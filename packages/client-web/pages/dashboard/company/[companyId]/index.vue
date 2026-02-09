<script lang="ts" setup>
import { Api } from '~/utils/api';

definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})

const $route = useRoute()
const companyId = computed(() => Number($route.params.companyId as string || '0'))
if (!companyId.value)  navigateTo('/dashboard/company')

const { data, pending } = await useFetchWithAuth<Api.Company.Company.response>(Api.Company.Company.url(companyId.value))
const company_Id = computed(() => data.value?.company?._id)

const Exercise = (() => {
  const { data } = useFetchWithAuth<Api.Company.Exercises.response>(Api.Company.Exercises.url(companyId.value))
  const columns = [
    {
      key: 'no',
      label: '#',
    },
    {
      key: 'name',
      label: 'Name'
    },
    {
      key: 'type',
      label: 'type'
    },
    {
      key: 'difficulty',
      label: 'difficulty'
    },
    {
      key: 'duration',
      label: 'Duration'
    },
    {
      key: 'actions'
    }
  ]
  const exercises = computed(() => (data.value?.exercises || []).map((exercise, i) => ({
    no: i + 1,
    name: exercise.name,
    duration: exercise.duration + ' seconds',
    type: exercise.type,
    difficulty: exercise.difficulty,
  })))

  return {
    data,
    columns,
    exercises,
  }
})()

const Session = (() => {
  const { data, pending } = useFetchWithAuth<Api.Session.All.response>(Api.Session.All.url())
  return {
    sessions: computed(() => (data.value?.sessions || [])
      .filter((item) => item.companyId === company_Id.value)
    ),
  }
})()

const leave = async () => {
  try {
    const { data: _data, status } = await useFetchWithAuth<Api.Company.Leave.response>(Api.Company.Leave.url(), {
      method: 'DELETE',
      body: {
        code: data.value?.company._id
      }
    })
    console.log(_data)
    navigateTo('/dashboard/company')
  } catch (error) {
    console.error(error)
  }
}
</script>

<template>
  <div v-if="data" class="flex flex-col gap-4">
    <DashboardCompanyBannerCard :company="data?.company">
      <div class="absolute z-10 top-0 right-0 m-4">
        <UDropdown
          :items="[
            ...(data.company.isAdmin
              ? ([[
                { label: 'Manage Company', icon: 'i-heroicons-cog', to: `${$route.params.companyId}/manage` },
              ]])
              : ([])),
            [
              { label: 'Leave company', icon: 'i-heroicons-arrow-left-start-on-rectangle-20-solid', click: leave },
            ],
          ]"
        >
          <UButton icon="i-heroicons-cog" variant="ghost" />
        </UDropdown>
      </div>
    </DashboardCompanyBannerCard>
    <HeadlessTabGroup>
      <HeadlessTabList class="border-b-2 w-auto border-gray-500/20 rounded">
        <HeadlessTab v-for="(item, i) in ['Home', 'My Session', 'Exercises', 'Program', 'Information']" as="template" v-slot="{ selected }">
          <button
            :class="{
              'px-2 py-2 text-sm ': true,
              'rounded bg-gray-300/50 dark:bg-gray-700/50 font-bold': selected,
              '': !selected,
            }"
          >
            {{ item }}
          </button>
        </HeadlessTab>
      </HeadlessTabList>
      <HeadlessTabPanels>
        <HeadlessTabPanel>
          <div>
            <div class="font-semibold mb-4">Your Result on this Company Today</div>
            <div class="w-full grid grid-cols-3 gap-4">
              <UCard class="relative border-b border-orange-500">
                <Icon name="lets-icons:calories-light" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500" />
                <div class="font-bold text-3xl">1 Cal</div>
                <div class="ml-1 text-gray-600 dark:text-gray-300">Calories Burn</div>
              </UCard>
              <UCard class="relative border-b border-green-500">
                <Icon name="healthicons:body-outline" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500" />
                <div class="font-bold text-3xl">19.03</div>
                <div class="ml-1 text-gray-600 dark:text-gray-300">BMI</div>
              </UCard>
            </div>
          </div>
        </HeadlessTabPanel>
        <HeadlessTabPanel>
          <div class="flex flex-col gap-2">
            <NuxtLink
              v-for="(item, i) in Session.sessions.value" :key="i"
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
              <div class="flex flex-col items-end">
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
            <div v-if="!Session.sessions.value || Session.sessions.value?.length === 0" class="text-center">no session recorded</div>
          </div>
        </HeadlessTabPanel>
        <HeadlessTabPanel>
          <UTable :columns="Exercise.columns" :rows="Exercise.exercises.value" />
        </HeadlessTabPanel>
      </HeadlessTabPanels>
    </HeadlessTabGroup>
  </div>
</template>