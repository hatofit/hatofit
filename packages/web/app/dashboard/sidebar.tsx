'use client'
import { Icon } from "@iconify/react"
import { useSession } from "next-auth/react"
import Link from "next/link"
import { useEffect } from "react"

export const Menus = [
  { title: 'Dashboard', icon: 'uil:dashboard', href: '/dashboard' },
  { title: 'My Exercises', icon: 'material-symbols:exercise-outline', href: '/dashboard/exercise' },
  { title: 'Shared Exercises', icon: 'material-symbols:exercise-outline', href: '/dashboard/shared-exercise' },
  { title: 'Settings', icon: 'ic:outline-settings-suggest', href: '/dashboard/setting' },
]

export default function Sidebar() {
  const { data, status } = useSession()

  const isMenuActive = (href: string) => {
    return false
    const allMenusActivated = Menus.map(menu => window.location.pathname.replaceAll('/', '').startsWith(menu.href.replaceAll('/', '')))
    if (allMenusActivated.filter(menu => menu).length === 0) {
      return false
    } else if (allMenusActivated.filter(menu => menu).length === 1) {
      return window.location.pathname.replaceAll('/', '').startsWith(href.replaceAll('/', ''))
    }
    return window.location.pathname.replaceAll('/', '').startsWith(href.replaceAll('/', ''))
  }

  useEffect(() => {
    console.log(data, status)
  }, [data, status])

  return (
    <div className="w-[200px]">
      {/* card */}
      <div className="bg-transparent rounded-lg shadow-lg">
        {/* ul list menu */}
        <ul className="flex flex-col">
          <li>
            {/* loop */}
            {Menus.map((menu, index) => (
              <Link
                key={Math.random()} href={menu.href}
                className={`flex items-center gap-4 hover:bg-gray-800/80 px-4 py-2 rounded ${isMenuActive(menu.href) ? 'bg-gray-800/80' : ''}`}
                >
                <Icon icon={menu.icon} className="text-xl" />
                <span className="text-sm text-gray-100">{menu.title}</span>
              </Link>
            ))}
          </li>
        </ul>
      </div>
    </div>
  )
}
