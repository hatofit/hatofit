'use client'
import Container from "@/components/layout/container";
import { Card, Input } from "@/components/ui";
import { Icon } from "@iconify/react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useEffect, useMemo, useState } from "react";
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'

dayjs.extend(dayjsutc)

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

export default function DashboardCompanyDetailPage({ params }: { params: { slug: string, memberId: string } }) {
  const { data } = useSession()
  const [sessions, setSessions] = useState<any>([])

  useEffect(() => {
    if (data && data?.user) {
      getExerciseSession(data?.user?.token, params.memberId).then((res) => {
        // console.log()
        setSessions(res?.sessions || [])
      })
    }
  }, [data, params])

  return (
    <main className="flex-1 flex flex-col">
      <Card.Wrapper className="px-0 py-0">
        <table className="w-full border-collapse bg-transparent text-left text-sm text-gray-500">
          <thead className="bg-gray-950">
            <tr>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Id</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Date</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Exercise</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100"></th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-700 border-t border-gray-700">
            {sessions.map((session: any, index: number) => (
              <tr key={index} className="hover:bg-gray-950">
                <th className="flex gap-3 px-6 py-4 font-normal text-gray-100">
                  <div className="text-sm">
                    <div className="font-medium text-gray-100">{session?._id}</div>
                  </div>
                </th>
                <td className="px-6 py-4">
                  <div className="text-sm text-gray-400">{dayjs.utc(session?.start_time).local().format('DD MMMM YYYY HH:mm:ss')}</div>
                </td>
                <td className="px-6 py-4">
                  <div className="text-sm text-gray-400">{session?.exercise?.name}</div>
                </td>
                <td className="px-6 py-4">
                  <div className="flex justify-end gap-4">
                    <Link href={`/dashboard/report/${session?._id}?back=${window.location.href}`} className="transition-all duration-300 text-gray-600 hover:text-indigo-500">
                      <span>Lihat</span>
                    </Link>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </Card.Wrapper>
    </main>
  )
}
