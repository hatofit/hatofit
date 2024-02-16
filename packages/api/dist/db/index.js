"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ReportShare = exports.ReportShareSchema = exports.Session = exports.User = exports.Company = exports.CompanySchema = exports.Exercise = exports.MongoConnect = void 0;
const mongoose_1 = __importStar(require("mongoose"));
mongoose_1.default.set("strictQuery", true);
mongoose_1.default.set("strictPopulate", true);
const MongoConnect = (url, opts) => mongoose_1.default.connect(url, opts);
exports.MongoConnect = MongoConnect;
// SCHEMA
const ExerciseSchema = new mongoose_1.Schema({
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
}, {
    typeKey: "$type",
    timestamps: true,
});
exports.Exercise = mongoose_1.default.model("Exercise", ExerciseSchema);
exports.CompanySchema = new mongoose_1.Schema({
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
}, {
    typeKey: "$type",
    timestamps: true,
});
exports.Company = mongoose_1.default.model("Company", exports.CompanySchema);
const UserSchema = new mongoose_1.Schema({
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
}, {
    typeKey: "$type",
    timestamps: true,
});
exports.User = mongoose_1.default.model("User", UserSchema);
const SessionSchema = new mongoose_1.Schema({
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
                    value: mongoose_1.Schema.Types.Mixed,
                },
            ],
        },
    ],
    withoutExercise: Boolean,
}, {
    typeKey: "$type",
    timestamps: true,
});
exports.Session = mongoose_1.default.model("Session", SessionSchema);
// this is a schema for user can share their report and allow other user to see it
exports.ReportShareSchema = new mongoose_1.Schema({
    _id: String,
    userShareId: String,
    userViewId: String,
}, {
    typeKey: "$type",
    timestamps: true,
});
exports.ReportShare = mongoose_1.default.model("ReportShare", exports.ReportShareSchema);
