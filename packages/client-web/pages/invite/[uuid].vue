<script lang="ts" setup>
import { Api } from '~/utils/api';

const $route = useRoute()
const uuid = computed(() => $route.params.uuid as string)
const $auth = useAuth()

definePageMeta({
  layout: 'page'
})

if (!uuid.value) navigateTo('/')

const { data: companyData, status } = await useFetch<Api.Company.Company.response>(Api.Company.Company.url(uuid.value))

const join = async () => {
  try {
    const { data, status } = await useFetchWithAuth<Api.Company.Join.response>(Api.Company.Join.url(), {
      method: 'POST',
      body: {
        code: companyData.value?.company._id
      }
    })
    navigateTo('/dashboard/company')
  } catch (error) {
    console.error(error)    
  }
}
</script>

<template>
  <PageContainer class="flex-1 flex flex-col gap-4 justify-center">
    <PageSection class="flex flex-col items-center justify-center">
      <div v-if="status == 'pending'">
        <Icon name="i-mingcute-loading-line" class="text-4xl text-primary-500 animate-spin" />
      </div>
      <div v-else-if="status == 'error'">
        <div class="text-red-500">Error</div>
      </div>
      <div v-else class="w-full md:w-1/2">
        <!-- <div class="text-3xl font-bold">{{ data?.company.name }}</div>
        <div class="text-lg">{{ data?.company.address }}</div> -->
        <UCard>
          <template #header>
            <div class="flex justify-between">
              <div class="font-bold text-xl">Join Company</div>
            </div>
          </template>
          <div class="flex flex-col gap-2">
            <p class="text-center">
              You are invited to join
              <span class="font-bold">{{ companyData?.company.name }}</span>,
              located at {{ companyData?.company.address }}.
            </p>
            <div class="flex justify-end items-center gap-2">
              <UButton to="/" color="gray">No, I dont</UButton>
              <UButton v-if="$auth.status.value == 'authenticated'" color="primary" @click="join">Join Company</UButton>
              <UButton v-else color="primary" to="/auth/login">Login First</UButton>
            </div>
          </div>
        </UCard>
      </div>
    </PageSection>
  </PageContainer>
</template>