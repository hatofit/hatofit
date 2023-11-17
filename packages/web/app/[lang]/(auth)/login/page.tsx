import LoginForm from "./form"
import { getServerSession } from "next-auth/next"
import { redirect } from "next/navigation"

export default async function LoginPage() {
  const session = await getServerSession()

  if (session?.user) redirect("/dashboard");

  return (
    <main className="flex flex-col justify-center items-center min-h-[calc(100vh_-_72px)] pb-[72px]">
      <div className="text-3xl font-bold text-gray-100">Log in to Hatofit</div>
      <LoginForm />
    </main>
  )
}
