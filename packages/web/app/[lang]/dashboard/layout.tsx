'use client'
import { getServerSession } from "next-auth/next"
import { redirect, usePathname } from "next/navigation"
import { useSession } from "next-auth/react"
import Container from "@/components/layout/container"
import Sidebar from "./sidebar"
import { useEffect, useMemo, useState } from "react"
import { useRouter } from "next/router"
import useObserveRoute from "@/hooks/use-observe-route"

export default function DashboardLayout({
  children,
}: {
  children: React.ReactNode
}) {
  const pathname = usePathname()

  const { data, status } = useSession({
    required: true,
    onUnauthenticated() {
      return redirect("/login")
    }
  })

  const [cR, sCr]  = useState(window?.location?.pathname || '')
  const isNoSidebar = useMemo(() => {
    return cR.includes('dashboard/report/')
  }, [cR])
  useObserveRoute(() => sCr(window.location.pathname), () => sCr(window.location.pathname))

  const isAllowerdUseLayout = useMemo(() => {
    const notAllowedList = [
      '/dashboard/company/'
    ]

    for (const route of notAllowedList) {
      if (pathname.includes(route)) return false
    }

    return true
  }, [pathname])

  return (
    <>
      {isAllowerdUseLayout && (
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
      )}
      {!isAllowerdUseLayout && children}
    </>
  )
}
