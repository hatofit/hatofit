import express from "express";
import { z } from "zod";
import { ReportShare, Session, User } from "../db";
import { AuthJwtMiddleware } from "../middlewares/auth";
import {
  ReportDevicesSchema,
  ReportItemsSchema,
  ReportSchema,
} from "../types/report";
import { SessionDataItemDeviceSchema } from "../types/session";
import mongoose from "mongoose";

export interface DeviceRule {
  name: string;
  check: (type: string) => boolean;
  report: {
    type: string;
    evaluate: (
      item: z.input<typeof SessionDataItemDeviceSchema>
    ) => any | false;
  }[];
}

export const DevicesRules = [
  // for polar
  {
    name: "Polar",
    check: (type: string) => type.includes("Polar"),
    report: [
      {
        type: "hr",
        evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
          if (item.type === "PolarDataType.hr") {
            const vals = (item.value || []) as { hr: number }[];
            const val = vals[0]?.hr || false;
            return val ? [val] : false;
          }
        },
      },
      {
        type: "acc",
        evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
          if (item.type === "PolarDataType.acc") {
            const vals = (item.value || []) as {
              x: number;
              y: number;
              z: number;
            }[];
            const val = vals[0] ? [vals[0].x, vals[0].y, vals[0].z] : false;
            return val;
          }
        },
      },
      {
        type: "gyro",
        evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
          if (item.type === "PolarDataType.gyro") {
            const vals = (item.value || []) as {
              x: number;
              y: number;
              z: number;
            }[];
            const val = vals[0] ? [vals[0].x, vals[0].y, vals[0].z] : false;
            return val;
          }
        },
      },
      {
        type: "ecg",
        evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
          if (item.type === "PolarDataType.ecg") {
            const vals = (item.value || []) as { voltage: number }[];
            const val = vals[0]?.voltage || false;
            return val ? [val] : false;
          }
        },
      },
    ],
  },
];

export const getDeviceNameFromDataDeviceType = (
  type: string
): [string | "Unknown", DeviceRule | undefined] => {
  for (const rules of DevicesRules) {
    if (rules.check(type)) {
      return [rules.name, rules];
    }
  }
  return ["Unknown", undefined];
};

// item: z.input<typeof SessionDataItemSchema>,
export const getParsedFromDataDevice = (
  device: z.input<typeof SessionDataItemDeviceSchema>
) => {
  // evaluate device name
  const [deviceName, rules] = getDeviceNameFromDataDeviceType(device.type);

  // vars
  const reportsItems: {
    type: string;
    value: any;
  }[] = [];

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

export const ApiReport = ({ route }: { route: express.Router }) => {
  route.get("/report/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const session = await Session.findById(id);
      if (!session) {
        return res.status(404).json({
          success: false,
          message: "Session not found",
        });
      }

      // vars
      const devices: z.input<typeof ReportDevicesSchema> = [];
      const reportsItems: z.input<typeof ReportItemsSchema> = [];

      // evaluate data
      for (const item of session.data) {
        // continue if item no second
        // console.log("item:", item);
        if (
          typeof item.second === "undefined" ||
          !item.timeStamp ||
          !item.devices ||
          !item.devices.length
        ) {
          continue;
        }

        // evaluate per device
        for (const device of item.devices) {
          // continue if device type and identifier undefined
          if (!device.type || !device.identifier) {
            continue;
          }
          // console.log("device", device);
          const parsed = getParsedFromDataDevice(
            device as z.input<typeof SessionDataItemDeviceSchema>
          );
          // console.log("parsed", parsed.deviceName, device.type);

          // check if device already exists
          const deviceIndex = devices.findIndex(
            (d) => d.identifier === device.identifier
          );
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
            const reportsItemsHr = parsed.reportsItems.filter(
              (r) => r.type === listreporttoacccepted
            );
            for (const reportItem of reportsItemsHr) {
              const ri = reportsItems.find(
                (item) => item.type === listreporttoacccepted
              );
              if (ri) {
                const riDevice = ri.data.find(
                  (item) => item.device === device.identifier
                );
                if (riDevice) {
                  const arg = reportItem.value;
                  try {
                    if (Array.isArray(arg)) {
                      riDevice.value.push([item.second, ...arg]);
                    }
                  } catch (error) {
                    riDevice.value.push([item.second]);
                  }
                } else {
                  ri.data.push({
                    device: device.identifier,
                    value: [item.second, ...reportItem.value],
                  });
                }
              } else {
                reportsItems.push({
                  type: listreporttoacccepted as any,
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
      const report = ReportSchema.parse({
        startTime: session.startTime,
        endTime: session.endTime,
        devices,
        exerciseId: session.exercise?._id || null,
        sessionId: session._id,

        reports: reportsItems,
      } as z.input<typeof ReportSchema>);
      console.log("devices:", devices);
      console.log("reportsItems:", reportsItems);
      return res.json({
        success: true,
        message: "Report generated",
        report,
        mood: session.mood,
        exercise: session.exercise,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.post("/report/share", AuthJwtMiddleware, async (req, res) => {
    try {
      // validate user
      const userId = req.auth?.user?._id;
      if (!userId || typeof userId !== "string" || userId.length === 0) {
        return res.json({
          success: false,
          message: "Invalid userId",
        });
      }

      // validate body
      const emailUserToAllow = req.body.emailUserToAllow;
      if (
        !emailUserToAllow ||
        typeof emailUserToAllow !== "string" ||
        emailUserToAllow.length === 0
      ) {
        return res.json({
          success: false,
          message: "Invalid emailUserToAllow",
        });
      }

      // search user by email
      const userByEmail = await User.findOne({ email: emailUserToAllow });
      if (!userByEmail) {
        return res.json({
          success: false,
          message: "User not found",
        });
      }

      // insert user to allow
      const userToAllow = await ReportShare.create({
        _id: new mongoose.Types.ObjectId().toHexString(),
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
    } catch (error) {
      console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.get("/report/share", AuthJwtMiddleware, async (req, res) => {
    try {
      // validate user
      const userId = req.auth?.user?._id;
      if (!userId || typeof userId !== "string" || userId.length === 0) {
        return res.json({
          success: false,
          message: "Invalid userId",
        });
      }

      const lists = await ReportShare.find({
        userShareId: userId,
      });

      return res.json({
        success: true,
        message: "get allowed user from me",
        lists: lists.map((list) => list.toObject())
      })
    } catch (error) {
      console.error(error)
      return res.status(500).json({ error });
    }
  });
  route.get("/report/share/tome", AuthJwtMiddleware, async (req, res) => {
    try {
      // validate user
      const userId = req.auth?.user?._id;
      if (!userId || typeof userId !== "string" || userId.length === 0) {
        return res.json({
          success: false,
          message: "Invalid userId",
        });
      }

      const lists = await ReportShare.find({
        userViewId: userId,
      });

      return res.json({
        success: true,
        message: "get allowed user to me",
        lists: lists.map((list) => list.toObject())
      })
    } catch (error) {
      console.error(error)
      return res.status(500).json({ error });
    }
  });
};
