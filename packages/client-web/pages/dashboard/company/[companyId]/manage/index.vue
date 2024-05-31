<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})

const $toast = useToast()

const { companyId, company } = await useCompanyLayout()
const invitationLink = computed(() => {
  let res = window ? window.location.href : ''

  // res is http://localhost:3000/dashboard/company/1/manage so to ../../../
  res = res.split('/').slice(0, -4).join('/')

  // add /invite/:id
  res += '/invite/' + company?._id

  return res
})
const copyToClipboard = () => {
  navigator.clipboard.writeText(invitationLink.value)
  $toast.add({
    title: 'Copied',
    description: 'Invitation link copied to clipboard',
  })
}
</script>

<template>
  <div class="flex flex-col w-full gap-6">
    <div class="w-full grid grid-cols-3 gap-4">
      <UCard class="relative border-b border-green-500">
        <Icon name="healthicons:body-outline" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500" />
        <div class="font-bold text-3xl">100</div>
        <div class="ml-1 text-gray-600 dark:text-gray-300">Members</div>
      </UCard>
    </div>
    <UCard>
      <template #header>
        <div class="flex justify-between">
          <div class="font-bold text-xl">Invitation</div>
        </div>
      </template>
      <div class="flex">
        <UInput :model-value="invitationLink" disabled class="flex-1" />
        <UButton color="primary" @click="() => copyToClipboard()" class="ml-2" icon="i-heroicons-clipboard" />
      </div>
    </UCard>
  </div>
</template>