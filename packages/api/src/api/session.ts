import express from 'express'
import mongoose from 'mongoose'
import { Session } from '../db'
import { SessionSchema } from '../types/session'

export const ApiSession = ({ route }: { route: express.Router }) => {
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
      // validate input
      const session = SessionSchema.parse(req.body)

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
}
