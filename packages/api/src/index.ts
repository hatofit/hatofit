import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import mongoose from "mongoose";
import { MongoConnect } from "./db";
import { seed } from "./db/seed";
import { RequestAuth } from "./middlewares/auth";
import { InitRoutes } from "./routes";

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
  app.use(express.urlencoded({ limit: process.env.FILE_LIMIT || "50mb", extended: false }));
  app.use(cors({
    // allow all
    methods: ["GET", "POST", "PUT", "DELETE"],
    origin: "*",
    // allow auth
    allowedHeaders: ["Content-Type", "Authorization"],
  }));

  // routes
  InitRoutes(app);

  // listen
  const port = parseInt(process.env.PORT || "3000") || 3000;
  app.listen(port, () => {
    console.log(`🚀 Server ready at http://localhost:${port}`);
    console.log(`🚀 MongoDB : ${process.env.MONGO_URL}`);
  });
  seed();
})();
