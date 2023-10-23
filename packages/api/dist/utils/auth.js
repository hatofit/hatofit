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
Object.defineProperty(exports, "__esModule", { value: true });
exports.getUserByAuth = void 0;
const db_1 = require("../db");
const getUserByAuth = (req) => __awaiter(void 0, void 0, void 0, function* () {
    var _a, _b;
    // validate user
    const userId = (_b = (_a = req.auth) === null || _a === void 0 ? void 0 : _a.user) === null || _b === void 0 ? void 0 : _b._id;
    if (!userId || typeof userId !== "string" || userId.length === 0)
        return false;
    // get user
    const user = yield db_1.User.findById(userId);
    if (!(user === null || user === void 0 ? void 0 : user._id))
        return false;
    if (!user)
        return false;
    return user;
});
exports.getUserByAuth = getUserByAuth;
