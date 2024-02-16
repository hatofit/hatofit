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
const express_form_data_1 = __importDefault(require("express-form-data"));
const fs_1 = __importDefault(require("fs"));
const mongoose_1 = __importDefault(require("mongoose"));
const morgan_1 = __importDefault(require("morgan"));
const node_cron_1 = __importDefault(require("node-cron"));
const db_1 = require("./db");
const seed_1 = require("./db/seed");
const routes_1 = require("./routes");
const storage_1 = require("./storage");
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
    app.use(express_1.default.urlencoded({
        limit: process.env.FILE_LIMIT || "50mb",
        extended: false,
    }));
    app.use((0, cors_1.default)({
        // allow all
        methods: ["GET", "POST", "PUT", "DELETE"],
        origin: "*",
        // allow auth
        allowedHeaders: ["Content-Type", "Authorization"],
    }));
    // create upload folder if not exist
    const uploadDir = "./uploads";
    if (!fs_1.default.existsSync(uploadDir)) {
        fs_1.default.mkdirSync(uploadDir);
    }
    // multer
    yield (0, storage_1.GridStorage)();
    const options = {
        uploadDir: uploadDir,
        autoClean: true,
    };
    app.use(express_form_data_1.default.parse(options));
    app.use(express_form_data_1.default.format());
    app.use(express_form_data_1.default.stream());
    app.use(express_form_data_1.default.union());
    app.use((0, morgan_1.default)("dev"));
    // routes
    (0, routes_1.InitRoutes)(app);
    // listen
    const port = parseInt(process.env.PORT || "3000") || 3000;
    app.listen(port, () => {
        console.log(`🚀 Server ready at http://localhost:${port}`);
        console.log(`🚀 MongoDB : ${process.env.MONGO_URL}`);
    });
    // cron job for delete user if has deletedAt and  deletedAt is now
    node_cron_1.default.schedule("0 0 * * *", () => __awaiter(void 0, void 0, void 0, function* () {
        console.log("running a task every day");
        const users = yield db_1.User.find({
            deletedAt: { $lt: new Date() },
            requestDelete: true,
        });
        for (const user of users) {
            if (user._id &&
                user.requetDelete &&
                user.deleteDate !== undefined &&
                user.deleteDate < new Date()) {
                if (user.photo && user.photo.length >= 24) {
                    const bucket = yield (0, storage_1.GridStorage)();
                    yield bucket.delete(new mongoose_1.default.Types.ObjectId(user.photo));
                }
                yield db_1.User.deleteOne({ _id: user._id });
            }
        }
    }));
    (0, seed_1.seed)();
}))();
