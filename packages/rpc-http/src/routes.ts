import type { Context } from "@/foundation/context";
import bcrypt from "bcrypt";
import dayjs from "dayjs";
import dayjsutc from "dayjs/plugin/utc";
import express, { type Express } from "express";
import jwt from "jsonwebtoken";
dayjs.extend(dayjsutc);

import { AuthRegisterFormDataSchema, AuthRegisterSchema } from "@/schemas/user";
import { Company, CompanyUser, User } from "@/services/postgres";
import { validateWithZod } from "@/utils/zod";
import mongoose from "mongoose";
import { CreateCompanySchema, CreateExerciseSchema } from "./schemas/company";
import { ExerciseSchema } from "./schemas/exercise";
import { SessionSchema } from "./schemas/session";
import { getConfigService } from "./services/config";
import { getMailService } from "./services/mail";
import { getMinioService } from "./services/minio";
import { CompanyExercise, Exercise, Session } from "./services/mongo";
import { exceptObjectProp } from "./utils/obj";
import { getReportFromSession } from "./utils/report";

// middlewares
// export type RequestAuth =
export interface RequestAuth {
  //   user: {
  //     _id: string
  //     email: string
  //   }
  user: User;
  token: string;
}
declare global {
  namespace Express {
    interface Request {
      auth: RequestAuth;
    }
  }
}
export const parseAuthFromRequest = async (
  req: any
): Promise<
  [
    boolean,
    { user: User; token: string } | undefined,
    string | undefined,
    string | undefined
  ]
> => {
  let token: string | undefined = undefined;
  if (req.headers["authorization"] as string) {
    token = (req.headers["authorization"] as string).split(" ")[1];
  } else if (req.query.token) {
    token = req.query.token as string;
  }

  if (!token) return [false, undefined, "Unauthorized", "auth.unauthorized"];
  // if (!token) {
  //   return res.status(401).json({
  //     success: false,
  //     message: 'Unauthorized',
  //     errorCode: 'auth.unauthorized'
  //   })
  // }

  try {
    const config = getConfigService().getAll();
    const jwtSecret = config.JWT_SECRET_KEY || "polar";
    const decoded = jwt.verify(token, jwtSecret) as any;
    const found = await User.findOne({ where: { _id: decoded.id } });
    if (!found)
      return [false, undefined, "User not found", "auth.user_not_found"];
    // if (!found) {
    //   return res.status(404).json({
    //     success: false,
    //     message: 'User not found',
    //     errorCode: 'auth.user_not_found'
    //   })
    // }

    req.auth = {
      // user: exceptObjectProp(found.toJSON(), ['password']),
      user: found,
      token,
    } as RequestAuth;

    return [true, req.auth, undefined, undefined];
  } catch (error) {
    return [
      false,
      undefined,
      "Invalid token",
      "auth.unauthorized.invalid_token",
    ];
    // return res.status(400).json({
    //   success: false,
    //   message: 'Invalid token',
    //   errorCode: 'auth.unauthorized.invalid_token'
    // })
  }
};
export const AuthJwtMiddleware = async (req: any, res: any, next: any) => {
  // let token: string | undefined = undefined
  // if (req.headers['authorization'] as string) {
  //   token = (req.headers['authorization'] as string).split(' ')[1]
  // } else if (req.query.token) {
  //   token = req.query.token as string
  // }

  // if (!token) {
  //   return res.status(401).json({
  //     success: false,
  //     message: 'Unauthorized',
  //     errorCode: 'auth.unauthorized'
  //   })
  // }

  // try {
  //   const config = getConfigService().getAll()
  //   const jwtSecret = config.JWT_SECRET_KEY || 'polar'
  //   const decoded = jwt.verify(token, jwtSecret) as any
  //   const found = await User.findOne({ where: { _id: decoded.id } })
  //   if (!found) {
  //     return res.status(404).json({
  //       success: false,
  //       message: 'User not found',
  //       errorCode: 'auth.user_not_found'
  //     })
  //   }

  //   req.auth = {
  //     // user: exceptObjectProp(found.toJSON(), ['password']),
  //     user: found,
  //     token,
  //   } as RequestAuth

  //   next()

  // } catch (error) {
  //   return res.status(400).json({
  //     success: false,
  //     message: 'Invalid token',
  //     errorCode: 'auth.unauthorized.invalid_token'
  //   })
  // }

  const [success, parsed, error_msg, err_code] = await parseAuthFromRequest(
    req
  );
  if (!success) {
    return res.status(400).json({
      success: false,
      message: error_msg,
      errorCode: err_code,
    });
  } else {
    req.auth = parsed;
    next();
  }
};

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
const geneateUniqueStrCode256 = () => {
  const lengthChar = 256;
  const characters =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
  let result = "";
  for (let i = 0; i < lengthChar; i++) {
    result += characters.charAt(Math.floor(Math.random() * characters.length));
  }
  return result;
};

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

