import { z } from "zod";
import { ReportDevicesSchema, ReportItemsSchema, ReportSchema } from "@/schemas/report";
import type { SessionDataItemDeviceSchema } from "@/schemas/session";


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

const RULE_POLAR_DEVICE = {
  name: "Polar",
  check: (type: string) => type.includes("Polar"),
  report: [
    {
      type: "hr",
      evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
        if (item.type === "PolarDataType.hr" || item.type === "CommonDataType.hr") {
          const vals = (item.value || []) as { hr: number }[];
          const val = vals[0]?.hr || false;
          return val ? [val] : false;
        }
      },
    },
    {
      type: "acc",
      evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
        if (item.type === "PolarDataType.acc" || item.type === "CommonDataType.acc") {
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
        if (item.type === "PolarDataType.gyro" || item.type === "CommonDataType.gyro") {
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
        if (item.type === "PolarDataType.ecg" || item.type === "CommonDataType.ecg") {
          const vals = (item.value || []) as { voltage: number }[];
          const val = vals[0]?.voltage || false;
          return val ? [val] : false;
        }
      },
    },
  ],
}

const RULE_COMMON_DEVICE = {
  ...RULE_POLAR_DEVICE,
  check: (type: string) => type.includes("Common"),
}

export const DevicesRules = [
  // for polar
  RULE_POLAR_DEVICE,
  // for common
  RULE_COMMON_DEVICE,
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

export const getReportFromSession = async (session: any) => {
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
      continue
    }

    // evaluate per device
    for (const device of item.devices) {
      // continue if device type and identifier undefined
      if (!device.type || !device.identifier) {
        continue
      }
      // console.log("device", device);
      const parsed = getParsedFromDataDevice(
        device as z.input<typeof SessionDataItemDeviceSchema>
      )
      // console.log("parsed", parsed);
      // console.log("parsed", parsed.deviceName, device.type);

      // check if device already exists
      const deviceIndex = devices.findIndex(
        (d) => d.identifier === device.identifier
      )
      if (deviceIndex === -1) {
        // add device
        devices.push({
          name: parsed.deviceName,
          identifier: device.identifier,
        })
      }

      // check data
      const reportsToListAccepted = [
        "hr",
        "ecg",
        "acc",
        "gyro",
        "magnetometer",
      ]
      for (const listreporttoacccepted of reportsToListAccepted) {
        const reportsItemsHr = parsed.reportsItems.filter(
          (r) => r.type === listreporttoacccepted
        )
        for (const reportItem of reportsItemsHr) {
          const ri = reportsItems.find(
            (item) => item.type === listreporttoacccepted
          )
          if (ri) {
            const riDevice = ri.data.find(
              (item) => item.device === device.identifier
            )
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
                value: [[item.second, ...reportItem.value]],
              })
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
            })
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

  return report;
};
