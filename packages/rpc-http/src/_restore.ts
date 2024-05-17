import fs from 'fs'
import path from 'path'
import z from 'zod'

import { ServiceManager } from '@/foundation/sevice'

// services
import { PostgresService, User } from '@/services/postgres'
import { ConfigService } from '@/services/config'
import { Exercise, MongoService, Session } from '@/services/mongo'
import { HttpService } from '@/services/http'
import { MailService } from '@/services/mail'

// utils
import context from '@/foundation/context'
import type { SessionSchema } from './schemas/session'

// run
const service = new ServiceManager(
  context,
  [
    ConfigService,      // manage config
    PostgresService,    // connecting postgres
    MongoService,       // connecting mongodb
  ]
)
await service.setup()
await service.start()

async function restore() {
  // restore data
  // data:user
  const userstr = fs.readFileSync(path.resolve(__dirname, '../../../backup/users.json'), 'utf-8');
  const usersjson = JSON.parse(userstr) as {
    _id: string
    email: string
    firstName: string
    lastName: string
    gender: 'male' | 'female'
    weight: number
    height: number
    "metricUnits": {
      "energyUnits": string
      "weightUnits": string
      "heightUnits": string
    },
    password: string
    photo?: string
  }[]
  for (const user of usersjson) {
    await User.findOrCreate({
      where: {
        email: user.email,
      },
      defaults: {
        email: user.email,
        firstName: user.firstName,
        lastName: user.lastName,
        dateOfBirth: new Date(),
        gender: user.gender,
        height: user.height,
        metricUnits: user.metricUnits,
        password: user.password,
        weight: user.weight,
        // photo: user.photo,
      },
    })
  }

  // data:exercises
  const exerciseStr = fs.readFileSync(path.resolve(__dirname, '../../../backup/exercises.json'), 'utf-8');
  const exercises = JSON.parse(exerciseStr) as {
    _id: string
    name: string
    description: string
    difficulty: string
    type: string
    thumbnail: string
    duration: number
    instructions: any[]
    createdAt: {
      $date: string
    }
    updatedAt: {
      $date: string
    }
    __v: number
  }[]
  for (const exercise of exercises) {
    const find = await Exercise.findById(exercise._id)
    if (!find) {
      await Exercise.create({
        _id: exercise._id,
        name: exercise.name,
        description: exercise.description,
        difficulty: exercise.difficulty,
        type: exercise.type,
        thumbnail: exercise.thumbnail,
        duration: exercise.duration,
        instructions: exercise.instructions,
        createdAt: new Date(exercise.createdAt.$date),
        updatedAt: new Date(exercise.updatedAt.$date),
        __v: exercise.__v,
      })
    }
  }

  // data:sessions
  const sessionStr = fs.readFileSync(path.resolve(__dirname, '../../../backup/sessions.json'), 'utf-8');
  const sessions = JSON.parse(sessionStr) as ((z.infer<typeof SessionSchema>) & {
    _id: string
    userId: string
    exercise: {
      _id: string
      name: string
    }
  })[];
  sessions.sort((a, b) => a.startTime - b.startTime)
  console.log('sessions', sessions.length, sessions[0].userId)
  for (const session of sessions) {
    const userold = usersjson.find(u => u._id === session.userId)
    if (!userold) continue
    const user = await User.findOne({
      where: {
        email: userold.email,
      },
    })
    if (!user) continue
    console.log('user', user.firstName)
    const exercise = await Exercise.findById(session.exercise.name)
    if (!exercise) continue
    console.log('exercise', exercise.name)
    // continue

    const data = session.data
    const timelines = session.timelines
    // deep remover, remove deep object "data" in every node if have prop "_id"
    const deepRemover = (obj: any) => {
      if (obj._id) {
        delete obj._id
      }
      for (const key in obj) {
        if (typeof obj[key] === 'object') {
          deepRemover(obj[key])
        }
      }
    }
    deepRemover(data)
    deepRemover(timelines)
    
    await Session.create({
      _id: session._id,
      userId: user._id,
      mood: session.mood,
      exercise: exercise.toObject(),
      startTime: session.startTime,
      endTime: session.endTime,
      timelines: timelines,
      data: data,
      withoutExercise: ((session as any)['withoutExercise'] as boolean) || false,
    })
  }
}

await restore()
process.exit(0)