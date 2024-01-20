'use client'
import { Fragment, useEffect, useMemo, useState } from 'react'
import { useSession } from "next-auth/react"
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
import Link from 'next/link'
import { Card, Button, Input } from '@/components/ui'
import { Dialog, Transition } from '@headlessui/react'
import axios from 'axios'

dayjs.extend(dayjsutc)

async function getSharedExercise(token?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/report/share`
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

async function inviteUserApi(token?: string, email?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/report/share`
  const response = await axios({
    method: "POST",
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    data: {
      emailUserToAllow: email ?? ''
    }
  });
  return response.data
}

export default function ExerciseList() {
  const { data, status } = useSession()

  const [sessions, setSessions] = useState<any[]>([])
  const [sharedExercise, setSharedExercise] = useState<any[]>([])
  const [modalShareIsOpen, setModalShareIsOpen] = useState(false)

  const [userToInvite, setUserToInvite] = useState('')

  const inviteUser = async (email: string) => {
    const res = await inviteUserApi(data?.user?.token, email)
    alert(res?.message)
    getSharedExercise(data?.user?.token)
      .then(res => {
        setSharedExercise(res?.lists || [])
        console.log('res', res)
      })
      .catch(err => console.log('err', err))
  }

  useEffect(() => {
    if (data && data?.user && data?.user?.token) {
      getExerciseSession(data?.user?.token)
        .then(res => {
          setSessions(res?.sessions || [])
          console.log('res', res)
        })
        .catch(err => console.log('err', err))
      getSharedExercise(data?.user?.token)
        .then(res => {
          setSharedExercise(res?.lists || [])
          console.log('res', res)
        })
        .catch(err => console.log('err', err))
    }
  }, [data])

  const getMood = (mood: string) => {
    switch (mood) {
      case 'happy':
        return '😄';
      case 'good':
        return '😊';
      case 'neutral':
        return '😐';
      case 'sad':
        return '😔';
      case 'awful':
        return '😢';
    }
  }

  if (status === 'loading') return <div>Loading...</div>
  return (
    <>
      <Card.Wrapper className="flex flex-col">
        <div className="flex justify-between">
          <Card.HeaderTitle>My Exercises</Card.HeaderTitle>
          <div>
            <Button onClick={() => setModalShareIsOpen(true)} className="text-xs px-2 py-1">Share</Button>
          </div>
        </div>
        <div className="flex flex-col gap-2">
          {sessions.map((session, index) => (
            <Link href={`/dashboard/report/${session?._id}`} key={index} className="flex flex-row border border-gray-700 px-4 py-2 rounded hover:bg-gray-700 cursor-pointer">
              <div className="flex flex-col flex-1">
                <div className="text-sm mb-1">{session?.exercise?.name}</div>
                <div className="text-xs text-gray-100">
                  {dayjs.utc(session?.startTime).local().format('DD MMMM YYYY HH:mm:ss')}
                </div>
              </div>
              <div className="flex justify-center items-center flex-col">
                <span>{getMood(session?.mood)}</span>
                <span className="text-xs">
                  {session?.mood}
                </span>
              </div>
            </Link>
          ))}
          {sessions.length === 0 && (
            <div>No session found.</div>
          )}
        </div>
      </Card.Wrapper>

      <Transition show={modalShareIsOpen} as={Fragment}>
        <Dialog onClose={() => setModalShareIsOpen(false)}>
          <Transition.Child
            as={Fragment}
            enter="ease-out duration-300"
            enterFrom="opacity-0"
            enterTo="opacity-100"
            leave="ease-in duration-200"
            leaveFrom="opacity-100"
            leaveTo="opacity-0"
          >
            <div className="fixed inset-0 bg-black/75" aria-hidden="true" />
          </Transition.Child>

          <Transition.Child
            as={Fragment}
            enter="ease-out duration-300"
            enterFrom="opacity-0 scale-95"
            enterTo="opacity-100 scale-100"
            leave="ease-in duration-200"
            leaveFrom="opacity-100 scale-100"
            leaveTo="opacity-0 scale-95"
          >
            <div className="fixed inset-0 w-screen overflow-y-auto">
              {/* Container to center the panel */}
              <div className="flex min-h-full items-center justify-center p-4">
                {/* The actual dialog panel  */}
                <Dialog.Panel className="mx-auto max-w-lg w-full rounded-lg bg-gray-950 px-12 py-8">
                  <Dialog.Title className="text-xl font-semibold mb-4">Share Your Exercise</Dialog.Title>
                  <div className="flex w-full mb-6 gap-4">
                    <Input.Text
                      type="email"
                      placeholder="User email to invite"
                      value={userToInvite}
                      onChange={(e) => setUserToInvite(e.target.value)}
                    />
                    <Button onClick={() => inviteUser(userToInvite)}>Invite</Button>
                  </div>

                  <Dialog.Title className="text-xl font-semibold mb-4">User Shared</Dialog.Title>
                  <div className="flex flex-col gap-2">
                    {sharedExercise.map((session, index) => (
                      <button key={index} className="w-full flex flex-col border border-gray-700 px-4 py-2 rounded hover:bg-gray-700 cursor-pointer">
                        <div className="text-sm flex w-full justify-between">
                          <div>{session?.userView?.firstName} {session?.userView?.lastName}</div>
                          <div className="text-gray-400">{session?.userView?.email}</div>
                        </div>
                      </button>
                    ))}
                    {sharedExercise.length === 0 && (
                      <div>No shared user found.</div>
                    )}
                  </div>

                  <div className="mt-4 flex justify-end">
                    <Button onClick={() => setModalShareIsOpen(false)}>Ok</Button>
                  </div>
                </Dialog.Panel>
              </div>
            </div>
          </Transition.Child>
        </Dialog>
      </Transition>
    </>
  )
}
