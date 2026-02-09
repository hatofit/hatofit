<script lang="ts" setup>
import { Api } from '~/utils/api';

  
definePageMeta({
  layout: 'auth',
  auth: {
    unauthenticatedOnly: true,
    navigateAuthenticatedTo: '/dashboard',
  }
})
useSeoMeta({
  title: 'Login',
  description: 'Login to access Hatofit',
})


const $auth = useAuth()
const $route = useRoute()
const input = reactive({
  email: '',
  password: '',
  otp: '',
})
const login = () => {
  $auth.signIn('credentials', {
    redirect: true,
    callbackUrl: '/dashboard',
  }, {
    email: input.email,
    password: input.password,
  })
}
// get error from query param url ?error=...
const error = computed(() => {
  return ($route.query.error === 'undefined' ? undefined : $route.query.error) as string|undefined
})
const errorMessage = computed(() => {
  if (error.value === 'CredentialsSignin') {
    return 'Invalid email or password.'
  } else if (['Wrong email or password', 'User not found'].includes(error.value || '')) {
    return error.value
  }
  return 'Something went wrong, please try again later.'
})


const mode = ref<'login'|'forgot'|'forgot_new_password'>('login')
const isForgotPasswordOtpSended = ref(false)
const isForgotPasswordOtpVerified = ref(false)
const forgotPasswordSendOTP = async () => {
  const http = await $fetch(Api.Auth.ForgotPasswordSendOTP.url(input.email), {
    method: "POST",
  })
  console.log(http)
  isForgotPasswordOtpSended.value = true
}
const forgotPasswordVerifyOTP = async () => {
  try {
    const http = await $fetch(Api.Auth.ForgotPasswordVerifyOTP.url(), {
      method: "POST",
      body: JSON.stringify({
        email: input.email,
        code: input.otp,
      }),
    })  
    console.log(http)
    isForgotPasswordOtpVerified.value = true
    mode.value = 'forgot_new_password'
  } catch (error) {
    console.log(error)
    alert('Invalid OTP')
    isForgotPasswordOtpVerified.value = false
    isForgotPasswordOtpSended.value = false
  }
}
const forgotPasswordReset = async () => {
  try {
    const http = await $fetch(Api.Auth.ForgotPasswordReset.url(), {
      method: "POST",
      body: JSON.stringify({
        email: input.email,
        code: input.otp,
        password: input.password,
      }),
    })  
    console.log(http)
    alert('Password has been reset, please login with your new password.')
    isForgotPasswordOtpVerified.value = true
    mode.value = 'login'
  } catch (error) {
    console.log(error)
    alert('Invalid OTP')
    isForgotPasswordOtpVerified.value = false
    isForgotPasswordOtpSended.value = false
  }
}
</script>

<template>
  <div class="w-screen h-screen flex flex-col justify-center items-center p-4">
    <div class="max-w-screen-xl flex flex-1 w-full max-h-[900px] overflow-hidden rounded-3xl bg-red-500 border-2 border-gray-500/50">
      <div class="flex-1 mx-auto w-full relative flex">
        <div class="-z-0 absolute top-0 left-0 w-full h-full overflow-visible bg-blue-500">
          <NuxtImg
            src="/images/scene/braden-collum-9HI8UJMSdZA-unsplash.jpg" alt="Login"
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
          <div class="w-0 lg:w-2/3 flex flex-col justify-end">
            <div class="h-[100px] pb-6 pl-8 flex items-center bg-gradient-to-t from-gray-950 to-transparent">
              <NuxtImg
                src="/images/logo/secondary-dark.png" alt="Hatofit Logo"
                loading="lazy"
                :style="{
                  width: 'auto',
                  height: '100%',
                }"
              />
            </div>
          </div>
          <div class="w-full md:w-1/2 lg:w-1/3 flex flex-col justify-between bg-gray-50 dark:bg-gray-950 p-8">
            <div>
              <NuxtLink to="/">
                <UButton variant="link" color="primary" icon="i-heroicons-arrow-left">back</UButton>
              </NuxtLink>
            </div>
            
            <!-- mode login -->
            <div v-if="mode === 'login'" class="flex flex-col gap-4">
              <UAlert
                v-if="error"
                icon="i-heroicons-information-circle"
                color="primary"
                variant="solid"
                title="Error"
                :description="errorMessage"
              />
              <Form @submit.prevent="login" class="flex flex-col gap-4">
                <UFormGroup label="Email" required>
                  <UInput :color="error ? 'primary' : 'gray'" v-model="input.email" type="email" placeholder="you@example.com" icon="i-heroicons-envelope" />
                </UFormGroup>
                <UFormGroup label="Password" required>
                  <UInput :color="error ? 'primary' : 'gray'" v-model="input.password" type="password" placeholder="your secret password" icon="i-heroicons-lock-closed" />
                  <UButton variant="link" class="text-xs float-right" label="Forgot Password?" @click="mode = 'forgot'" />
                </UFormGroup>
                <div class="flex justify-end">
                  <UButton type="submit" variant="solid" class="w-full flex justify-center" size="lg" @click="login">Login</UButton>
                </div>
                <div class="flex justify-center">
                  <p class="text-gray-600 dark:text-gray-300">
                    <NuxtLink to="/auth/register" class="text-primary-500">register</NuxtLink>
                    if you don't have an account.
                  </p>
                </div>
              </Form>
            </div>
            <div v-else-if="mode === 'forgot'" class="flex flex-col gap-4">
              <UFormGroup label="Email" required>
                <div class="flex gap-4">
                  <div class="flex-1">
                    <UInput :color="error ? 'primary' : 'gray'" v-model="input.email" type="email" placeholder="you@example.com" icon="i-heroicons-envelope" />
                  </div>
                  <div>
                    <UButton size="sm" variant="solid" class="w-full flex justify-center"  @click="forgotPasswordSendOTP">Send OTP</UButton>
                    <div class="flex justify-end">
                      <UButton variant="link" class="text-xs" label="Want To Login?" @click="mode = 'login'" />
                    </div>
                  </div>
                </div>
              </UFormGroup>
              <UFormGroup v-if="isForgotPasswordOtpSended" label="OTP" required>
                <UInput :color="error ? 'primary' : 'gray'" v-model="input.otp" type="text" placeholder="OTP" icon="i-heroicons-key" />
              </UFormGroup>
              <div v-if="isForgotPasswordOtpSended" class="flex justify-end">
                <UButton variant="solid" class="w-full flex justify-center" size="lg" @click="forgotPasswordVerifyOTP">Verify</UButton>
              </div>
            </div>
            <div v-else-if="mode === 'forgot_new_password'" class="flex flex-col gap-4">
              <UFormGroup label="New Password" required>
                <UInput :color="error ? 'primary' : 'gray'" v-model="input.password" type="password" placeholder="your secret password" icon="i-heroicons-lock-closed" />
              </UFormGroup>
              <div class="flex justify-end">
                <UButton variant="solid" class="w-full flex justify-center" size="lg" @click="forgotPasswordReset">Reset Password</UButton>
              </div>
            </div>

            <div>
              <div class="flex gap-4">
                <ButtonColorMode />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>