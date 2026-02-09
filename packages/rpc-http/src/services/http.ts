import { BaseService } from "@/foundation/sevice";
import cors from "cors";
import express, { type Express } from "express";
import formData from "express-form-data";
import { getConfigService } from "./config";

export class HttpService extends BaseService {
  name = "Http";
  app!: Express;

  async setup() {
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
    // parse form data
    app.use(formData.parse());
    app.use(formData.format());
    app.use(formData.stream());
    app.use(formData.union());

    // init routes
    require("@/routes").default(app, this.context);

    this.app = app;
  }

  async start() {
    const port = getConfigService().get("PORT") || 3000;

    this.log.info(`Starting ${this.name}`);
    this.app.listen(port, () => {
      this.log.info(`${this.name} listening on port ${port}`);
    });
  }
}
