import { z } from "zod";

export const UserSchema = z.object({
  email: z.string(),
  password: z.string(),
  firstName: z.string(),
  lastName: z.string(),
  dateOfBirth: z.date(),
  photo: z.string(),
  weight: z.number(),
  height: z.number(),
  gender: z.enum(["male", "female"]),
  metricUnits: z.object({
    energyUnits: z.string(),
    weightUnits: z.string(),
    heightUnits: z.string(),
  }),
});
