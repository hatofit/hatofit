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
exports.ApiAuth = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const db_1 = require("../db");
const user_1 = require("../types/user");
const bcrypt_1 = __importDefault(require("bcrypt"));
const dayjs_1 = __importDefault(require("dayjs"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const obj_1 = require("../utils/obj");
const auth_1 = require("../middlewares/auth");
const ApiAuth = ({ route }) => {
    route.post("/register", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log("DATA BODY", req.body);
        try {
            // validate input
            const password = req.body.password || "";
            const confirmPassword = req.body.confirmPassword || "";
            if (password !== confirmPassword) {
                return res.status(400).json({
                    success: false,
                    message: "Password and confirm password do not match",
                });
            }
            // check poassword must filled
            // remove whitespace
            if (password.trim() === "") {
                return res.status(400).json({
                    success: false,
                    message: "Password must not be empty",
                });
            }
            // input schema
            const rawPlainPassword = req.body.password || "";
            // password
            const saltRounds = parseInt(process.env.HASH_PASSWORD_SALT || "10");
            const hasingPasssword = yield new Promise((res) => {
                bcrypt_1.default.hash(rawPlainPassword, saltRounds, function (err, hash) {
                    return res(hash);
                });
            });
            req.body.password = hasingPasssword;
            // dateOfBirth
            const dateOfBirth = req.body.dateOfBirth || "";
            req.body.dateOfBirth = (0, dayjs_1.default)(dateOfBirth, "mm/dd/yyyy").toDate();
            const user = user_1.UserSchema.parse(req.body);
            // check in db
            const userInDb = yield db_1.User.findOne({
                email: user.email,
            });
            if (userInDb) {
                return res.status(400).json({
                    success: false,
                    message: "Email already exists",
                });
            }
            console.log("USER", user);
            // save to db
            const created = yield db_1.User.create(Object.assign(Object.assign({}, user), { _id: new mongoose_1.default.Types.ObjectId().toHexString() }));
            // resposne
            return res.json({
                success: true,
                message: "User created successfully",
                id: created._id,
                user: (0, obj_1.exceptObjectProp)(created.toObject(), ["password"]),
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.post("/login", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log("DATA BODY", req.body);
        try {
            // validate input
            const user = req.body;
            console.log("USER", user);
            // save to db
            const found = yield db_1.User.findOne({
                email: user.email,
            });
            // resposne
            if (!found) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            const isMatch = yield new Promise((res) => {
                bcrypt_1.default.compare(user.password, found.password || "", function (err, result) {
                    return res(result);
                });
            });
            if (!isMatch) {
                return res.status(401).json({
                    success: false,
                    message: "Password is incorrect",
                });
            }
            // generate token
            const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
            const token = jsonwebtoken_1.default.sign({ id: found._id }, jwtSecret, {
                expiresIn: 86400, // 1 month in seconds
            });
            return res.json({
                success: true,
                message: "User found",
                user: (0, obj_1.exceptObjectProp)(found.toObject(), ["password"]),
                token,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.get("/me", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        return res.json({
            success: true,
            message: "User found",
            auth: req.auth,
        });
    }));
};
exports.ApiAuth = ApiAuth;
