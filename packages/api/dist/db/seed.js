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
exports.seed = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const _1 = require(".");
const exerciseSeed = [
    {
        _id: "Walking",
        name: "Walking",
        description: "",
        difficulty: "",
        type: "",
        thumbnail: "https://apollohealthlib.blob.core.windows.net/health-library/2021/04/shutterstock_788590396-scaled.jpg",
        duration: 0,
        instructions: [],
    },
    {
        _id: "Running",
        name: "Running",
        description: "",
        difficulty: "",
        type: "",
        thumbnail: "https://apollohealthlib.blob.core.windows.net/health-library/2021/04/shutterstock_788590396-scaled.jpg",
        duration: 0,
        instructions: [],
    },
    {
        _id: "Cycling",
        name: "Cycling",
        description: "",
        difficulty: "",
        type: "",
        thumbnail: "https://runkeeper.com/cms/wp-content/uploads/sites/4/2022/12/Running-Image-12.jpg",
        duration: 0,
        instructions: [],
    },
    {
        _id: "Swimming",
        name: "Swimming",
        description: "",
        difficulty: "",
        type: "",
        thumbnail: "https://domf5oio6qrcr.cloudfront.net/medialibrary/9833/GettyImages-526245433.jpg",
        duration: 0,
        instructions: [],
    },
    {
        _id: "Other",
        name: "Other",
        description: "",
        difficulty: "",
        type: "",
        thumbnail: "https://assets-global.website-files.com/617b224ba2374548fcc039ba/617b224ba237453ce1c0409b_hpfulq-1234-1024x512.jpg",
        duration: 0,
        instructions: [],
    },
];
const companySeed = [
    {
        _id: new mongoose_1.default.Types.ObjectId("65b8b28bb68956c7d206a02a").toHexString(),
        name: "Apollo",
        meta: {
            description: "Apollo is a health company that helps people to be healthy",
            address: "St.Cruzz, Nepal",
        },
        admins: [
            {
                userId: "admin",
                role: "admin",
                isCreated: true,
            },
        ],
    },
];
const seed = () => __awaiter(void 0, void 0, void 0, function* () {
    // await Exercise.deleteMany({});
    // await Company.deleteMany({});
    // await User.deleteMany({});
    // await Session.deleteMany({});
    // await ReportShare.deleteMany({});
    // (await GridStorage()).drop();
    for (var exercise of exerciseSeed) {
        const exist = yield _1.Exercise.findById(exercise._id);
        if (exist) {
            yield _1.Exercise.updateOne({ _id: exercise._id }, exercise);
        }
        else {
            yield _1.Exercise.create(exercise);
        }
    }
    for (var company of companySeed) {
        const exist = yield _1.Company.findById(company._id);
        if (exist) {
            yield _1.Company.updateOne({ _id: company._id }, company);
        }
        else {
            yield _1.Company.create(company);
        }
    }
});
exports.seed = seed;