const findCal = (user: User, report: any) => {
  // prepare variables
  const startTime = dayjs.utc(report?.startTime).local();
  const endTime = dayjs.utc(report?.endTime).local();
  const diffTime = endTime.diff(startTime, "second");
  const avgHr = findAvgHr(
    report?.reports?.find((report: any) => report?.type === "hr")?.data[0]
      ?.value || []
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
            (0.6309 * avgHr + 0.1988 * userWeight + 0.2017 * age - 55.0969)) /
          4.184;
      } else if (weightUnits == "lbs") {
        let weightInKg = userWeight * 0.453592;
        calories =
          (secToMin *
            (0.6309 * avgHr + 0.1988 * weightInKg + 0.2017 * age - 55.0969)) /
          4.184;
      }
      break;

    case "female":
      if (weightUnits == "kg") {
        calories =
          (secToMin *
            (0.4472 * avgHr - 0.1263 * userWeight + 0.074 * age - 20.4022)) /
          4.184;
      } else if (weightUnits == "lbs") {
        let weightInKg = userWeight * 0.453592;
        calories =
          (secToMin *
            (0.4472 * avgHr - 0.1263 * weightInKg + 0.074 * age - 20.4022)) /
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
// routes
export default function (app: Express, ctx: Context) {
  const config = getConfigService(ctx).getAll();

  app.get("/", (req, res) => {
    return res.json({
      success: true,
      message: "🚀",
    });
  });

  // auth
  {
    const auth = express.Router();
    auth.post("/register", async (req, res) => {
      try {
        // reformat data
        if (req.body.dateOfBirth)
          req.body.dateOfBirth = dayjs(req.body.dateOfBirth).toDate();

        // check content type
        const isJSON =
          req.headers["content-type"]?.includes("application/json");

        // validate
        const { errors, data } = validateWithZod(
          isJSON ? AuthRegisterSchema : AuthRegisterFormDataSchema,
          req.body
        );
        if (errors) return res.status(400).json({ success: false, errors });
        if (data.password != data.confirmPassword)
          return res
            .status(400)
            .json({ success: false, errors: ["passwords do not match"] });

        // check in db
        const userInDb = await User.findOne({ where: { email: data.email } });
        if (userInDb) {
          return res.status(400).json({
            success: false,
            message: "Email already exists",
          });
        }

        // hash password
        const rawPlainPassword: string = (data.password || "") as string;
        // password
        const saltRounds = parseInt(config.HASH_PASSWORD_SALT || "10");
        const hasingPasssword = await new Promise<string>((res) => {
          bcrypt.hash(
            rawPlainPassword,
            saltRounds,
            function (err: any, hash: any) {
              return res(hash as string);
            }
          );
        });
        const photo = (data as any).photo;
        if (photo && typeof photo === "object") {
          const ext = photo.path.split(".").pop();
          const minioService = getMinioService(ctx);
          await minioService.uploadFile(
            "avatars",
            `${data.email}.${ext}`,
            photo.path,
            `image/${ext}`
          );
          const imageUrl = await minioService.getPresignedUrl(
            "avatars",
            `${data.email}.${ext}`
          );
          console.log("imageUrl", imageUrl);
          (data as any).photo = imageUrl.split("?")[0];
        }

        // insert
        const created = await User.create({
          firstName: data.firstName,
          lastName: data.lastName,
          email: data.email,
          password: hasingPasssword,
          dateOfBirth: data.dateOfBirth,
          gender: data.gender,
          height: data.height,
          weight: data.weight,
          metricUnits: {
            energyUnits: data.metricUnits?.energyUnits || "kj",
            weightUnits: data.metricUnits?.weightUnits || "kg",
            heightUnits: data.metricUnits?.heightUnits || "cm",
          },
          photo: (data as any).photo,
        });
        const jwtSecret = config.JWT_SECRET_KEY || "polar";
        const token = jwt.sign({ id: created._id }, jwtSecret, {
          expiresIn: 7776000, // 90 days
        });

        // return
        return res.json({
          success: true,
          message: "User created successfully",
          user: exceptObjectProp(created.toJSON(), ["password"]),
          token,
        });
      } catch (error) {
        console.error(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }

      return res.json({ success: false });
    });
    auth.post("/login", async (req, res) => {
      try {
        const { email, password } = req.body;
        console.log("login", email, password);
        if (!email || !password)
          return res
            .status(400)
            .json({ success: false, message: "Invalid email or password" });

        // find user
        const user = await User.findOne({ where: { email } });
        console.log("user", user?.email, user?.firstName);
        if (!user)
          return res
            .status(400)
            .json({ success: false, message: "User not found" });

        // compare password
        const match = await bcrypt.compare(password, user.password);
        console.log("match", match);
        if (!match)
          return res
            .status(400)
            .json({ success: false, message: "Invalid email or password" });

        // generate token
        const jwtSecret = config.JWT_SECRET_KEY || "polar";
        const token = jwt.sign({ id: user._id }, jwtSecret, {
          expiresIn: 7776000, // 90 days
        });

        // return
        return res.json({
          success: true,
          message: "User logged in successfully",
          user: exceptObjectProp(user.toJSON(), ["password"]),
          token,
        });
      } catch (error) {
        console.error(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }

      return res.json({ success: false });
    });
    auth.get("/me", AuthJwtMiddleware, (req, res) => {
      return res.json({
        success: true,
        message: "User found",
        auth: req.auth,
      });
    });
    auth.get("/dashboard", AuthJwtMiddleware, async (req, res) => {
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
              // get all session
              const sessions = await Session.find({
                userId: user._id,
                createdAt: {
                  $gte: dayjs().startOf("day").toDate(),
                  $lte: dayjs().endOf("day").toDate(),
                },
              });

              //
              let cal = 0;
              for (const session of sessions) {
                try {
                  cal += findCal(user, await getReportFromSession(session));
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
        console.log(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }
    });
    auth.delete("/delete", AuthJwtMiddleware, async (req, res) => {
      try {
        // schedule deletion in 2 weeks from now
        const user = req.auth?.user;
        const deleteAt = dayjs().add(2, "week").toDate();

        const updated = await user.update({
          deleteDate: deleteAt,
          requestDelete: true,
        });

        return res.json({
          success: true,
          message: "User will be deleted in 2 weeks",
          user: exceptObjectProp(updated.toJSON(), ["password"]),
        });
      } catch (error) {
        return res.status(400).json({ error });
      }
    });
    auth.post("/forgot-password/:email", async (req, res) => {
      try {
        const email = req.params.email || ("" as string);

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
          where: { email: email },
        });

        if (!found) {
          return res.status(404).json({
            success: false,
            message: "User not found",
          });
        }

        //  generate 6 digit code for reset password
        let code = Math.floor(100000 + Math.random() * 900000);

        // save to db
        const updated = await found.update({
          resetPasswordCode: `${code}`,
        });
        // const updated = await User.update(
        //   // {
        //   //   email: email,
        //   // },
        //   // {
        //   //   $set: {
        //   //     resetPasswordCode: code,
        //   //   },
        //   // },
        //   // {
        //   //   new: true,
        //   // }
        // );

        const mailOptions = {
          from: "HatoFit | No Reply <" + process.env.MAIL_USERNAME + ">",
          to: email,
          subject: "Forgot Password",
          text: "Forgot Password ",
          html:
            "<p> Forgot Password </p>" +
            "<p> Your otp for forgot password code is " +
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
        setTimeout(async () => {
          await found.update({
            resetPasswordCode: "",
          });
          // User.findOneAndUpdate(
          //   {
          //     email: email,
          //   },
          //   {
          //     $set: {
          //       resetPasswordCode: "",
          //     },
          //   },
          //   {
          //     new: true,
          //   }
          // );
        }, 300000);
      } catch (error) {
        // console.error(error)
        return res.status(400).json({ error });
      }
    });
    auth.post("/forgot-password-verify", async (req, res) => {
      try {
        const { email, code } = req.body;
        const found = await User.findOne({
          where: { email: email, resetPasswordCode: code },
        });
        if (!found) {
          return res.status(404).json({
            success: false,
            message: "User not found",
          });
        }
        return res.json({
          success: true,
          message: "Code is correct",
        });
      } catch (error) {
        // console.error(error)
        return res.status(400).json({ error });
      }
    });
    auth.post("/forgot-password-reset", async (req, res) => {
      try {
        const { email, code, password } = req.body;
        const found = await User.findOne({
          where: { email: email, resetPasswordCode: code },
        });
        if (!found) {
          return res.status(404).json({
            success: false,
            message: "User not found",
          });
        }
        // hash password
        const rawPlainPassword: string = (password || "") as string;
        // password
        const saltRounds = parseInt(config.HASH_PASSWORD_SALT || "10");
        const hasingPasssword = await new Promise<string>((res) => {
          bcrypt.hash(
            rawPlainPassword,
            saltRounds,
            function (err: any, hash: any) {
              return res(hash as string);
            }
          );
        });
        const updated = await found.update({
          password: hasingPasssword,
          resetPasswordCode: "",
        });
        return res.json({
          success: true,
          message: "Password reset successfully",
        });
      } catch (error) {
        // console.error(error)
        return res.status(400).json({ error });
      }
    });
    app.use("/auth", auth);
  }

  // user
  {
    const user = express.Router();
    user.delete("/request-delete", async (req, res) => {
      const { email, code } = req.body;

      if (email) {
        try {
          const user = await User.findOne({ where: { email } });
          if (!user) {
            return res.status(404).json({
              success: false,
              message: "User not found",
            });
          }
          if (user.deleteDate) {
            return res.status(400).json({
              success: false,
              message: "User already requested delete",
            });
          }
          // only process if user is not already requested, or already reqyest but in 3 minutes
          if (
            user.requestDelete &&
            dayjs().diff(dayjs(user.requestDeleteDate), "minute") < 3
          ) {
            return res.status(400).json({
              success: false,
              message:
                "User already requested, please wait 3 minute to request again",
            });
          }

          // code
          let codeStr = "";
          while (true) {
            codeStr = geneateUniqueStrCode256();
            const found = await User.findOne({
              where: { requestDeleteCode: codeStr },
            });
            if (!found) break;
          }
          if (!codeStr) {
            return res.status(500).json({
              success: false,
              message: "Internal server error",
            });
          }

          const nowDate = dayjs().toDate();
          const updated = await user.update({
            requestDelete: true,
            requestDeleteDate: nowDate,
            requestDeleteCode: codeStr,
          });

          const mailOptions = {
            from: "HatoFit | No Reply <" + config.MAIL_USERNAME + ">",
            to: email,
            subject: "Request Delete Account",
            text: "Request Delete Account",
            html:
              "<p> Your request delete account is " +
              `https://hatofit.com/user/request-delete?code=${codeStr}` +
              "</p>" +
              "<p> This link will be expired in 24 hours </p>" +
              "<p> If you did not request this, please ignore this email </p>",
          };

          const service = getMailService(ctx);
          service.transporter.sendMail(
            mailOptions,
            function (error: any, info: any) {
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
            }
          );

          return res.json({
            success: true,
            message: "User will be deleted in 2 weeks",
            user: exceptObjectProp(updated.toJSON(), ["password"]),
          });
        } catch (error) {
          console.log(error);
          return res
            .status(500)
            .json({ success: false, message: "Internal server error" });
        }
      } else if (code) {
        try {
          const user = await User.findOne({
            where: { requestDeleteCode: code },
          });
          if (!user) {
            return res.status(404).json({
              success: false,
              message: "User not found",
            });
          }
          if (user.deleteDate) {
            return res.status(400).json({
              success: false,
              message: "User already requested delete",
            });
          }

          // process delete
          const deleteAt = dayjs().add(2, "week").toDate();
          const updated = await user.update({
            deleteDate: deleteAt,
            requestDelete: true,
          });

          return res.json({
            success: true,
            message: "User will be deleted in 2 weeks",
          });
        } catch (error) {
          console.log(error);
          return res
            .status(500)
            .json({ success: false, message: "Internal server error" });
        }
      }
    });
    app.use("/user", user);
  }

  // exercise
  {
    const exercise = express.Router();
    exercise.post("/", async (req, res) => {
      try {
        // validate input
        const exercise = ExerciseSchema.parse(req.body);

        // save to db
        const created = await Exercise.create({
          ...exercise,
          _id: new mongoose.Types.ObjectId().toHexString(),
        });

        // resposne
        return res.json({
          success: true,
          message: "Exercise created successfully",
          id: created._id,
          exercise: {
            ...exercise,
            uuid: created._id,
          },
        });
      } catch (error) {
        console.log(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }
    });
    exercise.get("/", async (req, res) => {
      const exercises = await Exercise.find();
      return res.json({
        success: true,
        message: "Exercise found",
        exercises: exercises.map((item) => ({
          ...item.toObject(),
          uuid: item._id,
        })),
      });
    });
    app.use("/exercise", exercise);
  }

  // session
  {
    const session = express.Router();
    session.get("/", AuthJwtMiddleware, async (req, res) => {
      const sessions = (
        await Session.find({
          userId: req.auth?.user?._id,
        })
      ).map((item) => exceptObjectProp(item.toObject(), ["data"]));

      const companiesIds: string[] = sessions
        .map((item) => item.companyId)
        .filter((value, index, self) => self.indexOf(value) === index)
        .filter((item) => item) as string[];
      const companies = await Company.findAll({
        where: { _id: companiesIds },
      });

      for (const session of sessions) {
        if (session.companyId) {
          const company = companies.find(
            (item) => item._id === session.companyId
          );
          if (company) {
            session["company"] = company;
          }
        }
      }

      return res.json({
        success: true,
        message: "Sessions found",
        // sessions: exceptObjectProp(sessions, ["data"]),
        sessions: sessions.map((item) => ({
          ...item,
          uuid: item._id,
        })),
      });
    });
    session.post("/", AuthJwtMiddleware, async (req, res) => {
      try {
        // validate user
        const userId = req.auth?.user?._id;
        if (!userId || typeof userId !== "string" || userId.length === 0) {
          return res.json({
            success: false,
            message: "Invalid userId",
          });
        }

        // validate exercise
        const withoutExercise = req.body?.withoutExercise ?? false;
        const exerciseId = req.body?.exerciseId;
        const companyExerciseId = req.body?.companyExerciseId;

        if (withoutExercise !== true) {
          if (exerciseId || companyExerciseId) {
            if (exerciseId) {
              if (typeof exerciseId !== "string" || exerciseId.length === 0) {
                return res.json({
                  success: false,
                  message: "Invalid exerciseId",
                });
              }
            } else if (companyExerciseId) {
              if (
                typeof companyExerciseId !== "string" ||
                companyExerciseId.length === 0
              ) {
                return res.json({
                  success: false,
                  message: "Invalid companyExerciseId",
                });
              }
            } else {
              return res.json({
                success: false,
                message: "need exerciseId or companyExerciseId",
              });
            }
          } else {
            return res.json({
              success: false,
              message: "need exerciseId or companyExerciseId",
            });
          }
        }

        // validate input
        const session = SessionSchema.parse(req.body);

        // get
        // get exercise
        let exercise;
        let company;
        if (withoutExercise !== true) {
          if (exerciseId) {
            exercise = await Exercise.findById(exerciseId);
            if (!exercise) {
              return res.json({
                success: false,
                message: "Exercise not found",
              });
            }
          } else if (companyExerciseId) {
            exercise = await CompanyExercise.findById(companyExerciseId);
            if (!exercise) {
              return res.json({
                success: false,
                message: "Company Exercise not found",
              });
            }
            company = await Company.findOne({
              where: { _id: exercise.companyId as string },
            });
            if (!company) {
              return res.json({
                success: false,
                message: "Company not found",
              });
            }
          } else {
            return res.json({
              success: false,
              message: "Invalid exerciseId or companyExerciseId",
            });
          }
        }
        // get user
        const user = await User.findOne({ where: { _id: userId } });
        // const user = await User.findById(userId);
        if (!user) {
          return res.json({
            success: false,
            message: "User not found",
          });
        }

        // save to db
        const created = await Session.create({
          ...session,
          _id: new mongoose.Types.ObjectId().toHexString(),
          userId: user._id,
          exercise,
          withoutExercise,
          ...(company ? { companyId: company._id } : {}),
        });
        // response
        return res.json({
          success: true,
          message: "Session created successfully",
          id: created._id,
          session: {
            ...created,
            uuid: created._id,
          },
        });
      } catch (error) {
        console.log(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }
    });
    app.use("/session", session);
  }

  // report
  {
    const report = express.Router();
    report.get("/:id", async (req, res) => {
      try {
        const { id } = req.params;
        const session = await Session.findById(id);
        const user = await User.findOne({
          where: { _id: session?.userId || "" },
        });
        if (!session) {
          return res.status(404).json({
            success: false,
            message: "Session not found",
          });
        }

        const report = await getReportFromSession(session);

        return res.json({
          success: true,
          message: "Report generated",
          report,
          mood: session.mood,
          exercise: session.exercise,
          user: exceptObjectProp(user?.toJSON(), ["password"]),
        });
      } catch (error) {
        console.log(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }
    });
    app.use("/report", report);
  }

  // company
  const getIsAdmin = async (userId: number, company: Company) => {
    const found = await CompanyUser.findOne({
      where: { companyId: company.id, userId },
    });
    if (!found) return false;
    return found.role === "admin";
  };
  {
    const company = express.Router();
    company.get("/", AuthJwtMiddleware, async (req, res) => {
      const users = await CompanyUser.findAll({
        where: { userId: req.auth?.user?.id },
      });

      const compIds = users
        .map((item) => item.companyId)
        // remove duplicate
        .filter((value, index, self) => self.indexOf(value) === index);

      const companies = await Company.findAll({
        // where in
        where: { id: compIds },
      });

      return res.json({
        success: true,
        message: "Companies found",
        companies,
      });
    });
    company.get("/:id", async (req, res) => {
      const { id } = req.params;

      const company = await Company.findOne({
        where: {
          id,
        },
      });

      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }

      const [success, auth] = await parseAuthFromRequest(req);
      const isAdmin: boolean | undefined =
        auth && auth?.user?.id
          ? await getIsAdmin(auth.user.id, company)
          : undefined;

      return res.json({
        success: true,
        message: "Company found",
        company: { ...company.toJSON(), isAdmin },
      });
    });
    company.get("/:id/member", AuthJwtMiddleware, async (req, res) => {
      const { id } = req.params;
      const company = await Company.findOne({ where: { id } });
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }
      const users = await CompanyUser.findAll({
        where: { companyId: id },
        include: [
          {
            model: User,
            attributes: ["_id", "firstName", "lastName", "email", "createdAt"],
          },
        ],
        order: [["role", "ASC"]],
      });
      return res.json({
        success: true,
        message: "Company members found",
        members: users.map((item) => item),
      });
    });
    company.post("/", AuthJwtMiddleware, async (req, res) => {
      try {
        // validate
        const { ok, data, errors } = validateWithZod(
          CreateCompanySchema,
          req.body
        );
        if (!ok || !data)
          return res.status(400).json({ success: false, errors });

        // create
        const created = await Company.create({
          name: data.name,
          address: data.address,
          description: data.description,
        });

        // create company user
        await CompanyUser.create({
          companyId: created.id,
          userId: req.auth?.user?.id,
          role: "admin",
        });

        return res.json({
          success: true,
          message: "Company created successfully",
        });
      } catch (error) {
        console.log(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }
    });
    company.put("/:id", AuthJwtMiddleware, async (req, res) => {
      const { id } = req.params;
      const company = await Company.findOne({ where: { id } });
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }
      const { name, address, description } = req.body;
      const updated = await company.update({
        name,
        address,
        description,
      });
      return res.json({
        success: true,
        message: "Company updated successfully",
        company: updated,
      });
    });

    // user auth
    company.post("/join", AuthJwtMiddleware, async (req, res) => {
      let { code } = req.body as any;

      const company = await Company.findOne({ where: { _id: code } });
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }
      const found = await CompanyUser.findOne({
        where: { companyId: company.id, userId: req.auth?.user?.id },
      });
      if (found) {
        return res.status(400).json({
          success: false,
          message: "User already joined",
        });
      }

      // create company user
      await CompanyUser.create({
        companyId: company.id,
        userId: req.auth?.user?.id,
        role: "member",
      });

      return res.json({
        success: true,
        message: "User joined company successfully",
      });
    });
    company.delete("/leave", AuthJwtMiddleware, async (req, res) => {
      let { code } = req.body as any;
      // code = Number(code)

      const company = await Company.findOne({ where: { _id: code } });
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }
      const found = await CompanyUser.findOne({
        where: { companyId: company.id, userId: req.auth?.user?.id },
      });
      if (!found) {
        return res.status(400).json({
          success: false,
          message: "User not joined",
        });
      }

      // check if user is admin
      if (found.role === "admin") {
        return res.status(400).json({
          success: false,
          message: "Admin cannot leave company",
        });
      }

      // delete
      await found.destroy();

      return res.json({
        success: true,
        message: "User left company successfully",
      });
    });

    // manage - exercises
    company.get("/:id/exercise", AuthJwtMiddleware, async (req, res) => {
      const { id } = req.params;
      const company = await Company.findOne({ where: { id } });
      if (!company) {
        return res.status(404).json({
          success: false,
          message: "Company not found",
        });
      }
      const exercises = await CompanyExercise.find({
        where: { companyId: company._id },
      });

      return res.json({
        success: true,
        message: "Company exercises found",
        exercises,
      });
    });
    company.post("/:id/exercise", AuthJwtMiddleware, async (req, res) => {
      // validate
      const { ok, data, errors } = validateWithZod(
        CreateExerciseSchema,
        req.body
      );
      if (!ok || !data) return res.status(400).json({ success: false, errors });

      try {
        // company id
        const company = await Company.findOne({ where: { id: req.params.id } });
        if (!company) {
          return res.status(404).json({
            success: false,
            message: "Company not found",
          });
        }

        // create
        const created = await CompanyExercise.create({
          ...data,
          companyId: company._id,
          _id: new mongoose.Types.ObjectId().toHexString(),
        });

        return res.status(201).json({
          success: true,
          message: "Exercise created successfully",
          id: created._id,
          exercise: created,
        });
      } catch (error) {
        console.log(error);
        return res
          .status(500)
          .json({ success: false, message: "Internal server error" });
      }
    });
    company.put(
      "/:id/exercise/:exerciseId",
      AuthJwtMiddleware,
      async (req, res) => {
        const { ok, data, errors } = validateWithZod(
          CreateExerciseSchema,
          req.body
        );
        if (!ok || !data)
          return res.status(400).json({ success: false, errors });

        try {
          const { id, exerciseId } = req.params;
          const company = await Company.findOne({ where: { id } });
          if (!company) {
            return res.status(404).json({
              success: false,
              message: "Company not found",
            });
          }
          const exercise = await CompanyExercise.findOne({
            where: { companyId: company._id, _id: exerciseId },
          });
          if (!exercise) {
            return res.status(404).json({
              success: false,
              message: "Exercise not found",
            });
          }

          const updated = await CompanyExercise.updateOne(
            {
              companyId: company._id,
              _id: exerciseId,
            },
            {
              ...data,
            }
          );
          return res.json({
            success: true,
            message: "Exercise updated successfully",
            exercise: updated,
          });
        } catch (error) {
          console.log(error);
          return res
            .status(500)
            .json({ success: false, message: "Internal server error" });
        }
      }
    );
    company.get(
      "/:id/exercise/:exerciseId",
      AuthJwtMiddleware,
      async (req, res) => {
        const { id, exerciseId } = req.params;
        const company = await Company.findOne({ where: { id } });
        if (!company) {
          return res.status(404).json({
            success: false,
            message: "Company not found",
          });
        }
        const exercise = await CompanyExercise.findOne({
          where: { companyId: company._id, _id: exerciseId },
        });
        if (!exercise) {
          return res.status(404).json({
            success: false,
            message: "Exercise not found",
          });
        }

        const sessions = (
          await Session.find({
            companyId: company._id,
          })
        ).map((item) => exceptObjectProp(item.toObject(), ["data"]));

        // get all user ids, and dont duplicate
        const userIds = sessions
          .map((item) => item.userId)
          .filter((value, index, self) => self.indexOf(value) === index)
          .filter((item) => item) as string[];

        const users = await User.findAll({
          where: { _id: userIds },
        });

        const sessionsWithUser = sessions.map((item) => {
          const user = users.find((user) => user._id === item.userId);
          return {
            ...item,
            user: {
              _id: user?._id,
              firstName: user?.firstName,
              lastName: user?.lastName,
              email: user?.email,
            },
          };
        });

        return res.json({
          success: true,
          message: "Company exercises found",
          exercise,
          sessions: sessionsWithUser,
          userIds,
        });
      }
    );

    // manage - members
    company.put(
      "/:id/member/:userId/promote",
      AuthJwtMiddleware,
      async (req, res) => {
        const { id, userId } = req.params;

        try {
          const company = await Company.findOne({ where: { id } });
          if (!company) {
            return res.status(404).json({
              success: false,
              message: "Company not found",
            });
          }
          const user = await User.findOne({ where: { _id: userId } });
          if (!user) {
            return res.status(404).json({
              success: false,
              message: "User not found",
            });
          }

          console.log("promote", id, userId);
          const found = await CompanyUser.findOne({
            where: { companyId: company.id, userId: user.id },
          });
          if (!found) {
            return res.status(400).json({
              success: false,
              message: "User not joined",
            });
          }

          // check if user is admin
          if (found.role === "admin") {
            return res.status(400).json({
              success: false,
              message: "User already admin",
            });
          }

          // promote
          await found.update({
            role: "admin",
          });

          return res.json({
            success: true,
            message: "User promoted successfully",
          });
        } catch (error) {
          console.log(error);
          return res
            .status(500)
            .json({ success: false, message: "Internal server error" });
        }
      }
    );
    company.put(
      "/:id/member/:userId/demote",
      AuthJwtMiddleware,
      async (req, res) => {
        const { id, userId } = req.params;

        try {
          const company = await Company.findOne({ where: { id } });
          if (!company) {
            return res.status(404).json({
              success: false,
              message: "Company not found",
            });
          }
          const user = await User.findOne({ where: { _id: userId } });
          if (!user) {
            return res.status(404).json({
              success: false,
              message: "User not found",
            });
          }

          const found = await CompanyUser.findOne({
            where: { companyId: company.id, userId: user.id },
          });
          if (!found) {
            return res.status(400).json({
              success: false,
              message: "User not joined",
            });
          }

          // check if user is admin
          if (found.role !== "admin") {
            return res.status(400).json({
              success: false,
              message: "User not admin",
            });
          }

          // demote
          await found.update({
            role: "member",
          });

          return res.json({
            success: true,
            message: "User demoted successfully",
          });
        } catch (error) {
          console.log(error);
          return res
            .status(500)
            .json({ success: false, message: "Internal server error" });
        }
      }
    );
    company.delete(
      "/:id/member/:userId",
      AuthJwtMiddleware,
      async (req, res) => {
        const { id, userId } = req.params;

        const company = await Company.findOne({ where: { id } });
        if (!company) {
          return res.status(404).json({
            success: false,
            message: "Company not found",
          });
        }
        const user = await User.findOne({ where: { _id: userId } });
        if (!user) {
          return res.status(404).json({
            success: false,
            message: "User not found",
          });
        }

        const found = await CompanyUser.findOne({
          where: { companyId: company.id, userId: user._id },
        });
        if (!found) {
          return res.status(400).json({
            success: false,
            message: "User not joined",
          });
        }

        // check if user is admin
        if (found.role === "admin") {
          return res.status(400).json({
            success: false,
            message: "Admin cannot leave company",
          });
        }

        // delete
        await found.destroy();

        return res.json({
          success: true,
          message: "User left company successfully",
        });
      }
    );

    app.use("/company", company);
  }
}
