'use client'
import { Button } from '@/components/ui'
import Image from 'next/image'
import { FaCalendar, FaClock } from 'react-icons/fa6'
import { Menu } from '@headlessui/react'
import { Bar, Line, Scatter, Bubble } from 'react-chartjs-2'
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  Filler,
} from 'chart.js/auto'
import { Fragment, useCallback, useMemo } from 'react'
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'

ChartJS.register(CategoryScale);
dayjs.extend(dayjsutc)

const pickTheme = (data: any) => {
  const theme: {
    [key: string]: {
      borderColor: string,
      backgroundColor: string,
    }
  } = {
    red: {
      borderColor: 'rgba(140, 00, 00, 1)',
      backgroundColor: 'rgba(140, 00, 00, 0.3)',
    },
    blue: {
      borderColor: 'rgba(68, 88, 240, 1)',
      backgroundColor: 'rgba(68, 88, 240, 0.3)',
    },
    green: {
      borderColor: 'rgba(47, 97, 68, 1)',
      backgroundColor: 'rgba(47, 97, 68, 0.3)',
    },
    orange: {
      borderColor: 'rgba(240, 88, 68, 1)',
      backgroundColor: 'rgba(240, 88, 68, 0.3)',
    },
    yellow: {
      borderColor: 'rgba(240, 240, 68, 1)',
      backgroundColor: 'rgba(240, 240, 68, 0.3)',
    },
    indigo: {
      borderColor: 'rgba(68, 88, 240, 1)',
      backgroundColor: 'rgba(68, 88, 240, 0.3)',
    }
  }

  let _data = {...data}
  const pickedTheme: string[] = []

  const randomPickTheme = (): string => {
    // dont pick theme if exist in pickedTheme
    const _theme = Object.keys(theme)[Math.floor(Math.random() * Object.keys(theme).length)]
    if (pickedTheme.includes(_theme)) {
      return randomPickTheme()
    }
    return _theme
  }

  for (const item of _data.datasets) {
    const themePicked = randomPickTheme()
    pickedTheme.push(themePicked)
    item.borderColor = theme[themePicked].borderColor
    item.backgroundColor = theme[themePicked].backgroundColor
  }

  return data
}

const downloadDataset = (parsedData: any, onlyDevice = undefined) => {
  const dataToCsv = []
  const headers = ['second']
  let fileName = 'heart-rate.csv'

  if (onlyDevice) {
    fileName = `heart-rate-${onlyDevice}.csv`
    headers.push(onlyDevice)
    const datasets = parsedData.datasets.find((item: any) => item?.label === onlyDevice)
    let index = 0
    for (const val of datasets?.data || []) {
      const second = parsedData.labels[index]
      // if
      dataToCsv.push([second, val])
      index += 1
    }
  } else {
    headers.push(...parsedData.datasets.map((item: any) => `hr - ${item?.label}`))
    let index = 0
    for (const second of parsedData.labels) {
      const row = [second]
      for (const dataset of parsedData.datasets) {
        row.push(dataset?.data[index])
      }
      dataToCsv.push(row)
      index += 1
    }
  }

  // convert headers, data to csv
  let csvContent = "data:text/csv;charset=utf-8," + headers.join(",") + "\n"
  for (const item of dataToCsv) {
    csvContent += item.join(",") + "\n"
  }

  // download csv
  const encodedUri = encodeURI(csvContent)
  const link = document.createElement("a")
  link.setAttribute("href", encodedUri)
  link.setAttribute("download", fileName)
  document.body.appendChild(link)
  link.click()
  document.body.removeChild(link)
}

