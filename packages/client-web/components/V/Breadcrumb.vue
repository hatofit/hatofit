<script lang="ts" setup>
import type { VerticalNavigationLink, BreadcrumbLink } from '#ui/types'

defineProps({
  links: {
    type: Array as PropType<BreadcrumbLink[]>,
  },
  dashboard: {
    type: Boolean,
    default: false,
  }
})
</script>

<template>
  <UBreadcrumb
    :links="[
      ...(dashboard ? [{
        icon: 'i-ph-house-thin',
        label: 'Dashboard',
        to: '/dashboard',
      }] : []),
      ...links,
    ]"
    class="mb-4 px-2 py-1 rounded-lg bg-gray-900"
  />
</template>