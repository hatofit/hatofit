'use client'
import useObserveRoute from "@/hooks/use-observe-route"
import { useTranslation } from "@/i18n/client"
import { createTranslation } from "@/i18n/server"
import { Icon } from "@iconify/react"
import { useSession } from "next-auth/react"
import Link from "next/link"
import { useParams, useRouter } from "next/navigation"
import { Fragment, useEffect, useMemo, useState } from "react"


export default function Sidebar() {
  const params = useParams()
  const { t } = useTranslation(params?.lang)
  const router = useRouter()
  const { data, status } = useSession()
  const lang = useParams()?.lang
  const [c, sc] = useState(1)

  const menus = useMemo(() => {
    return [
      { type: 'item', title: t('dashboard.sidebar.menu.dashboard'), icon: 'uil:dashboard', href: '/dashboard' },
      { type: 'spacer' },
      { type: 'item', title: t('dashboard.sidebar.menu.my_exercises'), icon: 'material-symbols:exercise-outline', href: '/dashboard/exercise' },
      { type: 'item', title: t('dashboard.sidebar.menu.shared_exercises'), icon: 'material-symbols:exercise-outline', href: '/dashboard/shared-exercise' },
      { type: 'spacer' },
      { type: 'item', title: t('dashboard.sidebar.menu.company'), icon: 'mdi:company', href: '/dashboard/company' },
      { type: 'spacer' },
      { type: 'item', title: t('dashboard.sidebar.menu.settings'), icon: 'ic:outline-settings-suggest', href: '/dashboard/setting' },
    ].map(menu => {
      return {
        ...menu,
        href: `/${lang}${menu.href}`
      }
    })
  }, [lang, t])

  useObserveRoute(() => sc(v => v + 1), () => sc(v => v + 1))

  const isMenuActive = (href: string) => {
    // const allMenusActivated = Menus.map(menu => {
    //   console.log('[]', window.location.pathname.split('/').join('/'), menu.href)
    //   return window.location.pathname.split('/').join('/') === menu.href
    // })
    return window.location.pathname.split('/').join('/') === `${href}`
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
          {menus.map((menu, index) => (
            <Fragment key={index}>
              {(menu.type === 'item' && menu.href) && (
                <li>
                  <Link
                    key={Math.random()}
                    href={`${menu.href}`}
                    className={`flex items-center gap-4 hover:bg-gray-800/80 px-4 py-2 rounded ${isMenuActive(menu.href) ? 'bg-gray-800/80' : ''}`}
                    >
                    <Icon icon={menu.icon as any} className="text-xl" />
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
