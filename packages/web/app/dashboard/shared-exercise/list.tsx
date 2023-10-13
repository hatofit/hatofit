'use client'
import { useEffect, useMemo, useState } from 'react'
import { useSession } from "next-auth/react"
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
import Link from 'next/link'
import { Card } from '@/components/ui'
import { Icon } from '@iconify/react'

dayjs.extend(dayjsutc)

async function getSharedExercise(token?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/report/share/tome`
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

async function getExerciseSession(token?: string, userShareId?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/session/shared/${userShareId}`
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

export default function ExerciseList() {
  const { data, status } = useSession()

  const [sharedLists, setSharedLists] = useState<any[]>([])
  const [sessions, setSessions] = useState<any[]>([])
  const [selecterUser, setSelectedUser] = useState<any>()

  useEffect(() => {
    if (data && data?.user && data?.user?.token) {
      getSharedExercise(data?.user?.token)
        .then(res => {
          setSharedLists(res?.lists || [])
          console.log('res', res)
        })
        .catch(err => console.log('err', err))
    }
  }, [data])

  useEffect(() => {
    if (selecterUser) {
      getExerciseSession(data?.user?.token, selecterUser?._id)
        .then(res => {
          setSessions(res?.sessions || [])
          console.log('res', res)
        })
        .catch(err => console.log('err', err))
    }
  }, [selecterUser])


  if (status === 'loading') return <div>Loading...</div>

  if (selecterUser) {
    return (
      <Card.Wrapper className="flex flex-col">
        <div>
          <button onClick={() => setSelectedUser(undefined)} className="text-xs flex items-center mb-2">
            <Icon icon="uil:arrow-left" className="text-lg" />
            <span>back</span>
          </button>
          <Card.HeaderTitle>Shared Exercise From &quot;{selecterUser?.firstName} {selecterUser?.lastName}&quot;</Card.HeaderTitle>
        </div>
        <div className="flex flex-col gap-2">
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
        </div>
      </Card.Wrapper>
    )
  }

  return (
    <Card.Wrapper className="flex flex-col">
      <div>
        <Card.HeaderTitle>Shared Exercise</Card.HeaderTitle>
      </div>
      <div className="flex flex-col gap-2">
        {sharedLists.map((session, index) => (
          <button onClick={() => setSelectedUser(session?.userShare)} key={index} className="w-full flex flex-col border border-gray-700 px-4 py-2 rounded hover:bg-gray-700 cursor-pointer">
            <div className="text-sm flex w-full justify-between">
              <div>{session?.userShare?.firstName} {session?.userShare?.lastName}</div>
              <div className="text-gray-400">{session?.userShare?.email}</div>
            </div>
            <div className="text-xs text-gray-100">
              {/* {dayjs.utc(session?.start_time).local().format('DD MMMM YYYY HH:mm:ss')} */}
            </div>
          </button>
        ))}
        {sharedLists.length === 0 && (
          <div>No shared user found.</div>
        )}
      </div>
    </Card.Wrapper>
  )
}
