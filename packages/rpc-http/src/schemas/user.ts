import { z } from "zod";
import { zfd } from "zod-form-data";

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

export const AuthRegisterSchema = UserSchema.pick({
  email: true,
  password: true,
  firstName: true,
  lastName: true,
  dateOfBirth: true,
  gender: true,
  weight: true,
  height: true,
  metricUnits: true,
}).extend({
  confirmPassword: z.string(),
});

export const AuthRegisterFormDataSchema = zfd.formData({
  email: zfd.text(),
  password: zfd.text(),
  confirmPassword: zfd.text(),
  firstName: zfd.text(),
  lastName: zfd.text(),
  dateOfBirth: z.date(),
  gender: zfd.text(z.enum(["male", "female"])),
  weight: zfd.numeric(),
  height: zfd.numeric(),
  metricUnits: zfd.text(
    z
      .object({
        energyUnits: zfd.text(),
        weightUnits: zfd.text(),
        heightUnits: zfd.text(),
      })
      .optional()
  ),
  photo: z.any(),
});
