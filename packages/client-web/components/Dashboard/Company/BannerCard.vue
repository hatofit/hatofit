<script lang="ts" setup>
import type { Api } from '~/utils/api';

defineProps({
  company: {
    type: Object as PropType<Api.DataModel.Company.Company['company']>,
    required: true,
  },
})
</script>

<template>
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
    <!-- gradient bottom black to up transpareant -->
    <div class="z-10 bg-gradient-to-t from-black to-transparent p-4">
      <div class="text-2xl font-bold">{{ company.name }}</div>
      <div>{{ company.description }}</div>
    </div>
    <slot />
  </div>
</template>