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
const mongoose_1 = __importDefault(require("mongoose"));
const db_1 = require("./db");
const seed_1 = require("./db/seed");
const routes_1 = require("./routes");
// set
dotenv_1.default.config();
// args
const args = process.argv.slice(2);
// main
(() => __awaiter(void 0, void 0, void 0, function* () {
    // listen services
    yield (0, db_1.MongoConnect)(process.env.MONGO_URL || "", {
        auth: {
            username: process.env.MONGO_USER,
            password: process.env.MONGO_PASSWORD,
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
    app.use(express_1.default.json({ limit: process.env.FILE_LIMIT || "50mb" }));
    app.use(express_1.default.urlencoded({ limit: process.env.FILE_LIMIT || "50mb", extended: false }));
    app.use((0, cors_1.default)());
    // routes
    (0, routes_1.InitRoutes)(app);
    // listen
    const port = parseInt(process.env.PORT || "3000") || 3000;
    app.listen(port, () => {
        console.log(`🚀 Server ready at http://localhost:${port}`);
        console.log(`🚀 MongoDB : ${process.env.MONGO_URL}`);
    });
    (0, seed_1.seed)();
}))();
