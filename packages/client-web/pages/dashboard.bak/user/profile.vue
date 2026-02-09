<script lang="ts" setup>
definePageMeta({
  layout: 'dashboard',
  middleware: ['auth'],
})

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
    
    <div class="flex gap-4">
      <div class="flex-1">
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
      </div>
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
            <UButton variant="solid" color="primary" label="Change Email" />
          </div>
        </template>
      </UCard>
    </div>
  </div>
</template>