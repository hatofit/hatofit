<script lang="ts" setup>
import { Bar, Line } from 'vue-chartjs'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
  
  LineElement,
  PointElement,
} from 'chart.js'
import type { Api } from '~/utils/api';

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, LineElement, PointElement)

const chartOptions = {
  responsive: true
}


const props = defineProps({
  data: {
    type: Object as PropType<Api.Report.Get.response>,
    required: true,
  }
})


const $dayjs = useDayjs()
const generatePastelColor = (): string => {
  // Menentukan nilai dasar untuk pastel yang cenderung lebih tinggi
  const baseLight = 150; // Nilai dasar untuk memastikan warna pastel
  const range = 105; // Range untuk variasi warna pastel, memastikan tidak terlalu gelap

  // Menghasilkan komponen RGB secara acak
  const r = baseLight + Math.floor(Math.random() * range);
  const g = baseLight + Math.floor(Math.random() * range);
  const b = baseLight + Math.floor(Math.random() * range);

  // Menggabungkan komponen RGB menjadi format string yang sesuai
  return `rgb(${r}, ${g}, ${b})`;
}
class ReportParser {
  type: string = ''

  parse(...args: any[]) {
    return {
      type: this.type,
      labels: [] as string[],
      datasets: [
        {
          label: '',
          data: [] as number[],
        }
      ],
      yMin: 0,
      yMax: 0,
    }
  }
}
class ReportParserHR extends ReportParser {
  type: string = 'hr'

  parse(
    data: {
      device: string
      value: [number, number][]
    }[]
  ) {

    // merge per second
    const seconds: number[] = []
    for (const item of data) {
      for (const [second, value] of item.value) {
        // check item.value[0] is number is second, if seconds exist, push to seconds array
        if (typeof second === 'number' && !seconds.includes(second)) {
          seconds.push(second)
        }
      }
    }

    // add data
    const devices_datas: {
      data: Record<number, number>
      borderColor: string
      label: string
    }[] = []
    for (const item of data) {
      const data = {
        data: {} as Record<number, number>,
        borderColor: generatePastelColor(),
        label: item.device,
        tension: 0,
        borderWidth: 2,
        fill: 'start',
        hidden: true,
      }

      for (const [second, value] of item.value) {
        if (typeof second === 'number' && seconds.includes(second)) {
          data.data[second] = value
        }
      }

      devices_datas.push(data)
    }

    // add virtual device for simulate merge data from all devices
    const virtual_device_data = {
      data: {} as Record<number, number>,
      borderColor: generatePastelColor(),
      label: 'Merged',
      tension: 0,
      borderWidth: 2,
      fill: 'start',
    }
    // merge from all device and make normalize data, make more smooth
    for (const second of seconds) {
      const values = devices_datas.map(item => item.data[second] || 0)
      virtual_device_data.data[second] = values.reduce((a, b) => a + b, 0) / values.length
    }
    devices_datas.unshift(virtual_device_data)

    // labels must depends on range of time list in seconds vars
    // if seconds vars in range 0 - 100 we can use second range as labels
    // if seconds vars in range >100 we can use minute range as labels
    
    // so, first check if seconds range > 100
    let range: 'second' | 'minute' = 'second'
    if (seconds[seconds.length - 1] > 100) {
      range = 'minute'
    }
    // use 00s format if range is second, use 00:00 format if range is minute
    // use dayjs
    const labels: string[] = []
    if (range === 'second') {
      for (const second of seconds) {
        labels.push($dayjs().startOf('day').add(second, 'second').format('s') + 's')
      }
    } else {
      for (const second of seconds) {
        labels.push($dayjs().startOf('day').add(second, 'second').format('mm:ss'))
      }
    }


    return {
      type: this.type,
      labels,
      datasets: devices_datas.map(item => ({
        ...item,
        data: Object.values(item.data),
      })),
      yMin: Math.min(...devices_datas.map(item => Math.min(...Object.values(item.data)))),
      yMax: Math.max(...devices_datas.map(item => Math.max(...Object.values(item.data)))),
    }
  }
}
class ReportParserECG extends ReportParser {
  type: string = 'ecg'

