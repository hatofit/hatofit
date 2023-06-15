import express from 'express'
import http from 'http'
import cors from 'cors'
import bodyParser from 'body-parser'
import { z } from 'zod'
import mongoose, { Schema, Model } from 'mongoose'


mongoose.set('strictQuery', true)
const SessionSchema = new Schema({
  _id: String,
  startTime: Number,
  endTime: Number,
  timelines: [{
    name: String,
    startTime: Number,
  }],
  data: [{
    second: Number,
    timeStamp: Number,
    devices: [{
      type: String,
      identifier: String,
      value: Schema.Types.Mixed,
    }]
  }]
}, {
  typeKey: '$type',
  timestamps: true,
})
export const Session = mongoose.model('Session', SessionSchema)
export const MongoConnect = (url: string, opts?: mongoose.ConnectOptions) => mongoose.connect(url, opts)

;(async () => {
  const app = express()

  // middlewars
  app.use(cors())
  app.use(express.json())
  app.use(bodyParser.urlencoded({ extended: false }))
  app.use(bodyParser.json())

  // routes
  app.get('/sports', async (req, res) => {
    return res.json({
      // success: true,
      // data: [
      //   {
      //     id: '123',
      //     name:
      //   }
      // ]
    })
  })
  app.get('/session/:id', async (req, res) => {
    try {
      const { id } = req.params
      const session = await Session.findById(id)
      if (!session) {
        return res.status(404).json({
          success: false,
          message: 'Session not found',
        })
      }
      return res.json({
        success: true,
        message: 'Session found',
        session,
      })
    } catch (error) {
      console.error(error)
      return res.status(500).json({ error })
    }
  })
  app.post('/session', async (req, res) => {
    console.log('DATA BODY', req.body)
    // schema
    const SessionInputSchema = z.object({
      startTime: z.number(),
      endTime: z.number(),
      timelines: z.array(
        z.object({
          name: z.string(),
          startTime: z.number(),
        }),
      ),
      data: z.array(
        z.object({
          second: z.number(),
          timeStamp: z.number(),
          devices: z.array(
            z.object({
              type: z.string(),
              identifier: z.string(),
              value: z.any(),
            })
          )
        })
      )
    })

    try {
      // validate input
      const session = SessionInputSchema.parse(req.body)

      // save to db
      const created = await Session.create({
        ...session,
        _id: new mongoose.Types.ObjectId().toHexString(),
      })

      // resposne
      return res.json({
        success: true,
        message: 'Session created successfully',
        id: created._id,
        session,
      })
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error })
    }
  })


  // listen
  await MongoConnect('mongodb://localhost:27017', {
    auth: {
      username: 'polar',
      password: 'polar-password',
    }
  })
  console.log('📚 connected to mongodb')
  app.listen(3000, () => {
    console.log('🚀 Server ready at http://localhost:3000')
  })
})()
