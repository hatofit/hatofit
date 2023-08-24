"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ReportSchema = exports.ReportItemsSchema = exports.ReportItemsType = exports.ReportDevicesSchema = exports.ReportTypeGyroSchema = exports.ReportTypeAccSchema = exports.ReportTypeEcgSchema = exports.ReportTypeHRSchema = void 0;
const zod_1 = require("zod");
exports.ReportTypeHRSchema = zod_1.z.object({
    type: zod_1.z.literal('hr'),
    data: zod_1.z.array(zod_1.z.object({
        device: zod_1.z.string(),
        // value is [ [second, value], [second, value], [second, value], ... ]
        value: zod_1.z.array(zod_1.z.array(zod_1.z.number())),
    }))
});
exports.ReportTypeEcgSchema = zod_1.z.object({
    type: zod_1.z.literal('ecg'),
    data: zod_1.z.array(zod_1.z.object({
        device: zod_1.z.string(),
        // value is [time, voltage], [time, voltage], [time, voltage], ...
        value: zod_1.z.array(zod_1.z.array(zod_1.z.number())),
    }))
});
// akselometer
exports.ReportTypeAccSchema = zod_1.z.object({
    type: zod_1.z.literal('acc'),
    data: zod_1.z.array(zod_1.z.object({
        device: zod_1.z.string(),
        // value is [time, x, y, z], [time, x, y, z], [time, x, y, z], ...
        value: zod_1.z.array(zod_1.z.array(zod_1.z.number())),
    }))
});
exports.ReportTypeGyroSchema = zod_1.z.object({
    type: zod_1.z.literal('gyro'),
    data: zod_1.z.array(zod_1.z.object({
        device: zod_1.z.string(),
        // value is [time, x, y, z], [time, x, y, z], [time, x, y, z], ...
        value: zod_1.z.array(zod_1.z.array(zod_1.z.number())),
    }))
});
exports.ReportDevicesSchema = zod_1.z.array(zod_1.z.object({
    name: zod_1.z.string(),
    identifier: zod_1.z.string(),
}));
exports.ReportItemsType = zod_1.z.union([exports.ReportTypeHRSchema, exports.ReportTypeEcgSchema, exports.ReportTypeGyroSchema, exports.ReportTypeAccSchema]);
exports.ReportItemsSchema = zod_1.z.array(exports.ReportItemsType);
exports.ReportSchema = zod_1.z.object({
    // string or null undefined
    exerciseId: zod_1.z.string().nullable(),
    sessionId: zod_1.z.string(),
    startTime: zod_1.z.number(),
    endTime: zod_1.z.number(),
    // devices list like [ { name: "polar0h1", identifier: "1234" }, { name: "polarh10", identifier: "5678" } ]
    devices: exports.ReportDevicesSchema,
    // report is a list of ReportTypeHRSchema or ReportTypeGyroSchema
    reports: exports.ReportItemsSchema,
});
