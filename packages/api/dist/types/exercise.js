"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ExerciseSchema = void 0;
const zod_1 = require("zod");
exports.ExerciseSchema = zod_1.z.object({
    name: zod_1.z.string(),
    description: zod_1.z.string(),
    difficulty: zod_1.z.enum(['beginner', 'intermediate', 'advanced']),
    type: zod_1.z.string(),
    thumbnail: zod_1.z.string(),
    duration: zod_1.z.number(),
    instructions: zod_1.z.array(zod_1.z.object({
        type: zod_1.z.enum(['rest', 'instruction']),
        duration: zod_1.z.number(),
        name: zod_1.z.string().optional(),
        description: zod_1.z.string().optional(),
        content: zod_1.z.object({
            video: zod_1.z.string().optional(),
            image: zod_1.z.string().optional(),
            lottie: zod_1.z.string().optional(),
        }).optional(),
    }))
});
