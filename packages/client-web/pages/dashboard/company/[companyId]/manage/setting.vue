<script lang="ts" setup>
import { Api } from '~/utils/api';
import { z } from 'zod';
import { FetchError } from 'ofetch'
import type { FormSubmitEvent } from '#ui/types'

definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})

const isLoading = ref(false)
const { companyId } = await useCompanyLayout()
const { data, refresh } = await useFetchWithAuth<Api.Company.Company.response>(Api.Company.Company.url(companyId.value))

const $dayjs = useDayjs()
const schema = z.object({
  name: z.string().min(4, 'Must be at least 4 characters'),
  description: z.string().min(4, 'Must be at least 4 characters'),
  address: z.string().min(4, 'Must be at least 4 characters'),
})
const state = ref({
  name: '',
  description: '',
  address: '',
})
type Schema = z.output<typeof schema>

const syncState = () => {
  state.value = {
    name: data.value?.company.name || '',
    description: data.value?.company.description || '',
    address: data.value?.company.address || '',
  }
}
onMounted(() => {
  syncState()
})

// const save = async () => 
async function onSubmit (event: FormSubmitEvent<Schema>) {
  // test
  isLoading.value = true

  try {
    // send
    const res = await $fetchWithAuth<Api.Company.UpdateCompany.response>(Api.Company.UpdateCompany.url(companyId.value), {
      method: 'PUT',
      body: JSON.stringify(Api.Company.UpdateCompany.parseData({
        name: state.value.name,
        description: state.value.description,
        address: state.value.address,
      }))
    })

    // update
    try {
      await refresh()
    } catch (error) {}
    syncState()
  } catch (error) {
    if (error instanceof FetchError && error.response) parseErrorFromResponseWithToast(error.response)
    console.error(error)
  }

  isLoading.value = false
}
</script>

<template>
  <div class="flex flex-col gap-4">
    <UCard>
      <template #header>
        <h2 class="text-xl font-semibold">General</h2>
      </template>

      <UForm :state="state" :schema="schema" @submit="onSubmit" class="flex flex-col gap-4">
        <UFormGroup label="Company Name" name="name" required>
          <UInput v-model="state.name" />
        </UFormGroup>
        <UFormGroup label="Company Description" name="description" required>
          <UTextarea v-model="state.description" />
        </UFormGroup>
        <UFormGroup label="Company Address" name="address" required>
          <UTextarea v-model="state.address" />
        </UFormGroup>
        <div class="flex justify-end">
          <UButton variant="solid" color="primary" type="submit" label="Save" />
        </div>
      </UForm>
    </UCard>
  </div>
</template>