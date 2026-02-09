<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})
</script>

<template>
  <div class="flex flex-col gap-8">
    <div class="w-full">
      <PageTitle text="Today" />
      <div class="flex flex-col gap-2">
        <NuxtLink
          v-for="(item, i) in 3" :key="i"
          :to="`/dashboard/session/${item}`"
          class="transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
        >
          <div>
            <div class="font-semibold mb-1">
              Walking
            </div>
            <div class="text-sm">
              {{ $dayjs().format('dddd, DD MMMM YYYY') }}
            </div>
          </div>
          <div class="text-xs flex items-center">
            <div class="flex items-center gap-1">
              <Icon name="i-material-symbols-timer-outline-rounded" class="text-lg text-green-500" />
              <span>30m</span>
            </div>
            <div>
              <Icon name="lets-icons:calories-light" class="text-2xl text-orange-500" />
              <span>1Cal</span>
            </div>
          </div>
        </NuxtLink>
      </div>
    </div>
    <div>
      <PageTitle text="Another Day" />
      <div class="flex flex-col gap-2">
        <div class="text-center">no session recorded</div>
      </div>
    </div>
  </div>
</template>