export function useParseReportData(data: any) {
  const reports = useMemo(() => {
    const report = data?.report || {}

    const parsers = [
      {
        type: 'hr',
        evaluate: (item: any) => {
          const getData = (data: any) => {
            const _data = {
              labels: [] as number[],
              datasets: [] as {
                label: string,
                data: number[],
              }[],
            }
            // evaluate data
            let max_second = -1
            for (const device of item?.data || []) {
              const deviceName = report?.devices.find((d: any) => d?.identifier === device?.device)?.name || ""
              const datasetLabel = `${deviceName} (${device?.device})`
              const dataset = _data.datasets.find((dataset) => dataset.label === datasetLabel)
              if (!dataset) {
                _data.datasets.push({
                  label: datasetLabel,
                  data: [],
                })
              }

              for (const item of device?.value || []) {
                const second = parseInt(item[0] || 0)
                // const value = parseInt(item[1] || 0)
                if (second > max_second) {
                  max_second = second
                }
              }
            }
            // fill labels from 0 to max_second
            _data.labels = Array.from(Array(max_second + 1).keys()) || []
            // fill data
            for (const device of item?.data || []) {
              const deviceName = report?.devices.find((d: any) => d?.identifier === device?.device)?.name || ""
              const datasetLabel = `${deviceName} (${device?.device})`
              const dataset = _data.datasets.find((dataset) => dataset.label === datasetLabel)
              if (!dataset) {
                continue
              }
              for (const item of device?.value || []) {
                const second = item[0]
                const value = item[1]
                dataset.data[second] = value ? parseInt(value) : 0
              }
            }
            return _data
          }
          const getAverage = (data: any) => {
            let sum = 0
            let count = 0
            for (const item of data?.datasets || []) {
              for (const value of item?.data || []) {
                sum += value ? parseInt(value) : 0
                if (value) {
                  count += 1
                }
              }
            }
            return Math.round(sum / count)
          }
          const getMinMax = (data: any) => {
            let max = -1
            let min = Infinity
            for (const item of data?.datasets || []) {
              for (const value of item?.data || []) {
                if (value > max) {
                  max = value
                }
                if (value < min) {
                  min = value
                }
              }
            }
            return [min, max]
          }

          const data = getData(item)
          const [min, max] = getMinMax(data)

          return {
            data,
            average: getAverage(data),
            max,
            min,
          }
        }
      },
      {
        type: 'ecg',
        evaluate: (item: any) => {
          const getData = (data: any) => {
            const _data = {
              labels: [] as number[],
              datasets: [] as {
                label: string,
                data: number[],
              }[],
            }
            // evaluate data
            let max_second = -1
            for (const device of item?.data || []) {
              const deviceName = report?.devices.find((d: any) => d?.identifier === device?.device)?.name || ""
              const datasetLabel = `${deviceName} (${device?.device})`
              const dataset = _data.datasets.find((dataset) => dataset.label === datasetLabel)
              if (!dataset) {
                _data.datasets.push({
                  label: datasetLabel,
                  data: [],
                })
              }

              for (const item of device?.value || []) {
                const second = item[0] || 0
                const value = item[1] || 0
                if (second > max_second) {
                  max_second = second
                }
              }
            }
            // fill labels from 0 to max_second
            _data.labels = Array.from(Array(max_second + 1).keys()) || []
            // fill data
            for (const device of item?.data || []) {
              const deviceName = report?.devices.find((d: any) => d?.identifier === device?.device)?.name || ""
              const datasetLabel = `${deviceName} (${device?.device})`
              const dataset = _data.datasets.find((dataset) => dataset.label === datasetLabel)
              if (!dataset) {
                continue
              }
              for (const item of device?.value || []) {
                const second = item[0]
                const value = item[1]
                dataset.data[second] = value
              }
            }
            return _data
          }
          const getAverage = (data: any) => {
            let sum = 0
            let count = 0
            for (const item of data?.datasets || []) {
              for (const value of item?.data || []) {
                sum += value ? parseInt(value) : 0
                if (value) {
                  count += 1
                }
              }
            }
            return Math.round(sum / count)
          }
          const getMinMax = (data: any) => {
            let max = -1
            let min = Infinity
            for (const item of data?.datasets || []) {
              for (const value of item?.data || []) {
                if (value > max) {
                  max = value
                }
                if (value < min) {
                  min = value
                }
              }
            }
            return [min, max]
          }

          const data = getData(item)
          const [min, max] = getMinMax(data)

          return {
            data,
            average: getAverage(data),
            max,
            min,
          }
        }
      }
    ]

    // if (report?.)
    const _reports = []
    for (const item of report?.reports || []) {
      const parser = parsers.find((parser) => parser.type === item?.type)
      if (!parser) {
        continue
      }
      _reports.push({
        type: item?.type,
        data: parser.evaluate(item),
      })
    }

    // sort by priority [hr, ecg]
    _reports.sort((a, b) => {
      const priority = ['hr', 'ecg']
      return priority.indexOf(a?.type) - priority.indexOf(b?.type)
    })

    return _reports
  }, [data])

  const shorcuts = useMemo(() => {
    const findBmi = (weightUnits: string, heightUnits: string, userWeight: number, userHeight: number) => {
      let bmi = 0;
      switch (weightUnits) {
        case 'kg':
          switch (heightUnits) {
            case 'cm':
              bmi = userWeight / ((userHeight / 100) * (userHeight / 100));
              break;
            case 'ft':
              bmi = userWeight / ((userHeight * 12) * (userHeight * 12)) * 703;
              break;
          }
          break;

        case 'lbs':
          switch (heightUnits) {
            case 'cm':
              bmi = userWeight / ((userHeight / 100) * (userHeight / 100)) * 703;
              break;
            case 'ft':
              bmi = userWeight / ((userHeight * 12) * (userHeight * 12));
              break;
          }
          break;
      }
      return bmi;
    }
    const _rs = [
      {
        name: 'Calories',
        handler: () => {
          console.log('calc cal', data)
          const findAvgHr = (data: any) => {
            // format data is [second, hrvalue]
            let sum = 0
            let count = 0
            for (const item of data || []) {
              sum += item[1]
              count += 1
            }
            return Math.round(sum / count)
          }

          // prepare variables
          const startTime = dayjs.utc(data?.report?.startTime).local()
          const endTime = dayjs.utc(data?.report?.endTime).local()
          const diffTime = endTime.diff(startTime, 'second')
          const avgHr = findAvgHr(
            data?.report?.reports?.find((report: any) => report?.type === 'hr')?.data[0]?.value || []
          )
          const secToMin = diffTime / 60

          const weightUnits = data?.user?.metricUnits?.weightUnits
          const energyUnits = data?.user?.metricUnits?.energyUnits
          const userWeight = data?.user?.weight
          const userHeight = data?.user?.height
          const userGender = data?.user?.gender
          const age = dayjs().diff(dayjs(data?.user?.dateOfBirth), 'year')

          // show all vars
          console.log('vars', {
            startTime,
            endTime,
            diffTime,
            avgHr,
            weightUnits,
            energyUnits,
            userWeight,
            userHeight,
            userGender,
            age,
          })

          // calculate calories
          let calories = 0;
          switch (userGender) {
            case 'male':
              if (weightUnits == 'kg') {
                calories = secToMin *
                    (0.6309 * avgHr + 0.1988 * userWeight + 0.2017 * age - 55.0969) /
                    4.184;
              } else if (weightUnits == 'lbs') {
                let weightInKg = userWeight * 0.453592;
                calories = secToMin *
                    (0.6309 * avgHr + 0.1988 * weightInKg + 0.2017 * age - 55.0969) /
                    4.184;
              }
              break;

            case 'female':
              if (weightUnits == 'kg') {
                calories = secToMin *
                    (0.4472 * avgHr - 0.1263 * userWeight + 0.074 * age - 20.4022) /
                    4.184;
              } else if (weightUnits == 'lbs') {
                let weightInKg = userWeight * 0.453592;
                calories = secToMin *
                    (0.4472 * avgHr - 0.1263 * weightInKg + 0.074 * age - 20.4022) /
                    4.184;
              }
              break;

            default:
              calories = 0;
              break;
          }
          if (energyUnits == 'kcal') {
            return calories;
          } else if (energyUnits == 'kJ') {
            return calories * 4.184;
          }


          return `${calories.toFixed(2)} Cal`
        }
      },
      {
        name: 'BMI',
        handler: () => {
          const userWeight = data?.user?.weight
          const userHeight = data?.user?.height
          const weightUnits = data?.user?.metricUnits?.weightUnits
          const heightUnits = data?.user?.metricUnits?.heightUnits

          const bmi = findBmi(weightUnits, heightUnits, userWeight, userHeight)

          return `${bmi.toFixed(2)}`
        }
      },
      {
        name: 'BMI Status',
        handler: () => {
          const userWeight = data?.user?.weight
          const userHeight = data?.user?.height
          const weightUnits = data?.user?.metricUnits?.weightUnits
          const heightUnits = data?.user?.metricUnits?.heightUnits
          const bmi = findBmi(weightUnits, heightUnits, userWeight, userHeight)
          let status = '';
          if (bmi < 18.5) {
            status = 'Underweight';
          } else if (bmi >= 18.5 && bmi <= 24.9) {
            status = 'Normal';
          } else if (bmi >= 25 && bmi <= 29.9) {
            status = 'Overweight';
          } else if (bmi >= 30 && bmi <= 34.9) {
            status = 'Obesity';
          } else {
            status = 'Unknown';
          }
          return `${status}`
        }
      }
    ]

    return _rs.map((r) => ({
      ...r,
      value: r.handler(),
    }))
  }, [data])

  return {
    reports,
    shorcuts
  }
}

