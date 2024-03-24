<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})
</script>

<template>
  <div class="flex-1">
    <!-- <VBreadcrumb
      dashboard
      :links="[
        {
          label: 'Navigation',
          icon: 'i-heroicons-square-3-stack-3d'
        }, {
          label: 'Breadcrumb',
          icon: 'i-heroicons-link'
        }
      ]"
    /> -->
    <div class="flex justify-between">
      <PageTitle text="Your Company" />
      <div>
        <UDropdown
          :items="[
            [
              { label: 'Create Company', icon: 'i-heroicons-plus' },
            ]
          ]"
          :popper="{ placement: 'bottom-end' }"
        >
          <UButton color="white" trailing-icon="i-majesticons-dots-horizontal" />
        </UDropdown>
      </div>
    </div>
    <div class="w-full grid grid-cols-3 gap-4">
      <NuxtLink to="/dashboard/company/1" class="group">
        <UCard class="relative overflow-hidden border-b-2 h-[140px] border-orange-500 ring-2 ring-transparent group-hover:ring-gray-500">
          <NuxtImg
            class="absolute z-[1] top-0 left-0 transition-transform duration-300 transform scale-105 group-hover:scale-110"
            src="/images/scene/risen-wang-20jX9b35r_M-unsplash.jpg"
            alt="Company Image"
            :style="{
              width: '100%',
              height: '100%',
              objectFit: 'cover',
              objectPosition: 'center',
              filter: 'blur(2px) brightness(0.7)',
            }"
          />
          <div class="absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50">
            <div class="ml-1 text-gray-100">Ketintang Gym</div>
            <div class="ml-1 text-xs text-gray-300">JL Ketintang No 1</div>
          </div>
        </UCard>
      </NuxtLink>
    </div>
  </div>
</template>