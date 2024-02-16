import express from "express";
import mongoose from "mongoose";
import { z } from "zod";
import { getReportFromSession } from "../actions/report";
import { ReportShare, Session, User } from "../db";
import { AuthJwtMiddleware } from "../middlewares/auth";
import { SessionDataItemDeviceSchema } from "../types/session";
import { exceptObjectProp } from "../utils/obj";

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

      const userIsAllowed = await ReportShare.findOne({
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
      console.error(error);
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

      const user_ids: string[] = [];
      const lists = await ReportShare.find({
        userShareId: userId,
      });
      lists.forEach((list) => {
        if (list.userViewId && !user_ids.includes(list.userViewId))
          user_ids.push(list.userViewId);
      });
      const users = await User.find({
        // find all users
        _id: { $in: user_ids },
      });

      return res.json({
        success: true,
        message: "get allowed user from me",
        lists: lists.map((list) => ({
          ...list.toObject(),
          userView: exceptObjectProp(
            users.find((item) => item._id === list.userViewId)?.toObject(),
            ["password"]
          ),
        })),
      });
    } catch (error) {
      console.error(error);
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

      const user_ids: string[] = [];
      const lists = await ReportShare.find({
        userViewId: userId,
      });
      lists.forEach((list) => {
        if (list.userShareId && !user_ids.includes(list.userShareId))
          user_ids.push(list.userShareId);
      });
      const users = await User.find({
        // find all users
        _id: { $in: user_ids },
      });

      return res.json({
        success: true,
        message: "get allowed user to me",
        lists: lists.map((list) => ({
          ...list.toObject(),
          userShare: exceptObjectProp(
            users.find((item) => item._id === list.userShareId)?.toObject(),
            ["password"]
          ),
        })),
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.get("/report/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const session = await Session.findById(id);
      const user = await User.findById(session?.userId);
      if (!session) {
        return res.status(404).json({
          success: false,
          message: "Session not found",
        });
      }

      const report = await getReportFromSession(session);

      return res.json({
        success: true,
        message: "Report generated",
        report,
        mood: session.mood,
        exercise: session.exercise,
        user: exceptObjectProp(user?.toObject(), ["password"]),
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });

  route.get("/report", AuthJwtMiddleware, async (req, res) => {
    try {
      const userId = req.auth?.user?._id;
      if (!userId || typeof userId !== "string" || userId.length === 0) {
        return res.json({
          success: false,
          message: "Invalid userId",
        });
      }
      // const { page, limit } = req.query;
      const sessions = await Session.find({
        userId: userId,
      });
      // .sort({ createdAt: -1 })
      // .skip(Number(page || 0) * Number(limit || 10))
      // .limit(Number(limit || 10));

      const reports = await Promise.all(
        sessions.map(async (session) => {
          const report = await getReportFromSession(session);
          return {
            report,
            mood: session.mood,
            exercise: session.exercise,
          };
        })
      );

      return res.json({
        success: true,
        message: "Reports generated",
        reports,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
};
