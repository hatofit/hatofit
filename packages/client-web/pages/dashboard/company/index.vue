<script lang="ts" setup>
import { Api } from '~/utils/api';
import { z } from 'zod'
import { FetchError } from 'ofetch'
import type { FormSubmitEvent } from '#ui/types'

definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})

const $toast = useToast()

// createModel
const createModelIsOpen = ref(false)

const { data, refresh } = useFetchWithAuth<Api.Company.Companies.response>(Api.Company.Companies.url())
watch(data, (value) => {
  console.log('watch', value)
})

onMounted(() => {
  console.log('mounted', data.value)
})



// @company/create-modal
const CompanyCreateModal = (() => {
  // schema
  const schema = z.object({
    name: z.string().min(4, 'Must be at least 4 characters'),
    description: z.string().min(4, 'Must be at least 4 characters'),
    address: z.string().min(4, 'Must be at least 4 characters'),
  })
  const state = reactive({
    name: '',
    description: '',
    address: '',
  })

  type Schema = z.output<typeof schema>

  async function onSubmitRegister (event: FormSubmitEvent<Schema>) {
    try {
      const res = await $fetchWithAuth<Api.Company.CreateCompany.response>(
        Api.Company.CreateCompany.url(),
        {
          method: 'POST',
          body: Api.Company.CreateCompany.parseData({
            ...state
          })
        }
      )
      $toast.add({
        title: 'Success',
        description: 'Company created successfully',
      })
      createModelIsOpen.value = false
      refresh()
    } catch (error) {
      if (error instanceof FetchError && error.response) parseErrorFromResponseWithToast(error.response)
    }
  }

  return {
    state,
    schema,
    onSubmitRegister,
  }
})()
// @company/join-modal
const CompanyJoinModal = (() => {
  const isOpen = ref(false)
  const schema = z.object({
    code: z.string().min(1, 'Must be at least 4 characters'),
  })
  const state = reactive({
    code: '',
  })
  const save = async () => {
    try {
      const res = await $fetchWithAuth<Api.Company.Join.response>(
        Api.Company.Join.url(),
        {
          method: 'POST',
          body: JSON.stringify({ code: state.code })
        }
      )
      console.log('res', res)
      $toast.add({
        title: 'Success',
        description: 'Company joined successfully',
      })
      isOpen.value = false
      refresh()
    } catch (error) {
      if (error instanceof FetchError && error.response) parseErrorFromResponseWithToast(error.response)
      console.error(error)
    }
  }

  return {
    isOpen,
    schema,
    state,
    save,
  }
})()
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
              { label: 'Create Company', icon: 'i-heroicons-plus', click: () => createModelIsOpen = true },
              { label: 'Join Company', icon: 'i-heroicons-user-add', click: () => CompanyJoinModal.isOpen.value = true }
            ]
          ]"
          :popper="{ placement: 'bottom-end' }"
        >
          <UButton color="white" trailing-icon="i-majesticons-dots-horizontal" />
        </UDropdown>
      </div>
    </div>
    <div v-if="data?.companies?.length || 0 > 0" class="w-full grid grid-cols-3 gap-4">
      <NuxtLink v-for="(item, i) in data?.companies" :to="`/dashboard/company/${item.id}`" class="group">
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
            <div class="ml-1 text-gray-100">{{ item.name }}</div>
            <div class="ml-1 text-xs text-gray-300">{{ item.description }}</div>
          </div>
        </UCard>
      </NuxtLink>
    </div>
    <div v-else class="flex items-center justify-center h-[300px]">
      <div class="flex flex-col items-center gap-4">
        <div class="text-xs text-gray-500 dark:text-gray-400">You don't join any company yet, create your own company or join another company</div>
        <div class="flex gap-4">
          <UButton color="primary" @click="createModelIsOpen = true">Create Company</UButton>
          <UButton color="gray" @click="CompanyJoinModal.isOpen.value = true">Join Company</UButton>
        </div>
      </div>
    </div>

    <USlideover v-model="createModelIsOpen" prevent-close>
      <UCard
        class="flex flex-col flex-1"
        :ui="{
          body: {
            base: 'flex-1 overflow-y-auto p-4',
          },
          ring: '',
          divide: 'divide-y divide-gray-100 dark:divide-gray-800'
        }"
      >
        <template #header>
          <div class="flex items-center justify-between">
            <h3 class="text-base font-semibold leading-6 text-gray-900 dark:text-white">
              Create New Company
            </h3>
            <UButton color="gray" variant="ghost" icon="i-heroicons-x-mark-20-solid" class="-my-1" @click="createModelIsOpen = false" />
          </div>
        </template>

        <UForm
          :schema="CompanyCreateModal.schema"
          :state="CompanyCreateModal.state"
          class="flex flex-col gap-4"
          @submit="CompanyCreateModal.onSubmitRegister"
        >
          <UFormGroup label="Name" name="name" required>
            <UInput v-model="CompanyCreateModal.state.name" placeholder="name" />
          </UFormGroup>
          <UFormGroup label="Description" name="description" required>
            <UTextarea v-model="CompanyCreateModal.state.description" placeholder="description" />
          </UFormGroup>
          <UFormGroup label="Address" name="address" required>
            <UTextarea v-model="CompanyCreateModal.state.address" placeholder="address" />
          </UFormGroup>
          <div class="flex justify-end gap-4">
            <UButton color="primary" type="submit">Create</UButton>
            <UButton color="red" variant="ghost" @click="createModelIsOpen = false">Cancel</UButton>
          </div>
        </UForm>
      </UCard>
    </USlideover>
    <UModal v-model="CompanyJoinModal.isOpen.value">
      <UCard :ui="{ ring: '', divide: 'divide-y divide-gray-100 dark:divide-gray-800' }">
        <template #header>
          <h2 class="text-xl font-semibold">Join Company</h2>
        </template>

        <UForm :state="CompanyJoinModal.state" :schema="CompanyJoinModal.schema" class="flex flex-col gap-4">
          <UFormGroup label="Company ID" name="code" required>
            <UInput placeholder="code" v-model="CompanyJoinModal.state.code" />
          </UFormGroup>
        </UForm>

        <template #footer>
          <div class="flex justify-end gap-4">
            <UButton color="primary" @click="CompanyJoinModal.save">Join</UButton>
            <UButton color="red" variant="ghost" @click="CompanyJoinModal.isOpen.value = false">Cancel</UButton>
          </div>
        </template>
      </UCard>
    </UModal>
  </div>
</template>