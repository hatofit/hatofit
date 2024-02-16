import mongoose, { Schema } from "mongoose";

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

export const CompanySchema = new Schema(
  {
    _id: String,
    name: String,
    meta: {
      description: String,
      address: String,
    },
    admins: [
      {
        userId: String,
        role: String,
        isCreated: Boolean,
      },
    ],
  },
  {
    typeKey: "$type",
    timestamps: true,
  }
);
export const Company = mongoose.model("Company", CompanySchema);

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
    resetPasswordCode: String,
    requetDelete: Boolean,
    deleteDate: Date,
    // others
    linkedCompanyId: String,
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
