<script lang="ts" setup>  
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
  } else if (['Wrong email or password'].includes(error.value || '')) {
    return error.value
  }
  return 'Something went wrong, please try again later.'
})
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
            <div class="flex flex-col gap-4">
              <UAlert
                v-if="error"
                icon="i-heroicons-information-circle"
                color="primary"
                variant="solid"
                title="Error"
                :description="errorMessage"
              />
              <UFormGroup label="Email" required>
                <UInput :color="error ? 'primary' : 'gray'" v-model="input.email" type="email" placeholder="you@example.com" icon="i-heroicons-envelope" />
              </UFormGroup>
              <UFormGroup label="Password" required>
                <UInput :color="error ? 'primary' : 'gray'" v-model="input.password" type="password" placeholder="your secret password" icon="i-heroicons-lock-closed" />
              </UFormGroup>
              <div class="flex justify-end">
                <UButton variant="solid" class="w-full flex justify-center" size="lg" @click="login">Login</UButton>
              </div>
              <div class="flex justify-center">
                <p class="text-gray-600 dark:text-gray-300">
                  <NuxtLink to="/auth/register" class="text-primary-500">register</NuxtLink>
                  if you don't have an account.
                </p>
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