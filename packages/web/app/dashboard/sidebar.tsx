'use client'
import { Icon } from "@iconify/react"
import { useSession } from "next-auth/react"
import Link from "next/link"
import { useEffect } from "react"

export default function Sidebar() {
  const { data, status } = useSession()

  useEffect(() => {
    console.log(data, status)
  }, [data, status])

  return (
    <div className="w-[200px]">
      {/* card */}
      <div className="bg-gray-800 rounded-lg shadow-lg p-4">
        {/* ul list menu */}
        <ul className="flex flex-col gap-2">
          <li>
            <Link href="/dashboard" className="flex items-center gap-2 hover:underline">
              <Icon icon="uil:dashboard" className="text-xl" />
              <span className="text-sm text-gray-100">Dashboard</span>
            </Link>
          </li>
          <li>
            <Link href="/dashboard/exercise" className="flex items-center gap-2 hover:underline">
              <Icon icon="material-symbols:exercise-outline" className="text-xl" />
              <span className="text-sm text-gray-100">My Exercises</span>
            </Link>
          </li>
          <li>
            <Link href="/dashboard/setting" className="flex items-center gap-2 hover:underline">
              <Icon icon="ic:outline-settings-suggest" className="text-xl" />
              <span className="text-sm text-gray-100">Setings</span>
            </Link>
          </li>
        </ul>
      </div>
    </div>
  )
}
