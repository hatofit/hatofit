<script lang="ts" setup>
import { Api } from '~/utils/api';

definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})

const $loading = useLoadingIndicator()
const $toast = useToast()
const $auth = useAuth()
const $dayjs = useDayjs()
const state = ref({
  firstName: 'John',
  lastName: 'Doe',
  email: 'john.doe@mail.com',
  dateOfBirth: '',
  weight: 70,
  height: 50,
  gender: 'male' as 'male'|'female',
})
const changePasswordState = ref({
  oldPassword: '',
  newPassword: '',
  confirmPassword: '',
})


const deleteAccountIsOpen = ref(false)
const deleteAccountNow = async () => {
  deleteAccountIsOpen.value = false
  $loading.start()
  try {
    const res = await $fetchWithAuth<Api.Auth.Delete.response>(Api.Auth.Delete.url(), {
      method: 'DELETE',
    })
    console.log(res)
    $toast.add({
      title: 'Account Deleted',
      description: 'Your account has been deleted successfully, logging you out.',
      color: 'green',
    })
    setTimeout(() => {
      $auth.signOut({ callbackUrl: '/auth/login', redirect: true })
    }, 2000)
  } catch (error) {
    console.error(error)
    $toast.add({
      title: 'Error',
      description: 'An error occurred while deleting your account, please try again later.',
      color: 'red',
    })
  }
  $loading.finish()
}
</script>

<template>
  <div class="flex flex-col gap-4">
    <UCard>
      <template #header>
        <h2 class="text-xl font-semibold">Profile</h2>
      </template>

      <UForm :state="state" class="flex flex-col gap-4">
        <div class="flex gap-4 flex-1 w-full">
          <UFormGroup label="First Name" name="firstName" class="flex-1">
            <UInput v-model="state.firstName" />
          </UFormGroup>
          <UFormGroup label="Last Name" name="lastName" class="flex-1">
            <UInput v-model="state.lastName" />
          </UFormGroup>
        </div>
        <div class="flex gap-4 flex-1 w-full">
          <UFormGroup label="Date of Birth" name="dateOfBirth" class="flex-1">
            <UInput type="date" v-model="state.dateOfBirth" />
          </UFormGroup>
          <UFormGroup label="Gender" name="gender" class="flex-1">
            <USelectMenu v-model="state.gender" :options="['male', 'female']" />
          </UFormGroup>
        </div>
        <div class="flex gap-4 flex-1 w-full">
          <UFormGroup label="Weight" name="weight" class="flex-1">
            <UInput type="number" v-model="state.weight" />
          </UFormGroup>
          <UFormGroup label="Height" name="height" class="flex-1">
            <UInput type="number" v-model="state.height" />
          </UFormGroup>
        </div>
      </UForm>

      <template #footer>
        <div class="flex justify-end">
          <UButton variant="solid" color="primary" label="Save" />
        </div>
      </template>
    </UCard>
    
    <UCard class="">
      <template #header>
        <h2 class="text-xl font-semibold">Change Email</h2>
      </template>

      <UForm :state="state" class="flex flex-col gap-4">
        <UFormGroup label="Email" name="email">
          <UInput v-model="state.email" />
        </UFormGroup>
      </UForm>

      <template #footer>
        <div class="flex justify-end">
          <UButton variant="solid" color="primary" label="Change Email" />
        </div>
      </template>
    </UCard>
    
    <UCard class="flex-1">
      <template #header>
        <h2 class="text-xl font-semibold">Change Password</h2>
      </template>

      <UForm :state="changePasswordState" class="flex flex-col gap-4">
        <UFormGroup label="Old Password" name="oldPassword">
          <UInput type="password" v-model="changePasswordState.oldPassword" />
        </UFormGroup>
        <UFormGroup label="New Password" name="newPassword">
          <UInput type="password" v-model="changePasswordState.newPassword" />
        </UFormGroup>
        <UFormGroup label="Confirm Password" name="confirmPassword">
          <UInput type="password" v-model="changePasswordState.confirmPassword" />
        </UFormGroup>
      </UForm>

      <template #footer>
        <div class="flex justify-end">
          <UButton variant="solid" color="primary" label="Change Password" />
        </div>
      </template>
    </UCard>
    
    <UCard class="flex-1">
      <template #header>
        <h2 class="text-xl font-semibold">Delete Account</h2>
      </template>

      <p class="text-sm">
        Deleting your account will permanently remove all your data.
      </p>

      <template #footer>
        <div class="flex justify-end">
          <UButton variant="solid" color="primary" label="Delete" @click="deleteAccountIsOpen = true" />
        </div>
      </template>
    </UCard>

    <Teleport to="body">
      <UModal v-model="deleteAccountIsOpen">
        <UCard :ui="{ ring: '', divide: 'divide-y divide-gray-100 dark:divide-gray-800' }">
          <template #header>
            <h2 class="text-xl font-semibold">Delete Account</h2>
          </template>

          <p class="text-sm">
            Are you sure you want to delete your account? This action cannot be undone.
          </p>

          <template #footer>
            <div class="flex justify-end gap-2">
              <UButton variant="solid" color="primary" label="Delete" @click="deleteAccountNow" />
              <UButton variant="outline" color="gray" label="Cancel" @click="deleteAccountIsOpen = false" />
            </div>
          </template>
        </UCard>
      </UModal>
    </Teleport>
  </div>
</template>