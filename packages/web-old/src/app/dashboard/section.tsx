'use client'

import { SessionProvider, useSession } from 'next-auth/react'
import React from 'react'
import Router from 'next/router'

export default async function DashboardSectionPage() {
  const { status, data } = useSession({
    onUnauthenticated: () => {
      // back to login page
      Router.push('/login')
    },
    required: true,
  })

  return (
    <div>{data?.user.name} - {status}</div>
  )
}
