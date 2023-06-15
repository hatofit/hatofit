import { z } from 'zod'

export const SessionSchema = z.object({
  startTime: z.number(),
  endTime: z.number(),
  timelines: z.array(
    z.object({
      name: z.string(),
      startTime: z.number(),
    }),
  ),
  data: z.array(
    z.object({
      second: z.number(),
      timeStamp: z.number(),
      devices: z.array(
        z.object({
          type: z.string(),
          identifier: z.string(),
          value: z.any(),
        })
      )
    })
  )
})
