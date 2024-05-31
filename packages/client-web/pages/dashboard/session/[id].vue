<script lang="ts" setup>
import { Bar, Line, Doughnut } from 'vue-chartjs'
import {
  Chart as ChartJS,
  ArcElement,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
  
  LineElement,
  PointElement,
} from 'chart.js'
import { Api } from '~/utils/api';

ChartJS.register(ArcElement, Tooltip, Legend)

const $dayjs = useDayjs()
definePageMeta({
  // layout: 'dashboard',
  middleware: ['auth'],
})

const $route = useRoute()

const sessionId = computed(() => $route.params.id as string)
const { data, pending } = useFetchWithAuth<Api.Report.Get.response>(Api.Report.Get.url(sessionId.value))
</script>

<template>
  <div>
    <div class="h-[68px] border-b border-main w-full sticky top-0 flex items-center z-30 bg-gray-50/75 dark:bg-gray-950/75 backdrop-filter backdrop-blur-lg">
      <PageContainer class="flex-1 max-w-screen-lg mx-auto flex justify-between">
        <NuxtLink to="/dashboard/sessions" class="flex gap-2 items-center">
          <Icon name="fluent:arrow-left-16-regular" class="text-lg" />
          <span>Back</span>
        </NuxtLink>
        <div class="flex items-center gap-4 divide-x-2 divide-main">
          <div class="pl-4">
            <ButtonColorMode />
          </div>
        </div>
      </PageContainer>
    </div>
    <PageContainer>
      <PageSection>
        <UCard>
          <h2 class="text-xl font-semibold">{{ data?.exercise?.name || 'General' }}</h2>
          <div class="flex gap-4 mt-2 items-center">
            <div class="flex gap-1 items-center">
              <Icon name="fluent:calendar-20-regular" class="text-lg mb-0.5 text-red-500" />
              <div class="text-xs">{{ $dayjs(data?.report.startTime).format('dddd, DD MMMM YYYY') }}</div>
            </div>
            <div class="flex gap-1 items-center">
              <Icon name="fluent:clock-20-regular" class="text-lg mb-0.5 text-green-500" />
              <div class="text-xs">
                {{ $dayjs(data?.report.startTime).format('HH:mm:ss') }} - {{ $dayjs(data?.report.endTime).format('HH:mm:ss') }}
              </div>
            </div>
          </div>
        </UCard>
      </PageSection>
      <PageSection>
        <PageTitle text="Quick Report" />
        <div class="w-full grid grid-cols-3 gap-4">
          <!-- time exercise -->
          <UCard class="relative border-b border-blue-500">
            <Icon name="fluent:timer-20-regular" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500" />
            <div class="font-bold text-3xl">{{ getTimeInMorS(data?.report.startTime || 0, data?.report.endTime || 0) }}</div>
            <div class="ml-1 text-gray-600 dark:text-gray-300">Time Exercise</div>
          </UCard>
          <!-- calories burn -->
          <UCard class="relative border-b border-orange-500">
            <Icon name="lets-icons:calories-light" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500" />
            <div class="font-bold text-3xl">1 Cal</div>
            <div class="ml-1 text-gray-600 dark:text-gray-300">Calories Burn</div>
          </UCard>
          <!-- bmi -->
          <UCard class="relative border-b border-green-500">
            <Icon name="healthicons:body-outline" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500" />
            <div class="font-bold text-3xl">19.03</div>
            <div class="ml-1 text-gray-600 dark:text-gray-300">BMI</div>
          </UCard>
        </div>
      </PageSection>
      <PageSection>
        <PageTitle text="Detail" />
        <Suspense v-if="data">
          <LazySessionWidgetDetailWidget :data="data" />
          <template #fallback>
            Loading...
          </template>
        </Suspense>
      </PageSection>
      <PageSection>
        <PageTitle text="Stats" />
        <div class="flex flex-col gap-4">
          <UCard>
            <template #header>
              <div class="flex justify-between">
                <div class="flex items-end gap-2">
                  <h2 class="text-xl font-semibold">Training Intensity</h2>
                </div>
              </div>
            </template>
            <UMeterGroup :min="0" :max="100" size="md" indicator icon="i-heroicons-minus">
              <UMeter :value="20" color="gray" label="Maximum 90-100%" />
              <UMeter :value="10" color="red" label="Anaerobic 80-89%" />
              <UMeter :value="5" color="yellow" label="Aerobic 70-79%" />
              <UMeter :value="80" color="green" label="Endurance 60-69%" />
              <UMeter :value="15" color="green" label="Recovery 50-59%" />
              <!-- Total: 86 -->
            </UMeterGroup>
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
              <div
                v-for="(stat, j) in [
                  { label: 'Active', value: '558cal' },
                  { label: 'Afterburn', value: '100cal' },
                ]"
                class="text-center"
              >
                <div class="mb-2">{{ stat.label }}</div>
                <div class="text-3xl">
                  {{ stat.value }}
                </div>
              </div>
            </div>
            <div>
              <Doughnut
                :data="{
                  labels: ['Afterburn', 'Active'],
                  datasets: [
                    {
                      backgroundColor: ['#41B883', '#E46651'],
                      data: [75, 25]
                    }
                  ]
                }"
                :options="{
                  responsive: true,
                  maintainAspectRatio: false
                }"
              />
            </div>
          </UCard>
        </div>
      </PageSection>
      <PageSection>
        <PageTitle text="Devices" />
        <div class="w-full grid grid-cols-3 gap-4">
          <UCard v-for="(item, i) in data?.report.devices" class="relative border-b border-primary-500">
            <div class="flex gap-4 items-center">
              <Icon name="fluent:smartwatch-20-regular" class="text-6xl text-primary-500" />
              <div class="flex flex-col gap-1">
                <div class="">{{ item.name }}</div>
                <div class="text-xs text-gray-600 dark:text-gray-300">{{ item.identifier }}</div>
              </div>
            </div>
          </UCard>
        </div>
      </PageSection>
    </PageContainer>
  </div>
</template>