import Container from "@/components/layout/container"
import Sidebar from "../sidebar"
import { getServerSession } from "next-auth/next"
import ExerciseList from "./list"

export default async function SessionPage() {
  const session = await getServerSession()
  console.log('session', session)

  return (
    <main className="flex min-h-[calc(100vh_-_72px)] py-4">
      <Container className="flex gap-4">
        <Sidebar />
        <div className="flex-1">
          <ExerciseList />
        </div>
      </Container>
    </main>
  )
}
