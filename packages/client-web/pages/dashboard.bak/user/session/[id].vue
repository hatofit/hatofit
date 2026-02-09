<script lang="ts" setup>
const $dayjs = useDayjs()
definePageMeta({
  // layout: 'dashboard',
  middleware: ['auth'],
})
</script>

<template>
  <PageContainer>
    <PageSection>
      <!-- <PageTitle text="Session" /> -->
      <UCard>
        <h2 class="text-xl font-semibold">Walking Session</h2>
        <div class="flex gap-4 mt-2 items-center">
          <div class="flex gap-1 items-center">
            <Icon name="fluent:calendar-20-regular" class="text-lg mb-0.5 text-red-500" />
            <div class="text-xs">{{ $dayjs().format('dddd, DD MMMM YYYY') }}</div>
          </div>
          <div class="flex gap-1 items-center">
            <Icon name="fluent:clock-20-regular" class="text-lg mb-0.5 text-green-500" />
            <div class="text-xs">{{ $dayjs().format('HH:mm') }}</div>
          </div>
        </div>
      </UCard>
    </PageSection>
    <PageSection>
      <PageTitle text="Quick Report" />
      <div class="w-full grid grid-cols-3 gap-4">
        <!-- time exercise -->
        <UCard class="relative border-b border-blue-500">
          <Icon name="fluent:timer-20-regular" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500" />
          <div class="font-bold text-3xl">30m</div>
          <div class="ml-1 text-gray-600 dark:text-gray-300">Time Exercise</div>
        </UCard>
        <!-- calories burn -->
        <UCard class="relative border-b border-orange-500">
          <Icon name="lets-icons:calories-light" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500" />
          <div class="font-bold text-3xl">1 Cal</div>
          <div class="ml-1 text-gray-600 dark:text-gray-300">Calories Burn</div>
        </UCard>
        <!-- bmi -->
        <UCard class="relative border-b border-green-500">
          <Icon name="healthicons:body-outline" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500" />
          <div class="font-bold text-3xl">19.03</div>
          <div class="ml-1 text-gray-600 dark:text-gray-300">BMI</div>
        </UCard>
      </div>
    </PageSection>
    <PageSection>
      <PageTitle text="Detail" />
      <Suspense>
        <LazySessionWidgetDetailWidget />
        <template #fallback>
          Loading...
        </template>
      </Suspense>
    </PageSection>
    <PageSection>
      <PageTitle text="Devices" />
      <div class="w-full grid grid-cols-3 gap-4">
        <UCard class="relative border-b border-primary-500">
          <div class="flex gap-4 items-center">
            <Icon name="fluent:smartwatch-20-regular" class="text-6xl text-primary-500" />
            <div class="flex flex-col gap-1">
              <div class="">Polar H10</div>
              <div class="text-xs text-gray-600 dark:text-gray-300">Polar</div>
            </div>
          </div>
        </UCard>
      </div>
    </PageSection>
  </PageContainer>
</template>