import { Exercise } from ".";

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
];

export const seed = async () => {
  for (var exercise of exerciseSeed) {
    const exist = await Exercise.findById(exercise._id);
    if (exist) {
      await Exercise.updateOne({ _id: exercise._id }, exercise);
    } else {
      await Exercise.create(exercise);
    }
  }
};
