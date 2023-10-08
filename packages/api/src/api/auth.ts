import bcrypt from "bcrypt";
import dayjs from "dayjs";
import express from "express";
import jwt from "jsonwebtoken";
import mongoose from "mongoose";
import { User } from "../db";
import { AuthJwtMiddleware } from "../middlewares/auth";
import { UserSchema } from "../types/user";
import { exceptObjectProp } from "../utils/obj";

export const ApiAuth = ({ route }: { route: express.Router }) => {
  route.post("/register", async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate input
      const password = req.body.password || "";
      const confirmPassword = req.body.confirmPassword || "";
      if (password !== confirmPassword) {
        return res.status(400).json({
          success: false,
          message: "Password and confirm password do not match",
        });
      }
      // check poassword must filled
      // remove whitespace
      if (password.trim() === "") {
        return res.status(400).json({
          success: false,
          message: "Password must not be empty",
        });
      }

      // input schema
      const rawPlainPassword: string = req.body.password || ("" as string);
      // password
      const saltRounds = parseInt(process.env.HASH_PASSWORD_SALT || "10");
      const hasingPasssword = await new Promise((res) => {
        bcrypt.hash(
          rawPlainPassword,
          saltRounds,
          function (err: any, hash: any) {
            return res(hash);
          }
        );
      });
      req.body.password = hasingPasssword;
      // dateOfBirth
      const dateOfBirth = req.body.dateOfBirth || "";
      req.body.dateOfBirth = dayjs(dateOfBirth, "mm/dd/yyyy").toDate();
      const user = UserSchema.parse(req.body);

      // check in db
      const userInDb = await User.findOne({
        email: user.email,
      });
      if (userInDb) {
        return res.status(400).json({
          success: false,
          message: "Email already exists",
        });
      }

      console.log("USER", user);

      // save to db
      const created = await User.create({
        ...user,
        _id: new mongoose.Types.ObjectId().toHexString(),
      });

      // resposne
      return res.json({
        success: true,
        message: "User created successfully",
        id: created._id,
        user: exceptObjectProp(created.toObject(), ["password"]),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.post("/login", async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate input
      const user = req.body as any;
      console.log("USER", user);

      // save to db
      const found = await User.findOne({
        email: user.email,
      });

      // resposne
      if (!found) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }
      const isMatch = await new Promise((res) => {
        bcrypt.compare(
          user.password,
          found.password || "",
          function (err: any, result: any) {
            return res(result);
          }
        );
      });
      if (!isMatch) {
        return res.status(401).json({
          success: false,
          message: "Password is incorrect",
        });
      }

      // generate token
      const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
      const token = jwt.sign({ id: found._id }, jwtSecret, {
        expiresIn: 86400, // 1 month in seconds
      });

      return res.json({
        success: true,
        message: "User found",
        user: exceptObjectProp(found.toObject(), ["password"]),
        token,
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  route.get("/me", AuthJwtMiddleware, async (req, res) => {
    return res.json({
      success: true,
      message: "User found",
      auth: req.auth,
    });
  });

  // send email to reset password using nodemailer
  route.get("/forgot-password/:email", async (req, res) => {
    try {
      const email = req.params.email;

      const nodemailer = require("nodemailer");
      const transporter = nodemailer.createTransport({
        service: "gmail",
        host: "smtp.gmail.com",
        port: 587,
        secure: false,
        auth: {
          user: process.env.MAIL_USERNAME,
          pass: process.env.MAIL_PASSWORD,
        },
      });
      const found = await User.findOne({
        email: email,
      });

      if (!found) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }

      //  generate 6 digit code for reset password
      const code = Math.floor(100000 + Math.random() * 900000);

      // save to db
      const updated = await User.findOneAndUpdate(
        {
          email: email,
        },
        {
          $set: {
            resetPasswordCode: code,
          },
        },
        {
          new: true,
        }
      );

      const mailOptions = {
        from: "HatoFit | No Reply <" + process.env.MAIL_USERNAME + ">",
        to: email,
        subject: "Reset Password",
        text: "Reset Password ",
        html:
          "<p> Reset Password </p>" +
          "<p> Your reset password code is " +
          code +
          "</p>",
      };

      transporter.sendMail(mailOptions, function (error: any, info: any) {
        if (error) {
          console.log(error);
          return res.status(400).json({ error });
        } else {
          console.log("Email sent: " + info.response);
          return res.json({
            success: true,
            message: "Email sent",
          });
        }
      });
      // delete code after 5 minutes
      setTimeout(() => {
        User.findOneAndUpdate(
          {
            email: email,
          },
          {
            $set: {
              resetPasswordCode: "",
            },
          },
          {
            new: true,
          }
        );
      }, 300000);
      
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  
  route.post("/verify-code", async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate input
      const code = req.body.code || "";
      // remove whitespace
      if (code.trim() === "") {
        return res.status(400).json({
          success: false,
          message: "Code must not be empty",
        });
      }

      const userEmail = req.body.email || "";
      const found = await User.findOne({
        email: userEmail,
      });

      // resposne
      if (!found) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }
      console.log("FOUND", found);
      if (found.resetPasswordCode !== req.body.code) {
        return res.status(400).json({
          success: false,
          message: "OTP is incorrect",
        });
      }

      return res.json({
        success: true,
        message: "OTP is correct",
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });

  route.post("/reset-password", async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate input
      const password = req.body.password || "";
      const confirmPassword = req.body.confirmPassword || "";
      if (password !== confirmPassword) {
        return res.status(400).json({
          success: false,
          message: "Password and confirm password do not match",
        });
      }
      // check poassword must filled
      // remove whitespace
      if (password.trim() === "") {
        return res.status(400).json({
          success: false,
          message: "Password must not be empty",
        });
      }

      const userEmail = req.body.email || "";
      const found = await User.findOne({
        email: userEmail,
      });

      // resposne
      if (!found) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }
      console.log("FOUND", found);
      if (found.resetPasswordCode !== req.body.code) {
        return res.status(400).json({
          success: false,
          message: "OTP is incorrect",
        });
      }

      // input schema
      const rawPlainPassword: string = req.body.password || ("" as string);
      // password
      const saltRounds = parseInt(process.env.HASH_PASSWORD_SALT || "10");
      const hasingPasssword = await new Promise((res) => {
        bcrypt.hash(
          rawPlainPassword,
          saltRounds,
          function (err: any, hash: any) {
            return res(hash);
          }
        );
      });
      req.body.password = hasingPasssword;

      // update new password, remove resetPasswordCode
      const updated = await User.findOneAndUpdate(
        {
          email: userEmail,
        },
        {
          $set: {
            password: req.body.password,
            resetPasswordCode: "",
          },
        },
        {
          new: true,
        }
      );

      // resposne
      return res.json({
        success: true,
        message: "Password updated",
        user: exceptObjectProp(updated?.toObject(), ["password"]),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });

  // update user
  route.post("/update", AuthJwtMiddleware, async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // validate input
      const password = req.body.password || "";
      // remove whitespace
      if (password.trim() === "") {
        return res.status(400).json({
          success: false,
          message: "Password must not be empty",
        });
      }
      // check if password first 4 character isnt * then hash password
      if (password.substring(0, 4) !== "****") {
        // input schema
        const rawPlainPassword: string = req.body.password || ("" as string);
        // password
        const saltRounds = parseInt(process.env.HASH_PASSWORD_SALT || "10");
        const hasingPasssword = await new Promise((res) => {
          bcrypt.hash(
            rawPlainPassword,
            saltRounds,
            function (err: any, hash: any) {
              return res(hash);
            }
          );
        });
        req.body.password = hasingPasssword;
      } else {
        const user = await User.findOne({
          _id: req.auth?.user?._id,
        });
        req.body.password = user?.password;
      }
      // dateOfBirth
      const dateOfBirth = req.body.dateOfBirth || "";
      req.body.dateOfBirth = dayjs(dateOfBirth, "mm/dd/yyyy").toDate();
      const user = UserSchema.parse(req.body);

      // save to db
      const found = await User.findOne({
        _id: req.auth?.user?._id,
      });

      // resposne
      if (!found) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }

      // update
      const updated = await User.findOneAndUpdate(
        {
          _id: req.auth?.user?._id,
        },
        {
          $set: {
            ...user,
          },
        },
        {
          new: true,
        }
      );

      // resposne
      return res.json({
        success: true,
        message: "Profile updated successfully",
        user: exceptObjectProp(updated?.toObject(), ["password"]),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
  // update metric units , weight and height
  route.post("/update-metric", AuthJwtMiddleware, async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // save to db
      const found = await User.findOne({
        _id: req.auth?.user?._id,
      });

      // resposne
      if (!found) {
        return res.status(404).json({
          success: false,
          message: "User not found",
        });
      }

      // update
      const updated = await User.findOneAndUpdate(
        {
          _id: req.auth?.user?._id,
        },
        {
          $set: {
            ...req.body,
          },
        },
        {
          new: true,
        }
      );

      // resposne
      return res.json({
        success: true,
        message: "Metric updated successfully",
        user: exceptObjectProp(updated?.toObject(), ["password"]),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
};
