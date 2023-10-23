import path from 'path'
import fs from 'fs'

const res: any[] = []

const totalSeconds = 10 * 60
for (let i = 4; i < totalSeconds; i++) {
  // get random int from 70 - 100
  const hr = Math.floor(Math.random() * 30) + 70

  res.push({
    "second": i,
    "timeStamp": 1686913339097,
    "devices": [
      {
        "type": "PolarDataType.hr",
        "identifier": "BBADFE28",
        "value": [
          {
            "hr": hr,
            "rrsMs": [
              647
            ]
          }
        ]
      }
    ]
  })
}

fs.writeFileSync(path.join(__dirname, './res.json'), JSON.stringify(res, null, 2), 'utf8')
