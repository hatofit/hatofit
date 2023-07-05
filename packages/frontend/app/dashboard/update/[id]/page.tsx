"use client";
import React, { useState, useEffect } from "react";
import { Exercise, getExercise, updateExercise } from "@/lib/api";
import Link from "next/link";
interface Props {
  params: {
    id: string;
  };
}

export default function EditExercise({ params }: Props) {
  const [exercise, setExercise] = useState<Exercise | null>(null);
  const [loading, setLoading] = useState<boolean>(true);

  useEffect(() => {
    const fetchExercise = async () => {
      try {
        const res = await getExercise(params.id);
        setExercise(res.exercise);
        setLoading(false);
      } catch (error) {
        console.error("Failed to fetch exercise", error);
      }
    };

    fetchExercise();
  }, [params.id]);

  if (loading) {
    return (
      <div className="mx-auto">
        <h1 className="text-5xl font-bold text-center">Loading...</h1>
      </div>
    );
  }

  return (
    <div className="mx-auto">
      <h1 className="text-5xl font-bold text-center">Edit Exercise</h1>
      <div>
        <div className=" border rounded p-4">
          <div key={params.id} className="flex ">
            <div className="w-1/4 p-4">
              {/* Left column */}
              <div className="mb-4">
                <label
                  htmlFor="exerciseName"
                  className="text-center text-lg font-medium mb-2"
                >
                  Exercise Name
                </label>
                <input
                  type="text"
                  id="exerciseName"
                  className="border border-gray-400 p-2 w-full text-black"
                  placeholder="Exercise Name"
                  value={exercise?.name || ""}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise!,
                      name: e.target.value,
                    }))
                  }
                />
              </div>

              <div className="mb-4">
                <label
                  htmlFor="exerciseDescription"
                  className="text-center text-lg font-medium mb-2"
                >
                  Exercise Description
                </label>
                <textarea
                  id="exerciseDescription"
                  className="border border-gray-400 p-2 w-full text-black"
                  placeholder="Exercise Description"
                  value={exercise?.description || ""}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise!,
                      description: e.target.value,
                    }))
                  }
                />
              </div>

              <div className="mb-4">
                <label
                  htmlFor="exerciseDifficulty"
                  className="text-center text-lg font-medium mb-2"
                >
                  Exercise Difficulty
                </label>
                <select
                  id="exerciseDifficulty"
                  className="border border-gray-400 p-2 w-full text-black"
                  value={exercise?.difficulty || ""}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise!,
                      difficulty: e.target.value,
                    }))
                  }
                >
                  <option value="beginner">Beginner</option>
                  <option value="intermediate">Intermediate</option>
                  <option value="advanced">Advanced</option>
                </select>
              </div>

              <div className="mb-4">
                <label
                  htmlFor="exerciseType"
                  className="text-center text-lg font-medium mb-2"
                >
                  Exercise Type
                </label>
                <input
                  type="text"
                  id="exerciseType"
                  className="border border-gray-400 p-2 w-full text-black"
                  placeholder="Exercise Type"
                  value={exercise?.type || ""}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise!,
                      type: e.target.value,
                    }))
                  }
                />
              </div>

              <div className="mb-4">
                <label
                  htmlFor="exerciseThumbnail"
                  className="text-center text-lg font-medium mb-2"
                >
                  Exercise Thumbnail
                </label>
                <input
                  type="text"
                  id="exerciseThumbnail"
                  className="border border-gray-400 p-2 w-full text-black"
                  placeholder="Exercise Thumbnail"
                  value={exercise?.thumbnail || ""}
                  minLength={3}
                  onChange={(e) =>
                    setExercise((prevExercise) => ({
                      ...prevExercise!,
                      thumbnail: e.target.value,
                    }))
                  }
                />
                <img
                  className="mt-1"
                  src={exercise?.thumbnail}
                  alt="Thumbnail"
                />
              </div>
            </div>
            <div className="w-3/4 p-4  ">
              <h1 className="text-center text-lg font-bold mb-2">
                Instructions
              </h1>
              <table className="border-collapse border border-gray-400 w-full">
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
                <tbody>
                  {exercise?.instructions.map((instruction, index) => (
                    <tr key={index}>
                      <td className="border border-gray-400 p-2">
                        <select
                          className="border border-gray-400 p-2 w-full text-black"
                          value={instruction.type}
                          onChange={(e) => {
                            const newInstructions = [...exercise!.instructions];
                            newInstructions[index].type = e.target.value;
                            setExercise((prevExercise) => ({
                              ...prevExercise!,
                              instructions: newInstructions,
                            }));
                          }}
                        >
                          <option value="rest">Rest</option>
                          <option value="instruction">Instruction</option>
                        </select>
                      </td>
                      <td className="border border-gray-400 p-2">
                        <input
                          type="number"
                          className="border border-gray-400 p-2 w-full text-black"
                          placeholder="Instruction Duration"
                          value={instruction.duration || ""}
                          onChange={(e) => {
                            const newInstructions = [...exercise!.instructions];
                            newInstructions[index].duration = Number(
                              e.target.value
                            );
                            setExercise((prevExercise) => ({
                              ...prevExercise!,
                              instructions: newInstructions,
                            }));
                          }}
                        />
                      </td>
                      {instruction.type === "rest" ? (
                        <></>
                      ) : (
                        <>
                          <td className="border border-gray-400 p-2">
                            <input
                              type="text"
                              className="border border-gray-400 p-2 w-full text-black"
                              placeholder="Instruction Name"
                              value={instruction.name || ""}
                              minLength={3}
                              onChange={(e) => {
                                const newInstructions = [
                                  ...exercise!.instructions,
                                ];
                                newInstructions[index].name = e.target.value;
                                setExercise((prevExercise) => ({
                                  ...prevExercise!,
                                  instructions: newInstructions,
                                }));
                              }}
                            />
                          </td>
                          <td className="border border-gray-400 p-2">
                            <textarea
                              className="border border-gray-400 p-2 w-full text-black"
                              placeholder="Instruction Description"
                              value={instruction.description || ""}
                              minLength={3}
                              onChange={(e) => {
                                const newInstructions = [
                                  ...exercise!.instructions,
                                ];
                                newInstructions[index].description =
                                  e.target.value;
                                setExercise((prevExercise) => ({
                                  ...prevExercise!,
                                  instructions: newInstructions,
                                }));
                              }}
                            />
                          </td>
                          <td className="border border-gray-400 p-2">
                            <input
                              type="text"
                              className="border border-gray-400 p-2 w-full text-black"
                              placeholder="Instruction Video"
                              value={instruction.content?.video || ""}
                              onChange={(e) => {
                                const newInstructions = [
                                  ...exercise!.instructions,
                                ];
                                newInstructions[index].content = {
                                  ...newInstructions[index].content,
                                  video: e.target.value,
                                };
                                setExercise((prevExercise) => ({
                                  ...prevExercise!,
                                  instructions: newInstructions,
                                }));
                              }}
                            />
                          </td>
                          <td className="border border-gray-400 p-2">
                            <input
                              type="text"
                              className="border border-gray-400 p-2 w-full text-black"
                              placeholder="Instruction Image"
                              value={instruction.content?.image || ""}
                              onChange={(e) => {
                                const newInstructions = [
                                  ...exercise!.instructions,
                                ];
                                newInstructions[index].content = {
                                  ...newInstructions[index].content,
                                  image: e.target.value,
                                };
                                setExercise((prevExercise) => ({
                                  ...prevExercise!,
                                  instructions: newInstructions,
                                }));
                              }}
                            />
                          </td>
                        </>
                      )}
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          </div>
          <div className="flex justify-end items-end gap-4">
            <button
              className="bg-green-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
              onClick={() => {
                if (exercise) {
                  updateExercise(exercise, params.id).then((res) => {
                    if (res.success) {
                      window.location.href = "/dashboard";
                    }
                  });
                } else {
                  console.error("Exercise is null");
                }
              }}
            >
              Change
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
