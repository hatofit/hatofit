<script lang="ts" setup>
import  { Api } from '~/utils/api';

definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})

const columns = [
  {
    key: 'id',
    label: '#',
  },
  {
    key: 'name',
    label: 'Name'
  },
  {
    key: 'User.email',
    label: 'Email'
  },
  {
    key: 'role',
    label: 'Role'
  },
  {
    key: 'createdAt',
    label: 'Since'
  },
  {
    key: 'actions'
  }
]

const { companyId } = await useCompanyLayout()
const { data } = useFetchWithAuth<Api.Company.Members.response>(Api.Company.Members.url(companyId.value))
// const members = ref()
// const members = [{
//   no: 1,
//   name: 'Hannah',
//   email: 'hannah@gmail.com',
//   since: '2021-10-01'
// }, {
//   no: 2,
//   name: 'John',
//   email: 'john@gmail.com',
//   since: '2021-10-01'
// }]

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
  <UTable :columns="columns" :rows="data?.members">
    <template #name-data="{ row }">
      <div class="flex items-center">
        <UAvatar :name="row.name" />
        <div class="ml-2">
          <div class="font-semibold">{{ row.User.firstName }} {{ row.User.lastName }}</div>
        </div>
      </div>
    </template>
    <template #createdAt-data="{ row }">
      {{ $dayjs(row.createdAt).format('dddd, DD MMMM YYYY') }}
    </template>
    <template #actions-data="{ row }">
      <UDropdown :items="items(row)">
        <UButton color="gray" variant="ghost" icon="i-heroicons-ellipsis-horizontal-20-solid" />
      </UDropdown>
    </template>
  </UTable>
</template>