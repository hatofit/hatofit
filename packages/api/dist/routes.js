"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.InitRoutes = void 0;
const express_1 = __importDefault(require("express"));
const express_route_grouping_1 = __importDefault(require("express-route-grouping"));
const auth_1 = require("./api/auth");
const exercise_1 = require("./api/exercise");
const report_1 = require("./api/report");
const session_1 = require("./api/session");
const company_1 = require("./api/company");
const InitRoutes = (app) => {
    // routes
    const root = new express_route_grouping_1.default("/", express_1.default.Router());
    root.group("/", (app) => {
        app.get("/", (req, res) => {
            res.json({
                message: "🚀",
            });
        });
        // manage
        (0, exercise_1.ApiExercises)({ route: app });
        (0, session_1.ApiSession)({ route: app });
        (0, report_1.ApiReport)({ route: app });
        (0, company_1.ApiCompany)({ route: app });
        // auth
        app.group("/auth", (app) => {
            (0, auth_1.ApiAuth)({ route: app });
        });
    });
    // use root group routes
    app.use("/api", root.export());
};
exports.InitRoutes = InitRoutes;
