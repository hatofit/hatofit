<script lang="ts" setup>
import  { Api } from '~/utils/api';
import { FetchError } from 'ofetch'

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

const $toast = useToast()
const $auth = useAuth()
const { companyId } = await useCompanyLayout()
const { data, refresh } = useFetchWithAuth<Api.Company.Members.response>(Api.Company.Members.url(companyId.value))
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

const adminDemote = async (id: string) => {
  console.log('Demote', id)
  try {
    const res = await $fetchWithAuth<Api.Company.AdminDemote.response>(Api.Company.AdminDemote.url(companyId.value, id), {
      method: 'PUT',
    })
    refresh()
    $toast.add({ title: 'Success demote admin' })
  } catch (e) {
    console.error(e)
    if (e instanceof FetchError && e.response) parseErrorFromResponseWithToast(e.response)
  }
}
const adminPromote = async (id: string) => {
  console.log('Promote', id)
  try {
    const res = await $fetchWithAuth<Api.Company.AdminPromote.response>(Api.Company.AdminPromote.url(companyId.value, id), {
      method: 'PUT',
    })
    refresh()
    $toast.add({ title: 'Success promote admin' })
  } catch (e) {
    console.error(e)
    if (e instanceof FetchError && e.response) parseErrorFromResponseWithToast(e.response)
  }
}
const memberKick = async (id: string) => {
  console.log('Kick', id)
  try {
    const res = await $fetchWithAuth<Api.Company.MemberKick.response>(Api.Company.MemberKick.url(companyId.value, id), {
      method: 'DELETE',
    })
    refresh()
    $toast.add({ title: 'Success kick member' })
  } catch (e) {
    console.error(e)
    if (e instanceof FetchError && e.response) parseErrorFromResponseWithToast(e.response)
  }
}

const items = (row: any) => [
  // [{
  //   label: 'Edit',
  //   icon: 'i-heroicons-pencil-square-20-solid',
  //   click: () => console.log('Edit', row.id)
  // }, {
  //   label: 'Duplicate',
  //   icon: 'i-heroicons-document-duplicate-20-solid'
  // }], [{
  //   label: 'Archive',
  //   icon: 'i-heroicons-archive-box-20-solid'
  // }, {
  //   label: 'Move',
  //   icon: 'i-heroicons-arrow-right-circle-20-solid'
  // }],
  [
    ...(
      row.role == 'admin' ? ([{
        label: `Demote to Member`,
        icon: 'i-heroicons-arrow-down-circle-20-solid',
        click: () => adminDemote(row.User._id)
      }]) : [
        {
          label: `Promote to Admin`,
          icon: 'i-heroicons-arrow-up-circle-20-solid',
          click: () => adminPromote(row.User._id)
        }
      ]
    ),
    ...((row.role != 'admin' && `${row.User.firstName} ${row.User.lastName}` != $auth.data.value?.user?.name) ? ([{
      label: `Kick Member`,
      icon: 'i-heroicons-trash-20-solid',
      click: () => memberKick(row.User._id)
    }]) : []),
  ],
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