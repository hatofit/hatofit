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
import { Fragment, useMemo } from 'react'
ChartJS.register(CategoryScale);

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

  return {
    reports
  }
}

export function DetailReportHr({ data, average, max, min }: { data: any, average: number, max: number, min: number }) {

  return (
    <div className="dark:bg-gray-950 p-8 rounded-lg shadow">
      <div className="mb-4 flex justify-between items-center">
        <div>
          <h4 className="text-2xl font-semibold inline">
            Denyut Jantung
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
                  <a
                    className={`${active && 'bg-blue-500'} px-4 py-2`}
                    href="/account-settings"
                  >
                    Unduh dalam csv
                  </a>
                )}
              </Menu.Item>
              <Menu.Item>
                {({ active }) => (
                  <a
                    className={`${active && 'bg-blue-500'} px-4 py-2`}
                    href="/account-settings"
                  >
                    Lihat raw data utuh
                  </a>
                )}
              </Menu.Item>
            </Menu.Items>
          </Menu>
        </div>
      </div>
      <div className="grid grid-cols-3 my-8">
        <div className="text-center">
          <div className="font-thin text-gray-300">Minimal</div>
          <div className="font-semibold text-xl">{min}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Rata - Rata</div>
          <div className="font-semibold text-xl">{average}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Maksimum</div>
          <div className="font-semibold text-xl">{max}</div>
        </div>
      </div>
      <div>
        <Line
          data={data}
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
                borderColor: 'rgba(240, 88, 68, 1)',
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
                    Unduh dalam csv
                  </a>
                )}
              </Menu.Item>
              <Menu.Item>
                {({ active }) => (
                  <a
                    className={`${active && 'bg-blue-500'} px-4 py-2`}
                    href="/account-settings"
                  >
                    Lihat raw data utuh
                  </a>
                )}
              </Menu.Item>
            </Menu.Items>
          </Menu>
        </div>
      </div>
      <div className="grid grid-cols-3 my-8">
        <div className="text-center">
          <div className="font-thin text-gray-300">Minimal</div>
          <div className="font-semibold text-xl">{min}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Rata - Rata</div>
          <div className="font-semibold text-xl">{average}</div>
        </div>
        <div className="text-center">
          <div className="font-thin text-gray-300">Maksimum</div>
          <div className="font-semibold text-xl">{max}</div>
        </div>
      </div>
      <div>
        <Line
          data={data}
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
  const { reports } = useParseReportData(props.data)

  return (
    <>
      <div className="max-w-screen-lg w-full mx-auto py-14 pt-6 flex flex-col space-y-10">
        {/* overview widgets */}
        <div>
          <h3 className="text-2xl font-semibold mb-3">Pintas</h3>
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
          <h3 className="text-2xl font-semibold mb-3">Alat yang terhubung</h3>
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
