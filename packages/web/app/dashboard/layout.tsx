'use client'
import { getServerSession } from "next-auth/next"
import { redirect } from "next/navigation"
import { useSession } from "next-auth/react"

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

  return children
}
