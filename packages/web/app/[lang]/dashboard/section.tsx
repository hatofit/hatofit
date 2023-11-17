'use client'
import { Card, Input, Button } from "@/components/ui"
import { useSession } from "next-auth/react"
import Link from "next/link"
import { Dialog, Transition } from '@headlessui/react'
import { Fragment, useCallback, useEffect, useState } from "react"
import { useTranslation } from "@/i18n/client"

async function apiGetDashboard(token?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/auth/dashboard`
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

export const DashboardSection = ({}) => {
  const { data, status } = useSession()

  const { t } = useTranslation()

  const [widgets, setWidgets]  = useState<{
    name: string
    value: string
  }[]>([])

  useEffect(() => {
    if (data && data?.user && data?.user?.token) {
      apiGetDashboard(data?.user?.token)
        .then(res => {
          setWidgets(res?.widgets || [])
          console.log('res', res)
        })
        .catch(err => console.log('err', err))
    }
  }, [data])

  return (
    <>
      <div className="grid grid-cols-3 gap-4 mb-6">
        {widgets.map((shortcut) => (
          <div
            key={Math.random()}
            className={`rounded h-[106px] shadow py-4 px-4 container overflow-hidden flex dark:bg-gray-800`}
          >
            <div className="flex flex-col w-1/2 item justify-center">
              <div className="text-xs text-gray-200">{t(`dashboard.page.widgets.${shortcut.name}`)}</div>
              <div className="font-bold text-2xl">{shortcut.value}</div>
            </div>
          </div>
        ))}
      </div>
      <Card.Wrapper>
        {t('dashboard.page.welcome')}
      </Card.Wrapper>
    </>
  )
}
