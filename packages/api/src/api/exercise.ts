import express from "express";
import mongoose from "mongoose";
import { Exercise } from "../db";
import { ExerciseSchema } from "../types/exercise";

export const ApiExercises = ({ route }: { route: express.Router }) => {
  route.get("/exercise", async (req, res) => {
    const exercises = await Exercise.find();
    return res.json({
      success: true,
      message: "Exercise found",
      exercises,
    });
  });
  route.get("/exercise/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const exercise = await Exercise.findById(id);
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
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.post("/exercise", async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate input
      const exercise = ExerciseSchema.parse(req.body);

      // save to db
      const created = await Exercise.create({
        ...exercise,
        _id: new mongoose.Types.ObjectId().toHexString(),
      });

      // resposne
      return res.json({
        success: true,
        message: "Exercise created successfully",
        id: created._id,
        exercise,
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.put("/exercise/:id", async (req, res) => {
    try {
      // validate input
      const exercise = ExerciseSchema.parse(req.body);
      delete (exercise as any)?._id;

      // save to db
      const updated = await Exercise.findByIdAndUpdate(req.params.id, exercise);

      // resposne
      return res.json({
        success: true,
        message: "Exercise updated successfully",
        id: updated?._id,
        exercise,
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.delete("/exercise/:id", async (req, res) => {
    try {
      // validate input
      const { id } = req.params;

      // save to db
      const deleted = await Exercise.findByIdAndDelete(id);

      // resposne
      return res.json({
        success: true,
        message: "Exercise deleted successfully",
        // id: deleted?._id,
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
};
