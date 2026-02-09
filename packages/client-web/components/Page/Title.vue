<script lang="ts" setup>
defineProps({
  text: {
    type: String,
    required: true,
  },
})
</script>

<template>
  <div class="text-xl font-semibold mb-4">
    <slot>{{ text }}</slot>
  </div>
</template>