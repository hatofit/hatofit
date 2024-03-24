<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})

const columns = [
  {
    key: 'no',
    label: '#',
  },
  {
    key: 'name',
    label: 'Name'
  },
  {
    key: 'duration',
    label: 'Duration'
  },
  {
    key: 'actions'
  }
]

const exercises = [{
  no: 1,
  name: 'Yoga Poses for Beginners',
  duration: 'Everyday for 30 minutes',
}, {
  no: 2,
  name: 'Kettlebell Swing Workout',
  duration: 'Everyday for 30 minutes',
}]

const items = (row: any) => [
  [{
    label: 'Edit',
    icon: 'i-heroicons-pencil-square-20-solid',
    click: () => console.log('Edit', row.id)
  }, {
    label: 'Duplicate',
    icon: 'i-heroicons-document-duplicate-20-solid'
  }], [{
    label: 'Archive',
    icon: 'i-heroicons-archive-box-20-solid'
  }, {
    label: 'Move',
    icon: 'i-heroicons-arrow-right-circle-20-solid'
  }], [{
    label: 'Delete',
    icon: 'i-heroicons-trash-20-solid'
  }]
]
</script>

<template>
  <UTable :columns="columns" :rows="exercises">
    <template #actions-data="{ row }">
      <UDropdown :items="items(row)">
        <UButton color="gray" variant="ghost" icon="i-heroicons-ellipsis-horizontal-20-solid" />
      </UDropdown>
    </template>
  </UTable>
</template>