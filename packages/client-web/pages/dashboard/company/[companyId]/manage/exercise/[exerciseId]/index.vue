<script lang="ts" setup>
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import { Api } from '~/utils/api';
import { FetchError } from 'ofetch'

definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})


const $dayjs = useDayjs()
const $toast = useToast()
const $route = useRoute()
const { companyId } = await useCompanyLayout()
const exerciseId = computed(() => ($route.params.companyId as string))

const { data } = useFetchWithAuth<Api.Company.Exercise.response>(Api.Company.Exercise.url(companyId.value, exerciseId.value))

const columns = [
  {
    key: 'no',
    label: '#',
  },
  {
    key: 'name',
    label: 'Member'
  },
  {
    key: 'createdAt',
    label: 'Date'
  },
  {
    key: 'actions'
  }
]
const sessions = computed(() => (data.value?.sessions || []).map((exercise, i) => ({
  no: i + 1,
  id: exercise._id,
  userId: exercise.userId,
  name: `${exercise?.user?.firstName} ${exercise?.user?.lastName}`,
  createdAt: $dayjs(exercise.createdAt).format('dddd, DD MMMM YYYY h:mm A'),
})))

const reportOpenSessionId = ref<string>()
const isOpen = computed(() => !!reportOpenSessionId.value)
const items = (row: any) => ([
  [{
    label: 'Show Report',
    icon: 'i-heroicons-document-duplicate-20-solid',
    click: () => reportOpenSessionId.value = row.id
  }]
])

</script>

<template>
  <div>
    <div class="mb-6">
      <div>
        <h2 class="text-3xl">{{ data?.exercise?.name }}</h2>
        <p>Member Sessions</p>
      </div>
    </div>
    <UTable :columns="columns" :rows="sessions">
      <template #actions-data="{ row }">
        <UDropdown :items="items(row)">
          <UButton color="gray" variant="ghost" icon="i-heroicons-ellipsis-horizontal-20-solid" />
        </UDropdown>
      </template>
    </UTable>
    <UModal
      v-model="isOpen"
      :ui="{
        width: 'sm:max-w-5xl'
      }"
    >
      <UCard v-if="reportOpenSessionId">
        <template #header>
          <div class="flex justify-between">
            <h2 class="text-xl font-semibold">Session Report</h2>
            <UButton color="red" variant="soft" icon="i-heroicons-x-mark-20-solid" @click="reportOpenSessionId = undefined" />
          </div>
        </template>
        <LazySession :sessionId="reportOpenSessionId" />
      </UCard>
    </UModal>
  </div>
</template>