export function DetailReportHr({ data, average, max, min }: { data: any, average: number, max: number, min: number }) {
  const parsedData = useMemo(() => pickTheme(data), [data])
  const downloadCsv = useCallback((onlyDevice = undefined) => downloadDataset(parsedData, onlyDevice), [parsedData])

  return (
    <div className="dark:bg-gray-950 p-8 rounded-lg shadow">
      <div className="mb-4 flex justify-between items-center">
        <div>
          <h4 className="text-2xl font-semibold inline">
            Heart Rate
          </h4>
          <span className="ml-2 text-sm text-gray-400">(bpm)</span>
        </div>
        <div>
          <Menu>
            <Menu.Button className="inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded text-gray-700 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500">
              ...
            </Menu.Button>
            <Menu.Items className="absolute overflow-hidden -ml-[12rem] w-56 mt-2 origin-top-right bg-gray-800 divide-y divide-gray-700 rounded-md shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none flex flex-col">
              <Menu.Item>
                {({ active }) => (
                  <button
                    className={`${active && 'bg-blue-500'} px-4 py-2 text-left`}
                    onClick={() => {
                      downloadCsv()
                    }}
                  >
                    download csv all devices
                  </button>
                )}
              </Menu.Item>

              {parsedData.datasets.map((item: any) => (
                <Menu.Item key={Math.random()}>
                  {({ active }) => (
                    <button
                      className={`${active && 'bg-blue-500'} px-4 py-2 text-left`}
                      onClick={() => {
                        downloadCsv(item?.label)
                      }}
                    >
                      download csv ({item?.label})
                    </button>
                  )}
                </Menu.Item>
              ))}

              {/* <Menu.Item>
                {({ active }) => (
                  <a
                    className={`${active && 'bg-blue-500'} px-4 py-2`}
                    href="/account-settings"
                  >
                    Lihat raw data utuh
                  </a>
                )}
              </Menu.Item> */}
            </Menu.Items>
          </Menu>
        </div>
      </div>
      <div className="grid grid-cols-3 my-8">
        <div className="text-center">
          <div className="font-thin text-gray-300">Min</div>
          <div className="font-semibold text-xl">{min}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Average</div>
          <div className="font-semibold text-xl">{average}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Max</div>
          <div className="font-semibold text-xl">{max}</div>
        </div>
      </div>
      <div>
        <Line
          data={parsedData}
          // data={{
          //   labels: ["0", "1", "2", "3", "4", "5"],
          //   datasets: [
          //     {
          //       label: "Polar H10",
          //       data: [78, 88, 98, 90, 100, 88, 90, 92],
          //       borderColor: 'rgba(240, 88, 68, 1)',
          //       backgroundColor: 'rgba(240, 88, 68, 0.3)',
          //     },
          //     {
          //       label: "Polar 0H1",
          //       data: [78, 88, 96, 90, 102, 88, 90, 92],
          //       borderColor: 'rgba(140, 00, 00, 1)',
          //       backgroundColor: 'rgba(140, 00, 00, 0.3)',
          //     }
          //   ]
          // }}
          options={{
            plugins: {
              legend: {
                display: true,
              },
            },
            elements: {
              line: {
                tension: 0,
                borderWidth: 2,
                borderColor: 'rgba(240, 88, 68, 0.5)',
                fill: 'start',
                backgroundColor: 'rgba(240, 88, 68, 0.3)',
              },
              point: {
                radius: 0,
                hitRadius: 0,
              },
            },
            scales: {
              xAxis: {
                display: false,
              },
            }
          }}
        />
      </div>
    </div>
  )
}

