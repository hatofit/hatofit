'use client'
import { useEffect, useMemo, useState } from 'react'
import { useSession } from "next-auth/react"
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
import Link from 'next/link'
import { Card } from '@/components/ui'

dayjs.extend(dayjsutc)

async function getExerciseSession(token?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/session`
  const res = await fetch(url, {
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    }
  })

  if (!res.ok) {
    // This will activate the closest `error.js` Error Boundary
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

export default function ExerciseList() {
  const { data, status } = useSession()

  const [sessions, setSessions] = useState<any[]>([])

  useEffect(() => {
    if (data && data?.user && data?.user?.token) {
      getExerciseSession(data?.user?.token)
        .then(res => {
          setSessions(res?.sessions || [])
          console.log('res', res)
        })
        .catch(err => console.log('err', err))
    }
  }, [data])


  if (status === 'loading') return <div>Loading...</div>
  return (
    <Card.Wrapper className="flex flex-col">
      <div>
        <Card.HeaderTitle>My Exercises</Card.HeaderTitle>
      </div>
      {sessions.map((session, index) => (
        <Link href={`/dashboard/report/${session?._id}`} key={index} className="flex flex-col border border-gray-700 px-4 py-2 rounded hover:bg-gray-700 cursor-pointer">
          <div className="text-sm">{session?._id}</div>
          <div className="text-xs text-gray-100">
            {dayjs.utc(session?.start_time).local().format('DD MMMM YYYY HH:mm:ss')}
          </div>
        </Link>
      ))}
      {sessions.length === 0 && (
        <div>No session found.</div>
      )}
    </Card.Wrapper>
  )
}
