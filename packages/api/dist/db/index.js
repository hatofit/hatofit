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
exports.Exercise = exports.Session = exports.User = exports.MongoConnect = void 0;
const mongoose_1 = __importStar(require("mongoose"));
const MongoConnect = (url, opts) => mongoose_1.default.connect(url, opts);
exports.MongoConnect = MongoConnect;
// SCHEMA
const SessionSchema = new mongoose_1.Schema({
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
                    value: mongoose_1.Schema.Types.Mixed,
                }]
        }]
}, {
    typeKey: '$type',
    timestamps: true,
});
const ExerciseSchema = new mongoose_1.Schema({
    _id: String,
    name: String,
    description: String,
    difficulty: String,
    type: String,
    instructions: [{
            type: String,
            name: String,
            description: String,
            duration: Number,
            content: {
                video: String,
                image: String,
            }
        }],
}, {
    typeKey: '$type',
    timestamps: true,
});
const UserSchema = new mongoose_1.Schema({
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
});
// MODEL
exports.User = mongoose_1.default.model('User', UserSchema);
exports.Session = mongoose_1.default.model('Session', SessionSchema);
exports.Exercise = mongoose_1.default.model('Exercise', ExerciseSchema);
