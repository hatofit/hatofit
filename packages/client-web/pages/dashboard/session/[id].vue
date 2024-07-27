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
// const { data, pending } = useFetchWithAuth<Api.Report.Get.response>(Api.Report.Get.url(sessionId.value))
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

    <LazySession :sessionId="sessionId" />
  </div>
</template>