import Container from "@/components/layout/container"
import Sidebar from "../sidebar"
import { getServerSession } from "next-auth/next"
import ExerciseList from "./list"

export default async function SessionPage() {
  const session = await getServerSession()
  console.log('session', session)

  return (
    <main className="flex-1 flex flex-col">
      <ExerciseList />
    </main>
  )
}
