"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SessionSchema = exports.SessionDataSchema = exports.SessionDataItemSchema = exports.SessionDataItemDeviceSchema = void 0;
const zod_1 = require("zod");
exports.SessionDataItemDeviceSchema = zod_1.z.object({
    type: zod_1.z.string(),
    identifier: zod_1.z.string(),
    brand: zod_1.z.string(),
    model: zod_1.z.string(),
    value: zod_1.z.any(),
});
exports.SessionDataItemSchema = zod_1.z.object({
    second: zod_1.z.number(),
    timeStamp: zod_1.z.number(),
    devices: zod_1.z.array(exports.SessionDataItemDeviceSchema),
});
exports.SessionDataSchema = zod_1.z.array(exports.SessionDataItemSchema);
exports.SessionSchema = zod_1.z.object({
    startTime: zod_1.z.number(),
    endTime: zod_1.z.number(),
    mood: zod_1.z.string(),
    timelines: zod_1.z.array(zod_1.z.object({
        name: zod_1.z.string(),
        startTime: zod_1.z.number(),
    })),
    data: exports.SessionDataSchema,
});
