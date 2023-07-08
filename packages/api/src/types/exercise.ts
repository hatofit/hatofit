import { z } from 'zod'

export const ExerciseSchema = z.object({
  name: z.string(),
  description: z.string(),
  difficulty: z.enum(['beginner', 'intermediate', 'advanced']),
  type: z.string(),
  thumbnail: z.string(),
  duration: z.number(),
  instructions: z.array(
    z.object({
      type: z.enum(['rest', 'instruction']),
      duration: z.number(),
      name: z.string().optional(),
      description: z.string().optional(),
      content: z.object({
        video: z.string().optional(),
        image: z.string().optional(),
        lottie: z.string().optional(),
      }).optional(),
    })
  )
})

