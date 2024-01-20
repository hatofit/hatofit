'use client'
import Container from "@/components/layout/container";
import { Card, Input } from "@/components/ui";
import useObserveRoute from "@/hooks/use-observe-route";
import { Icon } from "@iconify/react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useEffect, useMemo, useState } from "react";
// import { DashboardCompanySection } from "./section";

const isMenuActive = (href: string) => {
  return window.location.pathname.split('/').join('/') === href
}

async function getCompanyDetail(token?: string, id?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}`
  const res = await fetch(url, {
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    }
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}


export default function DashboardCompanyDetailPage({ params, children }: { params: { slug: string }, children: JSX.Element }) {
  const Menus = useMemo(() => [
    { type: 'item', title: 'Dashboard', icon: 'uil:dashboard', href: `/dashboard/company/${params.slug}` },
    { type: 'item', title: 'Members', icon: 'uil:users-alt', href: `/dashboard/company/${params.slug}/members` },
    { type: 'spacer' },
    { type: 'item', title: 'Owners', icon: 'uil:user-md', href: `/dashboard/company/${params.slug}/owners` },
    { type: 'spacer' },
    { type: 'item', title: 'Settings', icon: 'ic:outline-settings-suggest', href: `/dashboard/company/${params.slug}/setting` },
  ], [params])

  const [cR, sCr]  = useState(window?.location?.pathname || '')
  useObserveRoute(() => sCr(window.location.pathname), () => sCr(window.location.pathname))

  const { data } = useSession()
  const [companyData, setCompanyData] = useState<any>({})

  useEffect(() => {
    if (data && data?.user) {
      getCompanyDetail(data?.user?.token, params.slug).then((res) => setCompanyData(res?.company || {}))
    }
  }, [data, params])

  return (
    <>
      <div className="bg-gray-950 w-full py-2">
        <Container>
          <h1>
            <Link href={`/dashboard/company`}>Company</Link> {'>'} {companyData?.name}
          </h1>
        </Container>
      </div>
      <div className="flex min-h-[calc(100vh_-_72px)] py-4">
        <Container className="flex gap-4">
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
          <div className="flex-1 flex">
            {children}
          </div>
        </Container>
      </div>
    </>
  )
}
