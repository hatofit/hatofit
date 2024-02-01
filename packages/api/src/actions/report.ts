import { z } from "zod";
import { getParsedFromDataDevice } from "../api/report";
import {
  ReportDevicesSchema,
  ReportItemsSchema,
  ReportSchema,
} from "../types/report";
import { SessionDataItemDeviceSchema } from "../types/session";

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
      console.log("parsed", parsed);
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
                value: [[item.second, ...reportItem.value]],
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

  return report;
};
