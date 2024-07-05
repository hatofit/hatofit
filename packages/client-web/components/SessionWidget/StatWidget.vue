<script lang="ts" setup>
import type { Api } from '~/utils/api';
import type { ReportParserHR as RPHR } from '~/utils/report';

const props = defineProps({
  data: {
    type: Object as PropType<Api.Report.Get.response>,
    required: true,
  }
})

const $dayjs = useDayjs()
const $auth = useAuth()

type IntensitySummary = {
  name: string;
  seconds: number;
  percent: number;
  maxVal: number;
  minVal: number;
  label: string;
};

function getIntensity(data: ReturnType<RPHR['parse']>, age: number): IntensitySummary[] {
  const maxHeartRate = 208 - (0.7 * age);

  const intensityZones = {
    // nama_zona: [minimal_hr, max_hr]
    maximum: [0.9 * maxHeartRate, maxHeartRate, '90% - 100%'],
    anaerobic: [0.8 * maxHeartRate, 0.89 * maxHeartRate, '80% - 89%'],
    aerobic: [0.7 * maxHeartRate, 0.79 * maxHeartRate, '70% - 79%'],
    endurance: [0.6 * maxHeartRate, 0.69 * maxHeartRate, '60% - 69%'],
    recovery: [0.5 * maxHeartRate, 0.59 * maxHeartRate, '50% - 59%'],
    lifeActive: [0, 0.49 * maxHeartRate, '0% - 49%'],
  } as { [key: string]: [number, number, string] };

  const heartRates = data.datasets[0].data;
  const intensityCount: { [key: string]: number } = {
    maximum: 0,
    anaerobic: 0,
    aerobic: 0,
    endurance: 0,
    recovery: 0,
    lifeActive: 0,
  };

  heartRates.forEach(heartRate => {
    if (heartRate >= intensityZones.maximum[0] && heartRate <= intensityZones.maximum[1]) {
      intensityCount.maximum += 1;
    } else if (heartRate >= intensityZones.anaerobic[0] && heartRate <= intensityZones.anaerobic[1]) {
      intensityCount.anaerobic += 1;
    } else if (heartRate >= intensityZones.aerobic[0] && heartRate <= intensityZones.aerobic[1]) {
      intensityCount.aerobic += 1;
    } else if (heartRate >= intensityZones.endurance[0] && heartRate <= intensityZones.endurance[1]) {
      intensityCount.endurance += 1;
    } else if (heartRate >= intensityZones.recovery[0] && heartRate <= intensityZones.recovery[1]) {
      intensityCount.recovery += 1;
    } else {
      intensityCount.lifeActive += 1;
    }
  });

  const totalSeconds = heartRates.length;
  const intensitySummary: IntensitySummary[] = [];

  for (const [key, value] of Object.entries(intensityCount)) {
    if (key !== 'lifeActive') {
    }
    intensitySummary.push({
      name: key,
      seconds: value,
      percent: (value / totalSeconds) * 100,
      maxVal: intensityZones[key][1],
      minVal: intensityZones[key][0],
      label: `${key} ${intensityZones[key][2]}`,
    } as any);
  }

  console.log('intensitySummary', intensitySummary);
  return intensitySummary;
}

const intensitySummary = computed(() => {
  const hrdata = props.data.report.reports.find((r) => r.type === 'hr')
  if (!hrdata) return
  const parser = new ReportParserHR()
  const parsed = parser.parse(hrdata.data)
  return getIntensity(parsed, 30)
})

const displayTimeSeconds = (seconds: number) => {
  // from seconds convert to display text hh:mm:ss format with dayjs
  return $dayjs().startOf('day').add(seconds, 'seconds').format('HH:mm:ss')
}

// onMounted(() => {
//   const hrdata = props.data.report.reports.find((r) => r.type === 'hr')
//   if (!hrdata) return
//   const parser = new ReportParserHR()
//   const parsed = parser.parse(hrdata.data)
//   console.log('parsed data', parsed, getIntensity(parsed, 23))
// })

const getColor = (i: number) => {
  // 0 - color red
  // 1 - color yellow
  // 2 - color green
  switch (i) {
    case 0:
      return 'gray'
    case 1:
      return 'red'
    case 2:
      return 'yellow'
    case 3:
      return 'green'
    case 4:
      return 'green'
    default:
      return 'gray'
  }
  return 'gray'
}
</script>

