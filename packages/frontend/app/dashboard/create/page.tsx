"use client";
import React, { useState } from "react";
import { Exercise, createExercise } from "@/lib/api";
import Link from "next/link";

export default function CreateExercise() {
  const [totalInstructions, setTotalInstructions] = useState(0);
  const [exercise, setExercise] = useState<Exercise>({
    name: "",
    description: "",
    difficulty: "",
    type: "",
    thumbnail: "",
    duration: 0,
    instructions: [],
  });

  const sumInstructionsDuration = () => {
    let sum = 0;
    exercise.instructions.forEach((element) => {
      console.log(element.duration);
      if (element.duration) {
        sum += element.duration;
      }
    });
    if (exercise && sum === exercise.duration) {
      createExercise(exercise).then((res) => {
        if (res.error) {
          console.log(res.error);
          console.error("Error creating exercise");
        } else {
          window.location.href = "/dashboard";
        }
      });
    } else {
      console.error("Exercise is null");
    }
    setExercise({ ...exercise, duration: sum });
  };

  const renderInstructions = () => {
    return Array.from({ length: totalInstructions }).map((_, index) => {
      return (
        <tr key={index}>
          <td className="border border-gray-400 p-2">
            <select
              className="input input-bordered w-full"
              value={exercise.instructions[index]?.type || ""}
              required
              onChange={(event) =>
                setExercise((prevExercise) => {
                  const updatedInstructions = [...prevExercise.instructions];
                  updatedInstructions[index] = {
                    ...updatedInstructions[index],
                    type: event.target.value,
                  };
                  return {
                    ...prevExercise,
                    instructions: updatedInstructions,
                  };
                })
              }
            >
              <option value="">Select Instruction Typr</option>
              <option value="instruction">Instruction</option>
              <option value="rest">Rest</option>
            </select>
          </td>
          <td className="border border-gray-400 p-2">
            <input
              type="number"
              className="input input-bordered w-full"
              placeholder="Instruction Duration"
              value={exercise.instructions[index]?.duration || ""}
              required
              min={0}
              onChange={(event) =>
                setExercise((prevExercise) => {
                  const updatedInstructions = [...prevExercise.instructions];
                  updatedInstructions[index] = {
                    ...updatedInstructions[index],
                    duration: parseInt(event.target.value),
                  };
                  return {
                    ...prevExercise,
                    instructions: updatedInstructions,
                  };
                })
              }
            />
          </td>
          {exercise.instructions[index]?.type === "rest" ? (
            <></>
          ) : (
            <>
              <td className="border border-gray-400 p-2">
                <input
                  type="text"
                  className="input input-bordered w-full"
                  placeholder="Instruction Name"
                  value={exercise.instructions[index]?.name || ""}
                  minLength={3}
                  onChange={(event) =>
                    setExercise((prevExercise) => {
                      const updatedInstructions = [
                        ...prevExercise.instructions,
                      ];
                      updatedInstructions[index] = {
                        ...updatedInstructions[index],
                        name: event.target.value,
                      };
                      return {
                        ...prevExercise,
                        instructions: updatedInstructions,
                      };
                    })
                  }
                />
              </td>
              <td className="border border-gray-400 p-2">
                <textarea
                  className="input input-bordered w-full"
                  placeholder="Instruction Description"
                  value={exercise.instructions[index]?.description || ""}
                  minLength={3}
                  onChange={(event) =>
                    setExercise((prevExercise) => {
                      const updatedInstructions = [
                        ...prevExercise.instructions,
                      ];
                      updatedInstructions[index] = {
                        ...updatedInstructions[index],
                        description: event.target.value,
                      };
                      return {
                        ...prevExercise,
                        instructions: updatedInstructions,
                      };
                    })
                  }
                />
              </td>
              <td className="border border-gray-400 p-2">
                <input
                  type="text"
                  className="input input-bordered w-full"
                  placeholder="Instruction Video"
                  value={exercise.instructions[index]?.content?.video || ""}
                  onChange={(event) =>
                    setExercise((prevExercise) => {
                      const updatedInstructions = [
                        ...prevExercise.instructions,
                      ];
                      updatedInstructions[index] = {
                        ...updatedInstructions[index],
                        content: {
                          ...updatedInstructions[index]?.content,
                          video: event.target.value,
                        },
                      };
                      return {
                        ...prevExercise,
                        instructions: updatedInstructions,
                      };
                    })
                  }
                />
              </td>
              <td className="border border-gray-400 p-2">
                <input
                  type="text"
                  className="input input-bordered w-full"
                  placeholder="Instruction Image"
                  value={exercise.instructions[index]?.content?.image || ""}
                  onChange={(event) =>
                    setExercise((prevExercise) => {
                      const updatedInstructions = [
                        ...prevExercise.instructions,
                      ];
                      updatedInstructions[index] = {
                        ...updatedInstructions[index],
                        content: {
                          ...updatedInstructions[index]?.content,
                          image: event.target.value,
                        },
                      };
                      return {
                        ...prevExercise,
                        instructions: updatedInstructions,
                      };
                    })
                  }
                />
              </td>
            </>
          )}
        </tr>
      );
    });
  };

  return (
    <div className="mx-auto">
      <h1 className="text-5xl font-bold text-center">Add Exercise</h1>
      <div>
        <div className="border rounded p-4">
          <div className="flex">
            <div className="w-1/4 p-4">
              {/* Left column */}
              <div className="mb-4">
                <label htmlFor="exerciseName" className="label">
                  Exercise Name
                </label>
                <input
                  type="text"
                  id="exerciseName"
                  className="input input-bordered w-full"
                  placeholder="Exercise Name"
                  value={exercise.name}
                  minLength={3}
                  required
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise,
                      name: e.target.value,
                    }))
                  }
                />
              </div>

              <div className="mb-4">
                <label htmlFor="exerciseDescription" className="label">
                  Exercise Description
                </label>
                <textarea
                  id="exerciseDescription"
                  className="input input-bordered w-full"
                  placeholder="Exercise Description"
                  value={exercise.description}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise,
                      description: e.target.value,
                    }))
                  }
                />
              </div>

              <div className="mb-4">
                <label htmlFor="exerciseDifficulty" className="label">
                  Exercise Difficulty
                </label>
                <select
                  id="exerciseDifficulty"
                  className="input input-bordered w-full"
                  value={exercise.difficulty}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise,
                      difficulty: e.target.value as Exercise["difficulty"],
                    }))
                  }
                >
                  <option value="">Select Difficulty</option>
                  <option value="beginner">Beginner</option>
                  <option value="intermediate">Intermediate</option>
                  <option value="advanced">Advanced</option>
                </select>
              </div>

              <div className="mb-4">
                <label htmlFor="exerciseType" className="label">
                  Exercise Type
                </label>
                <input
                  type="text"
                  id="exerciseType"
                  className="input input-bordered w-full"
                  placeholder="Exercise Type"
                  value={exercise.type}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise,
                      type: e.target.value,
                    }))
                  }
                />
              </div>

              <div className="mb-4">
                <label htmlFor="exerciseThumbnail" className="label">
                  Exercise Thumbnail
                </label>
                <input
                  type="text"
                  id="exerciseThumbnail"
                  className="input input-bordered w-full"
                  placeholder="Exercise Thumbnail"
                  value={exercise.thumbnail}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise,
                      thumbnail: e.target.value,
                    }))
                  }
                />
                <img
                  className="mt-1"
                  src={exercise.thumbnail}
                  alt="Thumbnail"
                />
              </div>
              <div className="mb-4">
                <label htmlFor="setTotalInstruction" className="label">
                  Total Instructions
                </label>
                <input
                  type="number"
                  id="setTotalInstruction"
                  className="input input-bordered w-full"
                  placeholder="Total Instructions"
                  value={totalInstructions}
                  min={0}
                  onChange={(e) =>
                    setTotalInstructions(parseInt(e.target.value))
                  }
                />
              </div>
            </div>

            <div className="w-3/4 p-4">
              <h1 className="text-center overflow-x-auto text-lg font-bold mb-2">
                Instructions
              </h1>
              <table className="table table-zebra ">
                <thead>
                  <tr>
                    <th className="border border-gray-400 p-2">Type</th>
                    <th className="border border-gray-400 p-2">Duration</th>
                    <th className="border border-gray-400 p-2">Name</th>
                    <th className="border border-gray-400 p-2">Description</th>
                    <th className="border border-gray-400 p-2">Video</th>
                    <th className="border border-gray-400 p-2">Image</th>
                  </tr>
                </thead>
                <tbody>{renderInstructions()}</tbody>
              </table>
            </div>
          </div>

          <div className="flex justify-end items-end gap-4">
            <button
              className="bg-green-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
              onClick={() => {
                sumInstructionsDuration();
              }}
            >
              Create
            </button>

            <Link
              className="bg-red-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
              href={`/dashboard`}
            >
              Cancel
            </Link>
          </div>
        </div>
      </div>
    </div>
  );
}
