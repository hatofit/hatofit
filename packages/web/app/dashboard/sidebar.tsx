'use client'
import { Icon } from "@iconify/react"

export default function Sidebar() {
  return (
    <div className="w-[200px]">
      {/* card */}
      <div className="bg-gray-800 rounded-lg shadow-lg p-4">
        {/* ul list menu */}
        <ul className="flex flex-col gap-2">
          <li className="flex items-center gap-2">
            <Icon icon="uil:dashboard" className="text-xl" />
            <span className="text-sm text-gray-100">Dashboard</span>
          </li>
          <li className="flex items-center gap-2">
            <Icon icon="material-symbols:exercise-outline" className="text-xl" />
            <span className="text-sm text-gray-100">My Exercises</span>
          </li>
          <li className="flex items-center gap-2">
            <Icon icon="ic:outline-settings-suggest" className="text-xl" />
            <span className="text-sm text-gray-100">Setings</span>
          </li>
        </ul>
      </div>
    </div>
  )
}
