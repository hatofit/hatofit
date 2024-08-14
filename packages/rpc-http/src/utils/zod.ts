import zod from "zod";

export const validateWithZod = <
  T extends zod.ZodObject<{}> | zod.ZodEffects<zod.ZodObject<{}>>
>(
  schema: T,
  data: object
) => {
  try {
    return {
      ok: true,
      data: schema.parse(data) as zod.infer<T>,
    };
  } catch (error) {
    if (error instanceof zod.ZodError) {
      return {
        ok: false,
        errors: error.errors,
      };
    }
    throw error;
  }
};
