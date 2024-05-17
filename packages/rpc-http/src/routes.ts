import express, { type Express } from 'express'
import type { Context } from '@/foundation/context'
import bcrypt from 'bcrypt'
import jwt from 'jsonwebtoken'
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
dayjs.extend(dayjsutc)

import { User } from '@/services/postgres'
import { AuthRegisterSchema, UserSchema }  from '@/schemas/user'
import { validateWithZod } from '@/utils/zod'
import { getConfigService } from './services/config'
import { exceptObjectProp } from './utils/obj'
import { Exercise, Session } from './services/mongo'
import { getReportFromSession } from './utils/report'
import mongoose from 'mongoose'
import { SessionSchema } from './schemas/session'
import { ExerciseSchema } from './schemas/exercise'
import { getMailService } from './services/mail'


// middlewares
// export type RequestAuth = 
export interface RequestAuth {
//   user: {
//     _id: string
//     email: string
//   }
  user: User
  token: string
}
declare global {
  namespace Express {
    interface Request {
      auth: RequestAuth;
    }
  }
}
export const AuthJwtMiddleware = async (req: any, res: any, next: any) => {
  let token: string | undefined = undefined
  if (req.headers['authorization'] as string) {
    token = (req.headers['authorization'] as string).split(' ')[1]
  } else if (req.query.token) {
    token = req.query.token as string
  }

  if (!token) {
    return res.status(401).json({
      success: false,
      message: 'Unauthorized',
      errorCode: 'auth.unauthorized'
    })
  }

  try {
    const config = getConfigService().getAll()
    const jwtSecret = config.JWT_SECRET_KEY || 'polar'
    const decoded = jwt.verify(token, jwtSecret) as any
    const found = await User.findOne({ where: { _id: decoded.id } })
    if (!found) {
      return res.status(404).json({
        success: false,
        message: 'User not found',
        errorCode: 'auth.user_not_found'
      })
    }

    req.auth = {
      // user: exceptObjectProp(found.toJSON(), ['password']),
      user: found,
      token,
    } as RequestAuth

    next()

  } catch (error) {
    return res.status(400).json({
      success: false,
      message: 'Invalid token',
      errorCode: 'auth.unauthorized.invalid_token'
    })
  }
}

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
}
const geneateUniqueStrCode256 = () => {
  const lengthChar = 256
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
  let result = ''
  for (let i = 0; i < lengthChar; i++) {
    result += characters.charAt(Math.floor(Math.random() * characters.length))
  }
  return result
}
// routes
export default function (app: Express, ctx: Context) {
  const config = getConfigService(ctx).getAll()

  // auth
  {
    const auth = express.Router()
    auth.post('/register', async (req, res) => {
      try {

        // reformat data
        if (req.body.dateOfBirth) req.body.dateOfBirth = dayjs(req.body.dateOfBirth).toDate()

        // validate
        const { errors, data } = validateWithZod(AuthRegisterSchema, req.body)
        if (errors) return res.status(400).json({ success: false, errors })
        if (data.password != data.confirmPassword) return res.status(400).json({ success: false, errors: ['passwords do not match'] })
        
        // check in db
        const userInDb = await User.findOne({ where: { email: data.email } })
        if (userInDb) {
          return res.status(400).json({
            success: false,
            message: "Email already exists",
          })
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
              return res(hash as string)
            }
          )
        })

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
            energyUnits: data.metricUnits?.energyUnits || 'kj',
            weightUnits: data.metricUnits?.weightUnits || 'kg',
            heightUnits: data.metricUnits?.heightUnits || 'cm',
          },
        })
        const jwtSecret = config.JWT_SECRET_KEY || "polar"
        const token = jwt.sign({ id: created._id }, jwtSecret, {
          expiresIn: 7776000, // 90 days
        })
        
        // return
        return res.json({
          success: true,
          message: "User created successfully",
          user: exceptObjectProp(created.toJSON(), ["password"]),
          token,
        });
      } catch (error) {
        console.error(error);
        return res.status(500).json({ success: false, message: "Internal server error" });
      }

      return res.json({ success: false })
    })
    auth.post('/login', async (req, res) => {
      try {
        const { email, password } = req.body
        console.log('login', email, password)
        if (!email || !password) return res.status(400).json({ success: false, message: "Invalid email or password" })

        // find user
        const user = await User.findOne({ where: { email } })
        console.log('user', user?.email, user?.firstName)
        if (!user) return res.status(400).json({ success: false, message: "Invalid email or password" })

        // compare password
        const match = await bcrypt.compare(password, user.password)
        console.log('match', match)
        if (!match) return res.status(400).json({ success: false, message: "Invalid email or password" })

        // generate token
        const jwtSecret = config.JWT_SECRET_KEY || "polar"
        const token = jwt.sign({ id: user._id }, jwtSecret, {
          expiresIn: 7776000, // 90 days
        })

        // return
        return res.json({
          success: true,
          message: "User logged in successfully",
          user: exceptObjectProp(user.toJSON(), ["password"]),
          token,
        });
      } catch (error) {
        console.error(error)
        return res.status(500).json({ success: false, message: "Internal server error" });
      }

      return res.json({ success: false })
    })
    auth.get('/me', AuthJwtMiddleware, (req, res) => {
      return res.json({
        success: true,
        message: "User found",
        auth: req.auth,
      })
    })
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
        console.log(error)
        return res.status(500).json({ success: false, message: "Internal server error" })
      }
    })
    auth.delete("/delete", AuthJwtMiddleware, async (req, res) => {
      try {
        // schedule deletion in 2 weeks from now
        const user = req.auth?.user;
        const deleteAt = dayjs().add(2, "week").toDate();
        
        const updated = await user.update({
          deleteDate: deleteAt,
          requestDelete: true,
        })

        return res.json({
          success: true,
          message: "User will be deleted in 2 weeks",
          user: exceptObjectProp(updated.toJSON(), ["password"]),
        });
      } catch (error) {
        return res.status(400).json({ error });
      }
    })
    app.use('/auth', auth)
  }

  // user
  {
    const user = express.Router()
    user.delete("/request-delete", async (req, res) => {
      const { email, code } = req.body

      if (email) {
        try {
          const user = await User.findOne({ where: { email } })
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
          if (user.requestDelete && dayjs().diff(dayjs(user.requestDeleteDate), 'minute') < 3) {
            return res.status(400).json({
              success: false,
              message: "User already requested, please wait 3 minute to request again",
            });
          }

          // code
          let codeStr = ''
          while (true) {
            codeStr = geneateUniqueStrCode256()
            const found = await User.findOne({ where: { requestDeleteCode: codeStr } })
            if (!found) break
          }
          if (!codeStr) {
            return res.status(500).json({
              success: false,
              message: "Internal server error",
            });
          }
          
          const nowDate = dayjs().toDate()
          const updated = await user.update({
            requestDelete: true,
            requestDeleteDate: nowDate,
            requestDeleteCode: codeStr,
          })

          const mailOptions = {
            from: "HatoFit | No Reply <" + config.MAIL_USERNAME + ">",
            to: email,
            subject: "Request Delete Account",
            text: "Request Delete Account",
            html:
              "<p> Your request delete account is "
              + `https://hatofit.com/user/request-delete?code=${codeStr}`
              + "</p>"
              + "<p> This link will be expired in 24 hours </p>"
              + "<p> If you did not request this, please ignore this email </p>",
          };

          const service = getMailService(ctx)
          service.transporter.sendMail(mailOptions, function (error: any, info: any) {
            if (error) {
              console.log(error);
              return res.status(400).json({ error });
            } else {
              console.log("Email sent: " + info.response);
              return res.json({
                success: true,
                message: "Email sent",
              })
            }
          })

          return res.json({
            success: true,
            message: "User will be deleted in 2 weeks",
            user: exceptObjectProp(updated.toJSON(), ["password"]),
          });
        } catch (error) {
          console.log(error)
          return res.status(500).json({ success: false, message: "Internal server error" })
        }
      } else if (code) {
        try {
          const user = await User.findOne({ where: { requestDeleteCode: code } })
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
          })

          return res.json({
            success: true,
            message: "User will be deleted in 2 weeks",
          })
        } catch (error) {
          console.log(error)
          return res.status(500).json({ success: false, message: "Internal server error" })
        }
      }
    })
    app.use('/user', user)
  }

  // exercise
  {
    const exercise = express.Router()
    exercise.post("/", async (req, res) => {
      try {
        // validate input
        const exercise = ExerciseSchema.parse(req.body);

        // save to db
        const created = await Exercise.create({
          ...exercise,
          _id: new mongoose.Types.ObjectId().toHexString(),
        })

        // resposne
        return res.json({
          success: true,
          message: "Exercise created successfully",
          id: created._id,
          exercise,
        })
      } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: "Internal server error" })
      }
    })
    exercise.get("/", async (req, res) => {
      const exercises = await Exercise.find();
      return res.json({
        success: true,
        message: "Exercise found",
        exercises,
      })
    })
    app.use('/exercise', exercise)
  }

  // session
  {
    const session = express.Router()
    session.get("/", AuthJwtMiddleware, async (req, res) => {
      const sessions = await Session.find({
        userId: req.auth?.user?._id,
      });

      return res.json({
        success: true,
        message: "Sessions found",
        sessions,
      })
    })
    session.post('/', AuthJwtMiddleware, async (req, res) => {
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
        if (withoutExercise !== true) {
          if (
            !exerciseId ||
            typeof exerciseId !== "string" ||
            exerciseId.length === 0
          ) {
            return res.json({
              success: false,
              message: "Invalid exerciseId",
            });
          }
        }
        // validate input
        const session = SessionSchema.parse(req.body);

        // get
        // get exercise
        let exercise;
        if (withoutExercise !== true) {
          exercise = await Exercise.findById(exerciseId);
          if (!exercise) {
            return res.json({
              success: false,
              message: "Exercise not found",
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
        });
        // response
        return res.json({
          success: true,
          message: "Session created successfully",
          id: created._id,
          session: created,
        });
      } catch (error) {
        console.log(error)
        return res.status(500).json({ success: false, message: "Internal server error" });
      }
    })
    app.use('/session', session)
  }

  // report
  {
    const report = express.Router()
    report.get("/:id", async (req, res) => {
      try {
        const { id } = req.params;
        const session = await Session.findById(id);
        const user = await User.findOne({ where: { _id: session?.userId || '' } });
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
        console.log(error)
        return res.status(500).json({ success: false, message: "Internal server error" })
      }
    })
    app.use('/report', report)
  }
}