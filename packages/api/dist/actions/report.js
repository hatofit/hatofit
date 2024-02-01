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
Object.defineProperty(exports, "__esModule", { value: true });
exports.getReportFromSession = void 0;
const report_1 = require("../api/report");
const report_2 = require("../types/report");
const getReportFromSession = (session) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    // vars
    const devices = [];
    const reportsItems = [];
    // evaluate data
    for (const item of session.data) {
        // continue if item no second
        // console.log("item:", item);
        if (typeof item.second === "undefined" ||
            !item.timeStamp ||
            !item.devices ||
            !item.devices.length) {
            continue;
        }
        // evaluate per device
        for (const device of item.devices) {
            // continue if device type and identifier undefined
            if (!device.type || !device.identifier) {
                continue;
            }
            // console.log("device", device);
            const parsed = (0, report_1.getParsedFromDataDevice)(device);
            console.log("parsed", parsed);
            // console.log("parsed", parsed.deviceName, device.type);
            // check if device already exists
            const deviceIndex = devices.findIndex((d) => d.identifier === device.identifier);
            if (deviceIndex === -1) {
                // add device
                devices.push({
                    name: parsed.deviceName,
                    identifier: device.identifier,
                });
            }
            // check data
            const reportsToListAccepted = [
                "hr",
                "ecg",
                "acc",
                "gyro",
                "magnetometer",
            ];
            for (const listreporttoacccepted of reportsToListAccepted) {
                const reportsItemsHr = parsed.reportsItems.filter((r) => r.type === listreporttoacccepted);
                for (const reportItem of reportsItemsHr) {
                    const ri = reportsItems.find((item) => item.type === listreporttoacccepted);
                    if (ri) {
                        const riDevice = ri.data.find((item) => item.device === device.identifier);
                        if (riDevice) {
                            const arg = reportItem.value;
                            try {
                                if (Array.isArray(arg)) {
                                    riDevice.value.push([item.second, ...arg]);
                                }
                            }
                            catch (error) {
                                riDevice.value.push([item.second]);
                            }
                        }
                        else {
                            ri.data.push({
                                device: device.identifier,
                                value: [[item.second, ...reportItem.value]],
                            });
                        }
                    }
                    else {
                        reportsItems.push({
                            type: listreporttoacccepted,
                            data: [
                                {
                                    device: device.identifier,
                                    value: [[item.second, ...reportItem.value]],
                                },
                            ],
                        });
                    }
                }
            }
        }
    }
    // reports
    const report = report_2.ReportSchema.parse({
        startTime: session.startTime,
        endTime: session.endTime,
        devices,
        exerciseId: ((_a = session.exercise) === null || _a === void 0 ? void 0 : _a._id) || null,
        sessionId: session._id,
        reports: reportsItems,
    });
    return report;
});
exports.getReportFromSession = getReportFromSession;
