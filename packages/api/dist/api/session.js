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
exports.ApiSession = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const db_1 = require("../db");
const session_1 = require("../types/session");
const ApiSession = ({ route }) => {
    route.get('/session/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const session = yield db_1.Session.findById(id);
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
    route.post('/session', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log('DATA BODY', req.body);
        try {
            // validate input
            const session = session_1.SessionSchema.parse(req.body);
            // save to db
            const created = yield db_1.Session.create(Object.assign(Object.assign({}, session), { _id: new mongoose_1.default.Types.ObjectId().toHexString() }));
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
};
exports.ApiSession = ApiSession;
