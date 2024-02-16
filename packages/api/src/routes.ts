import express from "express";
import RouteGroup from "express-route-grouping";
import { ApiAuth } from "./api/auth";
import { ApiCompany } from "./api/company";
import { ApiExercises } from "./api/exercise";
import { ApiPublic } from "./api/public";
import { ApiReport } from "./api/report";
import { ApiSession } from "./api/session";

export const InitRoutes = (app: express.Express) => {
  // routes
  const root = new RouteGroup("/", express.Router());
  root.group("/", (app) => {
    app.get("/", (req, res) => {
      res.json({
        message: "🚀",
      });
    });

    // manage
    ApiExercises({ route: app });
    ApiSession({ route: app });
    ApiReport({ route: app });
    ApiCompany({ route: app });
    ApiPublic({ route: app });
    // auth
    app.group("/auth", (app) => {
      ApiAuth({ route: app });
    });
  });

  // use root group routes
  app.use("/api", root.export());
};
