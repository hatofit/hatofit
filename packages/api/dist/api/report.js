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
exports.ApiReport = exports.getParsedFromDataDevice = exports.getDeviceNameFromDataDeviceType = exports.DevicesRules = void 0;
const db_1 = require("../db");
const report_1 = require("../types/report");
const auth_1 = require("../middlewares/auth");
exports.DevicesRules = [
    // for polar
    {
        name: 'Polar',
        check: (type) => type.includes('Polar'),
        report: [
            {
                type: 'hr',
                evaluate: (item) => {
                    var _a;
                    if (item.type === 'PolarDataType.hr') {
                        const vals = (item.value || []);
                        const val = ((_a = vals[0]) === null || _a === void 0 ? void 0 : _a.hr) || false;
                        return val ? [val] : false;
                    }
                }
            },
            // {
            //   type: 'acc',
            //   evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
            //     if (item.type === 'PolarDataType.acc') {
            //       const vals = (item.value || []) as { x: number, y: number, z: number }[]
            //       const val = vals[0] ? [vals[0].x, vals[0].y, vals[0].z] : false
            //       return val
            //     }
            //   }
            // },
            {
                type: 'ecg',
                evaluate: (item) => {
                    var _a;
                    if (item.type === 'PolarDataType.ecg') {
                        const vals = (item.value || []);
                        const val = ((_a = vals[0]) === null || _a === void 0 ? void 0 : _a.voltage) || false;
                        return val ? [val] : false;
                    }
                }
            }
        ]
    }
];
const getDeviceNameFromDataDeviceType = (type) => {
    for (const rules of exports.DevicesRules) {
        if (rules.check(type)) {
            return [rules.name, rules];
        }
    }
    return ['Unknown', undefined];
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
    route.get('/report/:id', (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _a;
        try {
            const { id } = req.params;
            const session = yield db_1.Session.findById(id);
            if (!session) {
                return res.status(404).json({
                    success: false,
                    message: 'Session not found',
                });
            }
            // vars
            const devices = [];
            const reportsItems = [];
            // evaluate data
            for (const item of session.data) {
                // continue if item no second
                if (typeof item.second === 'undefined' || !item.timeStamp || !item.devices || !item.devices.length) {
                    continue;
                }
                // evaluate per device
                for (const device of item.devices) {
                    // continue if device type and identifier undefined
                    if (!device.type || !device.identifier) {
                        continue;
                    }
                    const parsed = (0, exports.getParsedFromDataDevice)(device);
                    // console.log('parsed', parsed.deviceName, device.type)
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
                        'hr',
                        'ecg',
                        // 'acc',
                    ];
                    for (const listreporttoacccepted of reportsToListAccepted) {
                        const reportsItemsHr = parsed.reportsItems.filter((r) => r.type === listreporttoacccepted);
                        for (const reportItem of reportsItemsHr) {
                            const ri = reportsItems.find(item => item.type === listreporttoacccepted);
                            if (ri) {
                                const riDevice = ri.data.find(item => item.device === device.identifier);
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
                                        value: [item.second, ...reportItem.value],
                                    });
                                }
                            }
                            else {
                                reportsItems.push({
                                    type: listreporttoacccepted,
                                    data: [
                                        {
                                            device: device.identifier,
                                            value: [
                                                [item.second, ...reportItem.value],
                                            ],
                                        }
                                    ]
                                });
                            }
                        }
                    }
                }
            }
            // reports
            const report = report_1.ReportSchema.parse({
                startTime: session.startTime,
                endTime: session.endTime,
                devices,
                exerciseId: ((_a = session.exercise) === null || _a === void 0 ? void 0 : _a._id) || null,
                sessionId: session._id,
                reports: reportsItems,
            });
            return res.json({
                success: true,
                message: 'Report generated',
                report,
                exercise: session.exercise,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.post('/report/share', auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _b, _c;
        try {
            // validate user
            const userId = (_c = (_b = req.auth) === null || _b === void 0 ? void 0 : _b.user) === null || _c === void 0 ? void 0 : _c._id;
            if (!userId || typeof userId !== 'string' || userId.length === 0) {
                return res.json({
                    success: false,
                    message: 'Invalid userId',
                });
            }
            // validate body
            const emailUserToAllow = req.body.emailUserToAllow;
            if (!emailUserToAllow || typeof emailUserToAllow !== 'string' || emailUserToAllow.length === 0) {
                return res.json({
                    success: false,
                    message: 'Invalid emailUserToAllow',
                });
            }
            // search user by email
            const userByEmail = yield db_1.User.findOne({ email: emailUserToAllow });
            if (!userByEmail) {
                return res.json({
                    success: false,
                    message: 'User not found',
                });
            }
            // insert user to allow
            const userToAllow = yield db_1.ReportShare.create({
                userShareId: userId,
                userViewId: userByEmail._id || userByEmail.id,
            });
            if (!userToAllow) {
                return res.json({
                    success: false,
                    message: 'User not found',
                });
            }
            return res.json({
                success: true,
                message: 'User allowed',
                user: userByEmail.email,
            });
            // street email
        }
        catch (error) {
            return res.status(400).json({ error });
        }
    }));
};
exports.ApiReport = ApiReport;
