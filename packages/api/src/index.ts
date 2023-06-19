import express from 'express'
import RouteGroup from 'express-route-grouping';
import http from 'http'
import cors from 'cors'
import bodyParser from 'body-parser'
import { z } from 'zod'
import mongoose, { Schema, Model } from 'mongoose'
import { MongoConnect } from './db'
import dotenv from 'dotenv'
import { ApiSession } from './api/session'
import { ApiExercises } from './api/exercise'
import { ApiAuth } from './api/auth';

// set
mongoose.set('strictQuery', true)
dotenv.config()

// main
;(async () => {
  const app = express()

  // middlewares
  app.use(cors())
  app.use(express.json())
  app.use(bodyParser.urlencoded({ extended: false }))
  app.use(bodyParser.json())

  // routes
  const root = new RouteGroup('/', express.Router())
  root.group('/', (app) => {
    ApiExercises({ route: app })
    ApiSession({ route: app })
    app.group('/auth', (app) => {
      ApiAuth({ route: app })
    })
  })
  app.use('/api', root.export())

  // listen
  await MongoConnect(process.env.MONGO_URL || '', {
    auth: {
      username: process.env.MONGO_USER || '',
      password: process.env.MONGO_PASSWORD || '',
    }
  })
  console.log('📚 connected to mongodb')
  app.listen(3000, () => {
    console.log('🚀 Server ready at http://localhost:3000')
  })
})()
