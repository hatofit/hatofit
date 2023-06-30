"use client";
import { useState } from "react";
import { toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

export default function ExercisePost() {
  const [exerciseForm, setExerciseForm] = useState({
    name: "",
    description: "",
    difficulty: "beginner",
    type: "strength",
    thumbnail: "",
    instructions: [
      {
        type: "instruction",
        duration: 0,
        name: "",
        description: "",
        content: {
          video: "",
          image: "",
        },
      },
    ],
  });

  const [instructionTotal, setInstructionTotal] = useState(2);

  const postForm = async (e: React.FormEvent) => {
    e.preventDefault();

    const response = await fetch("http://localhost:3000/api/exercise", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(exerciseForm),

    });
    if (response.ok) {
      toast.success("Exercise data submitted successfully!");
    } else {
      toast.error("Failed to submit exercise data." + response.status);
    }
  };

  const renderInstructions = () => {

    return Array.from({ length: instructionTotal }).map((_, index) => {
     const isRest = exerciseForm.instructions[index]?.type === "rest";
      return (

        <div key={index} className={isRest ?  "bg-slate-100 " : "bg-white" }>
          <div className="flex flex-col m-2 p-2">
            <label htmlFor={`instructionType${index}`}>Instruction Type</label>
            <select
              className="border-2 border-gray-400 rounded-md p-2"
              name={`instructionType${index}`}
              id={`instructionType${index}`}
              value={exerciseForm.instructions[index]?.type || ""}
              required
              onChange={(event) =>
                setExerciseForm({
                  ...exerciseForm,
                  instructions: [
                    ...exerciseForm.instructions.slice(0, index),
                    {
                      ...exerciseForm.instructions[index],
                      type: event.target?.value ,
                    },
                    ...exerciseForm.instructions.slice(index + 1),
                  ],
                })

              }
            >
              <option value="instruction">Instruction</option>
              <option value="rest">Rest</option>
            </select>
          </div>

          {isRest && (
            <div className={isRest ?  "bg-slate-100 " : "bg-white" }>
              <div className="flex flex-col m-2 p-2">
              <label htmlFor={`instructionDuration${index}`}>
                Instruction Duration
              </label>
              <input
                className="border-2 border-gray-400 rounded-md p-2"
                type="number"
                name={`instructionDuration${index}`}
                id={`instructionDuration${index}`}
                value={exerciseForm.instructions[index]?.duration || ""}
                required
                onChange={(event) =>
                  setExerciseForm({
                    ...exerciseForm,
                    instructions: [
                      ...exerciseForm.instructions.slice(0, index),
                      {
                        ...exerciseForm.instructions[index],
                        duration: parseInt(event.target.value),
                      },
                      ...exerciseForm.instructions.slice(index + 1),
                    ],
                  })
                }
              />
          </div></div>
          )}

          {!isRest && (
            <div>
              <div className="flex flex-col m-2 p-2">
                <label htmlFor={`instructionDuration${index}`}>
                  Instruction Duration
                </label>
                <input
                  className="border-2 border-gray-400 rounded-md p-2"
                  type="number"
                  name={`instructionDuration${index}`}
                  id={`instructionDuration${index}`}
                  value={exerciseForm.instructions[index]?.duration || ""}
                  required
                  onChange={(event) =>
                    setExerciseForm({
                      ...exerciseForm,
                      instructions: [
                        ...exerciseForm.instructions.slice(0, index),
                        {
                          ...exerciseForm.instructions[index],
                          duration: parseInt(event.target.value),
                        },
                        ...exerciseForm.instructions.slice(index + 1),
                      ],
                    })

                  }
                />
              </div>
              <div className="flex flex-col m-2 p-2">
                <label htmlFor={`instructionName${index}`}>
                  Instruction Name
                </label>
                <input
                  className="border-2 border-gray-400 rounded-md p-2"
                  type="text"
                  name={`instructionName${index}`}
                  id={`instructionName${index}`}
                  value={exerciseForm.instructions[index]?.name || ""}
                  onChange={(event) =>

                    setExerciseForm({
                      ...exerciseForm,
                      instructions: [
                        ...exerciseForm.instructions.slice(0, index),
                        {
                          ...exerciseForm.instructions[index],
                          name: event.target.value,
                        },
                        ...exerciseForm.instructions.slice(index + 1),
                      ],
                    })

                  }
                />
              </div>
              <div className="flex flex-col m-2 p-2">
                <label htmlFor={`instructionDescription${index}`}>
                  Instruction Description
                </label>
                <textarea
                  className="border-2 border-gray-400 rounded-md p-2"
                  name={`instructionDescription${index}`}
                  id={`instructionDescription${index}`}
                  value={exerciseForm.instructions[index]?.description || ""}
                  onChange={(event) =>
                    setExerciseForm({
                      ...exerciseForm,
                      instructions: [
                        ...exerciseForm.instructions.slice(0, index),
                        {
                          ...exerciseForm.instructions[index],
                          description: event.target.value,
                        },
                        ...exerciseForm.instructions.slice(index + 1),
                      ],
                    })
                  }
                />
              </div>
              <div className="flex flex-col m-2 p-2">
                <label htmlFor={`instructionVideo${index}`}>
                  Instruction Video
                </label>
                <input
                  className="border-2 border-gray-400 rounded-md p-2"
                  placeholder="https://www.youtube.com/embed/..."
                  name={`instructionVideo${index}`}
                  id={`instructionVideo${index}`}
                  value={exerciseForm.instructions[index]?.content?.video || ""}
                  onChange={(event) =>
                    setExerciseForm({
                      ...exerciseForm,
                      instructions: [
                        ...exerciseForm.instructions.slice(0, index),
                        {
                          ...exerciseForm.instructions[index],
                          content: {
                            ...exerciseForm.instructions[index].content,
                            video: event.target.value,
                          },
                        },
                        ...exerciseForm.instructions.slice(index + 1),
                      ],
                    })
                  }
                />
              </div>
              <div className="flex flex-col m-2 p-2">
                <label htmlFor={`instructionImage${index}`}>
                  Instruction Image
                </label>
                <input
                  className="border-2 border-gray-400 rounded-md p-2"
                  placeholder="https://www.example.com/image.jpg"
                  name={`instructionImage${index}`}
                  id={`instructionImage${index}`}
                  value={exerciseForm.instructions[index]?.content?.image || ""}
                  onChange={(event) =>

                    setExerciseForm({
                      ...exerciseForm,
                      instructions: [
                        ...exerciseForm.instructions.slice(0, index),
                        {
                          ...exerciseForm.instructions[index],
                          content: {
                            ...exerciseForm.instructions[index].content,
                            image: event.target.value,
                          },
                        },
                        ...exerciseForm.instructions.slice(index + 1),
                      ],
                    })
                  }
                />
              </div>
            </div>
          )}
        </div>
      );
    });
  };


  return (
    <div className="m-2 p-2 max-w-5xl mx-auto">
      <h1 className="font-bold text-2xl text-left">Exercise</h1>
      <form onSubmit={postForm}>
        <div className="flex flex-col m-2 p-2">
          <label htmlFor="name">Exercise Name</label>
          <input
            className="border-2 border-gray-400 rounded-md p-2"
            type="text"
            name="exerciseName"
            id="exerciseName"
            value={exerciseForm.name}
            minLength={4}
            required
            onChange={(event) =>
              setExerciseForm({
                ...exerciseForm,
                name: event.target.value,
              })
            }
          />
        </div>
        <div className="flex flex-col m-2 p-2">
          <label htmlFor="description">Exercise Description</label>
          <textarea
            className="border-2 border-gray-400 rounded-md p-2"
            name="exerciseDescription"
            id="exerciseDescription"
            value={exerciseForm.description}
            minLength={4}
            required
            onChange={(event) =>
              setExerciseForm({
                ...exerciseForm,
                description: event.target.value,
              })
            }
          />
        </div>
        <div className="flex flex-col m-2 p-2">
          <label htmlFor="difficulty">Exercise Difficulty</label>
          <select
            className="border-2 border-gray-400 rounded-md p-2"
            name="exerciseDifficulty"
            id="exerciseDifficulty"
            value={exerciseForm.difficulty}
            required
            onChange={(event) =>
              setExerciseForm({
                ...exerciseForm,
                difficulty: event.target.value,
              })
            }
          >
            <option value="beginner">Beginner</option>
            <option value="intermediate">Intermediate</option>
            <option value="advanced">Advanced</option>
          </select>
        </div>
        <div className="flex flex-col m-2 p-2">
          <label htmlFor="type">Exercise Type</label>
          <select
            className="border-2 border-gray-400 rounded-md p-2"
            name="exerciseType"
            id="exerciseType"
            value={exerciseForm.type}
            required
            onChange={(event) =>
              setExerciseForm({
                ...exerciseForm,
                type: event.target.value,
              })
            }
          >
            <option value="strength">Strength</option>
            <option value="cardio">Cardio</option>
            <option value="stretching">Stretching</option>
          </select>
        </div>
        <div className="flex flex-col m-2 p-2">
          <label htmlFor="equipment">Exercise Thumbnail</label>
          <input
            className="border-2 border-gray-400 rounded-md p-2"
            type="text"
            name="exerciseThumbnail"
            id="exerciseThumbnail"
            value={exerciseForm.thumbnail}
            required
            minLength={10}
            onChange={(event) =>
              setExerciseForm({
                ...exerciseForm,
                thumbnail: event.target.value,
              })
            }
          />
        </div>
        <h1 className="font-bold text-2xl text-left mt-10">Instructions</h1>
        <div className="flex flex-col m-2 p-2">
          <label htmlFor="instructionTotal">Instruction Total</label>
          <input
            className="border-2 border-gray-400 rounded-md p-2"
            type="number"
            name="instructionTotal"
            id="instructionTotal"
            value={instructionTotal}
            required
            step={2}
            onChange={(event) =>
              setInstructionTotal(parseInt(event.target.value))
            }
          />
        </div>

        {renderInstructions()}
        <button
          className="bg-blue-500 w-full m-2 p-2 hover:bg-blue-700 text-white font-bold rounded"
          type="submit"
        >
          Submit
        </button>
      </form>
      <ToastContainer />
    </div>
  );
}
