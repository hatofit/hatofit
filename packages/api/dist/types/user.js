"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserSchema = void 0;
const zod_1 = require("zod");
exports.UserSchema = zod_1.z.object({
    email: zod_1.z.string(),
    password: zod_1.z.string(),
    firstName: zod_1.z.string(),
    lastName: zod_1.z.string(),
    dateOfBirth: zod_1.z.date(),
    photo: zod_1.z.any(),
    weight: zod_1.z.string(),
    height: zod_1.z.string(),
    gender: zod_1.z.enum(["male", "female"]),
    metricUnits: zod_1.z
        .object({
        energyUnits: zod_1.z.string(),
        weightUnits: zod_1.z.string(),
        heightUnits: zod_1.z.string(),
    })
        .optional(),
    //
    linkedCompanyId: zod_1.z.string().optional(),
});
