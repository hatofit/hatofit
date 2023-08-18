import { z } from 'zod'

export const ReportTypeHRSchema = z.object({
  type: z.literal('hr'),
  data: z.array(
    z.object({
      device: z.string(),
      // value is [ [second, value], [second, value], [second, value], ... ]
      value: z.array(z.array(z.number())),
    })
  )
})

export const ReportTypeEcgSchema = z.object({
  type: z.literal('ecg'),
  data: z.array(
    z.object({
      device: z.string(),
      // value is [time, voltage], [time, voltage], [time, voltage], ...
      value: z.array(z.array(z.number())),
    })
  )
})

// akselometer
export const ReportTypeAccSchema = z.object({
  type: z.literal('acc'),
  data: z.array(
    z.object({
      device: z.string(),
      // value is [time, x, y, z], [time, x, y, z], [time, x, y, z], ...
      value: z.array(z.array(z.number())),
    })
  )
})

export const ReportTypeGyroSchema = z.object({
  type: z.literal('gyro'),
  data: z.array(
    z.object({
      device: z.string(),
      // value is [time, x, y, z], [time, x, y, z], [time, x, y, z], ...
      value: z.array(z.array(z.number())),
    })
  )
})

export const ReportDevicesSchema = z.array(
  z.object({
    name: z.string(),
    identifier: z.string(),
  })
)

export const ReportItemsType = z.union([ReportTypeHRSchema, ReportTypeEcgSchema, ReportTypeGyroSchema, ReportTypeAccSchema])

export const ReportItemsSchema = z.array(ReportItemsType)

export const ReportSchema = z.object({
  // string or null undefined
  exerciseId: z.string().nullable(),
  sessionId: z.string(),
  startTime: z.number(),
  endTime: z.number(),
  // devices list like [ { name: "polar0h1", identifier: "1234" }, { name: "polarh10", identifier: "5678" } ]
  devices: ReportDevicesSchema,
  // report is a list of ReportTypeHRSchema or ReportTypeGyroSchema
  reports: ReportItemsSchema,
})
