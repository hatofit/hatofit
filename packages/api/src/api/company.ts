import express, { IRouter } from "express";
import { z } from "zod";
import { Company, User } from "../db";
import { CompanySchema } from "../types/company";
import mongoose from "mongoose";
import { AuthJwtMiddleware } from "../middlewares/auth";
import { getUserByAuth } from "../utils/auth";

export const ApiCompany = ({ route }: { route: IRouter }) => {
  route.get('/company', async (req, res) => {
    const companies = await Company.find()
    return res.json({
      success: true,
      message: 'Companies found',
      companies,
    })
  })
  route.get('/company/create-by-me', AuthJwtMiddleware, async (req, res) => {
    try {
      const authUser = await getUserByAuth(req);
      if (!authUser) return res
        .status(401)
        .json({
          success: false,
          message: "User not found",
        });

      const companies = await Company.find({
        'admins.userId': authUser._id,
      })
      return res.json({
        success: true,
        message: 'Companies found',
        companies,
      })

      return companies
    } catch (error) {
      return res.status(400).json({ error })
    }
  })
  route.get('/company/:id', async (req, res) => {
    try {
      const { id } = req.params
      const company = await Company.findById(id)
      if (!company) {
        return res.status(404).json({
          success: false,
          message: 'Company not found',
        })
      }
      return res.json({
        success: true,
        message: 'Company found',
        company,
      })
    } catch (error) {
      console.error(error)
      return res.status(500).json({ error })
    }
  })
  route.post('/company', AuthJwtMiddleware, async (req, res) => {
    try {
      const authUser = await getUserByAuth(req);
      if (!authUser) return res
        .status(401)
        .json({
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
        admins: []
      })

      // save to db
      const created = await Company.create({
        ...company,
        _id: new mongoose.Types.ObjectId().toHexString(),
        admins: [
          {
            userId: authUser._id,
            role: 'owner',
            isCreated: true,
          }
        ],
      })

      // resposne
      return res.json({
        success: true,
        message: 'Company created successfully',
        id: created._id,
        company: created.toObject(),
      })
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error })
    }
  })
  route.post('/company/:id/link', AuthJwtMiddleware, async (req, res) => {
    try {
      let authUser = await getUserByAuth(req);
      if (!authUser) return res
        .status(401)
        .json({
          success: false,
          message: "User not found",
        });

      const { id } = req.params
      const company = await Company.findById(id)
      if (!company) {
        return res.status(404).json({
          success: false,
          message: 'Company not found',
        })
      }

      // update input
      await authUser.updateOne({
        linkedCompanyId: company._id,
      }, { new: true })

      // resposne
      return res.json({
        success: true,
        message: 'Company linked successfully',
        user: authUser.toObject(),
      })
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error })
    }
  })
  route.post('/company/unlink', AuthJwtMiddleware, async (req, res) => {
    try {
      const authUser = await getUserByAuth(req);
      if (!authUser) return res
        .status(401)
        .json({
          success: false,
          message: "User not found",
        });

      // update input
      await authUser.updateOne({
        linkedCompanyId: null,
      }, { new: true })

      // resposne
      return res.json({
        success: true,
        message: 'Company unlink successfully',
        user: authUser.toObject(),
      })
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error })
    }
  })
  route.get('/company/:id/members', async (req, res) => {
    try {
      const { id } = req.params
      const company = await Company.findById(id)
      if (!company) {
        return res.status(404).json({
          success: false,
          message: 'Company not found',
        })
      }

      const members = await User.find({
        linkedCompanyId: company._id,
      })
      return res.json({
        success: true,
        message: 'Members found',
        members,
      })
    } catch (error) {
      console.error(error)
      return res.status(500).json({ error })
    }
  })
  route.get('/auth/company-linked', AuthJwtMiddleware, async (req, res) => {
    try {
      let authUser = await getUserByAuth(req);
      if (!authUser) return res
        .status(401)
        .json({
          success: false,
          message: "User not found",
        });

      if (!authUser.linkedCompanyId) return res
        .json({
          success: true,
          message: "User not have linked company",
          user: authUser.toObject(),
        });

      const company = await Company.findById(authUser.linkedCompanyId)
      if (!company) {
        return res
          .json({
            success: true,
            message: "User not have linked company",
            user: authUser.toObject(),
          });
      }

      // resposne
      return res.json({
        success: true,
        message: 'User have linked company',
        user: authUser.toObject(),
        company,
      })
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error })
    }
  })
}
