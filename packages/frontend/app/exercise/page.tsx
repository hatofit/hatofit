"use client";
import { useEffect, useState } from "react";
import { Instructions } from "../page";

type Exercise = {
  _id: string;
  name: string;
  description: string;
  difficulty: string;
  type: string;
  thumbnail: string;
  instructions: [
    {
      content: Content;
      type: string;
      name: string;
      description: string;
      duration: number;
      _id: string;
    }
  ];
  createdAt: string;
  updatedAt: string;
  __v: number;
};
type Content = {
  video: string;
  image: string;
};

type ApiResponse = {
  success: boolean;
  message: string;
  exercises: Exercise[];
};

export default function ExercisePage() {
  const [exercises, setExercises] = useState<Exercise[]>([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch("http://localhost:3000/api/exercise");
        const data: ApiResponse = await response.json();
        setExercises(data.exercises);
      } catch (error) {
        console.error("Error fetching data:", error);
      }
    };

    fetchData();
  }, []);

  const handleDelete = async (id: string) => {
    try {
      const response = await fetch(`http://localhost:3000/api/exercise/${id}`, {
        method: "DELETE",
      });
      const data: ApiResponse = await response.json();
      if (data.success) {
        setExercises((prevExercises) =>
          prevExercises.filter((exercise) => exercise._id !== id)
        );
      }
    } catch (error) {
      console.error("Error deleting exercise:", error);
    }
  };

  const handleUpdate = async (id: string) => {
    try {
      const response = await fetch(`http://localhost:3000/api/exercise/${id}`, {
        method: "PUT",
      });
      const data: ApiResponse = await response.json();
      if (data.success) {
        setExercises((prevExercises) =>
          prevExercises.filter((exercise) => exercise._id !== id)
        );
      }
    } catch (error) {
      console.error("Error deleting exercise:", error);
    }
  };

  return (
    <div className="max-w-5xl mx-auto">
      <h1 className="font-bold text-3xl text-center m-2 p-2">Exercise List</h1>
      <button
        onClick={() => {
          window.location.href = "/exercise/create";
        }}
        className="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
      >
        Create Exercise
      </button>
      {exercises.map((exercise) => (
        <div className="m-2 p-2 bg-slate-100 rounded-xl" key={exercise._id}>
          <h2>id: {exercise._id}</h2>
          <h2 className=" font-semibold">
            <span className=" font-normal">name</span> {exercise.name}
          </h2>
          <p>desc: {exercise.description}</p>
          <p>difficulty: {exercise.difficulty}</p>
          <p>type: {exercise.type}</p>
          <p>thumbnail: {exercise.thumbnail}</p>
          <p>
            <h3 className=" font-semibold">instructions :</h3>
            {exercise.instructions.map((instruction) => (
              <div className="mx-8" key={instruction._id}>
                <br />
                {instruction.type === "rest" ? (
                  <>
                    <p>
                      type:
                      <span className=" font-semibold">
                        {" "}
                        {instruction.type}
                      </span>
                    </p>
                    <p>duration: {instruction.duration}</p>
                  </>
                ) : (
                  <>
                    <p>name: {instruction.name}</p>
                    <p>description: {instruction.description}</p>
                    <p>duration: {instruction.duration}</p>
                    <p>
                      type:
                      <span className=" font-semibold">
                        {" "}
                        {instruction.type}
                      </span>
                    </p>
                    <p>image url: {instruction?.content?.image}</p>
                    <p>video url: {instruction?.content?.video}</p>
                  </>
                )}
                <br />
              </div>
            ))}
          </p>
          <p>createdAt: {exercise.createdAt}</p>
          <p>updatedAt: {exercise.updatedAt}</p>
          <button
            className=" bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded"
            onClick={() => handleDelete(exercise._id)}
          >
            Delete
          </button>
          <button
        onClick={() => {
          window.location.href = "/exercise/update";
        }}
        className="mx-2 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
      >
        Update
      </button>
        </div>
      ))}
    </div>
  );
}
