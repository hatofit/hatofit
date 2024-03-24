<script lang="ts" setup>
definePageMeta({
  layout: 'page',
})

const $auth = useAuth()
const leadingsText = computed(() => [
  {
    text: "Healthy",
    startColor: '#007CF0',
    endColor: '#00DFD8',
    delay: 0,
  },
  {
    text: "Energetic",
    startColor: '#7928CA',
    endColor: '#FF0080',
    delay: 2,
  },
  {
    text: "Fit",
    startColor: '#FF4D4D',
    endColor: '#F9CB28',
    delay: 4,
  },
])
</script>

<template>
  <div class="flex-1 flex flex-col w-full">
    <section class="h-screen flex flex-col items-center justify-center pb-12">
      <h2 class="text-center">
        <span
          v-for="(item, i) in leadingsText"
          :key="i"
          :style="`--content: '${item.text}'; --start-color: ${
            item.startColor
          }; --end-color: ${item.endColor}; --animation-name: anim-fg-${
            i + 1
          }`"
          class="animated-text-bg drop-shadow-xl text-6xl sm:text-8xl md:text-8xl lg:text-8xl 2xl:text-8xl block font-black uppercase"
        >
          <span class="animated-text-fg">{{ item.text }}</span>
        </span>
      </h2>
      <div class="px-4 mt-6 text-center max-w-[500px] md:max-w-[600px]">
        <p>
          Hatofit is a platform that helps you to be fit and healthy, help you to track and monitoring your health.
        </p>
      </div>
      <div class="mt-6 flex gap-4">
        <UButton
          :label="`${$auth.status.value == 'authenticated' ? 'Dashboard' : 'Login' }`"
          :to="`${$auth.status.value == 'authenticated' ? '/dashboard' : '/auth/login' }`"
          variant="solid"
          color="primary"
          size="xl"
          class="w-[120px] flex items-center justify-center"
        />
        <!-- <UButton label="Dashboard" to="/dashboard" variant="solid" color="primary" size="xl" class="w-[120px] flex items-center justify-center" /> -->
        <UButton label="Download" to="#download" variant="solid" color="gray" size="xl" class="w-[120px] flex items-center justify-center" />
      </div>
      <div class="mt-6">
        <Icon name="mdi:chevron-triple-down" class="mt-6 animate-bounce text-3xl" />
      </div>
    </section>
    <section id="download" class="h-screen min-h-[860px] flex flex-col justify-center py-20 bg-gray-100 dark:bg-gray-900">
      <PageContainer class="flex gap-6">
        <div class="w-1/2 relative">
          <div
            class="absolute right-[36px] top-[-20px] w-[300px] transform rotate-[-10deg] bg-gradient-to-br from-primary to-secondary opacity-50"
          >
            <NuxtImg
              src="/images/preview/hatofit-mobile-app-preview-2.webp"
              alt="Hatofit Mobile Preview"
              loading="lazy"
              :style="{
                height: 'auto',
                objectFit: 'cover',
                objectPosition: 'center',
              }"
            />
          </div>
          <div class="w-[300px] relative flex">
            <NuxtImg
              src="/images/preview/hatofit-mobile-app-preview-1.webp"
              alt="Hatofit Mobile Preview"
              loading="lazy"
              :style="{
                width: '100%',
                height: 'auto',
                objectFit: 'cover',
                objectPosition: 'center',
              }"
            />
          </div>
        </div>
        <div class="w-1/2 flex flex-col justify-center items-center">
          <div class="text-right flex flex-col items-end">
            <h2 class="text-5xl font-bold text-gray-950 dark:text-gray-50">Download Hatofit Mobiles Apps</h2>
            <div class="max-w-[400px]">
              <p class="mt-4 text-gray-700 dark:text-gray-300">
                Hatofit currently available on Androi. Download now and start your healthy journey.
              </p>
            </div>
            <div class="flex justify-end items-center">
              <a href="https://play.google.com/store/apps/details?id=com.hatofit.hatofit&hl=en_US&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1">
                <img class="h-[80px]" alt="Get it on Google Play" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"/>
              </a>
            </div>
          </div>
        </div>
      </PageContainer>
    </section>
  </div>
</template>

<style lang="scss">
:root {
  --padding: 0.05em;
}

@keyframes anim-fg-1 {
  0%,
  16.667%,
  100% {
    opacity: 1;
  }
  33.333%,
  83.333% {
    opacity: 0;
  }
}
@keyframes anim-fg-2 {
  0%,
  16.667%,
  66.667%,
  100% {
    opacity: 0;
  }
  33.333%,
  50% {
    opacity: 1;
  }
}
@keyframes anim-fg-3 {
  0%,
  50%,
  100% {
    opacity: 0;
  }
  66.667%,
  83.333% {
    opacity: 1;
  }
}
.animated-text-bg {
  position: relative;
  display: block;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  content: var(--content);
  display: block;
  width: 100%;
  color: theme('colors.slate.800');
  top: 0;
  bottom: 0;
  left: 0;
  z-index: 0;
  padding-left: var(--padding);
  padding-right: var(--padding);
  &:before {
    content: var(--content);
    position: absolute;
    display: block;
    width: 100%;
    color: theme('colors.slate.800');
    top: 0;
    bottom: 0;
    left: 0;
    z-index: 0;
    padding-left: var(--padding);
    padding-right: var(--padding);
  }
}
.animated-text-fg {
  background-clip: text;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  padding-left: var(--padding);
  padding-right: var(--padding);
  background-image: linear-gradient(
    90deg,
    var(--start-color),
    var(--end-color)
  );
  position: relative;
  opacity: 0;
  z-index: 1;
  animation: var(--animation-name) 8s infinite;
}
html.dark {
  .animated-text-bg {
    color: theme('colors.gray.100');
    &:before {
      color: theme('colors.gray.100');
    }
  }
}
</style>