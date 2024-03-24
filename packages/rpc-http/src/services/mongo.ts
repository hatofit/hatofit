import { DataTypes, Sequelize, type Optional, Model, type InferAttributes, type InferCreationAttributes, type CreationOptional, UUID, UUIDV4 } from 'sequelize'
import { BaseService, ServiceManager } from '@/foundation/sevice'
import { getConfigService } from '@/services/config'
import mongoose, { Schema } from "mongoose"

mongoose.set("strictQuery", true);
mongoose.set("strictPopulate", true);

export const MongoConnect = (url: string, opts?: mongoose.ConnectOptions) =>
  mongoose.connect(url, opts);

// SERVICE Mongo
export class MongoService extends BaseService {
  name = 'Mongo'
  sequelize!: Sequelize
  
  async setup() {
    const config = getConfigService().getAll()
    this.log.info(`Connecting to ${this.name}`)
    this.log.debug('load mongo: ', config.MONGO_URL, config.MONGO_USER, config.MONGO_PASSWORD, config.MONGO_DB_NAME)

    await MongoConnect(config.MONGO_URL || "", {
      auth: {
        username: config.MONGO_USER,
        password: config.MONGO_PASSWORD,
      },
      dbName: config.MONGO_DB_NAME || "",
    })
  }

  async start() {
    this.log.info(`Connected to ${this.name}`)
  }
}

// SCHEMA && TYPES
const ExerciseSchema = new Schema(
  {
    _id: String,
    name: String,
    description: String,
    difficulty: String,
    type: String,
    thumbnail: String,
    duration: Number,
    instructions: [
      {
        type: String, // rest, instruction
        name: String,
        description: String,
        duration: Number, // in seconds
        content: {
          video: String,
          image: String,
          lottie: String,
        },
      },
    ],
  },
  {
    typeKey: "$type",
    timestamps: true,
  }
)
export const Exercise = mongoose.model("Exercise", ExerciseSchema)


const SessionSchema = new Schema(
  {
    _id: String,
    userId: String,
    mood: String,
    exercise: ExerciseSchema,
    startTime: Number,
    endTime: Number,
    timelines: [
      {
        name: String,
        startTime: Number,
      },
    ],
    data: [
      {
        second: Number,
        timeStamp: Number,
        devices: [
          {
            type: String,
            identifier: String,
            brand: String,
            model: String,
            value: Schema.Types.Mixed,
          },
        ],
      },
    ],

    withoutExercise: Boolean,
  },
  {
    typeKey: "$type",
    timestamps: true,
  }
);
export const Session = mongoose.model("Session", SessionSchema)