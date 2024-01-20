"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CompanySchema = exports.CompanyAdminSchema = void 0;
const zod_1 = require("zod");
exports.CompanyAdminSchema = zod_1.z.object({
    userId: zod_1.z.string(),
    role: zod_1.z.enum(['owner']),
    isCreated: zod_1.z.boolean(),
});
exports.CompanySchema = zod_1.z.object({
    name: zod_1.z.string(),
    meta: zod_1.z.object({
        description: zod_1.z.string(),
        address: zod_1.z.string(),
    }),
    admins: zod_1.z.array(exports.CompanyAdminSchema)
});
// {
//   name: String,
//   meta: {
//     description: String,
//     address: String,
//   },
//   admins: {
//     userId: String,
//     role: 'owner' | 'viewer',
//     isCreated: Boolean,
//   }[]
// }
