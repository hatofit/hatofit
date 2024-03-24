import { z } from "zod"

export const UserSchema = z.object({
  email: z.string(),
  password: z.string(),
  firstName: z.string(),
  lastName: z.string(),
  dateOfBirth: z.date(),
  gender: z.enum(["male", "female"]),

  weight: z.number(),
  height: z.number(),
  metricUnits: z
    .object({
      energyUnits: z.string(),
      weightUnits: z.string(),
      heightUnits: z.string(),
    })
    .optional(),

  photo: z.any(),
});

export const AuthRegisterSchema = UserSchema
  .pick({
    email: true,
    password: true,
    firstName: true,
    lastName: true,
    dateOfBirth: true,
    gender: true,
    weight: true,
    height: true,
    metricUnits: true,
  })
  .extend({
    confirmPassword: z.string(),
  })