'use client'
import { getServerSession } from "next-auth/next"
import { redirect } from "next/navigation"
import { useSession } from "next-auth/react"
import Container from "@/components/layout/container"
import Sidebar from "./sidebar"
import { useMemo } from "react"

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

  const isNoSidebar = useMemo(() => {
    return window.location.pathname.includes('dashboard/report/')
  }, [])

  return (
    <div className="flex min-h-[calc(100vh_-_72px)] py-4">
      <Container className="flex gap-4">
        {!isNoSidebar && (
          <Sidebar />
        )}
        <div className="flex-1 flex">
          {children}
        </div>
      </Container>
    </div>
  )
}
