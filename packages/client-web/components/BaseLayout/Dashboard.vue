<script lang="ts" setup>
import type { VerticalNavigationLink, BreadcrumbLink } from '#ui/types'
const props = defineProps({
  links: {
    type: Array as PropType<VerticalNavigationLink[] | VerticalNavigationLink[][]>,
  },
  breadcrumbLinks: {
    type: Array as PropType<BreadcrumbLink[]>,
  },
})
</script>

<template>
  <BaseLayoutDefaultPage>
    <div class="flex-1">
      <PageContainer class="flex-1 flex flex-col">
        <slot name="dashboard-header" />
        <div class="flex-1 flex gap-6">
          <div class="w-2/12 flex flex-col">
            <UVerticalNavigation :links="links" />
          </div>
          <div class="flex-1">
            <template v-if="$slots['breadcrumb'] && breadcrumbLinks">
              <UBreadcrumb :links="breadcrumbLinks" />
            </template>
            <slot />
          </div>
        </div>
        <slot name="dashboard-footer" />
      </PageContainer>
    </div>
  </BaseLayoutDefaultPage>
</template>