export function DetailReportEcg({ data, average, max, min }: { data: any, average: number, max: number, min: number }) {
  const parsedData = useMemo(() => pickTheme(data), [data])
  const downloadCsv = useCallback((onlyDevice = undefined) => downloadDataset(parsedData, onlyDevice), [parsedData])

  return (
    <div className="dark:bg-gray-950 p-8 rounded-lg shadow">
      <div className="mb-4 flex justify-between items-center">
        <div>
          <h4 className="text-2xl font-semibold inline">
            ECG
          </h4>
        </div>
        <div>
          <Menu>
            <Menu.Button className="inline-flex items-center px-2.5 py-1.5 border border-transparent text-xs font-medium rounded text-gray-700 bg-gray-100 hover:bg-gray-200 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500">
              ...
            </Menu.Button>
            <Menu.Items className="absolute overflow-hidden -ml-[12rem] w-56 mt-2 origin-top-right bg-gray-800 divide-y divide-gray-700 rounded-md shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none flex flex-col">
              <Menu.Item>
                {({ active }) => (
                  <a
                    className={`${active && 'bg-blue-500'} px-4 py-2`}
                    href="/account-settings"
                  >
                    download csv all devices
                  </a>
                )}
              </Menu.Item>

              {parsedData.datasets.map((item: any) => (
                <Menu.Item key={Math.random()}>
                  {({ active }) => (
                    <button
                      className={`${active && 'bg-blue-500'} px-4 py-2 text-left`}
                      onClick={() => {
                        downloadCsv(item?.label)
                      }}
                    >
                      download csv ({item?.label})
                    </button>
                  )}
                </Menu.Item>
              ))}
            </Menu.Items>
          </Menu>
        </div>
      </div>
      <div className="grid grid-cols-3 my-8">
        <div className="text-center">
          <div className="font-thin text-gray-300">Min</div>
          <div className="font-semibold text-xl">{min}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Average</div>
          <div className="font-semibold text-xl">{average}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Max</div>
          <div className="font-semibold text-xl">{max}</div>
        </div>
      </div>
      <div>
        <Line
          data={parsedData}
          options={{
            plugins: {
              legend: {
                display: true,
              },
            },
            elements: {
              line: {
                tension: 0,
                borderWidth: 2,
                borderColor: 'rgba(68, 88, 240, 1)',
                fill: 'start',
                backgroundColor: 'rgba(68, 88, 240, 0.3)',
              },
              point: {
                radius: 0,
                hitRadius: 0,
              },
            },
            scales: {
              xAxis: {
                display: false,
              },
            }
          }}
        />
      </div>
    </div>
  )
}

