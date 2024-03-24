<script lang="ts" setup>
const $auth = useAuth()
if ($auth.status.value !== 'authenticated') {
  navigateTo('/login')
} else {
  if ($auth.data.value?.user?.role == 'company') {
    navigateTo('/dashboard/company')
  } else {
    navigateTo('/dashboard/user')
  }
} 
</script>

<template>
  <div class="flex-1 flex justify-center items-center">
    <div class="animate-pulse">
      Please Wait...
    </div>
  </div>
</template>