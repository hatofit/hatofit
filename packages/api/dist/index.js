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
const express_1 = __importDefault(require("express"));
const express_route_grouping_1 = __importDefault(require("express-route-grouping"));
const cors_1 = __importDefault(require("cors"));
const body_parser_1 = __importDefault(require("body-parser"));
const mongoose_1 = __importDefault(require("mongoose"));
const db_1 = require("./db");
const dotenv_1 = __importDefault(require("dotenv"));
const session_1 = require("./api/session");
const exercise_1 = require("./api/exercise");
const auth_1 = require("./api/auth");
// set
mongoose_1.default.set('strictQuery', true);
dotenv_1.default.config();
(() => __awaiter(void 0, void 0, void 0, function* () {
    const app = (0, express_1.default)();
    // middlewares
    app.use((0, cors_1.default)());
    app.use(express_1.default.json());
    app.use(body_parser_1.default.urlencoded({ extended: false }));
    app.use(body_parser_1.default.json());
    // routes
    const root = new express_route_grouping_1.default('/', express_1.default.Router());
    root.group('/', (app) => {
        (0, exercise_1.ApiExercises)({ route: app });
        (0, session_1.ApiSession)({ route: app });
        app.group('/auth', (app) => {
            (0, auth_1.ApiAuth)({ route: app });
        });
    });
    app.use('/api', root.export());
    // listen
    yield (0, db_1.MongoConnect)(process.env.MONGO_URL || '', {
        auth: {
            username: process.env.MONGO_USER || '',
            password: process.env.MONGO_PASSWORD || '',
        }
    });
    console.log('📚 connected to mongodb');
    app.listen(3000, () => {
        console.log('🚀 Server ready at http://localhost:3000');
    });
}))();