  parse(
    data: {
      device: string
      value: [number, number][]
    }[]
  ) {
    // merge per second
    const seconds: number[] = []
    for (const item of data) {
      for (const [second, value] of item.value) {
        // check item.value[0] is number is second, if seconds exist, push to seconds array
        if (typeof second === 'number' && !seconds.includes(second)) {
          seconds.push(second)
        }
      }
    }

    // add data
    const devices_datas: {
      data: Record<number, number>
      borderColor: string
      label: string
    }[] = []
    for (const item of data) {
      const data = {
        data: {} as Record<number, number>,
        borderColor: generatePastelColor(),
        label: item.device,
        tension: 0,
        borderWidth: 2,
        fill: 'start',
        hidden: true,
      }

      for (const [second, value] of item.value) {
        if (typeof second === 'number' && seconds.includes(second)) {
          data.data[second] = value
        }
      }

      devices_datas.push(data)
    }

    // add virtual device for simulate merge data from all devices
    const virtual_device_data = {
      data: {} as Record<number, number>,
      borderColor: generatePastelColor(),
      label: 'Merged',
      tension: 0,
      borderWidth: 2,
      fill: 'start',
    }
    // merge from all device and make normalize data, make more smooth
    for (const second of seconds) {
      const values = devices_datas.map(item => item.data[second] || 0)
      virtual_device_data.data[second] = values.reduce((a, b) => a + b, 0) / values.length
    }
    devices_datas.unshift(virtual_device_data)

    // labels must depends on range of time list in seconds vars
    // if seconds vars in range 0 - 100 we can use second range as labels
    // if seconds vars in range >100 we can use minute range as labels
    
    // so, first check if seconds range > 100
    let range: 'second' | 'minute' = 'second'
    if (seconds[seconds.length - 1] > 100) {
      range = 'minute'
    }
    // use 00s format if range is second, use 00:00 format if range is minute
    // use dayjs
    const labels: string[] = []
    if (range === 'second') {
      for (const second of seconds) {
        labels.push($dayjs().startOf('day').add(second, 'second').format('s') + 's')
      }
    } else {
      for (const second of seconds) {
        labels.push($dayjs().startOf('day').add(second, 'second').format('mm:ss'))
      }
    }

    return {
      type: this.type,
      labels,
      datasets: devices_datas.map(item => ({
        ...item,
        data: Object.values(item.data),
      })),
      yMin: Math.min(...devices_datas.map(item => Math.min(...Object.values(item.data)))),
      yMax: Math.max(...devices_datas.map(item => Math.max(...Object.values(item.data)))),
    }
  }
}

const generateECGData = (totalSeconds: number) => {
    const samplingRate = 256; // 256 sampel per detik
    const dataLength = totalSeconds * samplingRate; // Total sampel
    const ecgData: number[][] = [];
    const heartRate = 60; // Asumsikan 60 denyut per menit

    // Konstanta untuk simulasi gelombang
    const amplitude = 1; // Amplitudo maksimal gelombang
    const frequency = heartRate / 60; // Frekuensi gelombang dalam Hz

    for (let i = 0; i < dataLength; i++) {
        const time = i / samplingRate;

        // Mengoptimalkan perhitungan dengan menghitung nilai yang berulang
        const sinBase = 2 * Math.PI * frequency * time;

        // Gelombang P
        const pWave = amplitude * 0.1 * Math.sin(sinBase * 5);

        // Kompleks QRS
        const qrsComplex = amplitude * Math.sin(sinBase * 25);

        // Gelombang T
        const tWave = amplitude * 0.5 * Math.sin(sinBase * 2);

        // Kombinasikan semua gelombang
        const ecgValue = pWave + qrsComplex + tWave;

        // Menyertakan nilai detik saat ini bersama dengan nilai ECG yang dihitung
        ecgData.push([parseFloat(time.toFixed(2)), ecgValue]);
    }

    return ecgData;
}
const generateChartData = () => {
  // const sessionData = {
  //   id: 1,
  //   startTime: $dayjs().subtract(30, 'minute').toDate(),
  //   endTime: $dayjs().toDate(),
  //   reports: [
  //     {
  //       "type": "hr",
  //       "data": [
  //         {
  //           "device": "BBADFE28",
  //           value: [] as [number, number][],
  //           // "value": [
  //           //   [
  //           //     0,
  //           //     92
  //           //   ],
  //           //   [
  //           //     1,
  //           //     93
  //           //   ],
  //           //   [
  //           //     2,
  //           //     92
  //           //   ],
  //           //   [
  //           //     3,
  //           //     93
  //           //   ],
  //           //   [
  //           //     4,
  //           //     93
  //           //   ]
  //           // ]
  //         },
  //         {
  //           "device": "1BAD12B3",
  //           value: [] as [number, number][],
  //           // "value": [
  //           //   [
  //           //     0,
  //           //     91
  //           //   ],
  //           //   [
  //           //     1,
  //           //     92
  //           //   ],
  //           //   [
  //           //     2,
  //           //     93
  //           //   ],
  //           //   [
  //           //     3,
  //           //     91
  //           //   ],
  //           //   [
  //           //     4,
  //           //     92
  //           //   ]
  //           // ]
  //         },
  //       ]
  //     },
  //     {
  //       type: "ecg",
  //       data: [
  //         {
  //           device: "BBADFE28",
  //           value: [] as [number, number][],
  //         },
  //         {
  //           device: "1BAD12B3",
  //           value: [] as [number, number][],
  //         },
  //       ],
  //     }
  //   ]
  // }
  const sessionData = props.data.report
  const minute_to_second = 10 * 60
  // for (let i = 0; i < minute_to_second; i++) {
  //   // simulate 30minutes session data, random heart rate date 70 - 100
  //   // and add to sessionData.reports[0].data[0].value and sessionData.reports[0].data[1].value
  //   sessionData.reports[0].data[0].value.push([i, Math.floor(Math.random() * (100 - 70 + 1) + 70)])
  //   sessionData.reports[0].data[1].value.push([i, Math.floor(Math.random() * (100 - 70 + 1) + 70)])

  //   // simulate for ecg data, random with function generateECGData
  //   sessionData.reports[1].data[0].value.push(...generateECGData(5))
  //   // sessionData.reports[1].data[1].value.push(...generateECGData(10))
  // }

  // return
  const parsers = [
    new ReportParserHR(),
    new ReportParserECG(),
  ]

  const parsed: ReturnType<ReportParser['parse']>[] = []
  for (const report of sessionData.reports) {
    const parser = parsers.find(p => p.type === report.type)
    if (parser) {
      const res = parser.parse((report as any).data)
      parsed.push(res as any)
    }
  }

  console.log(parsed)

  return parsed
}

