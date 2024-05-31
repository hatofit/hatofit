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