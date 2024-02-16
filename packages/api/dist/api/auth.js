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
const bcrypt_1 = __importDefault(require("bcrypt"));
const dayjs_1 = __importDefault(require("dayjs"));
const utc_1 = __importDefault(require("dayjs/plugin/utc"));
const fs_1 = __importDefault(require("fs"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
const mongoose_1 = __importDefault(require("mongoose"));
const report_1 = require("../actions/report");
const db_1 = require("../db");
const auth_1 = require("../middlewares/auth");
const storage_1 = require("../storage");
const user_1 = require("../types/user");
const obj_1 = require("../utils/obj");
dayjs_1.default.extend(utc_1.default);
// funcs
const findBmi = (weightUnits, heightUnits, userWeight, userHeight) => {
    let bmi = 0;
    switch (weightUnits) {
        case "kg":
            switch (heightUnits) {
                case "cm":
                    bmi = userWeight / ((userHeight / 100) * (userHeight / 100));
                    break;
                case "ft":
                    bmi = (userWeight / (userHeight * 12 * (userHeight * 12))) * 703;
                    break;
            }
            break;
        case "lbs":
            switch (heightUnits) {
                case "cm":
                    bmi = (userWeight / ((userHeight / 100) * (userHeight / 100))) * 703;
                    break;
                case "ft":
                    bmi = userWeight / (userHeight * 12 * (userHeight * 12));
                    break;
            }
            break;
    }
    return bmi;
};
// routes
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
            if (user.photo) {
                let photoPath = req.body.photo.path.split("\\")[1];
                if (!photoPath) {
                    photoPath = req.body.photo.path.split("/")[1];
                }
                const bucket = yield (0, storage_1.GridStorage)();
                const file = fs_1.default.createReadStream(`./uploads/${photoPath}`).pipe(bucket.openUploadStream(photoPath, {
                    metadata: { contentType: "image/png" },
                }));
                user.photo = file.id;
            }
            // save to db
            const created = yield db_1.User.create(Object.assign(Object.assign({}, user), { _id: new mongoose_1.default.Types.ObjectId().toHexString() }));
            const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
            const token = jsonwebtoken_1.default.sign({ id: created._id }, jwtSecret, {
                expiresIn: 7776000, // 90 days
            });
            // resposne
            return res.json({
                success: true,
                message: "User created successfully",
                user: (0, obj_1.exceptObjectProp)(created.toObject(), ["password"]),
                token,
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
            const found = yield db_1.User.findOneAndUpdate({
                email: user.email,
            }, {
                $set: {
                    requetDelete: false,
                    deleteDate: null,
                },
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
                expiresIn: 7776000, // 90 days
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
    // send email to reset password using nodemailer
    route.get("/forgot-password/:email", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const email = req.params.email;
            const nodemailer = require("nodemailer");
            const transporter = nodemailer.createTransport({
                service: "gmail",
                host: "smtp.gmail.com",
                port: 587,
                secure: false,
                auth: {
                    user: process.env.MAIL_USERNAME,
                    pass: process.env.MAIL_PASSWORD,
                },
            });
            const found = yield db_1.User.findOne({
                email: email,
            });
            if (!found) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            //  generate 6 digit code for reset password
            const code = Math.floor(100000 + Math.random() * 900000);
            // save to db
            const updated = yield db_1.User.findOneAndUpdate({
                email: email,
            }, {
                $set: {
                    resetPasswordCode: code,
                },
            }, {
                new: true,
            });
            const mailOptions = {
                from: "HatoFit | No Reply <" + process.env.MAIL_USERNAME + ">",
                to: email,
                subject: "Reset Password",
                text: "Reset Password ",
                html: "<p> Reset Password </p>" +
                    "<p> Your reset password code is " +
                    code +
                    "</p>",
            };
            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                    return res.status(400).json({ error });
                }
                else {
                    console.log("Email sent: " + info.response);
                    return res.json({
                        success: true,
                        message: "Email sent",
                    });
                }
            });
            // delete code after 5 minutes
            setTimeout(() => {
                db_1.User.findOneAndUpdate({
                    email: email,
                }, {
                    $set: {
                        resetPasswordCode: "",
                    },
                }, {
                    new: true,
                });
            }, 300000);
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.post("/verify-code", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        console.log("DATA BODY", req.body);
        try {
            // validate input
            const code = req.body.code || "";
            // remove whitespace
            if (code.trim() === "") {
                return res.status(400).json({
                    success: false,
                    message: "Code must not be empty",
                });
            }
            const userEmail = req.body.email || "";
            const found = yield db_1.User.findOne({
                email: userEmail,
            });
            // resposne
            if (!found) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            console.log("FOUND", found);
            if (found.resetPasswordCode !== req.body.code) {
                return res.status(400).json({
                    success: false,
                    message: "OTP is incorrect",
                });
            }
            return res.json({
                success: true,
                message: "OTP is correct",
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.put("/reset-password", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
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
            const userEmail = req.body.email || "";
            const found = yield db_1.User.findOne({
                email: userEmail,
            });
            // resposne
            if (!found) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            console.log("FOUND", found);
            if (found.resetPasswordCode !== req.body.code) {
                return res.status(400).json({
                    success: false,
                    message: "OTP is incorrect",
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
            // update new password, remove resetPasswordCode
            const updated = yield db_1.User.findOneAndUpdate({
                email: userEmail,
            }, {
                $set: {
                    password: req.body.password,
                    resetPasswordCode: "",
                },
            }, {
                new: true,
            });
            const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
            const token = jsonwebtoken_1.default.sign({ id: updated === null || updated === void 0 ? void 0 : updated._id }, jwtSecret, {
                expiresIn: 7776000, // 90 days
            });
            // resposne
            return res.json({
                success: true,
                message: "Password updated",
                user: (0, obj_1.exceptObjectProp)(updated === null || updated === void 0 ? void 0 : updated.toObject(), ["password"]),
                token,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    // update user
    route.post("/update", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _a, _b, _c, _d, _e, _f;
        console.log("DATA BODY", req.body);
        try {
            // validate input
            const password = req.body.password || "";
            // remove whitespace
            if (password.trim() === "") {
                return res.status(400).json({
                    success: false,
                    message: "Password must not be empty",
                });
            }
            // check if password first 4 character isnt * then hash password
            if (password.substring(0, 4) !== "****") {
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
            }
            else {
                const user = yield db_1.User.findOne({
                    _id: (_b = (_a = req.auth) === null || _a === void 0 ? void 0 : _a.user) === null || _b === void 0 ? void 0 : _b._id,
                });
                req.body.password = user === null || user === void 0 ? void 0 : user.password;
            }
            // dateOfBirth
            const dateOfBirth = req.body.dateOfBirth || "";
            req.body.dateOfBirth = (0, dayjs_1.default)(dateOfBirth, "mm/dd/yyyy").toDate();
            const user = user_1.UserSchema.parse(req.body);
            // save to db
            const found = yield db_1.User.findOne({
                _id: (_d = (_c = req.auth) === null || _c === void 0 ? void 0 : _c.user) === null || _d === void 0 ? void 0 : _d._id,
            });
            // resposne
            if (!found) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            if (user.photo) {
                let photoPath = req.body.photo.path.split("\\")[1];
                if (!photoPath) {
                    photoPath = req.body.photo.path.split("/")[1];
                }
                const bucket = yield (0, storage_1.GridStorage)();
                const file = fs_1.default.createReadStream(`./uploads/${photoPath}`).pipe(bucket.openUploadStream(photoPath, {
                    metadata: { contentType: "image/png" },
                }));
                user.photo = file.id;
            }
            // update
            const updated = yield db_1.User.findOneAndUpdate({
                _id: (_f = (_e = req.auth) === null || _e === void 0 ? void 0 : _e.user) === null || _f === void 0 ? void 0 : _f._id,
            }, {
                $set: Object.assign({}, user),
            }, {
                new: true,
            });
            // resposne
            return res.json({
                success: true,
                message: "Profile updated successfully",
                user: (0, obj_1.exceptObjectProp)(updated === null || updated === void 0 ? void 0 : updated.toObject(), ["password"]),
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    // update metric units , weight and height
    route.post("/update-metric", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _g, _h, _j, _k;
        console.log("DATA BODY", req.body);
        try {
            // save to db
            const found = yield db_1.User.findOne({
                _id: (_h = (_g = req.auth) === null || _g === void 0 ? void 0 : _g.user) === null || _h === void 0 ? void 0 : _h._id,
            });
            // resposne
            if (!found) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            // update
            const updated = yield db_1.User.findOneAndUpdate({
                _id: (_k = (_j = req.auth) === null || _j === void 0 ? void 0 : _j.user) === null || _k === void 0 ? void 0 : _k._id,
            }, {
                $set: Object.assign({}, req.body),
            }, {
                new: true,
            });
            // resposne
            return res.json({
                success: true,
                message: "Metric updated successfully",
                user: (0, obj_1.exceptObjectProp)(updated === null || updated === void 0 ? void 0 : updated.toObject(), ["password"]),
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    // part of reports
    route.get("/dashboard", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _l;
        try {
            const user = (_l = req.auth) === null || _l === void 0 ? void 0 : _l.user;
            // const
            const widgets = [
                {
                    name: "BMI",
                    handler: () => {
                        var _a, _b;
                        const userWeight = user === null || user === void 0 ? void 0 : user.weight;
                        const userHeight = user === null || user === void 0 ? void 0 : user.height;
                        const weightUnits = (_a = user === null || user === void 0 ? void 0 : user.metricUnits) === null || _a === void 0 ? void 0 : _a.weightUnits;
                        const heightUnits = (_b = user === null || user === void 0 ? void 0 : user.metricUnits) === null || _b === void 0 ? void 0 : _b.heightUnits;
                        const bmi = findBmi(weightUnits, heightUnits, userWeight, userHeight);
                        return `${bmi.toFixed(2)}`;
                    },
                },
                {
                    name: "BMI Status",
                    handler: () => {
                        var _a, _b;
                        const userWeight = user === null || user === void 0 ? void 0 : user.weight;
                        const userHeight = user === null || user === void 0 ? void 0 : user.height;
                        const weightUnits = (_a = user === null || user === void 0 ? void 0 : user.metricUnits) === null || _a === void 0 ? void 0 : _a.weightUnits;
                        const heightUnits = (_b = user === null || user === void 0 ? void 0 : user.metricUnits) === null || _b === void 0 ? void 0 : _b.heightUnits;
                        const bmi = findBmi(weightUnits, heightUnits, userWeight, userHeight);
                        let status = "";
                        if (bmi < 18.5) {
                            status = "Underweight";
                        }
                        else if (bmi >= 18.5 && bmi <= 24.9) {
                            status = "Normal";
                        }
                        else if (bmi >= 25 && bmi <= 29.9) {
                            status = "Overweight";
                        }
                        else if (bmi >= 30 && bmi <= 34.9) {
                            status = "Obesity";
                        }
                        else {
                            status = "Unknown";
                        }
                        return `${status}`;
                    },
                },
                {
                    name: "Calories",
                    handler: () => __awaiter(void 0, void 0, void 0, function* () {
                        const findAvgHr = (data) => {
                            // format data is [second, hrvalue]
                            let sum = 0;
                            let count = 0;
                            for (const item of data || []) {
                                sum += item[1];
                                count += 1;
                            }
                            return Math.round(sum / count);
                        };
                        const findCal = (report) => {
                            var _a, _b, _c, _d, _e;
                            // prepare variables
                            const startTime = dayjs_1.default.utc(report === null || report === void 0 ? void 0 : report.startTime).local();
                            const endTime = dayjs_1.default.utc(report === null || report === void 0 ? void 0 : report.endTime).local();
                            const diffTime = endTime.diff(startTime, "second");
                            const avgHr = findAvgHr(((_c = (_b = (_a = report === null || report === void 0 ? void 0 : report.reports) === null || _a === void 0 ? void 0 : _a.find((report) => (report === null || report === void 0 ? void 0 : report.type) === "hr")) === null || _b === void 0 ? void 0 : _b.data[0]) === null || _c === void 0 ? void 0 : _c.value) || []);
                            const secToMin = diffTime / 60;
                            const weightUnits = (_d = user === null || user === void 0 ? void 0 : user.metricUnits) === null || _d === void 0 ? void 0 : _d.weightUnits;
                            const energyUnits = (_e = user === null || user === void 0 ? void 0 : user.metricUnits) === null || _e === void 0 ? void 0 : _e.energyUnits;
                            const userWeight = user === null || user === void 0 ? void 0 : user.weight;
                            const userHeight = user === null || user === void 0 ? void 0 : user.height;
                            const userGender = user === null || user === void 0 ? void 0 : user.gender;
                            const age = (0, dayjs_1.default)().diff((0, dayjs_1.default)(user === null || user === void 0 ? void 0 : user.dateOfBirth), "year");
                            // calculate calories
                            let calories = 0;
                            switch (userGender) {
                                case "male":
                                    if (weightUnits == "kg") {
                                        calories =
                                            (secToMin *
                                                (0.6309 * avgHr +
                                                    0.1988 * userWeight +
                                                    0.2017 * age -
                                                    55.0969)) /
                                                4.184;
                                    }
                                    else if (weightUnits == "lbs") {
                                        let weightInKg = userWeight * 0.453592;
                                        calories =
                                            (secToMin *
                                                (0.6309 * avgHr +
                                                    0.1988 * weightInKg +
                                                    0.2017 * age -
                                                    55.0969)) /
                                                4.184;
                                    }
                                    break;
                                case "female":
                                    if (weightUnits == "kg") {
                                        calories =
                                            (secToMin *
                                                (0.4472 * avgHr -
                                                    0.1263 * userWeight +
                                                    0.074 * age -
                                                    20.4022)) /
                                                4.184;
                                    }
                                    else if (weightUnits == "lbs") {
                                        let weightInKg = userWeight * 0.453592;
                                        calories =
                                            (secToMin *
                                                (0.4472 * avgHr -
                                                    0.1263 * weightInKg +
                                                    0.074 * age -
                                                    20.4022)) /
                                                4.184;
                                    }
                                    break;
                                default:
                                    calories = 0;
                                    break;
                            }
                            if (energyUnits == "kcal") {
                                return calories;
                            }
                            else if (energyUnits == "kJ") {
                                return calories * 4.184;
                            }
                            return calories;
                        };
                        // get all session
                        const sessions = yield db_1.Session.find({
                            userId: user._id,
                        });
                        //
                        let cal = 0;
                        for (const session of sessions) {
                            try {
                                cal += findCal(yield (0, report_1.getReportFromSession)(session));
                            }
                            catch (error) { }
                        }
                        return `${cal.toFixed(2)} Cal`;
                    }),
                },
            ];
            const widgets_result = [];
            for (const r of widgets) {
                try {
                    widgets_result.push(Object.assign(Object.assign({}, r), { value: yield r.handler() }));
                }
                catch (error) { }
            }
            return res.json({
                success: true,
                message: "get data dashboard successfully",
                widgets: widgets_result,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.delete("/delete", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _m;
        console.log("DATA BODY", req.body);
        try {
            // schedule deletion in 2 weeks from now
            const user = (_m = req.auth) === null || _m === void 0 ? void 0 : _m.user;
            const deleteAt = (0, dayjs_1.default)().add(2, "week").toDate();
            const updated = yield db_1.User.findOneAndUpdate({
                _id: user._id,
            }, {
                $set: {
                    deleteAt,
                    requestDelete: true,
                },
            }, {
                new: true,
            });
            return res.json({
                success: true,
                message: "User will be deleted in 2 weeks",
                user: (0, obj_1.exceptObjectProp)(updated === null || updated === void 0 ? void 0 : updated.toObject(), ["password"]),
            });
            // find user based user session
            // const found = await User.findOne({
            //   _id: req.auth?.user?._id,
            // });
            // // user deletion
            // await User.findOneAndDelete({
            //   _id: found?._id,
            // });
            // // check if user photo is not empty string or length must same as object id length
            // if (found?.photo && found?.photo.length >= 24) {
            //   const bucket = await GridStorage();
            //   await bucket.delete(new mongoose.Types.ObjectId(found?.photo));
            // }
            // return res.json({
            //   success: true,
            //   message: "User deleted successfully",
            //   user: exceptObjectProp(found?.toObject(), ["password"]),
            // });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
};
exports.ApiAuth = ApiAuth;
