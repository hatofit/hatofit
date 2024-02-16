import { IRouter } from "express";
import mongoose from "mongoose";
import { Company, User } from "../db";
import { AuthJwtMiddleware } from "../middlewares/auth";
import { CompanySchema } from "../types/company";
import { getUserByAuth } from "../utils/auth";

export const ApiCompany = ({ route }: { route: IRouter }) => {
  // LISTINGS
  route.get("/company", async (req, res) => {
    const companies = await Company.find();
    return res.json({
      success: true,
      message: "Companies found",
      companies,
    });
  });
  route.get("/company/create-by-me", AuthJwtMiddleware, async (req, res) => {
    try {
      const authUser = await getUserByAuth(req);
      if (!authUser)
        return res.status(401).json({
          success: false,
          message: "User not found",
        });

      const companies = await Company.find({
        "admins.userId": authUser._id,
      });
      return res.json({
        success: true,
        message: "Companies found",
        companies,
      });

      return companies;
    } catch (error) {
      return res.status(400).json({ error });
    }
  });
  route.get("/company/:id", async (req, res) => {
    try {
      const { id } = req.params;
      const company = await Company.findById(id);
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
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });

  // COMPANY ACTIONS
  route.post("/company", AuthJwtMiddleware, async (req, res) => {
    try {
      const authUser = await getUserByAuth(req);
      if (!authUser)
        return res.status(401).json({
          success: false,
          message: "User not found",
        });

      // validate input
      const company = CompanySchema.parse({
        name: req.body?.name,
        meta: {
          description: req.body?.description,
          address: req.body?.address,
        },
        admins: [],
      });

      // save to db
      const created = await Company.create({
        ...company,
        _id: new mongoose.Types.ObjectId().toHexString(),
        admins: [
          {
            userId: authUser._id,
            role: "owner",
            isCreated: true,
          },
        ],
      });

      // resposne
      return res.json({
        success: true,
        message: "Company created successfully",
        id: created._id,
        company: created.toObject(),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.post("/company/:id/link", AuthJwtMiddleware, async (req, res) => {
    try {
      let authUser = await getUserByAuth(req);
      if (!authUser)
        return res.status(401).json({
          success: false,
          message: "User not found",
        });

      const { id } = req.params;
      const company = await Company.findById(id);
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      // update input
      await authUser.updateOne(
        {
          linkedCompanyId: company._id,
        },
        { new: true }
      );

      // resposne
      return res.json({
        success: true,
        message: "Company linked successfully",
        user: authUser.toObject(),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.post("/company/unlink", AuthJwtMiddleware, async (req, res) => {
    try {
      const authUser = await getUserByAuth(req);
      if (!authUser)
        return res.status(401).json({
          success: false,
          message: "User not found",
        });

      // update input
      await authUser.updateOne(
        {
          linkedCompanyId: null,
        },
        { new: true }
      );

      // resposne
      return res.json({
        success: true,
        message: "Company unlink successfully",
        user: authUser.toObject(),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });

  // SETTINGS
  route.get("/company/:id/setting", AuthJwtMiddleware, async (req, res) => {
    try {
      const { id } = req.params;
      const company = await Company.findById(id);
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
            description: company.meta?.description,
            address: company.meta?.address,
          },
        },
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.post("/company/:id/setting", AuthJwtMiddleware, async (req, res) => {
    try {
      const { id } = req.params;
      let company = await Company.findById(id);
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      // validate input
      await Company.findByIdAndUpdate(id, {
        name: req.body?.name,
        meta: {
          description: req.body?.meta?.description,
          address: req.body?.meta?.address,
        },
      });

      return res.json({
        success: true,
        message: "setting save success",
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });

  // MEMBERS
  route.get("/company/:id/members", async (req, res) => {
    try {
      const { id } = req.params;
      const company = await Company.findById(id);
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      const members = await User.find({
        linkedCompanyId: company._id,
      });
      return res.json({
        success: true,
        message: "Members found",
        members,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.delete(
    "/company/:id/members/:memberId",
    AuthJwtMiddleware,
    async (req, res) => {
      try {
        const { id, memberId } = req.params;
        const company = await Company.findById(id);
        if (!company) {
          return res.status(404).json({
            success: false,
            message: "Company not found",
          });
        }

        // login user must be admin of this company
        const authUser = await getUserByAuth(req);
        if (!authUser)
          return res.status(401).json({
            success: false,
            message: "User not found",
          });
        const authUserAdmin = company.admins.find(
          (admin) => admin.userId === authUser._id
        );
        if (!authUserAdmin) {
          return res.status(403).json({
            success: false,
            message: "User not allowed",
          });
        }

        const member = await User.findById(memberId);
        if (!member) {
          return res.status(404).json({
            success: false,
            message: "User not found in this company",
          });
        }

        await member.updateOne(
          {
            linkedCompanyId: null,
          },
          { new: true }
        );

        return res.json({
          success: true,
          message: "remove member from company successfully",
        });
      } catch (error) {
        console.error(error);
        return res.status(500).json({ error });
      }
    }
  );

  // OWNERS
  route.get("/company/:id/owners", async (req, res) => {
    try {
      const { id } = req.params;
      const company = await Company.findById(id);
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      const owners = company.admins;
      const users = await User.find({
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
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.post("/company/:id/owners", AuthJwtMiddleware, async (req, res) => {
    try {
      const { id } = req.params;
      const { email } = req.body;

      // search company
      const company = await Company.findById(id);
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      // login user must be admin of this company
      const authUser = await getUserByAuth(req);
      if (!authUser)
        return res.status(401).json({
          success: false,
          message: "User not found",
        });
      const authUserAdmin = company.admins.find(
        (admin) => admin.userId === authUser._id
      );
      if (!authUserAdmin) {
        return res.status(403).json({
          success: false,
          message: "User not allowed",
        });
      }

      // search user to add
      const userToAdd = await User.findOne({
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
      const userAlreadyInCompany = companyNew.find(
        (admin) => admin.userId === userToAdd._id
      );
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
      await company.updateOne(
        {
          admins: companyNew,
        },
        { new: true }
      );

      return res.json({
        success: true,
        message: "Add owner successfully",
        email,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.delete("/company/:id/owners", AuthJwtMiddleware, async (req, res) => {
    try {
      const { id } = req.params;
      const { userId } = req.body;

      // search company
      const company = await Company.findById(id);
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      // login user must be admin of this company
      const authUser = await getUserByAuth(req);
      if (!authUser)
        return res.status(401).json({
          success: false,
          message: "User not found",
        });
      const authUserAdmin = company.admins.find(
        (admin) => admin.userId === authUser._id
      );
      if (!authUserAdmin) {
        return res.status(403).json({
          success: false,
          message: "User not allowed",
        });
      }

      // search user to remove
      const userToAdd = await User.findById(userId);
      if (!userToAdd) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }

      // remove from admin company
      const companyNew = [...company.admins];
      // search if user already in company
      const userAlreadyInCompany = companyNew.find(
        (admin) => admin.userId === userToAdd._id
      );
      if (!userAlreadyInCompany) {
        return res.status(400).json({
          success: false,
          message: "User not in company",
        });
      }

      // remove
      companyNew.splice(companyNew.indexOf(userAlreadyInCompany), 1);

      // update company
      await company.updateOne(
        {
          admins: companyNew,
        },
        { new: true }
      );

      return res.json({
        success: true,
        message: "Remove owner successfully",
        userId,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });

  // AUTHS
  route.get("/auth/company-linked", AuthJwtMiddleware, async (req, res) => {
    try {
      let authUser = await getUserByAuth(req);
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

      const company = await Company.findById(authUser.linkedCompanyId);
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
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
};
