import $dayjs from 'dayjs'

export const generatePastelColor = (): string => {
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

export class ReportParser {
  type: string = ''

  // constructor() {
  //   const $dayjs = useDayjs()
  //   $dayjs
  // }

  parse(...args: any[]) {
    return {
      stats: [] as { label: string, value: number }[],
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

export class ReportParserHR extends ReportParser {
  override type: string = 'hr'
  override parse(
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

    
    // count max min avg from merged data
    const stats: {
      label: string
      value: number
    }[] = [
      {
        label: 'Min',
        value: 0,
      },
      {
        label: 'Avg',
        value: 0,
      },
      {
        label: 'Max',
        value: 0,
      },
    ]
    {
      const values = Object.values(virtual_device_data.data)
      stats[0].value = Math.round(Math.min(...values))
      stats[1].value = Math.round(values.reduce((a, b) => a + b, 0) / values.length)
      stats[2].value = Math.round(Math.max(...values))
    }

    return {
      type: this.type,
      stats,
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

export class ReportParserECG extends ReportParser {
  override type: string = 'ecg'
  override parse(
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

    // count max min avg from merged data
    const stats: {
      label: string
      value: number
    }[] = [
      {
        label: 'Min',
        value: 0,
      },
      {
        label: 'Avg',
        value: 0,
      },
      {
        label: 'Max',
        value: 0,
      },
    ]
    {
      const values = Object.values(virtual_device_data.data)
      stats[0].value = Math.round(Math.min(...values))
      stats[1].value = Math.round(values.reduce((a, b) => a + b, 0) / values.length)
      stats[2].value = Math.round(Math.max(...values))
    }

    return {
      type: this.type,
      labels,
      stats,
      datasets: devices_datas.map(item => ({
        ...item,
        data: Object.values(item.data),
      })),
      yMin: Math.min(...devices_datas.map(item => Math.min(...Object.values(item.data)))),
      yMax: Math.max(...devices_datas.map(item => Math.max(...Object.values(item.data)))),
    }
  }
}