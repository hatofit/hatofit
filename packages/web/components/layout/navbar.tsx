'use client'

import { useSession } from "next-auth/react"
import { signOut } from "next-auth/react"

import { MoonIcon, SunIcon } from '@chakra-ui/icons'
import Container from './container'
import { useEffect } from 'react'
import Router, { useRouter } from 'next/navigation'
import { Menu } from '@headlessui/react'
import { useTranslation } from '@/i18n/client'
import { Link } from "../ui"

export interface Props {
  children: React.ReactNode
}

export default function Navbar() {
  const { data, status } = useSession({
    required: false,
  })

  const { t } = useTranslation()

  const logout = async () => {
    return await signOut()
  }

  useEffect(() => {
    console.log(data, status)
  }, [data, status])

  return (
    <div className="bg-gray-100 dark:bg-black h-[72px] border-b-2 border-red-500/30 shadow">
      <Container className="flex items-center h-full justify-between">
        <div className="flex items-center">
          <Link href="/" className="cursor-pointer font-mono text-xl font-bold">HATOFIT</Link>
        </div>
        <div className="flex items-center gap-3">
          {(status !== 'authenticated' && !data) && (
            <>
              <a className="transition-all duration-300 cursor-pointer px-4 py-1.5 leading-loose text-xs text-center font-semibold rounded-lg text-gray-950 bg-gray-50 hover:bg-gray-100 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600">Register</a>
              <Link href="/login" className="transition-all duration-300 cursor-pointer px-4 py-1.5 leading-loose text-xs text-center font-semibold rounded-lg bg-primary-500 text-gray-300 hover:bg-primary-600">Login</Link>
            </>
          )}
          {(status === 'authenticated' && data) && (
            <>
              <Menu as="div" className="relative inline-block text-left">
                <Menu.Button>
                  {data?.user?.name || 'Unknown'}
                </Menu.Button>
                <Menu.Items className="absolute text-left w-48">
                  <div className="relative overflow-hidden flex flex-col space-y-1 py-1 rounded-md shadow-lg bg-white dark:bg-gray-700 ring-1 ring-black ring-opacity-5 focus:outline-none">
                    <Menu.Item>
                      {({ active }) => (
                        <Link
                          href="/dashboard"
                          className={`duration-300 transition-all text-left px-4 py-1 ${active && 'bg-primary-500'}`}
                        >
                        {t('layout.navbar.menu.dashboard')}
                        </Link>
                      )}
                    </Menu.Item>
                    <Menu.Item>
                      {({ active }) => (
                        <Link
                          href="/dashboard/setting"
                          className={`duration-300 transition-all text-left px-4 py-1 ${active && 'bg-primary-500'}`}
                        >
                        {t('layout.navbar.menu.setting')}
                        </Link>
                      )}
                    </Menu.Item>
                    <Menu.Item>
                      {({ active }) => (
                        <button
                          className={`duration-300 transition-all text-left px-4 py-1 ${active && 'bg-primary-500'}`}
                          onClick={logout}
                        >
                          {t('layout.navbar.menu.logout')}
                        </button>
                      )}
                    </Menu.Item>
                  </div>
                </Menu.Items>
              </Menu>
            </>
          )}
        </div>
      </Container>
    </div>
  )
}
