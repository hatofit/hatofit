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
exports.GridStorage = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
let bucket = null;
const GridStorage = () => __awaiter(void 0, void 0, void 0, function* () {
    if (bucket)
        return bucket;
    var db = mongoose_1.default.connections[0].db;
    bucket = new mongoose_1.default.mongo.GridFSBucket(db, {
        bucketName: "photos",
    });
    console.log("📚 connected to mongodb gridfs");
    return bucket;
});
exports.GridStorage = GridStorage;
