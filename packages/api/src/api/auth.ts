import bcrypt from "bcrypt";
import dayjs from "dayjs";
import dayjsutc from "dayjs/plugin/utc";
import express from "express";
import fs from "fs";
import jwt from "jsonwebtoken";
import mongoose from "mongoose";
import { getReportFromSession } from "../actions/report";
import { Session, User } from "../db";
import { AuthJwtMiddleware } from "../middlewares/auth";
import { GridStorage } from "../storage";
import { UserSchema } from "../types/user";
import { exceptObjectProp } from "../utils/obj";

dayjs.extend(dayjsutc);

// funcs
const findBmi = (
  weightUnits: string,
  heightUnits: string,
  userWeight: number,
  userHeight: number
) => {
  let bmi = 0;
  switch (weightUnits) {
    case "kg":
      switch (heightUnits) {
        case "cm":
          bmi = userWeight / ((userHeight / 100) * (userHeight / 100));
          break;
        case "ft":
          bmi = (userWeight / (userHeight * 12 * (userHeight * 12))) * 703;
          break;
      }
      break;

    case "lbs":
      switch (heightUnits) {
        case "cm":
          bmi = (userWeight / ((userHeight / 100) * (userHeight / 100))) * 703;
          break;
        case "ft":
          bmi = userWeight / (userHeight * 12 * (userHeight * 12));
          break;
      }
      break;
  }
  return bmi;
};

