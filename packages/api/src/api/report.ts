import { z } from 'zod'
import express from 'express'
import mongoose from 'mongoose'
import { Exercise, Session } from '../db'
import { SessionSchema, SessionDataItemSchema, SessionDataItemDeviceSchema } from '../types/session'
import {
  ReportSchema,
  ReportDevicesSchema,
  ReportItemsSchema,
  ReportItemsType,
  ReportTypeHRSchema,
  ReportTypeGyroSchema,
} from '../types/report'

export interface DeviceRule {
  name: string
  check: (type: string) => boolean
  report: {
    type: string
    evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => any|false
  }[]
}

export const DevicesRules = [
  // for polar
  {
    name: 'Polar',
    check: (type: string) => type.includes('Polar'),
    report: [
      {
        type: 'hr',
        evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
          if (item.type === 'PolarDataType.hr') {
            const vals = (item.value || []) as { hr: number }[]
            const val = vals[0]?.hr || false
            return val ? [val] : false
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
        evaluate: (item: z.input<typeof SessionDataItemDeviceSchema>) => {
          if (item.type === 'PolarDataType.ecg') {
            const vals = (item.value || []) as { voltage: number }[]
            const val = vals[0]?.voltage || false
            return val ? [val] : false
          }
        }
      }
    ]
  }
]

export const getDeviceNameFromDataDeviceType = (type: string): [string|'Unknown', DeviceRule|undefined] => {
  for (const rules of DevicesRules) {
    if (rules.check(type)) {
      return [rules.name, rules]
    }
  }
  return ['Unknown', undefined]
}

// item: z.input<typeof SessionDataItemSchema>,
export const getParsedFromDataDevice = (device: z.input<typeof SessionDataItemDeviceSchema>) => {
  // evaluate device name
  const [deviceName, rules] = getDeviceNameFromDataDeviceType(device.type)

  // vars
  const reportsItems: {
    type: string
    value: any
  }[] = []

  // evaluate all posibles reports
  if (rules) {
    for (const rule of rules.report) {
      const val = rule.evaluate(device)
      if (val) {
        reportsItems.push({
          type: rule.type,
          value: val,
        })
      }
    }
  }

  return {
    deviceName,
    reportsItems,
  }
}

export const ApiReport = ({ route }: { route: express.Router }) => {
  route.get('/report/:id', async (req, res) => {
    try {
      const { id } = req.params
      const session = await Session.findById(id)
      if (!session) {
        return res.status(404).json({
          success: false,
          message: 'Session not found',
        })
      }

      // vars
      const devices: z.input<typeof ReportDevicesSchema> = []
      const reportsItems: z.input<typeof ReportItemsSchema> = []

      // evaluate data
      for (const item of session.data) {
        // continue if item no second
        if (typeof item.second === 'undefined' || !item.timeStamp || !item.devices || !item.devices.length) {
          continue
        }

        // evaluate per device
        for (const device of item.devices) {
          // continue if device type and identifier undefined
          if (!device.type || !device.identifier) {
            continue
          }

          const parsed = getParsedFromDataDevice(device as z.input<typeof SessionDataItemDeviceSchema>)
          // console.log('parsed', parsed.deviceName, device.type)

          // check if device already exists
          const deviceIndex = devices.findIndex((d) => d.identifier === device.identifier)
          if (deviceIndex === -1) {
            // add device
            devices.push({
              name: parsed.deviceName,
              identifier: device.identifier,
            })
          }

          // check data
          const reportsToListAccepted = [
            'hr',
            'ecg',
            // 'acc',
          ]
          for (const listreporttoacccepted of reportsToListAccepted) {
            const reportsItemsHr = parsed.reportsItems.filter((r) => r.type === listreporttoacccepted)
            for (const reportItem of reportsItemsHr) {
              const ri = reportsItems.find(item => item.type === listreporttoacccepted)
              if (ri) {
                const riDevice = ri.data.find(item => item.device === device.identifier)
                if (riDevice) {
                  const arg = reportItem.value
                  try {
                    if (Array.isArray(arg)) {
                      riDevice.value.push([item.second, ...arg])
                    }
                  } catch (error) {
                    riDevice.value.push([item.second])
                  }
                } else {
                  ri.data.push({
                    device: device.identifier,
                    value: [item.second, ...reportItem.value],
                  })
                }
              } else {
                reportsItems.push({
                  type: listreporttoacccepted as any,
                  data: [
                    {
                      device: device.identifier,
                      value: [
                        [item.second, ...reportItem.value],
                      ],
                    }
                  ]
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
        exerciseId: session.exercise?._id,
        sessionId: session._id,
        reports: reportsItems,
      } as z.input<typeof ReportSchema>)

      return res.json({
        success: true,
        message: 'Report generated',
        report,
        exercise: session.exercise,
      })
    } catch (error) {
      console.error(error)
      return res.status(500).json({ error })
    }
  })
}
