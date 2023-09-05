import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import RouteGroup from "express-route-grouping";
import mongoose from "mongoose";
import { ApiAuth } from "./api/auth";
import { ApiExercises } from "./api/exercise";
import { ApiReport } from "./api/report";
import { ApiSession } from "./api/session";
import { MongoConnect } from "./db";
import { RequestAuth } from "./middlewares/auth";

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
    // auth: {
    //   username: process.env.MONGO_USER || "",
    //   password: process.env.MONGO_PASSWORD || "",
    // },
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
  app.use(express.json({ limit: "50mb" }));
  app.use(express.urlencoded({ limit: "50mb", extended: false }));
  app.use(cors());

  // routes
  const root = new RouteGroup("/", express.Router());
  root.group("/", (app) => {
    app.get("/", (req, res) => {
      res.json({
        message: "🚀",
      });
    });
    ApiExercises({ route: app });
    ApiSession({ route: app });
    ApiReport({ route: app });
    app.group("/auth", (app) => {
      ApiAuth({ route: app });
    });
  });
  app.use("/api", root.export());

  // listen
  const port = parseInt(process.env.PORT || "3000") || 3000;
  app.listen(port, () => {
    console.log(`🚀 Server ready at http://localhost:${port}`);
    console.log(`🚀 MongoDB : ${process.env.MONGO_URL}`);
  });
})();
