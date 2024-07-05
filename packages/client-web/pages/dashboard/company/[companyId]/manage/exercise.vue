<script lang="ts" setup>
import { z } from 'zod'
import type { FormSubmitEvent } from '#ui/types'
import { Api } from '~/utils/api';
import { FetchError } from 'ofetch'

definePageMeta({
  layout: 'dashboard-company-manage',
  middleware: ['auth'],
})

const $toast = useToast()
const { companyId } = await useCompanyLayout()
const { data } = useFetchWithAuth<Api.Company.Exercises.response>(Api.Company.Exercises.url(companyId.value))

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
    key: 'type',
    label: 'type'
  },
  {
    key: 'difficulty',
    label: 'difficulty'
  },
  {
    key: 'duration',
    label: 'Duration'
  },
  {
    key: 'actions'
  }
]

// const exercises = [{
//   no: 1,
//   name: 'Yoga Poses',
//   duration: '30 minutes',
// }, {
//   no: 2,
//   name: 'Kettlebell Swing',
//   duration: '20 minutes',
// }]
const exercises = computed(() => (data.value?.exercises || []).map((exercise, i) => ({
  no: i + 1,
  name: exercise.name,
  duration: exercise.duration + ' seconds',
  type: exercise.type,
  difficulty: exercise.difficulty,
})))

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

const CreateEditExerciseModal = (() => {
  const vals = {
    isOpen: ref(false),
    mode: ref<'create' | 'edit'>('create'),
    schema: z.object({
      name: z.string().min(3).max(255),
      description: z.string().min(3).max(255),
      thumbnail: z.string().url().optional(),
      type: z.enum(['cardio', 'strength', 'flexibility', 'balance', 'endurance', 'power', 'speed', 'agility', 'coordination', 'reaction', 'mobility', 'stability', 'other']),
      difficulty: z.enum(['expert', 'intermediate', 'advanced', 'beginner', 'professional', 'olympic', 'paralympic', 'other']),
      // duration: z.number().int().min(0),
      instructions: z.array(z.object({
        type: z.enum(['instruction', 'rest']),
        duration: z.number().int().min(0),
        name: z.string().min(3).max(255).optional(),
        content: z.object({
          lottie: z.string().url().optional(),
          video: z.string().url().optional(),
          image: z.string().url().optional(),
        }).optional(),
      })),
    }),
    inputs: ref({
      name: '',
      description: '',
      thumbnail: '',
      type: 'cardio',
      difficulty: 'expert',
      duration: 0,
      instructions: [
        {
          "content": {
            "lottie": "https://assets2.lottiefiles.com/packages/lf20_dwydvW8JJ7.json",
            "video": "https://www.youtube.com/watch?v=LXuVHYAfyGU",
            "image": "https://static.vecteezy.com/system/resources/previews/005/178/354/original/woman-doing-jump-rope-skipping-cardio-exercise-flat-illustration-isolated-on-white-background-free-vector.jpg"
          },
          "name": "Jumping rope",
          "duration": 30,
          "type": "instruction"
        },
        {
          "duration": 30,
          "type": "rest"
        }
      ],
    }),
  }

  return {
    ...vals,
    onSubmitRegister: async (event: FormSubmitEvent<z.output<typeof vals.schema>>) => {
      console.log('onSubmitRegister', event)
      if (vals.mode.value === 'create') {
        console.log('Create Exercise')

        try {
          const http = await $fetchWithAuth<Api.Company.CreateExercises.response>(Api.Company.CreateExercises.url(companyId.value), {
            method: 'POST',
            body: JSON.stringify(vals.inputs.value),
          })
          console.log(http)
          $toast.add({ title: 'Exercise created' })
          vals.isOpen.value = false
        } catch (error) {
          if (error instanceof FetchError && error.response) parseErrorFromResponseWithToast(error.response)
          console.error(error)
        }
      } else {
        console.log('Edit Exercise')
      }
    }
  }
})()
</script>

