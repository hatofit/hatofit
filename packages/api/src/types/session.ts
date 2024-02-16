import { z } from "zod";

export const SessionDataItemDeviceSchema = z.object({
  type: z.string(),
  identifier: z.string(),
  brand: z.string(),
  model: z.string(),
  value: z.any(),
});

export const SessionDataItemSchema = z.object({
  second: z.number(),
  timeStamp: z.number(),
  devices: z.array(SessionDataItemDeviceSchema),
});

export const SessionDataSchema = z.array(SessionDataItemSchema);

export const SessionSchema = z.object({
  startTime: z.number(),
  endTime: z.number(),
  mood: z.string(),
  timelines: z.array(
    z.object({
      name: z.string(),
      startTime: z.number(),
    })
  ),
  data: SessionDataSchema,
});
