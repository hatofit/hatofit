"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ApiExercises = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const db_1 = require("../db");
const exercise_1 = require("../types/exercise");
const ApiExercises = ({ route }) => {
    route.get("/exercise", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        const exercises = yield db_1.Exercise.find();
        return res.json({
            success: true,
            message: "Exercise found",
            exercises,
        });
    }));
    route.get("/exercise/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const exercise = yield db_1.Exercise.findById(id);
            if (!exercise) {
                return res.status(404).json({
                    success: false,
                    message: "Exercise not found",
                });
            }
            return res.json({
                success: true,
                message: "Exercise found",
                exercise,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.post("/exercise", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log("DATA BODY", req.body);
        try {
            // validate input
            const exercise = exercise_1.ExerciseSchema.parse(req.body);
            // save to db
            const created = yield db_1.Exercise.create(Object.assign(Object.assign({}, exercise), { _id: new mongoose_1.default.Types.ObjectId().toHexString() }));
            // resposne
            return res.json({
                success: true,
                message: "Exercise created successfully",
                id: created._id,
                exercise,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.put("/exercise/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            // validate input
            const exercise = exercise_1.ExerciseSchema.parse(req.body);
            exercise === null || exercise === void 0 ? true : delete exercise._id;
            // save to db
            const updated = yield db_1.Exercise.findByIdAndUpdate(req.params.id, exercise);
            // resposne
            return res.json({
                success: true,
                message: "Exercise updated successfully",
                id: updated === null || updated === void 0 ? void 0 : updated._id,
                exercise,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.delete("/exercise/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            // validate input
            const { id } = req.params;
            // save to db
            const deleted = yield db_1.Exercise.findByIdAndDelete(id);
            // resposne
            return res.json({
                success: true,
                message: "Exercise deleted successfully",
                // id: deleted?._id,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
};
exports.ApiExercises = ApiExercises;
