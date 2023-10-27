'use client'
import useObserveRoute from "@/hooks/use-observe-route"
import { Icon } from "@iconify/react"
import { useSession } from "next-auth/react"
import Link from "next/link"
import { useRouter } from "next/navigation"
import { Fragment, useEffect, useState } from "react"

export const Menus = [
  { type: 'item', title: 'Dashboard', icon: 'uil:dashboard', href: '/dashboard' },
  { type: 'spacer' },
  { type: 'item', title: 'My Exercises', icon: 'material-symbols:exercise-outline', href: '/dashboard/exercise' },
  { type: 'item', title: 'Shared Exercises', icon: 'material-symbols:exercise-outline', href: '/dashboard/shared-exercise' },
  { type: 'spacer' },
  { type: 'item', title: 'Company', icon: 'mdi:company', href: '/dashboard/company' },
  { type: 'spacer' },
  { type: 'item', title: 'Settings', icon: 'ic:outline-settings-suggest', href: '/dashboard/setting' },
]

export default function Sidebar() {
  const router = useRouter()
  const { data, status } = useSession()
  const [c, sc] = useState(1)
  useObserveRoute(() => sc(v => v + 1), () => sc(v => v + 1))

  const isMenuActive = (href: string) => {
    // const allMenusActivated = Menus.map(menu => {
    //   console.log('[]', window.location.pathname.split('/').join('/'), menu.href)
    //   return window.location.pathname.split('/').join('/') === menu.href
    // })
    return window.location.pathname.split('/').join('/') === href
    // let res = true
    // if (allMenusActivated.filter(menu => menu).length === 0) {
    //   res = false
    // } else if (allMenusActivated.filter(menu => menu).length === 1) {
    //   res = window.location.pathname.replaceAll('/', '').startsWith(href.replaceAll('/', ''))
    // } else {
    //   res = window.location.pathname.replaceAll('/', '').startsWith(href.replaceAll('/', ''))
    // }
    // return res
  }

  return (
    <div className="w-[200px]">
      {/* card */}
      <div className="bg-transparent rounded-lg shadow-lg">
        {/* ul list menu */}
        <ul className="flex flex-col">
          {/* loop */}
          {Menus.map((menu, index) => (
            <Fragment key={index}>
              {(menu.type === 'item' && menu.href) && (
                <li>
                  <Link
                    key={Math.random()} href={menu.href}
                    className={`flex items-center gap-4 hover:bg-gray-800/80 px-4 py-2 rounded ${isMenuActive(menu.href) ? 'bg-gray-800/80' : ''}`}
                    >
                    <Icon icon={menu.icon} className="text-xl" />
                    <span className="text-sm text-gray-100">{menu.title}</span>
                  </Link>
                </li>
              )}
              {(menu.type === 'spacer') && (
                <li><div className="w-full h-0.5 mt-2 mb-2 bg-gray-950/75"></div></li>
              )}
            </Fragment>
          ))}
        </ul>
      </div>
    </div>
  )
}
