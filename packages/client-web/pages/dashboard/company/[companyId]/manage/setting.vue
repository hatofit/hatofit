<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})

const $dayjs = useDayjs()
const state = ref({
  name: '',
  address: '',
})
</script>

<template>
  <div class="flex flex-col gap-4">
    <UCard>
      <template #header>
        <h2 class="text-xl font-semibold">General</h2>
      </template>

      <UForm :state="state" class="flex flex-col gap-4">
        <UFormGroup label="Company Name">
          <UInput v-model="state.name" />
        </UFormGroup>
        <UFormGroup label="Company Address">
          <UTextarea v-model="state.address" />
        </UFormGroup>
      </UForm>

      <template #footer>
        <div class="flex justify-end">
          <UButton variant="solid" color="primary" label="Save" />
        </div>
      </template>
    </UCard>
  </div>
</template>