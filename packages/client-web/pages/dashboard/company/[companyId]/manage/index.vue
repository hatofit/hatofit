<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})
</script>

<template>
  <div class="w-full grid grid-cols-3 gap-4">
    <UCard class="relative border-b border-green-500">
      <Icon name="healthicons:body-outline" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500" />
      <div class="font-bold text-3xl">100</div>
      <div class="ml-1 text-gray-600 dark:text-gray-300">Members</div>
    </UCard>
  </div>
</template>