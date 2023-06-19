import mongoose, { Schema, Model } from 'mongoose'

export const MongoConnect = (url: string, opts?: mongoose.ConnectOptions) => mongoose.connect(url, opts)

// SCHEMA
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
const ExerciseSchema = new Schema({
  _id: String,
  name: String,
  description: String,
  difficulty: String,
  type: String,
  instructions: [{
    type: String, // rest, instruction
    name: String,
    description: String,
    duration: Number, // in seconds
    content: {
      video: String,
      image: String,
    }
  }],
}, {
  typeKey: '$type',
  timestamps: true,
})
const UserSchema = new Schema({
  _id: String,
  name: String,
  email: String,
  password: String,
  firstName: String,
  lastName: String,
  birthDate: Date,
}, {
  typeKey: '$type',
  timestamps: true,
})

// MODEL
export const User = mongoose.model('User', UserSchema)
export const Session = mongoose.model('Session', SessionSchema)
export const Exercise = mongoose.model('Exercise', ExerciseSchema)