const generated = ref<ReturnType<typeof generateChartData> | []>([])
onMounted(() => {
  const run = (async () => {
    generated.value = generateChartData()
  })
  setTimeout(run, 1000)
})
</script>

<template>
  <div class="flex flex-col gap-4">
    <template v-for="(item, i) in generated">
      <!-- {{ JSON.stringify({ labels: item.labels, datasets: item.datasets }) }} -->
      <UCard v-if="item.type == 'hr'">
        <template #header>
          <div class="flex items-end gap-2">
            <h2 class="text-xl font-semibold">Heart Rate</h2>
            <span class="text-xs mb-0.5 text-gray-500">(bpm)</span>
          </div>
        </template>
        <Line
          :options="{
            ...chartOptions,
            elements: {
              point: {
                radius: 0,
                hitRadius: 0,
              },
            },
            scales: {
              // current tick interval is 00:15, 00:30, 00:45, 01:00, make more bigger like 00:30, 01:00, 01:30, 02:00
              x: {
                ticks: {
                  maxTicksLimit: 10,
                  maxRotation: 0,
                  minRotation: 0,
                },
              },
              // add more space / gap for Y, example +20, -20
              y: {
                suggestedMin: item.yMin - 20,
                suggestedMax: item.yMax + 20,
              },
            }
          }"
          :data="{
            labels: item.labels,
            datasets: [...item.datasets.map(item => ({
              ...item,
            }))],
          }"
        />
      </UCard>
      <UCard v-else-if="item.type == 'ecg'">
        <template #header>
          <div class="flex items-end gap-2">
            <h2 class="text-xl font-semibold">Electrocardiogram</h2>
            <span class="text-xs mb-0.5 text-gray-500">(mV)</span>
          </div>
        </template>
        <Line
          :options="{
            ...chartOptions,
            elements: {
              point: {
                radius: 0,
                hitRadius: 0,
              },
            },
            scales: {
              // current tick interval is 00:15, 00:30, 00:45, 01:00, make more bigger like 00:30, 01:00, 01:30, 02:00
              x: {
                ticks: {
                  maxTicksLimit: 10,
                  maxRotation: 0,
                  minRotation: 0,
                },
              },
              // add more space / gap for Y, example +20, -20
              y: {
                suggestedMin: item.yMin,
                suggestedMax: item.yMax,
              },
            }
          }"
          :data="{
            labels: item.labels,
            datasets: [...item.datasets.map(item => ({
              ...item,
            }))],
          }"
        />
      </UCard>
    </template>
    <div v-if="generated.length == 0">
      <div
        class="h-[600px] w-full rounded-lg bg-gray-100 dark:bg-gray-900 p-4 flex flex-col gap-4"
      >
        <div class="h-[50px] w-full rounded-lg bg-gray-300 dark:bg-gray-700 animate-pulse" />
        <div class="flex-1 w-full rounded-lg bg-gray-300 dark:bg-gray-700 animate-pulse" />
      </div>
    </div>
  </div>
</template>