export function ReportMainSection(props: {
  data: any
}) {
  const { reports, shorcuts } = useParseReportData(props.data)

  return (
    <>
      <div className="max-w-screen-lg w-full mx-auto py-14 pt-6 flex flex-col space-y-10">
        {/* overview widgets */}
        <div>
          <h3 className="text-2xl font-semibold mb-3">Shorcuts</h3>
          <div className="grid grid-cols-3 gap-4">
            {/* example create a line chart */}
            {reports.find((report) => report.type === 'hr') && (
              <div className="rounded shadow py-4 px-4 container overflow-hidden flex dark:bg-orange-400">
                <div className="flex flex-col w-1/2 item justify-center">
                  <div className="text-xs text-gray-200">Rata rata denyut jantung</div>
                  <div className="font-bold text-2xl">{reports.find((report) => report.type === 'hr')?.data?.average} bpm</div>
                </div>
                {/* line chart, absolute position bot-right */}
                <div className="w-1/2">
                  <Line
                    data={reports.find((report) => report.type === 'hr')?.data.data as any}
                    options={{
                      plugins: {
                        legend: {
                          display: false,
                        },
                      },
                      elements: {
                        line: {
                          tension: 0,
                          borderWidth: 2,
                          borderColor: 'rgba(47, 97, 68, 1)',
                          fill: 'start',
                          backgroundColor: 'rgba(47, 97, 68, 0.3)',
                        },
                        point: {
                          radius: 0,
                          hitRadius: 0,
                        },
                      },
                      scales: {
                        xAxis: {
                          display: false,
                        },
                        yAxis: {
                          display: false,
                        },
                        x: {
                          display: false,
                        },
                        y: {
                          display: false,
                        }
                      }
                    }}
                  />
                </div>
              </div>
            )}
            {reports.find((report) => report.type === 'ecg') && (
              <div className="rounded shadow py-4 px-4 container overflow-hidden flex dark:bg-blue-400">
                <div className="flex flex-col w-1/2 item justify-center">
                  <div className="text-xs text-gray-200">Rata rata ECG</div>
                  <div className="font-bold text-2xl">{reports.find((report) => report.type === 'ecg')?.data?.average} volt</div>
                </div>
                {/* line chart, absolute position bot-right */}
                <div className="w-1/2">
                  <Line
                    data={reports.find((report) => report.type === 'ecg')?.data.data as any}
                    options={{
                      plugins: {
                        legend: {
                          display: false,
                        },
                      },
                      elements: {
                        line: {
                          tension: 0,
                          borderWidth: 2,
                          borderColor: 'rgba(47, 97, 68, 1)',
                          fill: 'start',
                          backgroundColor: 'rgba(47, 97, 68, 0.3)',
                        },
                        point: {
                          radius: 0,
                          hitRadius: 0,
                        },
                      },
                      scales: {
                        xAxis: {
                          display: false,
                        },
                        yAxis: {
                          display: false,
                        },
                        x: {
                          display: false,
                        },
                        y: {
                          display: false,
                        }
                      }
                    }}
                  />
                </div>
              </div>
            )}
            {shorcuts.map((shortcut) => (
              <div
                key={Math.random()}
                className={`rounded h-[106px] shadow py-4 px-4 container overflow-hidden flex dark:bg-gray-800`}
              >
                <div className="flex flex-col w-1/2 item justify-center">
                  <div className="text-xs text-gray-200">{shortcut.name}</div>
                  <div className="font-bold text-2xl">{shortcut.value}</div>
                </div>
              </div>
            ))}
          </div>
        </div>

        {/* detail */}
        <div className="">
          <h3 className="text-2xl font-semibold mb-4">
            Detail
          </h3>
          <div className="flex flex-col space-y-6">
            {reports.map((report) => (
              <Fragment key={Math.random()}>
                {report?.type === 'hr' && (
                  <DetailReportHr data={report?.data?.data} average={report?.data?.average} max={report?.data?.max} min={report?.data?.min} />
                )}
                {report?.type === 'ecg' && (
                  <DetailReportEcg data={report?.data?.data} average={report?.data?.average} max={report?.data?.max} min={report?.data?.min} />
                )}
              </Fragment>
            ))}
          </div>
        </div>

        {/* devices */}
        <div>
          <h3 className="text-2xl font-semibold mb-3">Connected Device</h3>
          <div className="grid grid-cols-4 gap-4">
            {props.data?.report?.devices?.map((device: any) => (
              <div key={device?.identifier || Math.random()} className="rounded shadow container overflow-hidden flex items-center dark:bg-slate-900">
                <div className="w-14 h-14 relative overflow-hidden bg-red-500">
                  {/* <Image
                    src="https://images.tokopedia.net/img/cache/700/VqbcmM/2022/4/27/ec117ea4-79f5-4fa1-9e9a-5ebb8759705c.jpg"
                    alt="polarh10"
                    layout="fill"
                  /> */}
                </div>
                <div className="flex-1 ml-4">
                  <div className="text-lg font-semibold">{device?.name}</div>
                  <div className="text-xs italic text-gray-200">{device?.identifier}</div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </div>
    </>
  )
}
