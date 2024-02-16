import { z } from "zod";

export const UserSchema = z.object({
  email: z.string(),
  password: z.string(),
  firstName: z.string(),
  lastName: z.string(),
  dateOfBirth: z.date(),
  photo: z.any(),
  weight: z.string(),
  height: z.string(),
  gender: z.enum(["male", "female"]),
  metricUnits: z
    .object({
      energyUnits: z.string(),
      weightUnits: z.string(),
      heightUnits: z.string(),
    })
    .optional(),

  //
  linkedCompanyId: z.string().optional(),
});
