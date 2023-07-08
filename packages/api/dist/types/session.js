"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.SessionSchema = void 0;
const zod_1 = require("zod");
exports.SessionSchema = zod_1.z.object({
    startTime: zod_1.z.number(),
    endTime: zod_1.z.number(),
    timelines: zod_1.z.array(zod_1.z.object({
        name: zod_1.z.string(),
        startTime: zod_1.z.number(),
    })),
    data: zod_1.z.array(zod_1.z.object({
        second: zod_1.z.number(),
        timeStamp: zod_1.z.number(),
        devices: zod_1.z.array(zod_1.z.object({
            type: zod_1.z.string(),
            identifier: zod_1.z.string(),
            value: zod_1.z.any(),
        }))
    }))
});
