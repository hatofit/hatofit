<script lang="ts" setup>
import { Api } from '~/utils/api';

const $route = useRoute()
const companyId = computed(() => Number($route.params.companyId as string || '0'))
if (!companyId.value)  navigateTo('/dashboard/company')

const { data, pending } = await useFetchWithAuth<Api.Company.Company.response>(Api.Company.Company.url(companyId.value))

const prefix = computed(() => `/dashboard/company/${$route.params.companyId}/manage`)
const links = computed(() => [
  [
    {
      label: 'Home',
      icon: 'i-heroicons-command-line',
      to: `${prefix.value}`
    },
  ],
  [
    {
      label: 'Exercises',
      icon: 'i-material-symbols-light-exercise-outline',
      to: `${prefix.value}/exercise`
    },
    {
      label: 'Programs',
      icon: 'i-heroicons-calendar',
      to: `${prefix.value}/program`
    }
  ],
  [
    {
      label: 'Members',
      icon: 'i-heroicons-user-group',
      to: `${prefix.value}/member`
    },
    {
      label: 'Setting',
      icon: 'i-heroicons-user',
      to: `${prefix.value}/setting`
    }
  ]
])
</script>

<template>
  <BaseLayoutDashboard v-if="data" :links="links">
    <template #dashboard-header>
      <DashboardCompanyBannerCard :company="data?.company"class="mb-8">
        <div class="absolute z-10 top-0 left-0 m-4">
          <UButton icon="i-heroicons-arrow-left" label="Back" variant="solid" :to="`/dashboard/company/${$route.params.companyId}`" />
        </div>
      </DashboardCompanyBannerCard>
    </template>
    <slot />
  </BaseLayoutDashboard>
</template>