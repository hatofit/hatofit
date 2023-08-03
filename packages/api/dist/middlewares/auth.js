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
exports.AuthJwtMiddleware = void 0;
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const obj_1 = require("../utils/obj");
const db_1 = require("../db");
const AuthJwtMiddleware = (req, res, next) => __awaiter(void 0, void 0, void 0, function* () {
    let token = undefined;
    if (req.headers['authorization']) {
        token = req.headers['authorization'].split(' ')[1];
    }
    else if (req.query.token) {
        token = req.query.token;
    }
    if (!token) {
        return res.status(401).json({
            success: false,
            message: 'Unauthorized',
            errorCode: 'auth.unauthorized'
        });
    }
    try {
        const jwtSecret = process.env.JWT_SECRET_KEY || 'polar';
        const decoded = jsonwebtoken_1.default.verify(token, jwtSecret);
        const found = yield db_1.User.findById(decoded.id);
        if (!found) {
            return res.status(404).json({
                success: false,
                message: 'User not found',
                errorCode: 'auth.user_not_found'
            });
        }
        req.auth = {
            user: (0, obj_1.exceptObjectProp)(found.toObject(), ['password']),
            token,
        };
        next();
    }
    catch (error) {
        return res.status(400).json({
            success: false,
            message: 'Invalid token',
            errorCode: 'auth.unauthorized.invalid_token'
        });
    }
});
exports.AuthJwtMiddleware = AuthJwtMiddleware;