<template>
  <div class="flex flex-col gap-4">
    <UCard>
      <template #header>
        <div class="flex justify-between">
          <div class="flex items-end gap-2">
            <h2 class="text-xl font-semibold">Heart rate</h2>
          </div>
        </div>
      </template>
      <div class="flex justify-around mb-6">
        <div v-for="(stat, j) in [
          ['Age', Math.abs(Number($dayjs($auth.data.value?.user['dateOfBirth']).diff($dayjs(), 'year')))],
          ['Recomendation Max HR', 208 - (0.7 * 30)],
        ]" class="text-center">
          <div class="mb-2">{{ stat[0] }}</div>
          <div class="text-5xl">
            {{ stat[1] }}
          </div>
        </div>
      </div>
    </UCard>
    <UCard>
      <template #header>
        <div class="flex justify-between">
          <div class="flex items-end gap-2">
            <h2 class="text-xl font-semibold">Training Intensity</h2>
          </div>
        </div>
      </template>
      <UMeterGroup :min="0" :max="100" size="md" indicator icon="i-heroicons-minus">
        <!-- <UMeter :value="20" color="gray" label="Maximum 90-100%" />
        <UMeter :value="10" color="red" label="Anaerobic 80-89%" />
        <UMeter :value="5" color="yellow" label="Aerobic 70-79%" />
        <UMeter :value="80" color="green" label="Endurance 60-69%" />
        <UMeter :value="15" color="green" label="Recovery 50-59%" /> -->
        <!-- <UMeter
          v-for="(intensity, i) in intensitySummary"
          :key="i"
          :value="intensity.percent"
          :color="intensity.name === 'maximum' ? 'gray' : intensity.name === 'anaerobic' ? 'red' : intensity.name === 'aerobic' ? 'yellow' : intensity.name === 'endurance' ? 'green' : 'green'"
          :label="`${intensity.name.charAt(0).toUpperCase()}${intensity.name.slice(1)} ${intensity.percent.toFixed(2)}%`"
           -->
        <UMeter v-for="(intensity, i) in intensitySummary" :key="i" :value="intensity.percent" :color="getColor(i)"
          :label="`${intensity.label}`" :icon="intensity.name === 'maximum' ? 'i-heroicons-fire-20-solid' : intensity.name === 'anaerobic' ? 'i-heroicons-fire-20-solid' : intensity.name === 'aerobic' ? 'i-heroicons-fire-20-solid' : intensity.name === 'endurance' ? 'i-heroicons-fire-20-solid' : 'i-heroicons-fire-20-solid'" />
        <!-- Total: 86 -->
      </UMeterGroup>
      <div class="border-t border-gray-500/50 py-6 mt-6">
        <div>Zone Summary</div>
        <div v-for="item in intensitySummary" :key="item.name" class="flex justify-between">
          <div class="text-sm">
            {{ item.name }}
            ({{ Math.round(item.minVal) }} - {{ Math.round(item.maxVal) }}bpm)
          </div>
          <div class="text-xs">{{ item.seconds }}s | {{ displayTimeSeconds(item.seconds) }}</div>
        </div>
      </div>
    </UCard>
    <UCard>
      <template #header>
        <div class="flex justify-between">
          <div class="flex items-end gap-2">
            <h2 class="text-xl font-semibold">Energy Expenditure</h2>
          </div>
        </div>
      </template>
      <div class="flex justify-around mb-6">
        <div v-for="(stat, j) in [
          { label: 'Active', value: '558cal' },
          { label: 'Afterburn', value: '100cal' },
        ]" class="text-center">
          <div class="mb-2">{{ stat.label }}</div>
          <div class="text-3xl">
            {{ stat.value }}
          </div>
        </div>
      </div>
      <div>
        <Doughnut :data="{
          labels: ['Afterburn', 'Active'],
          datasets: [
            {
              backgroundColor: ['#41B883', '#E46651'],
              data: [75, 25]
            }
          ]
        }" :options="{
            responsive: true,
            maintainAspectRatio: false
          }" />
      </div>
    </UCard>
  </div>
</template>