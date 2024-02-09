import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import formData, { FormDataOptions } from "express-form-data";
import fs from "fs";
import mongoose from "mongoose";
import morgan from "morgan";
import cron from "node-cron";
import { MongoConnect, User } from "./db";
import { seed } from "./db/seed";
import { RequestAuth } from "./middlewares/auth";
import { InitRoutes } from "./routes";
import { GridStorage } from "./storage";

// types
// create types for request Request<{}, any, any, QueryString.ParsedQs, Record<string, any>> to have req.auth
declare global {
  namespace Express {
    interface Request {
      auth: RequestAuth;
    }
  }
}

// set
dotenv.config();

// args
const args = process.argv.slice(2);

// main
(async () => {
  // listen services
  await MongoConnect(process.env.MONGO_URL || "", {
    auth: {
      username: process.env.MONGO_USER,
      password: process.env.MONGO_PASSWORD,
    },
    dbName: process.env.MONGO_DB_NAME || "",
  });
  console.log("📚 connected to mongodb");

  // options
  if (args.includes("--reset")) {
    const collections = await mongoose.connection.db.collections();
    for (const collection of collections) {
      await collection.deleteMany({});
    }
    console.log("📚 reseted mongodb");
  }

  // api
  const app = express();

  // middlewares
  app.use(express.json({ limit: process.env.FILE_LIMIT || "50mb" }));
  app.use(
    express.urlencoded({
      limit: process.env.FILE_LIMIT || "50mb",
      extended: false,
    })
  );
  app.use(
    cors({
      // allow all
      methods: ["GET", "POST", "PUT", "DELETE"],
      origin: "*",
      // allow auth
      allowedHeaders: ["Content-Type", "Authorization"],
    })
  );

  // create upload folder if not exist
  const uploadDir = "./uploads";
  if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir);
  }

  // multer
  await GridStorage();

  const options: FormDataOptions = {
    uploadDir: uploadDir,
    autoClean: true,
  };
  app.use(formData.parse(options));
  app.use(formData.format());
  app.use(formData.stream());
  app.use(formData.union());
  app.use(morgan("dev"));

  // routes
  InitRoutes(app);

  // listen
  const port = parseInt(process.env.PORT || "3000") || 3000;
  app.listen(port, () => {
    console.log(`🚀 Server ready at http://localhost:${port}`);
    console.log(`🚀 MongoDB : ${process.env.MONGO_URL}`);
  });

  // cron job for delete user if has deletedAt and  deletedAt is now
  cron.schedule("0 0 * * *", async () => {
    console.log("running a task every day");
    const users = await User.find({
      deletedAt: { $lt: new Date() },
      requestDelete: true,
    });
    for (const user of users) {
      if (
        user._id &&
        user.requetDelete &&
        user.deleteDate !== undefined &&
        user.deleteDate < new Date()
      ) {
        if (user.photo && user.photo.length >= 24) {
          const bucket = await GridStorage();
          await bucket.delete(new mongoose.Types.ObjectId(user.photo));
        }
        await User.deleteOne({ _id: user._id });
      }
    }
  });

  seed();
})();
