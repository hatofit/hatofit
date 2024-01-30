import mongoose from "mongoose";
import { Company, Exercise } from ".";

const exerciseSeed = [
  {
    _id: "Walking",
    name: "Walking",
    description: "",
    difficulty: "",
    type: "",
    thumbnail:
      "https://apollohealthlib.blob.core.windows.net/health-library/2021/04/shutterstock_788590396-scaled.jpg",
    duration: 0,
    instructions: [],
  },
  {
    _id: "Running",
    name: "Running",
    description: "",
    difficulty: "",
    type: "",
    thumbnail:
      "https://apollohealthlib.blob.core.windows.net/health-library/2021/04/shutterstock_788590396-scaled.jpg",
    duration: 0,
    instructions: [],
  },
  {
    _id: "Cycling",
    name: "Cycling",
    description: "",
    difficulty: "",
    type: "",
    thumbnail:
      "https://runkeeper.com/cms/wp-content/uploads/sites/4/2022/12/Running-Image-12.jpg",
    duration: 0,
    instructions: [],
  },
  {
    _id: "Swimming",
    name: "Swimming",
    description: "",
    difficulty: "",
    type: "",
    thumbnail:
      "https://domf5oio6qrcr.cloudfront.net/medialibrary/9833/GettyImages-526245433.jpg",
    duration: 0,
    instructions: [],
  },
  {
    _id: "Other",
    name: "Other",
    description: "",
    difficulty: "",
    type: "",
    thumbnail:
      "https://assets-global.website-files.com/617b224ba2374548fcc039ba/617b224ba237453ce1c0409b_hpfulq-1234-1024x512.jpg",
    duration: 0,
    instructions: [],
  },
] as const;

const companySeed = [
  {
    _id: new mongoose.Types.ObjectId("65b8b28bb68956c7d206a02a").toHexString(),
    name: "Apollo",
    meta: {
      description: "Apollo is a health company that helps people to be healthy",
      address: "St.Cruzz, Nepal",
    },
    admins: [
      {
        userId: "admin",
        role: "admin",
        isCreated: true,
      },
    ],
  },
] as const;

export const seed = async () => {
  // await Exercise.deleteMany({});
  // await Company.deleteMany({});
  // await User.deleteMany({});
  // await Session.deleteMany({});
  // await ReportShare.deleteMany({});
  // (await GridStorage()).drop();
  for (var exercise of exerciseSeed) {
    const exist = await Exercise.findById(exercise._id);
    if (exist) {
      await Exercise.updateOne({ _id: exercise._id }, exercise);
    } else {
      await Exercise.create(exercise);
    }
  }

  for (var company of companySeed) {
    const exist = await Company.findById(company._id);
    if (exist) {
      await Company.updateOne({ _id: company._id }, company);
    } else {
      await Company.create(company);
    }
  }
};
