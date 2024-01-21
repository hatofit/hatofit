"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ApiCompany = void 0;
const mongoose_1 = __importDefault(require("mongoose"));
const db_1 = require("../db");
const auth_1 = require("../middlewares/auth");
const company_1 = require("../types/company");
const auth_2 = require("../utils/auth");
const ApiCompany = ({ route }) => {
    // LISTINGS
    route.get("/company", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        const companies = yield db_1.Company.find();
        return res.json({
            success: true,
            message: "Companies found",
            companies,
        });
    }));
    route.get("/company/create-by-me", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            const companies = yield db_1.Company.find({
                "admins.userId": authUser._id,
            });
            return res.json({
                success: true,
                message: "Companies found",
                companies,
            });
            return companies;
        }
        catch (error) {
            return res.status(400).json({ error });
        }
    }));
    route.get("/company/:id", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            return res.json({
                success: true,
                message: "Company found",
                company,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    // COMPANY ACTIONS
    route.post("/company", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _a, _b, _c;
        try {
            const authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            // validate input
            const company = company_1.CompanySchema.parse({
                name: (_a = req.body) === null || _a === void 0 ? void 0 : _a.name,
                meta: {
                    description: (_b = req.body) === null || _b === void 0 ? void 0 : _b.description,
                    address: (_c = req.body) === null || _c === void 0 ? void 0 : _c.address,
                },
                admins: [],
            });
            // save to db
            const created = yield db_1.Company.create(Object.assign(Object.assign({}, company), { _id: new mongoose_1.default.Types.ObjectId().toHexString(), admins: [
                    {
                        userId: authUser._id,
                        role: "owner",
                        isCreated: true,
                    },
                ] }));
            // resposne
            return res.json({
                success: true,
                message: "Company created successfully",
                id: created._id,
                company: created.toObject(),
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.post("/company/:id/link", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            let authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            const { id } = req.params;
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            // update input
            yield authUser.updateOne({
                linkedCompanyId: company._id,
            }, { new: true });
            // resposne
            return res.json({
                success: true,
                message: "Company linked successfully",
                user: authUser.toObject(),
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    route.post("/company/unlink", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            // update input
            yield authUser.updateOne({
                linkedCompanyId: null,
            }, { new: true });
            // resposne
            return res.json({
                success: true,
                message: "Company unlink successfully",
                user: authUser.toObject(),
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
    // SETTINGS
    route.get("/company/:id/setting", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _d, _e;
        try {
            const { id } = req.params;
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            return res.json({
                success: true,
                message: "setting found",
                setting: {
                    name: company.name,
                    meta: {
                        description: (_d = company.meta) === null || _d === void 0 ? void 0 : _d.description,
                        address: (_e = company.meta) === null || _e === void 0 ? void 0 : _e.address,
                    },
                },
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.post("/company/:id/setting", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        var _f, _g, _h, _j, _k;
        try {
            const { id } = req.params;
            let company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            // validate input
            yield db_1.Company.findByIdAndUpdate(id, {
                name: (_f = req.body) === null || _f === void 0 ? void 0 : _f.name,
                meta: {
                    description: (_h = (_g = req.body) === null || _g === void 0 ? void 0 : _g.meta) === null || _h === void 0 ? void 0 : _h.description,
                    address: (_k = (_j = req.body) === null || _j === void 0 ? void 0 : _j.meta) === null || _k === void 0 ? void 0 : _k.address,
                },
            });
            return res.json({
                success: true,
                message: "setting save success",
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    // MEMBERS
    route.get("/company/:id/members", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            const members = yield db_1.User.find({
                linkedCompanyId: company._id,
            });
            return res.json({
                success: true,
                message: "Members found",
                members,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.delete("/company/:id/members/:memberId", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id, memberId } = req.params;
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            // login user must be admin of this company
            const authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            const authUserAdmin = company.admins.find((admin) => admin.userId === authUser._id);
            if (!authUserAdmin) {
                return res.status(403).json({
                    success: false,
                    message: "User not allowed",
                });
            }
            const member = yield db_1.User.findById(memberId);
            if (!member) {
                return res.status(404).json({
                    success: false,
                    message: "User not found in this company",
                });
            }
            yield member.updateOne({
                linkedCompanyId: null,
            }, { new: true });
            return res.json({
                success: true,
                message: "remove member from company successfully",
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    // OWNERS
    route.get("/company/:id/owners", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            const owners = company.admins;
            const users = yield db_1.User.find({
                _id: {
                    $in: owners.map((owner) => owner.userId),
                },
            });
            return res.json({
                success: true,
                message: "Owners found",
                owners,
                users: users.map((user) => ({
                    _id: user._id,
                    firstName: user.firstName,
                    lastName: user.lastName,
                    email: user.email,
                })),
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.post("/company/:id/owners", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const { email } = req.body;
            // search company
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            // login user must be admin of this company
            const authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            const authUserAdmin = company.admins.find((admin) => admin.userId === authUser._id);
            if (!authUserAdmin) {
                return res.status(403).json({
                    success: false,
                    message: "User not allowed",
                });
            }
            // search user to add
            const userToAdd = yield db_1.User.findOne({
                email,
            });
            if (!userToAdd) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            // add to admin company
            const companyNew = [...company.admins];
            // search if user already in company
            const userAlreadyInCompany = companyNew.find((admin) => admin.userId === userToAdd._id);
            if (userAlreadyInCompany) {
                return res.status(400).json({
                    success: false,
                    message: "User already in company",
                });
            }
            // add
            companyNew.push({
                userId: userToAdd._id,
                role: "owner",
            });
            // update company
            yield company.updateOne({
                admins: companyNew,
            }, { new: true });
            return res.json({
                success: true,
                message: "Add owner successfully",
                email,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    route.delete("/company/:id/owners", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            const { id } = req.params;
            const { userId } = req.body;
            // search company
            const company = yield db_1.Company.findById(id);
            if (!company) {
                return res.status(404).json({
                    success: false,
                    message: "Company not found",
                });
            }
            // login user must be admin of this company
            const authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            const authUserAdmin = company.admins.find((admin) => admin.userId === authUser._id);
            if (!authUserAdmin) {
                return res.status(403).json({
                    success: false,
                    message: "User not allowed",
                });
            }
            // search user to remove
            const userToAdd = yield db_1.User.findById(userId);
            if (!userToAdd) {
                return res.status(404).json({
                    success: false,
                    message: "User not found",
                });
            }
            // remove from admin company
            const companyNew = [...company.admins];
            // search if user already in company
            const userAlreadyInCompany = companyNew.find((admin) => admin.userId === userToAdd._id);
            if (!userAlreadyInCompany) {
                return res.status(400).json({
                    success: false,
                    message: "User not in company",
                });
            }
            // remove
            companyNew.splice(companyNew.indexOf(userAlreadyInCompany), 1);
            // update company
            yield company.updateOne({
                admins: companyNew,
            }, { new: true });
            return res.json({
                success: true,
                message: "Remove owner successfully",
                userId,
            });
        }
        catch (error) {
            console.error(error);
            return res.status(500).json({ error });
        }
    }));
    // AUTHS
    route.get("/auth/company-linked", auth_1.AuthJwtMiddleware, (req, res) => __awaiter(void 0, void 0, void 0, function* () {
        try {
            let authUser = yield (0, auth_2.getUserByAuth)(req);
            if (!authUser)
                return res.status(401).json({
                    success: false,
                    message: "User not found",
                });
            if (!authUser.linkedCompanyId)
                return res.json({
                    success: true,
                    message: "User not have linked company",
                    user: authUser.toObject(),
                });
            const company = yield db_1.Company.findById(authUser.linkedCompanyId);
            if (!company) {
                return res.json({
                    success: true,
                    message: "User not have linked company",
                    user: authUser.toObject(),
                });
            }
            // resposne
            return res.json({
                success: true,
                message: "User have linked company",
                user: authUser.toObject(),
                company,
            });
        }
        catch (error) {
            // console.error(error)
            return res.status(400).json({ error });
        }
    }));
};
exports.ApiCompany = ApiCompany;
