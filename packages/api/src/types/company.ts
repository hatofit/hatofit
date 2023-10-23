import { z } from 'zod'

export const CompanyAdminSchema = z.object({
  userId: z.string(),
  role: z.enum(['owner']),
  isCreated: z.boolean(),
})

export const CompanySchema = z.object({
  name: z.string(),
  meta: z.object({
    description: z.string(),
    address: z.string(),
  }),
  admins: z.array(CompanyAdminSchema)
})

