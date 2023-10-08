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
const cors_1 = __importDefault(require("cors"));
const dotenv_1 = __importDefault(require("dotenv"));
const express_1 = __importDefault(require("express"));
const express_route_grouping_1 = __importDefault(require("express-route-grouping"));
const mongoose_1 = __importDefault(require("mongoose"));
const auth_1 = require("./api/auth");
const exercise_1 = require("./api/exercise");
const report_1 = require("./api/report");
const session_1 = require("./api/session");
const db_1 = require("./db");
const seed_1 = require("./db/seed");
// set
dotenv_1.default.config();
// args
const args = process.argv.slice(2);
// main
(() => __awaiter(void 0, void 0, void 0, function* () {
    // listen services
    yield (0, db_1.MongoConnect)(process.env.MONGO_URL || "", {
        auth: {
            username: process.env.MONGO_USER || "",
            password: process.env.MONGO_PASSWORD || "",
        },
        dbName: process.env.MONGO_DB_NAME || "",
    });
    console.log("📚 connected to mongodb");
    // options
    if (args.includes("--reset")) {
        const collections = yield mongoose_1.default.connection.db.collections();
        for (const collection of collections) {
            yield collection.deleteMany({});
        }
        console.log("📚 reseted mongodb");
    }
    // api
    const app = (0, express_1.default)();
    // middlewares
    app.use(express_1.default.json({ limit: "50mb" }));
    app.use(express_1.default.urlencoded({ limit: "50mb", extended: false }));
    app.use((0, cors_1.default)());
    // routes
    const root = new express_route_grouping_1.default("/", express_1.default.Router());
    root.group("/", (app) => {
        app.get("/", (req, res) => {
            res.json({
                message: "🚀",
            });
        });
        (0, exercise_1.ApiExercises)({ route: app });
        (0, session_1.ApiSession)({ route: app });
        (0, report_1.ApiReport)({ route: app });
        app.group("/auth", (app) => {
            (0, auth_1.ApiAuth)({ route: app });
        });
    });
    app.use("/api", root.export());
    // listen
    const port = parseInt(process.env.PORT || "3000") || 3000;
    app.listen(port, () => {
        console.log(`🚀 Server ready at http://localhost:${port}`);
        console.log(`🚀 MongoDB : ${process.env.MONGO_URL}`);
    });
    (0, seed_1.seed)();
}))();
