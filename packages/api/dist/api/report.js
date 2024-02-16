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
exports.ApiReport = exports.getParsedFromDataDevice = exports.getDeviceNameFromDataDeviceType = exports.DevicesRules = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const report_1 = require("../actions/report");
const db_1 = require("../db");
const auth_1 = require("../middlewares/auth");
const obj_1 = require("../utils/obj");
exports.DevicesRules = [
    // for polar
    {
        name: "Polar",
        check: (type) => type.includes("Polar"),
        report: [
            {
                type: "hr",
                evaluate: (item) => {
                    var _a;
                    if (item.type === "PolarDataType.hr") {
                        const vals = (item.value || []);
                        const val = ((_a = vals[0]) === null || _a === void 0 ? void 0 : _a.hr) || false;
                        return val ? [val] : false;
                    }
                },
            },
            {
                type: "acc",
                evaluate: (item) => {
                    if (item.type === "PolarDataType.acc") {
                        const vals = (item.value || []);
                        const val = vals[0] ? [vals[0].x, vals[0].y, vals[0].z] : false;
                        return val;
                    }
                },
            },
            {
                type: "gyro",
                evaluate: (item) => {
                    if (item.type === "PolarDataType.gyro") {
                        const vals = (item.value || []);
                        const val = vals[0] ? [vals[0].x, vals[0].y, vals[0].z] : false;
                        return val;
                    }
                },
            },
            {
                type: "ecg",
                evaluate: (item) => {
                    var _a;
                    if (item.type === "PolarDataType.ecg") {
                        const vals = (item.value || []);
                        const val = ((_a = vals[0]) === null || _a === void 0 ? void 0 : _a.voltage) || false;
                        return val ? [val] : false;
                    }
                },
            },
        ],
    },
];
const getDeviceNameFromDataDeviceType = (type) => {
    for (const rules of exports.DevicesRules) {
        if (rules.check(type)) {
            return [rules.name, rules];
        }
    }
    return ["Unknown", undefined];
};
exports.getDeviceNameFromDataDeviceType = getDeviceNameFromDataDeviceType;
// item: z.input<typeof SessionDataItemSchema>,
const getParsedFromDataDevice = (device) => {
    // evaluate device name
    const [deviceName, rules] = (0, exports.getDeviceNameFromDataDeviceType)(device.type);
    // vars
    const reportsItems = [];
    // evaluate all posibles reports
    if (rules) {
        for (const rule of rules.report) {
            const val = rule.evaluate(device);
            if (val) {
                reportsItems.push({
                    type: rule.type,
                    value: val,
                });
            }
        }
    }
    return {
        deviceName,
        reportsItems,
    };
};
exports.getParsedFromDataDevice = getParsedFromDataDevice;
const ApiReport = ({ route }) => {
    route.post("/report/share", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _a, _b;
        try {
            // validate user
            const userId = (_b = (_a = req.auth) === null || _a === void 0 ? void 0 : _a.user) === null || _b === void 0 ? void 0 : _b._id;
            if (!userId || typeof userId !== "string" || userId.length === 0) {
                return res.json({
                    success: false,
                    message: "Invalid userId",
                });
            }
            // validate body
            const emailUserToAllow = req.body.emailUserToAllow;
            if (!emailUserToAllow ||
                typeof emailUserToAllow !== "string" ||
                emailUserToAllow.length === 0) {
                return res.json({
                    success: false,
                    message: "Invalid emailUserToAllow",
                });
            }
            // search user by email
            const userByEmail = yield db_1.User.findOne({ email: emailUserToAllow });
            if (!userByEmail) {
                return res.json({
                    success: false,
                    message: "User not found",
                });
            }
            const userIsAllowed = yield db_1.ReportShare.findOne({
                userShareId: userId,
                userViewId: userByEmail._id || userByEmail.id,
            });
            if (userIsAllowed) {
                return res.json({
                    success: false,
                    message: "User already allowed",
                });
            }
            // insert user to allow
            const userToAllow = yield db_1.ReportShare.create({
                _id: new mongoose_1.default.Types.ObjectId().toHexString(),
                userShareId: userId,
                userViewId: userByEmail._id || userByEmail.id,
            });
            if (!userToAllow) {
                return res.json({
                    success: false,
                    message: "User not found",
                });
            }
            return res.json({
                success: true,
                message: "User allowed",
                user: userByEmail.email,
            });
            // street email
        }
        catch (error) {
            console.error(error);
            return res.status(400).json({ error });
        }
    }));
    route.get("/report/share", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _c, _d;
        try {
            // validate user
            const userId = (_d = (_c = req.auth) === null || _c === void 0 ? void 0 : _c.user) === null || _d === void 0 ? void 0 : _d._id;
            if (!userId || typeof userId !== "string" || userId.length === 0) {
                return res.json({
                    success: false,
                    message: "Invalid userId",
                });
            }
            const user_ids = [];
            const lists = yield db_1.ReportShare.find({
                userShareId: userId,
            });
            lists.forEach((list) => {
                if (list.userViewId && !user_ids.includes(list.userViewId))
                    user_ids.push(list.userViewId);
            });
            const users = yield db_1.User.find({
                // find all users
                _id: { $in: user_ids },
            });
            return res.json({
                success: true,
                message: "get allowed user from me",
                lists: lists.map((list) => {
                    var _a;
                    return (Object.assign(Object.assign({}, list.toObject()), { userView: (0, obj_1.exceptObjectProp)((_a = users.find((item) => item._id === list.userViewId)) === null || _a === void 0 ? void 0 : _a.toObject(), ["password"]) }));
                }),
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.get("/report/share/tome", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _e, _f;
        try {
            // validate user
            const userId = (_f = (_e = req.auth) === null || _e === void 0 ? void 0 : _e.user) === null || _f === void 0 ? void 0 : _f._id;
            if (!userId || typeof userId !== "string" || userId.length === 0) {
                return res.json({
                    success: false,
                    message: "Invalid userId",
                });
            }
            const user_ids = [];
            const lists = yield db_1.ReportShare.find({
                userViewId: userId,
            });
            lists.forEach((list) => {
                if (list.userShareId && !user_ids.includes(list.userShareId))
                    user_ids.push(list.userShareId);
            });
            const users = yield db_1.User.find({
                // find all users
                _id: { $in: user_ids },
            });
            return res.json({
                success: true,
                message: "get allowed user to me",
                lists: lists.map((list) => {
                    var _a;
                    return (Object.assign(Object.assign({}, list.toObject()), { userShare: (0, obj_1.exceptObjectProp)((_a = users.find((item) => item._id === list.userShareId)) === null || _a === void 0 ? void 0 : _a.toObject(), ["password"]) }));
                }),
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.get("/report/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const session = yield db_1.Session.findById(id);
            const user = yield db_1.User.findById(session === null || session === void 0 ? void 0 : session.userId);
            if (!session) {
                return res.status(404).json({
                    success: false,
                    message: "Session not found",
                });
            }
            const report = yield (0, report_1.getReportFromSession)(session);
            return res.json({
                success: true,
                message: "Report generated",
                report,
                mood: session.mood,
                exercise: session.exercise,
                user: (0, obj_1.exceptObjectProp)(user === null || user === void 0 ? void 0 : user.toObject(), ["password"]),
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.get("/report", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _g, _h;
        try {
            const userId = (_h = (_g = req.auth) === null || _g === void 0 ? void 0 : _g.user) === null || _h === void 0 ? void 0 : _h._id;
            if (!userId || typeof userId !== "string" || userId.length === 0) {
                return res.json({
                    success: false,
                    message: "Invalid userId",
                });
            }
            // const { page, limit } = req.query;
            const sessions = yield db_1.Session.find({
                userId: userId,
            });
            // .sort({ createdAt: -1 })
            // .skip(Number(page || 0) * Number(limit || 10))
            // .limit(Number(limit || 10));
            const reports = yield Promise.all(sessions.map((session) => __awaiter(void 0, void 0, void 0, function* () {
                const report = yield (0, report_1.getReportFromSession)(session);
                return {
                    report,
                    mood: session.mood,
                    exercise: session.exercise,
                };
            })));
            return res.json({
                success: true,
                message: "Reports generated",
                reports,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
};
exports.ApiReport = ApiReport;
