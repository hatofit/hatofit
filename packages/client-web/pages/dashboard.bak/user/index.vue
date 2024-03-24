<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})
</script>

<template>
  <div class="flex-1">
    <PageTitle text="Your Result Today" />
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
</template>