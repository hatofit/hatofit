'use client'
import { getServerSession } from "next-auth/next"
import { redirect } from "next/navigation"
import { useSession } from "next-auth/react"
import Container from "@/components/layout/container"
import Sidebar from "./sidebar"

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const { data, status } = useSession({
    required: true,
    onUnauthenticated() {
      return redirect("/login")
    }
  })

  return (
    <div className="flex min-h-[calc(100vh_-_72px)] py-4">
      <Container className="flex gap-4">
        <Sidebar />
        <div className="flex-1 flex">
          {children}
        </div>
      </Container>
    </div>
  )
}
