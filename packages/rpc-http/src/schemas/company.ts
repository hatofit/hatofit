import { z } from 'zod'

export const CompanySchema = z.object({
  id: z.string(),
  name: z.string(),
})

export const CreateCompanySchema = z.object({
  name: z.string(),
  description: z.string(),
  address: z.string(),
})

export const CreateExerciseSchema = z.object({
  name: z.string().min(3).max(255),
  description: z.string().min(3).max(255),
  thumbnail: z.string().optional(),
  type: z.enum(['cardio', 'strength', 'flexibility', 'balance', 'endurance', 'power', 'speed', 'agility', 'coordination', 'reaction', 'mobility', 'stability', 'other']),
  difficulty: z.enum(['expert', 'intermediate', 'advanced', 'beginner', 'professional', 'olympic', 'paralympic', 'other']),
  duration: z.number().int().min(0),
  instructions: z.array(z.object({
    type: z.enum(['instruction', 'rest']),
    duration: z.number().int().min(0),
    name: z.string().min(3).max(255).optional(),
    content: z.object({
      lottie: z.string().optional(),
      video: z.string().optional(),
      image: z.string().optional(),
    }).optional(),
  })),
})