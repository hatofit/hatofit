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
  route.get("/forgot-password", async (req, res) => {
    console.log("DATA BODY", req.body);

    const nodemailer = require("nodemailer");

    const transporter = nodemailer.createTransport({
      service: process.env.MAIL_SERVICE,
      auth: {
        user: process.env.MAIL_USERNAME,
        pass: process.env.MAIL_PASSWORD,
        // clientId: process.env.OAUTH_CLIENTID,
        // clientSecret: process.env.OAUTH_CLIENT_SECRET,
        // refreshToken: process.env.OAUTH_REFRESH_TOKEN,
      },
    });
    const found = await User.findOne({
      email: req.body.email,
    });

    if (!found) {
      return res.status(404).json({
        success: false,
        message: "User not found",
      });
    }

    // generate token
    const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
    const token = jwt.sign({ email: req.body.email }, jwtSecret, {
      expiresIn: 86400, // 1 month in seconds
    });

    const link =
      process.env.BASE_URL +
      "/api/auth/reset-password/" +
      found._id +
      "/" +
      token;

    const mailOptions = {
      from: "HatoFit | No Reply <" + process.env.MAIL_USERNAME + ">",
      to: req.body.email,
      subject: "Reset Password",
      text: "Reset Password ",
      html:
        "<p> Reset Password </p>  <br> <a href=" + link + ">Reset Password</a>",
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
  });

  // reset password using token from email
  route.post("/reset-password/:id/:token", async (req, res) => {
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

      // save to db
      const found = await User.findOne({
        _id: req.params.id,
      });
      console.log("ID", req.params.id);

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
          _id: req.params.id,
        },
        {
          $set: {
            password: req.body.password,
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
      // // validate input
      // const password = req.body.password || "";
      // // remove whitespace
      // if (password.trim() === "") {
      //   return res.status(400).json({
      //     success: false,
      //     message: "Password must not be empty",
      //   });
      // }
      // // input schema
      // const rawPlainPassword: string = req.body.password || ("" as string);
      // // password
      // const saltRounds = parseInt(process.env.HASH_PASSWORD_SALT || "10");
      // const hasingPasssword = await new Promise((res) => {
      //   bcrypt.hash(
      //     rawPlainPassword,
      //     saltRounds,
      //     function (err: any, hash: any) {
      //       return res(hash);
      //     }
      //   );
      // });
      // req.body.password = hasingPasssword;
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
        message: "User updated",
        user: exceptObjectProp(updated?.toObject(), ["password"]),
      });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
};
