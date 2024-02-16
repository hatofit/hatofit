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
exports.ApiPublic = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const storage_1 = require("../storage");
const ApiPublic = ({ route }) => {
    route.get("/image/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const bucket = yield (0, storage_1.GridStorage)();
            const file = yield bucket
                .find({ _id: new mongoose_1.default.Types.ObjectId(id) })
                .toArray();
            if (file.length === 0) {
                return res.status(404).json({
                    success: false,
                    message: "File not found",
                });
            }
            console.log("FILE", file[0].metadata.contentType);
            res.setHeader("Content-Type", file[0].metadata.contentType);
            const readStream = bucket.openDownloadStream(new mongoose_1.default.Types.ObjectId(id));
            readStream.pipe(res);
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
};
exports.ApiPublic = ApiPublic;
