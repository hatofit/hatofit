import express from 'express'
import mongoose from 'mongoose'
import { Exercise, Session } from '../db'
import { SessionSchema } from '../types/session'

export const ApiSession = ({ route }: { route: express.Router }) => {
  route.get('/session/', async (req, res) => {
    const sessions = await Session.find()
    return res.json({
      success: true,
      message: 'Sessions found',
      sessions,
    })
  })
  route.get('/session/:id', async (req, res) => {
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
  route.post('/session', async (req, res) => {
    console.log('DATA BODY', req.body)
    try {
      // validate exercise
      const exerciseId = req.body?.exerciseId
      if (!exerciseId || typeof exerciseId !== 'string' || exerciseId.length === 0) {
        return res.json({
          success: false,
          message: 'Invalid exerciseId',
        })
      }
      // validate input
      const session = SessionSchema.parse(req.body)

      // validate exercise
      const exercise = await Exercise.findById(exerciseId)
      if (!exercise) {
        return res.json({
          success: false,
          message: 'Exercise not found',
        })
      }

      // save to db
      const created = await Session.create({
        ...session,
        _id: new mongoose.Types.ObjectId().toHexString(),
        exercise,
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
}
