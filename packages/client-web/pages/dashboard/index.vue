<script lang="ts" setup>
import { Api } from '~/utils/api';

definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})

// const $auth = useAuth()

// const { data } = useFetch<Api.Auth.Dashboard.response>(Api.Auth.Dashboard.url(), {
//   baseURL: getApiUrl(),
//   headers: {
//     Authorization: `Bearer ${($auth.data.value?.user as any)?.token || ''}`,
//   }
// })

const { data, pending } = useFetchWithAuth<Api.Auth.Dashboard.response>(Api.Auth.Dashboard.url(), {})

const widgets = ref<{
  name: string
  value: string
}[]>([])

// watch(data, (newData) => {
//   console.log('newData', newData)
// })

// onMounted(async () => {
//   const url = Api.Auth.Dashboard.url() // 'https://api.hatofit.com/api/auth/dashboard'
//   console.log('url', url)
//   const res = await $fetch(url, {
//     headers: {
//       Authorization: `Bearer ${($auth.data.value?.user as any)?.token || ''}`,
//     }
//   })
//   console.log('res', res)
// })
</script>

<template>
  <div v-if="!pending" class="flex-1">
    <PageTitle text="Your Result Today" />
    <div class="w-full grid grid-cols-3 gap-4">
      <!-- <UCard class="relative border-b border-orange-500">
        <Icon name="lets-icons:calories-light" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500" />
        <div class="font-bold text-3xl">1 Cal</div>
        <div class="ml-1 text-gray-600 dark:text-gray-300">Calories Burn</div>
      </UCard> -->
      <UCard
        v-for="(item, i) in data?.widgets"
        :key="i"
        class="relative border-b"
        :class="{
          'border-orange-500': i === 0,
          'border-green-500': i === 1,
          'border-blue-500': i === 2,
          'border-red-500': i === 3,
        }"
      >
        <Icon
          name="healthicons:body-outline"
          class="text-6xl absolute right-0 top-0 mt-6 mr-4"
          :class="{
            'text-orange-500': i === 0,
            'text-green-500': i === 1,
            'text-blue-500': i === 2,
            'text-red-500': i === 3,
          }"
        />
        <div class="font-bold text-3xl">{{ item.value }}</div>
        <div class="ml-1 text-gray-600 dark:text-gray-300">{{ item.name }}</div>
      </UCard>
    </div>
  </div>
  <div v-if="pending">
    <PageTitle text="Home" />
    <div class="flex justify-center items-center">
      <Icon name="i-mingcute-loading-line" class="text-4xl text-primary-500 animate-spin" />
    </div>
  </div>
</template>