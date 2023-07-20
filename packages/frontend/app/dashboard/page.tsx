"use client";
import { Exercise, deleteExercise, getExercises } from "@/lib/api";
import { useState, useEffect } from "react";
import Link from "next/link";
import { parse } from "path";

export default function Home() {
  const [exercises, setExercises] = useState<Exercise[]>([]);
  const [loading, setLoading] = useState<boolean>(true);
  const [selectedExercise, setSelectedExercise] = useState<Exercise | null>(
    null
  );

  const fetchData = async () => {
    const res = await getExercises();
    setExercises(res);
    setLoading(false);
  };

  useEffect(() => {
    fetchData().then(() => console.log("Fetching Data ... : ", exercises));
  }, []);

  const handleDeleteExercise = async (id: string) => {
    if (id) {
      await deleteExercise(id);
      fetchData();
    }
  };

  const handleViewExercise = (exercise: any) => {
    setSelectedExercise(exercise);
    console.log("handleViewExercise" + exercise.name);
    if (exercise) {
      console.log("selectedExercise" + selectedExercise);
    }
  };

  function capitalizeFirstLetter(str: string) {
    return str.charAt(0).toUpperCase() + str.slice(1);
  }

  loading ? console.log("loading") : console.log(exercises);

  return loading ? (
    <div className="mx-auto">
      <h1 className="text-5xl font-bold text-center">Loading...</h1>
    </div>
  ) : (
    <div className="max-w-7xl mx-auto">
      <h1 className="text-center text-5xl font-bold my-4">Exercises List</h1>
      <Link
        passHref
        href={`/dashboard/create`}
        className="btn btn-primary btn-block"
      >
        Create New
      </Link>
      <div className="grid grid-cols-3 gap-4 mt-8">
        {exercises.map((exercise) => (
          <div key={exercise._id} className="border p-4">
            <img
              className="mx-auto h-64 object-cover"
              src={exercise.thumbnail}
              width={400}
              height={300}
              alt={exercise.name}
            />
            <h2 className="text-xl my-2 font-semibold">{exercise.name}</h2>
            <p className="font-elipsis my-2">{exercise.description}</p>
            <div className="flex justify-between">
              <button
                className="bg-blue-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
                onClick={() => handleViewExercise(exercise)}
              >
                View
              </button>
              <Link
                passHref
                href={`/dashboard/update/${exercise._id}`}
                className="bg-orange-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
              >
                Update
              </Link>
              <button
                className="bg-red-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
                onClick={() =>
                  exercise._id && handleDeleteExercise(exercise._id)
                }
              >
                Delete
              </button>
            </div>
          </div>
        ))}
      </div>
      {selectedExercise && (
        <div className="fixed top-0 left-0 right-0 bottom-0 flex items-center justify-center bg-gray-800 bg-opacity-75 ">
          <div className=" bg-gray-200 p-4 text-black w-4/6">
            <div className="  flex  ">
              <div className=" w-1/3">
                <h1 className="text-3xl font-bold mb-4 text-center">
                  Exercise Details{" "}
                </h1>
                <h1 className="text-xl mb-4">
                  Name :{" "}
                  <span className=" font-semibold">
                    {selectedExercise.name}
                  </span>{" "}
                </h1>
                <h1 className="text-xl mb-4 text-ellipsis">
                  Description :{" "}
                  <span className=" font-semibold">
                    {selectedExercise.description}
                  </span>{" "}
                </h1>
                <h1 className="text-xl mb-4 text-ellipsis">
                  Difficulty:{" "}
                  <span className="font-semibold">
                    {capitalizeFirstLetter(selectedExercise.difficulty)}
                  </span>
                </h1>
                <h1 className="text-xl mb-4 text-ellipsis">
                  Type:{" "}
                  <span className="font-semibold">
                    {capitalizeFirstLetter(selectedExercise.type)}
                  </span>
                </h1>
                <h1 className="text-xl mb-4 text-ellipsis">
                  Duration:{" "}
                  <span className="font-semibold">
                    {selectedExercise.duration}
                  </span>
                </h1>
                <h1 className="text-xl mb-4 ">
                  Thumbnail :{" "}
                  <span className="hover:text-blue-600 font-semibold">
                    <Link href={selectedExercise.thumbnail}>
                      {selectedExercise.thumbnail}
                    </Link>
                  </span>{" "}
                </h1>
                <img
                  className="mx-auto h-64 object-cover"
                  src={selectedExercise.thumbnail}
                  width={400}
                  height={300}
                  alt={selectedExercise.name}
                />
              </div>
              <div className="w-3/4">
                <table className="w-full">
                  <thead>
                    <tr>
                      <th className="border border-gray-400 p-2">Type</th>
                      <th className="border border-gray-400 p-2">Duration</th>
                      <th className="border border-gray-400 p-2">Name</th>
                      <th className="border border-gray-400 p-2">
                        Description
                      </th>
                      <th className="border border-gray-400 p-2">Video</th>
                      <th className="border border-gray-400 p-2">Image</th>
                    </tr>
                  </thead>
                  <tbody>
                    {selectedExercise.instructions.map((instruction) => (
                      <tr key={instruction._id}>
                        <td className="border border-gray-400 p-2">
                          {instruction.type}
                        </td>
                        <td className="border border-gray-400 p-2">
                          {instruction.duration}
                        </td>
                        <td className="border border-gray-400 p-2">
                          {instruction.name}
                        </td>
                        <td className="border border-gray-400 p-2">
                          {instruction.description}
                        </td>
                        <td className="border border-gray-400 p-2">
                          {instruction.video}
                        </td>
                        <td className="border border-gray-400 p-2">
                          {instruction.image}
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </div>

            <div className="flex justify-end items-end  ">
              <button
                className=" flex justify-end items-end bg-red-500 text-white rounded-lg font-medium px-4 py-2 mt-2"
                onClick={() => setSelectedExercise(null)}
              >
                Close
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