// routes
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

      if (user.photo) {
        let photoPath: string = req.body.photo.path.split("\\")[1];
        if (!photoPath) {
          photoPath = req.body.photo.path.split("/")[1];
        }
        const bucket = await GridStorage();
        const file = fs.createReadStream(`./uploads/${photoPath}`).pipe(
          bucket.openUploadStream(photoPath, {
            metadata: { contentType: "image/png" },
          })
        );
        user.photo = file.id;
      }

      // save to db
      const created = await User.create({
        ...user,
        _id: new mongoose.Types.ObjectId().toHexString(),
      });
      const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
      const token = jwt.sign({ id: created._id }, jwtSecret, {
        expiresIn: 7776000, // 90 days
      });
      // resposne
      return res.json({
        success: true,
        message: "User created successfully",
        user: exceptObjectProp(created.toObject(), ["password"]),
        token,
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
      const found = await User.findOneAndUpdate(
        {
          email: user.email,
        },
        {
          $set: {
            requetDelete: false,
            deleteDate: null,
          },
        }
      );

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
        expiresIn: 7776000, // 90 days
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

  route.put("/reset-password", async (req, res) => {
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
      const jwtSecret = process.env.JWT_SECRET_KEY || "polar";
      const token = jwt.sign({ id: updated?._id }, jwtSecret, {
        expiresIn: 7776000, // 90 days
      });
      // resposne
      return res.json({
        success: true,
        message: "Password updated",
        user: exceptObjectProp(updated?.toObject(), ["password"]),
        token,
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

      if (user.photo) {
        let photoPath: string = req.body.photo.path.split("\\")[1];
        if (!photoPath) {
          photoPath = req.body.photo.path.split("/")[1];
        }
        const bucket = await GridStorage();
        const file = fs.createReadStream(`./uploads/${photoPath}`).pipe(
          bucket.openUploadStream(photoPath, {
            metadata: { contentType: "image/png" },
          })
        );
        user.photo = file.id;
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

  // part of reports
  route.get("/dashboard", AuthJwtMiddleware, async (req, res) => {
    try {
      const user = req.auth?.user as any;

      // const
      const widgets = [
        {
          name: "BMI",
          handler: () => {
            const userWeight = user?.weight;
            const userHeight = user?.height;
            const weightUnits = user?.metricUnits?.weightUnits;
            const heightUnits = user?.metricUnits?.heightUnits;

            const bmi = findBmi(
              weightUnits,
              heightUnits,
              userWeight,
              userHeight
            );

            return `${bmi.toFixed(2)}`;
          },
        },
        {
          name: "BMI Status",
          handler: () => {
            const userWeight = user?.weight;
            const userHeight = user?.height;
            const weightUnits = user?.metricUnits?.weightUnits;
            const heightUnits = user?.metricUnits?.heightUnits;
            const bmi = findBmi(
              weightUnits,
              heightUnits,
              userWeight,
              userHeight
            );
            let status = "";
            if (bmi < 18.5) {
              status = "Underweight";
            } else if (bmi >= 18.5 && bmi <= 24.9) {
              status = "Normal";
            } else if (bmi >= 25 && bmi <= 29.9) {
              status = "Overweight";
            } else if (bmi >= 30 && bmi <= 34.9) {
              status = "Obesity";
            } else {
              status = "Unknown";
            }
            return `${status}`;
          },
        },
        {
          name: "Calories",
          handler: async () => {
            const findAvgHr = (data: any) => {
              // format data is [second, hrvalue]
              let sum = 0;
              let count = 0;
              for (const item of data || []) {
                sum += item[1];
                count += 1;
              }
              return Math.round(sum / count);
            };

            const findCal = (report: any) => {
              // prepare variables
              const startTime = dayjs.utc(report?.startTime).local();
              const endTime = dayjs.utc(report?.endTime).local();
              const diffTime = endTime.diff(startTime, "second");
              const avgHr = findAvgHr(
                report?.reports?.find((report: any) => report?.type === "hr")
                  ?.data[0]?.value || []
              );
              const secToMin = diffTime / 60;

              const weightUnits = user?.metricUnits?.weightUnits;
              const energyUnits = user?.metricUnits?.energyUnits;
              const userWeight = user?.weight;
              const userHeight = user?.height;
              const userGender = user?.gender;
              const age = dayjs().diff(dayjs(user?.dateOfBirth), "year");

              // calculate calories
              let calories = 0;
              switch (userGender) {
                case "male":
                  if (weightUnits == "kg") {
                    calories =
                      (secToMin *
                        (0.6309 * avgHr +
                          0.1988 * userWeight +
                          0.2017 * age -
                          55.0969)) /
                      4.184;
                  } else if (weightUnits == "lbs") {
                    let weightInKg = userWeight * 0.453592;
                    calories =
                      (secToMin *
                        (0.6309 * avgHr +
                          0.1988 * weightInKg +
                          0.2017 * age -
                          55.0969)) /
                      4.184;
                  }
                  break;

                case "female":
                  if (weightUnits == "kg") {
                    calories =
                      (secToMin *
                        (0.4472 * avgHr -
                          0.1263 * userWeight +
                          0.074 * age -
                          20.4022)) /
                      4.184;
                  } else if (weightUnits == "lbs") {
                    let weightInKg = userWeight * 0.453592;
                    calories =
                      (secToMin *
                        (0.4472 * avgHr -
                          0.1263 * weightInKg +
                          0.074 * age -
                          20.4022)) /
                      4.184;
                  }
                  break;

                default:
                  calories = 0;
                  break;
              }
              if (energyUnits == "kcal") {
                return calories;
              } else if (energyUnits == "kJ") {
                return calories * 4.184;
              }

              return calories;
            };

            // get all session
            const sessions = await Session.find({
              userId: user._id,
            });

            //
            let cal = 0;
            for (const session of sessions) {
              try {
                cal += findCal(await getReportFromSession(session));
              } catch (error) {}
            }

            return `${cal.toFixed(2)} Cal`;
          },
        },
      ];

      const widgets_result: any[] = [];
      for (const r of widgets) {
        try {
          widgets_result.push({
            ...r,
            value: await r.handler(),
          });
        } catch (error) {}
      }

      return res.json({
        success: true,
        message: "get data dashboard successfully",
        widgets: widgets_result,
      });
    } catch (error) {
      console.error(error);
      return res.status(500).json({ error });
    }
  });
  route.delete("/delete", AuthJwtMiddleware, async (req, res) => {
    console.log("DATA BODY", req.body);
    try {
      // schedule deletion in 2 weeks from now
      const user = req.auth?.user as any;
      const deleteAt = dayjs().add(2, "week").toDate();
      const updated = await User.findOneAndUpdate(
        {
          _id: user._id,
        },
        {
          $set: {
            deleteAt,
            requestDelete: true,
          },
        },
        {
          new: true,
        }
      );

      return res.json({
        success: true,
        message: "User will be deleted in 2 weeks",
        user: exceptObjectProp(updated?.toObject(), ["password"]),
      });

      // find user based user session
      // const found = await User.findOne({
      //   _id: req.auth?.user?._id,
      // });
      // // user deletion
      // await User.findOneAndDelete({
      //   _id: found?._id,
      // });
      // // check if user photo is not empty string or length must same as object id length
      // if (found?.photo && found?.photo.length >= 24) {
      //   const bucket = await GridStorage();
      //   await bucket.delete(new mongoose.Types.ObjectId(found?.photo));
      // }
      // return res.json({
      //   success: true,
      //   message: "User deleted successfully",
      //   user: exceptObjectProp(found?.toObject(), ["password"]),
      // });
    } catch (error) {
      // console.error(error)
      return res.status(400).json({ error });
    }
  });
};
