<script lang="ts" setup>
import { Api } from '~/utils/api';

definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})

const { data, pending } = useFetchWithAuth<Api.Session.All.response>(Api.Session.All.url())

const $dayjs = useDayjs()

const sessions = computed(() => {
  return (data.value?.sessions || [])
    // sort by createdAt desc
    .sort((a, b) => {
      return $dayjs(b.createdAt).diff($dayjs(a.createdAt))
    })
})
const todaySessions = computed(() => {
  return sessions.value.filter((item) => {
    return $dayjs(item.createdAt).isSame($dayjs(), 'day')
  })
})
const otherDaySessions = computed(() => {
  return sessions.value.filter((item) => {
    return !$dayjs(item.createdAt).isSame($dayjs(), 'day')
  })
})
</script>

<template>
  <div v-if="!pending" class="flex flex-col gap-8">
    <div class="w-full">
      <PageTitle text="Today" />
      <div class="flex flex-col gap-2">
        <NuxtLink
          v-for="(item, i) in todaySessions" :key="i"
          :to="`/dashboard/session/${item._id}`"
          class="transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
        >
          <div>
            <div class="font-semibold mb-1">
              <!-- <span v-if="item['company']" class="font-semibold">[COMPANY]&nbsp;</span> -->
              <span>{{ item.exercise?.name || 'General' }}</span>
            </div>
            <div class="text-sm flex gap-2 divide-x divide-gray-500/50">
              <div>{{ $dayjs(item.createdAt).format('dddd, DD MMMM YYYY') }}</div>
              <div class="pl-2">{{ $dayjs(item.createdAt).format('h:mm A') }}</div>
            </div>
          </div>
          <div class="flex flex-col items-end justify-center">
            <span v-if="item['company']" class="text-xs text-red-300">Company: {{ item['company']['name'] }}</span>
            <div class="text-xs flex items-center gap-2">
              <div class="flex items-center gap-1">
                <Icon name="i-material-symbols-timer-outline-rounded" class="text-lg text-green-500" />
                <span>
                  {{ getTimeInMorS(item.startTime, item.endTime) }}
                </span>
              </div>
              <div>
                <Icon name="lets-icons:calories-light" class="text-2xl text-orange-500" />
                <span class="pt-1">1Cal</span>
              </div>
              <div v-if="item['mood']">
                {{ item['mood'] }}
              </div>
            </div>
          </div>
        </NuxtLink>
        <div v-if="!todaySessions || todaySessions?.length === 0" class="text-center">no session recorded</div>
      </div>
    </div>
    <div>
      <PageTitle text="Another Day" />
      <div class="flex flex-col gap-2">
        <NuxtLink
          v-for="(item, i) in otherDaySessions" :key="i"
          :to="`/dashboard/session/${item._id}`"
          class="transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
        >
          <div>
            <div class="font-semibold mb-1">
              {{ item.exercise?.name || 'General' }}
            </div>
            <div class="text-sm flex gap-2 divide-x divide-gray-500/50">
              <div>{{ $dayjs(item.createdAt).format('dddd, DD MMMM YYYY') }}</div>
              <div class="pl-2">{{ $dayjs(item.createdAt).format('h:mm A') }}</div>
            </div>
          </div>
          <div class="flex flex-col items-end">
            <span v-if="item['company']" class="text-xs text-red-300">Company: {{ item['company']['name'] }}</span>
            <div class="text-xs flex items-center">
              <div class="flex items-center gap-1">
                <Icon name="i-material-symbols-timer-outline-rounded" class="text-lg text-green-500" />
                <span>
                  {{ getTimeInMorS(item.startTime, item.endTime) }}
                </span>
              </div>
              <div>
                <Icon name="lets-icons:calories-light" class="text-2xl text-orange-500" />
                <span>1Cal</span>
              </div>
            </div>
          </div>
        </NuxtLink>
      </div>
    </div>
  </div>
  <div v-if="pending">
    <PageTitle text="Sessions" />
    <div class="flex justify-center items-center">
      <Icon name="i-mingcute-loading-line" class="text-4xl text-primary-500 animate-spin" />
    </div>
  </div>
</template>