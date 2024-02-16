import express from "express";
import mongoose from "mongoose";
import { Exercise, Session, User } from "../db";
import { AuthJwtMiddleware } from "../middlewares/auth";
import { SessionSchema } from "../types/session";

export const ApiSession = ({ route }: { route: express.Router }) => {
  route.get("/session/", AuthJwtMiddleware, async (req, res) => {
    // const { page, limit } = req.query;
    const sessions = await Session.find({
      userId: req.auth?.user?._id,
    });
    // .sort({ createdAt: -1 })
    // .skip(Number(page || 0) * Number(limit || 10))
    // .limit(Number(limit || 10));

    return res.json({
      success: true,
      message: "Sessions found",
      sessions,
    });
  });
  route.get("/session/shared/:userid", AuthJwtMiddleware, async (req, res) => {
    const { userid } = req.params;
    const user = await User.findById(userid);
    if (!user) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    // const allowed = await ReportShare.find({
    //   userViewId: req.auth?.user?._id,
    //   userShareId: user._id,
    // })
    // if (allowed.length === 0) {
    //   return res.status(403).json({
    //     success: false,
    //     message: "User not allowed",
    //   });
    // }

    const sessions = await Session.find({
      userId: user._id,
    });
    return res.json({
      success: true,
      message: "Sessions shared found",
      sessions,
    });
  });
  route.get("/session/:id", AuthJwtMiddleware, async (req, res) => {
    try {
      const { id } = req.params;
      const session = await Session.findById(id);
      if (!session) {
        return res.status(404).json({
          success: false,
          message: "Session not found",
        });
      }
      return res.json({
        success: true,
        message: "Session found",
        session,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.post("/session", AuthJwtMiddleware, async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate user
      const userId = req.auth?.user?._id;
      if (!userId || typeof userId !== "string" || userId.length === 0) {
        return res.json({
          success: false,
          message: "Invalid userId",
        });
      }
      // validate exercise
      const withoutExercise = req.body?.withoutExercise ?? false;
      const exerciseId = req.body?.exerciseId;
      if (withoutExercise !== true) {
        if (
          !exerciseId ||
          typeof exerciseId !== "string" ||
          exerciseId.length === 0
        ) {
          return res.json({
            success: false,
            message: "Invalid exerciseId",
          });
        }
      }
      // validate input
      const session = SessionSchema.parse(req.body);

      // get
      // get exercise
      let exercise;
      if (withoutExercise !== true) {
        exercise = await Exercise.findById(exerciseId);
        if (!exercise) {
          return res.json({
            success: false,
            message: "Exercise not found",
          });
        }
      }
      // get user
      const user = await User.findById(userId);
      if (!user) {
        return res.json({
          success: false,
          message: "User not found",
        });
      }

      // save to db
      const created = await Session.create({
        ...session,
        _id: new mongoose.Types.ObjectId().toHexString(),
        userId: user._id,
        exercise,
        withoutExercise,
      });
      // resposne
      return res.json({
        success: true,
        message: "Session created successfully",
        id: created._id,
        session: created,
      });
    } catch (error) {
      console.log("4");
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
};
