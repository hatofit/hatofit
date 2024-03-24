<script lang="ts" setup>
const route = useRoute()
const prefix = computed(() => `/dashboard/company/${route.params.companyId}/manage`)
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
  <BaseLayoutDashboard :links="links">
    <template #dashboard-header>
      <DashboardCompanyBannerCard class="mb-8">
        <div class="absolute z-10 top-0 left-0 m-4">
          <UButton icon="i-heroicons-arrow-left" label="Back" variant="solid" :to="`/dashboard/company/${$route.params.companyId}`" />
        </div>
      </DashboardCompanyBannerCard>
    </template>
    <slot />
  </BaseLayoutDashboard>
</template>