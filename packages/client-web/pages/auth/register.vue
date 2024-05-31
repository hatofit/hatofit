<script lang="ts" setup>
import { Api } from '~/utils/api';
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import { FetchError } from 'ofetch'

definePageMeta({
  layout: 'auth',
})
useSeoMeta({
  title: 'Register',
  description: 'Register account to access Hatofit',
})

const $toast = useToast()

// schema
const schema = z.object({
  firstName: z.string().min(4, 'Must be at least 4 characters'),
  lastName: z.string().min(4, 'Must be at least 4 characters'),
  email: z.string().email('Invalid email address'),
  password: z.string().min(8, 'Must be at least 8 characters'),
  confirmPassword: z.string().min(8, 'Must be at least 8 characters'),
  dateOfBirth: z.string(),
  weight: z.number().min(0, 'Must be at least 0'),
  height: z.number().min(0, 'Must be at least 0'),
  gender: z.enum(['male', 'female']),
})
const state = reactive({
  firstName: '',
  lastName: '',
  email: '',
  password: '',
  confirmPassword: '',
  dateOfBirth: '04/24/2023',
  weight: 0,
  height: 0,
  gender: 'male',
  "metricUnits": {
    "energyUnits": "j",
    "weightUnits": "kg",
    "heightUnits": "cm"
  }
})
type Schema = z.output<typeof schema>
async function onSubmitRegister (event: FormSubmitEvent<Schema>) {
  // Do something with data
  console.log(event.data)
  try {
    const res = await $fetch<Api.Auth.Register.response>(
      Api.Auth.Register.url(),
      {
        method: 'POST',
        body: Api.Auth.Register.parseData({
          ...state
        })
      }
    )
    $toast.add({
      title: 'Success',
      description: 'Successfully registered',
    })
    navigateTo('/auth/login')
  } catch (error) {
    if (error instanceof FetchError && error.response) {
      const [isError, message] = parseErrorFromResponse(error.response)
      if (isError) {
        $toast.add({
          title: 'Error',
          description: message,
        })
        return
      }
    }
    $toast.add({
      title: 'Error',
      description: `Failed to register, cause: ${error}`,
    })
  }
}
</script>

<template>
  <div class="w-screen h-screen flex flex-col justify-center items-center p-4">
    <div class="max-w-screen-xl flex flex-1 w-full max-h-[900px] overflow-hidden rounded-3xl bg-red-500 border-2 border-gray-500/50">
      <div class="flex-1 mx-auto w-full relative flex">
        <div class="-z-0 absolute top-0 left-0 w-full h-full overflow-visible bg-blue-500">
          <NuxtImg
            src="/images/scene/braden-collum-9HI8UJMSdZA-unsplash.jpg"
            alt="Register"
            loading="lazy"
            :style="{
              width: '100%',
              height: '100%',
              objectFit: 'cover',
              objectPosition: 'center',
            }"
          />
        </div>
        <div class="z-[1] flex-1 flex flex-row">
          <div class="w-full md:w-1/2 lg:w-1/3 flex flex-col justify-between bg-gray-50 dark:bg-gray-950 p-8">
            <div>
              <NuxtLink to="/">
                <UButton variant="link" color="primary" icon="i-heroicons-arrow-left">back</UButton>
              </NuxtLink>
            </div>
            <UForm :schema="schema" :state="state" class="flex flex-col gap-4" @submit="onSubmitRegister">
              <div class="flex gap-4">
                <UFormGroup label="First Name" name="firstName" required class="flex-1">
                  <UInput v-model="state.firstName" placeholder="fist name" />
                </UFormGroup>
                <UFormGroup label="Last Name" name="lastName" required class="flex-1">
                  <UInput v-model="state.lastName" placeholder="last name" />
                </UFormGroup>
              </div>
              <UFormGroup label="Email" name="email" required>
                <UInput v-model="state.email" type="email" placeholder="you@example.com" icon="i-heroicons-envelope" />
              </UFormGroup>
              <UFormGroup label="Password" name="password" required>
                <UInput v-model="state.password" type="password" placeholder="your secret password" icon="i-heroicons-lock-closed" />
              </UFormGroup>
              <UFormGroup label="Confirm Password" name="confirmPassword" required>
                <UInput v-model="state.confirmPassword" type="password" placeholder="your confirmation password" icon="i-heroicons-lock-closed" />
              </UFormGroup>
              <div class="flex gap-4">
                <UFormGroup label="Weight" name="weight" required class="flex-1">
                  <UInput v-model="state.weight" type="number" placeholder="your weight" />
                </UFormGroup>
                <UFormGroup label="Height" name="height" required class="flex-1">
                  <UInput v-model="state.height" type="number" placeholder="your height" />
                </UFormGroup>
                <!-- gender -->
                <UFormGroup label="Gender" name="gender" required class="flex-1">
                  <USelect v-model="state.gender" :options="['male', 'female']" />
                </UFormGroup>
              </div>
              <UFormGroup label="Date Of Birth" name="confirmPassword" required>
                <UInput v-model="state.dateOfBirth" type="date" placeholder="your date of birth" />
              </UFormGroup>
              <div class="flex justify-end">
                <UButton type="submit" variant="solid" class="w-full flex justify-center" size="lg">Register</UButton>
              </div>
              <div class="flex justify-center">
                <p class="text-gray-600 dark:text-gray-300">
                  <NuxtLink to="/auth/login" class="text-primary-500">login</NuxtLink>
                  if you already have an account.
                </p>
              </div>
            </UForm>
            <div>
              <div>
                <ButtonColorMode />
              </div>
            </div>
          </div>
          <div class="w-0 lg:w-2/3 flex flex-col justify-end">
            <div class="h-[100px] pb-6 pr-8 flex items-center bg-gradient-to-t from-gray-950 to-transparent justify-end">
              <NuxtImg
                src="/images/logo/secondary-dark.png"
                alt="Hatofit Logo"
                loading="lazy"
                :style="{
                  width: 'auto',
                  height: '100%',
                }"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>