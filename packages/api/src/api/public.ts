import express from "express";
import mongoose from "mongoose";
import { GridStorage } from "../storage";

export const ApiPublic = ({ route }: { route: express.Router }) => {
  route.get("/image/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const bucket = await GridStorage();
      const file = await bucket
        .find({ _id: new mongoose.Types.ObjectId(id) })
        .toArray();
      if (file.length === 0) {
        return res.status(404).json({
          success: false,
          message: "File not found",
        });
      }
      console.log("FILE", file[0].metadata!.contentType);
      res.setHeader("Content-Type", file[0].metadata!.contentType);
      const readStream = bucket.openDownloadStream(
        new mongoose.Types.ObjectId(id)
      );
      readStream.pipe(res);
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
};
