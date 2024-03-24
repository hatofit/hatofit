<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})
</script>

<template>
  <div class="flex flex-col gap-4">
    <div class="h-[200px] rounded-xl flex flex-col justify-end bg-gray-200 dark:bg-gray-800 relative overflow-hidden">
      <NuxtImg
        src="/images/scene/risen-wang-20jX9b35r_M-unsplash.jpg"
        alt="Company Image"
        :style="{
          position: 'absolute',
          top: 0,
          left: 0,
          width: '100%',
          height: '100%',
          objectFit: 'cover',
          objectPosition: 'center',
          filter: 'blur(2px) brightness(0.7)',
        }"
      />
      <div class="absolute z-10 top-0 right-0 m-4">
        <UDropdown
          :items="[
            [
              { label: 'Out from company', icon: 'i-heroicons-arrow-left-start-on-rectangle-20-solid' },
            ]
          ]"
        >
          <UButton icon="i-heroicons-cog" variant="ghost" />
        </UDropdown>
      </div>
      <!-- gradient bottom black to up transpareant -->
      <div class="z-10 bg-gradient-to-t from-black to-transparent p-4">
        <div class="text-2xl font-bold">Company Name</div>
        <div>company address</div>
      </div>
    </div>
    
    <HeadlessTabGroup>
      <HeadlessTabList class="border-b-2 w-auto border-gray-500/20 rounded">
        <HeadlessTab v-for="(item, i) in ['Home', 'My Exercises', 'Information']" as="template" v-slot="{ selected }">
          <button
            :class="{
              'px-2 py-2 text-sm ': true,
              'rounded bg-gray-300/50 dark:bg-gray-700/50 font-bold': selected,
              '': !selected,
            }"
          >
            {{ item }}
          </button>
        </HeadlessTab>
      </HeadlessTabList>
      <HeadlessTabPanels>
        <HeadlessTabPanel>
          <div>
            <div class="font-semibold mb-4">Your Result on this Company Today</div>
            <div class="w-full grid grid-cols-3 gap-4">
              <UCard class="relative border-b border-orange-500">
                <Icon name="lets-icons:calories-light" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500" />
                <div class="font-bold text-3xl">1 Cal</div>
                <div class="ml-1 text-gray-600 dark:text-gray-300">Calories Burn</div>
              </UCard>
              <UCard class="relative border-b border-green-500">
                <Icon name="healthicons:body-outline" class="text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500" />
                <div class="font-bold text-3xl">19.03</div>
                <div class="ml-1 text-gray-600 dark:text-gray-300">BMI</div>
              </UCard>
            </div>
          </div>
        </HeadlessTabPanel>
      </HeadlessTabPanels>
    </HeadlessTabGroup>
  </div>
</template>