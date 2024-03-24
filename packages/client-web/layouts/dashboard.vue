<script lang="ts" setup>
const route = useRoute()
const $auth = useAuth()

const prefix = '/dashboard'
const links = [
  [
    {
      label: 'Home',
      icon: 'i-heroicons-command-line',
      to: `${prefix}`
    },
    {
      label: 'Sessions',
      icon: 'i-material-symbols-light-exercise-outline',
      to: `${prefix}/sessions`
    }
  ],
  [
    {
      label: 'Company',
      icon: 'i-heroicons-building-library',
      to: `${prefix}/company`
    }
  ],
  [
    {
      label: 'Profile',
      icon: 'i-heroicons-user',
      to: `${prefix}/profile`
    }
  ]
]

onMounted(() => {
  console.log('auth', $auth.data.value?.user)
})
</script>

<template>
  <BaseLayoutDashboard :links="links">
    <slot />
  </BaseLayoutDashboard>
</template>