<template>
  <div>
    <div>
      <div class="mb-6">
        <div class="flex justify-end gap-2">
          <UButton @click="CreateEditExerciseModal.isOpen.value = true">Create Exercise</UButton>
        </div>
      </div>
      <UTable :columns="columns" :rows="exercises">
        <template #actions-data="{ row }">
          <UDropdown :items="items(row)">
            <UButton color="gray" variant="ghost" icon="i-heroicons-ellipsis-horizontal-20-solid" />
          </UDropdown>
        </template>
      </UTable>
    </div>
    <UModal v-model="CreateEditExerciseModal.isOpen.value">
      <UCard :ui="{ ring: '', divide: 'divide-y divide-gray-100 dark:divide-gray-800' }">
        <template #header>
          {{ CreateEditExerciseModal.mode.value === 'create' ? 'Create' : 'Edit' }} Exercise
        </template>

        <UForm :schema="CreateEditExerciseModal.schema" :state="CreateEditExerciseModal.inputs.value" class="flex flex-col gap-4" @submit="CreateEditExerciseModal.onSubmitRegister">
          <UFormGroup label="Name" name="name" required class="flex-1">
            <UInput v-model="CreateEditExerciseModal.inputs.value.name" placeholder="name" />
          </UFormGroup>
          <UFormGroup label="Description" name="description" required class="flex-1">
            <UTextarea v-model="CreateEditExerciseModal.inputs.value.description" placeholder="description" />
          </UFormGroup>
          <UFormGroup label="Thumbnail" name="thumbnail" class="flex-1">
            <UInput v-model="CreateEditExerciseModal.inputs.value.thumbnail" placeholder="thumbnail" />
          </UFormGroup>
          <UFormGroup label="Type" name="type" required class="flex-1">
            <USelect v-model="CreateEditExerciseModal.inputs.value.type" :options="['cardio', 'strength', 'flexibility', 'balance', 'endurance', 'power', 'speed', 'agility', 'coordination', 'reaction', 'mobility', 'stability', 'other']" />
          </UFormGroup>
          <UFormGroup label="Difficulty" name="difficulty" required class="flex-1">
            <USelect v-model="CreateEditExerciseModal.inputs.value.difficulty" :options="['expert', 'intermediate', 'advanced', 'beginner', 'professional', 'olympic', 'paralympic', 'other']" />
          </UFormGroup>
        </UForm>

        <div class="border-t border-gray-50/50 py-6 mt-6 flex flex-col gap-4">
          <div>Instructions ({{ CreateEditExerciseModal.inputs.value.instructions.length }})</div>
          <div class="flex flex-col gap-4">
            <div v-for="(instruction, i) in CreateEditExerciseModal.inputs.value.instructions" :key="i" class="border rounded border-gray-500/50">
              <div class="px-3 py-2 border-b border-gray-500/50 flex justify-between items-center">
                <div>Intruction {{ i+1 }}</div>
                <div class="text-xs">
                  <UButton color="red" variant="ghost" icon="i-heroicons-trash-20-solid" size="xs" @click="CreateEditExerciseModal.inputs.value.instructions.splice(i, 1)" />
                </div>
              </div>
              <div class="px-3 py-2">
                <UFormGroup label="Type" name="type" required class="flex-1">
                  <USelect v-model="instruction.type" :options="['instruction', 'rest']" />
                </UFormGroup>
                <UFormGroup label="Duration" name="duration" required class="flex-1">
                  <UInput v-model="instruction.duration" type="number" placeholder="duration" />
                </UFormGroup>
                <UFormGroup v-if="instruction.type == 'instruction'" label="Name" name="name" class="flex-1">
                  <UInput v-model="instruction.name" placeholder="name" />
                </UFormGroup>
              </div>
            </div>
            <div class="flex justify-end">
              <UButton @click="CreateEditExerciseModal.inputs.value.instructions.push({ type: 'instruction', duration: 0 })">Add Instruction</UButton>
            </div>
          </div>
        </div>

        <template #footer>
          <div class="flex justify-end gap-2">
            <UButton color="gray" variant="ghost" @click="CreateEditExerciseModal.isOpen.value = false">Cancel</UButton>
            <UButton
              color="primary"
              @click="CreateEditExerciseModal.onSubmitRegister"
            >
              Save
            </UButton>
          </div>
        </template>
      </UCard>
    </UModal>
  </div>
</template>