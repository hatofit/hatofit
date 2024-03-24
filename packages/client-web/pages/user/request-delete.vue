<script lang="ts" setup>
import { z } from 'zod'
import { Api } from '~/utils/api';
import { FetchError } from 'ofetch'

const $loading = useLoadingIndicator()
const $toast = useToast()
const $auth = useAuth()
const $dayjs = useDayjs()
const $route = useRoute()

definePageMeta({
  layout: 'page'
})

const state = ref({
  email: '',
})
const schema = z.object({
  email: z.string().email('Invalid email address'),
})

const submit = async () => {
  $loading.start()
  try {
    const res = await $fetchWithAuth<Api.User.RequestDelete.response>(Api.User.RequestDelete.url(), {
      method: 'DELETE',
      body: Api.User.RequestDelete.parseData(state.value),
    })
    console.log(res)
    $toast.add({
      title: 'Account Delete Requested',
      description: 'Your request has been sent to your email, please check your email to confirm.',
      color: 'green',
    })
    setTimeout(() => {
      $auth.signOut({ callbackUrl: '/', redirect: true })
    }, 2000)
  } catch (error) {
    console.error(error)
  let msg = 'An error occurred while deleting your account, please try again later.'
  if (error instanceof FetchError) {
    msg = error.data?.message || msg
  }
  $toast.add({
    title: 'Error',
    description: msg,
    color: 'red',
  })
  }
  $loading.finish()
}

onMounted(async () => {
  // get code from query ?code=123
  const query = $route.query
  if (query.code) {
    $loading.start()
    try {
      const res = await $fetchWithAuth<Api.User.RequestDelete.response>(Api.User.RequestDelete.url(), {
        method: 'DELETE',
        body: Api.User.RequestDelete.parseData({
          code: query.code as string,
        }),
      })
      console.log(res)
      $toast.add({
        title: 'Account Deleted',
        description: 'Your account has been deleted successfully, logging you out.',
        color: 'green',
      })
      setTimeout(() => {
        $auth.signOut({ callbackUrl: '/', redirect: true })
      }, 3000)
    } catch (error) {
      console.error(error)
      let msg = 'An error occurred while deleting your account, please try again later.'
      if (error instanceof FetchError) {
        msg = error.data?.message || msg
      }
      $toast.add({
        title: 'Error',
        description: msg,
        color: 'red',
      })
    }
    $loading.finish()
  }
})
</script>

<template>
  <PageContainer class="flex-1 flex flex-col gap-4 justify-center">
    <PageSection class="flex flex-col items-center justify-center">
      <UCard class="w-full max-w-[500px]">
        <template #header>
          <h2 class="text-xl font-semibold">Request Account Delete</h2>
        </template>

        <UForm :schema="schema" :state="state" class="flex flex-col gap-4">
          <UFormGroup label="Email" name="email" required>
            <UInput v-model="state.email" type="email" placeholder="you@example.com" icon="i-heroicons-envelope" />
          </UFormGroup>
        </UForm>

        <template #footer>
          <div class="flex justify-end">
            <UButton variant="solid" color="primary" label="Send Request to Email" @click="submit" />
          </div>
        </template>
      </UCard>
      <div class="w-full max-w-[500px] mt-4 text-center text-gray-500">
        You also can delete account via dashboard, login and go to profile page.
      </div>
    </PageSection>
  </PageContainer>
</template>