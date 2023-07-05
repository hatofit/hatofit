const API_URL = "http://localhost:3000/api"

export interface Exercise extends Instruction{
  _id?: string;
  name: string;
  description: string;
  difficulty: string; // beginner, intermediate, advanced
  type: string;
  thumbnail: string;
  duration: number;
  instructions: Instruction[];
}

 interface Content {
  video?: string;
  image?: string;
}

 interface Instruction extends Content {
    _id?: string;
    name?: string;
    description?: string;
    type: string; // 'rest', 'instruction'
    duration?: number;
    content?: Content;
}


export async function getExercises(): Promise<Exercise[]> {
  const res = await fetch(`${API_URL}/exercise`);
  const data = await res.json();
  return data.exercises;
}

export async function getExercise(id: string) {
  const res = await fetch(`${API_URL}/exercise/${id}`);
  const data = res.json();
  return data ;
}

export async function createExercise(data : Exercise) {
  const res = await fetch(`${API_URL}/exercise`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data),
  });
  const exercise = await res.json();
  return exercise;
}

export async function updateExercise(data : Exercise, id: string){
  const res = await fetch(`${API_URL}/exercise/${id}`,{
    method: 'PUT',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data),
  });
  const exercise = await res.json();
  return exercise;
}

export async function deleteExercise(_id: string){
  const res = await fetch(`${API_URL}/exercise/${_id}`, {
    method: 'DELETE',
  });
  const exercise = await res.json();
  return exercise;
}

