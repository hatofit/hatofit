<script lang="ts" setup>
const $config = useRuntimeConfig()
const meta = {
  title: 'Hatofit - Be Fit and Healthy',
  description: 'Hatofit is a platform that helps you to be fit and healthy, help you to track and monitoring your health.',
  image: '/images/logo/hatofit.png',
  url: $config.public.baseUrl,
}
useSeoMeta({
  title: meta.title,
  description: meta.description,
  ogTitle: meta.title,
  ogDescription: meta.description,
  ogImage: meta.image,
  ogUrl: meta.url,
})
const switchLocalePath = useSwitchLocalePath()

const languages = [
  { id: 'id', name: 'Indonesia', icon: '🇮🇩' },
  { id: 'en', name: 'English', icon: '🇬🇧' },
]
const languageSelected = ref(languages[1])

watch(languageSelected, (value) => {
  console.log('Language Selected:', value)
  switchLocalePath(value.id)
})

const $auth = useAuth()
</script>

<template>
  <div class="flex flex-col min-h-screen w-full bg-gray-50 dark:bg-gray-950 text-gray-800 dark:text-gray-200">
    <div class="h-[68px] border-b border-main w-full sticky top-0 flex items-center z-30 bg-gray-50/75 dark:bg-gray-950/75 backdrop-filter backdrop-blur-lg">
      <PageContainer class="flex-1 max-w-screen-lg mx-auto flex justify-between">
        <NuxtLink to="/" class="flex gap-2 items-center">
          <div class="h-[24px] relative overflow-hidden">
            <NuxtImg
              src="/images/logo/hatofit.png" alt="Hatofit Logo"
              :style="{
                width: 'auto',
                height: '100%',
              }"
              loading="lazy"
            />
          </div>
          <h1 class="text-2xl font-bold">HATOFIT</h1>
        </NuxtLink>
        <div class="flex items-center gap-4 divide-x-2 divide-main">
          <div v-if="$auth.status.value != 'authenticated' " class="flex gap-2">
            <UButton
              to="/auth/register"
              variant="link"
              color="primary"
              label="Register"
              icon="i-heroicons-ui:document-add"
            />
            <UButton
              to="/auth/login"
              variant="solid"
              color="primary"
              label="Login"
            />
          </div>
          <div v-else class="flex flex-col items-center">
            <UDropdown
              :items="[
                [
                  { label: 'Dashboard', icon: 'i-heroicons-home', to: '/dashboard' },
                  { label: 'Profile', icon: 'i-heroicons-user', to: '/dashboard/profile' },
                ],
                [
                  { label: 'Logout', icon: 'i-heroicons-arrow-left-start-on-rectangle-20-solid', click: () => $auth.signOut({ callbackUrl: '/auth/login', redirect: true }) },
                ]
              ]"
            >
              <div class="flex items-center">
                <UAvatar
                  :src="$auth.data.value?.user?.avatar"
                  alt="User Avatar"
                  size="xs"
                />
                <span class="text-sm ml-3">
                  {{ $auth.data.value?.user?.name }}
                </span>
              </div>
            </UDropdown>
          </div>
          <div class="pl-4">
            <ButtonColorMode />
          </div>
        </div>
      </PageContainer>
    </div>
    <div class="flex-1 flex">
      <slot />
    </div>
    <footer class="w-full flex justify-between border-t border-main items-center">
      <PageContainer class="py-2 flex-1 flex justify-between w-full items-center">
        <div class="text-sm flex items-center">
          &copy; {{ new Date().getFullYear() }}
          <UButton to="/" variant="link" class="">HATOFIT TEAM</UButton>
        </div>
        <div class="flex items-center gap-1">
          <div>
            <ULink to="/privacy-policies">
              <UButton variant="link" size="xs">
                Privacy Policies
              </UButton>
            </ULink>
          </div>
          <div class="h-6 w-0.5 bg-gray-500/50 mr-2" />
          <ClientOnly>
            <USelectMenu v-model="languageSelected" :options="languages" option-attribute="name">
              <template #label>
                <span>{{ languageSelected.icon }}</span>
                <span class="truncate">{{ languageSelected.name }}</span>
              </template>
              <template #option="{ option: lang }">
                <span>{{ lang.icon }}</span>
                <span class="truncate">{{ lang.name }}</span>
              </template>
            </USelectMenu>
          </ClientOnly>
        </div>
      </PageContainer>
    </footer>
  </div>
</template>