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
ChartJS.register(CategoryScale);

export function HomeMainSection() {
  const data = {
    labels: ["0", "1", "2", "3", "4", "5"],
    datasets: [
      {
        data: [0.1, 0.4, 0.3, 0.5, 0.4, 0.6, 0.7, 0.8],
      }
    ]
  }

  return (
    <>
      <div className="max-w-screen-lg w-full mx-auto py-14 pt-6 flex flex-col space-y-10">
        {/* overview widgets */}
        <div>
          <h3 className="text-2xl font-semibold mb-3">Pintas</h3>
          <div className="grid grid-cols-3 gap-4">
            {/* example create a line chart */}
            <div className="rounded shadow py-4 px-4 container overflow-hidden flex dark:bg-orange-400">
              <div className="flex flex-col w-1/2 item justify-center">
                <div className="text-xs text-gray-200">Rata rata denyut jantung</div>
                <div className="font-bold text-2xl">90 bpm</div>
              </div>
              {/* line chart, absolute position bot-right */}
              <div className="w-1/2">
                <Line
                  data={data}
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
            <div className="rounded shadow py-4 px-4 container overflow-hidden flex dark:bg-blue-400">
              <div className="flex flex-col w-1/2 item justify-center">
                <div className="text-xs text-gray-200">Rata rata kecepatan</div>
                <div className="font-bold text-2xl">1 km/h</div>
              </div>
              {/* line chart, absolute position bot-right */}
              <div className="w-1/2">
                <Line
                  data={data}
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
          </div>
        </div>

        {/* detail */}
        <div className="">
          <h3 className="text-2xl font-semibold mb-4">
            Detail
          </h3>
          <div className="flex flex-col space-y-6">
            {/* detail:bpm */}
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
              <div className="grid grid-cols-2 my-8">
                <div className="text-center">
                  <div className="font-thin text-gray-300">Rata - Rata</div>
                  <div className="font-semibold text-xl">99</div>
                </div>
                <div className="text-center">
                  <div className="font-thin text-gray-300">Maksimum</div>
                  <div className="font-semibold text-xl">110</div>
                </div>
              </div>
              <div>
                <Line
                  data={{
                    labels: ["0", "1", "2", "3", "4", "5"],
                    datasets: [
                      {
                        label: "Polar H10",
                        data: [78, 88, 98, 90, 100, 88, 90, 92],
                        borderColor: 'rgba(240, 88, 68, 1)',
                        backgroundColor: 'rgba(240, 88, 68, 0.3)',
                      },
                      {
                        label: "Polar 0H1",
                        data: [78, 88, 96, 90, 102, 88, 90, 92],
                        borderColor: 'rgba(140, 00, 00, 1)',
                        backgroundColor: 'rgba(140, 00, 00, 0.3)',
                      }
                    ]
                  }}
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
            {/* detail:kecepatan */}
            <div className="dark:bg-gray-950 p-8 rounded-lg shadow">
              <div className="mb-4 flex justify-between items-center">
                <div>
                  <h4 className="text-2xl font-semibold inline">
                    Kecepatan
                  </h4>
                  <span className="ml-2 text-sm text-gray-400">(/km)</span>
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
              <div className="grid grid-cols-2 my-8">
                <div className="text-center">
                  <div className="font-thin text-gray-300">Rata - Rata</div>
                  <div className="font-semibold text-xl">99</div>
                </div>
                <div className="text-center">
                  <div className="font-thin text-gray-300">Tercepat</div>
                  <div className="font-semibold text-xl">110</div>
                </div>
              </div>
              <div>
                <Line
                  data={{
                    labels: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                    datasets: [
                      {
                        data: [78, 88, undefined, 90, 100, undefined, 90, 80, 90, 92, 94],
                      }
                    ]
                  }}
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
                    }
                  }}
                />
              </div>
            </div>
          </div>
        </div>

        {/* devices */}
        <div>
          <h3 className="text-2xl font-semibold mb-3">Alat yang terhubung</h3>
          <div className="grid grid-cols-4 gap-4">
            <div className="rounded shadow container overflow-hidden flex items-center dark:bg-red-400">
              <div className="w-14 h-1w-14 relative overflow-hidden">
                <img
                  src="https://images.tokopedia.net/img/cache/700/VqbcmM/2022/4/27/ec117ea4-79f5-4fa1-9e9a-5ebb8759705c.jpg"
                  alt="polarh10"
                />
              </div>
              <div className="flex-1 ml-4">
                <div className="text-lg font-semibold">Polar H10</div>
                <div className="text-xs italic text-gray-200">Polar</div>
              </div>
            </div>
            <div className="rounded shadow container overflow-hidden flex items-center dark:bg-blue-400">
              <div className="w-14 h-1w-14 relative overflow-hidden">
                <img
                  src="https://images.tokopedia.net/img/cache/700/VqbcmM/2022/4/27/ec117ea4-79f5-4fa1-9e9a-5ebb8759705c.jpg"
                  alt="polarh10"
                />
              </div>
              <div className="flex-1 ml-4">
                <div className="text-lg font-semibold">Polar 0H1</div>
                <div className="text-xs italic text-gray-200">Polar</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  )
}
