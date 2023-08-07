import mongoose, { Schema, Model, mongo } from "mongoose";

mongoose.set("strictQuery", true);
mongoose.set("strictPopulate", true);

export const MongoConnect = (url: string, opts?: mongoose.ConnectOptions) =>
  mongoose.connect(url, opts);

// SCHEMA
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
);
export const Exercise = mongoose.model("Exercise", ExerciseSchema);

const UserSchema = new Schema(
  {
    _id: String,
    name: String,
    email: String,
    password: String,
    firstName: String,
    lastName: String,
    dateOfBirth: Date,
    photo: String,
    weight: Number,
    height: Number,
    gender: String,
    metricUnits: {
      energyUnits: String,
      weightUnits: String,
      heightUnits: String,
    },
  },
  {
    typeKey: "$type",
    timestamps: true,
  }
);
export const User = mongoose.model("User", UserSchema);

const SessionSchema = new Schema(
  {
    _id: String,
    userId: String,
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
            value: Schema.Types.Mixed,
          },
        ],
      },
    ],
  },
  {
    typeKey: "$type",
    timestamps: true,
  }
);
export const Session = mongoose.model("Session", SessionSchema);

// this is a schema for user can share their report and allow other user to see it
export const ReportShareSchema = new Schema(
  {
    _id: String,
    userShareId: String,
    userViewId: String,
  },
  {
    typeKey: "$type",
    timestamps: true,
  }
);
export const ReportShare = mongoose.model("ReportShare", ReportShareSchema);
