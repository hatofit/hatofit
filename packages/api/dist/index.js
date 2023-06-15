"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    var desc = Object.getOwnPropertyDescriptor(m, k);
    if (!desc || ("get" in desc ? !m.__esModule : desc.writable || desc.configurable)) {
      desc = { enumerable: true, get: function() { return m[k]; } };
    }
    Object.defineProperty(o, k2, desc);
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
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
exports.MongoConnect = exports.Session = void 0;
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const body_parser_1 = __importDefault(require("body-parser"));
const zod_1 = require("zod");
const mongoose_1 = __importStar(require("mongoose"));
mongoose_1.default.set('strictQuery', true);
const SessionSchema = new mongoose_1.Schema({
    _id: String,
    startTime: Number,
    endTime: Number,
    timelines: [{
            name: String,
            startTime: Number,
        }],
    data: [{
            second: Number,
            timeStamp: Number,
            devices: [{
                    type: String,
                    identifier: String,
                    value: mongoose_1.Schema.Types.Mixed,
                }]
        }]
}, {
    typeKey: '$type',
    timestamps: true,
});
exports.Session = mongoose_1.default.model('Session', SessionSchema);
const MongoConnect = (url, opts) => mongoose_1.default.connect(url, opts);
exports.MongoConnect = MongoConnect;
(() => __awaiter(void 0, void 0, void 0, function* () {
    const app = (0, express_1.default)();
    // middlewars
    app.use((0, cors_1.default)());
    app.use(express_1.default.json());
    app.use(body_parser_1.default.urlencoded({ extended: false }));
    app.use(body_parser_1.default.json());
    // routes
    app.get('/sports', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        return res.json({
        // success: true,
        // data: [
        //   {
        //     id: '123',
        //     name:
        //   }
        // ]
        });
    }));
    app.get('/session/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const session = yield exports.Session.findById(id);
            if (!session) {
                return res.status(404).json({
                    success: false,
                    message: 'Session not found',
                });
            }
            return res.json({
                success: true,
                message: 'Session found',
                session,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    app.post('/session', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log('DATA BODY', req.body);
        // schema
        const SessionInputSchema = zod_1.z.object({
            startTime: zod_1.z.number(),
            endTime: zod_1.z.number(),
            timelines: zod_1.z.array(zod_1.z.object({
                name: zod_1.z.string(),
                startTime: zod_1.z.number(),
            })),
            data: zod_1.z.array(zod_1.z.object({
                second: zod_1.z.number(),
                timeStamp: zod_1.z.number(),
                devices: zod_1.z.array(zod_1.z.object({
                    type: zod_1.z.string(),
                    identifier: zod_1.z.string(),
                    value: zod_1.z.any(),
                }))
            }))
        });
        try {
            // validate input
            const session = SessionInputSchema.parse(req.body);
            // save to db
            const created = yield exports.Session.create(Object.assign(Object.assign({}, session), { _id: new mongoose_1.default.Types.ObjectId().toHexString() }));
            // resposne
            return res.json({
                success: true,
                message: 'Session created successfully',
                id: created._id,
                session,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    // listen
    yield (0, exports.MongoConnect)('mongodb://localhost:27017', {
        auth: {
            username: 'polar',
            password: 'polar-password',
        }
    });
    console.log('📚 connected to mongodb');
    app.listen(3000, () => {
        console.log('🚀 Server ready at http://localhost:3000');
    });
}))();
