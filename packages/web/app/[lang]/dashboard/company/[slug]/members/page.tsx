'use client'
import Container from "@/components/layout/container";
import { Card, Input } from "@/components/ui";
import { Icon } from "@iconify/react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Fragment, useCallback, useEffect, useMemo, useState } from "react";

async function apiGetCompanyMembers(token?: string, id?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}/members`
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

async function apiRemoveUserFromCompany(token?: string, companyId?: string, memberId?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${companyId}/members/${memberId}`
  const res = await fetch(url, {
    method: 'DELETE',
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

export default function DashboardCompanyDetailPage({ params }: { params: { slug: string } }) {
  const { data } = useSession()
  const [members, setMembers] = useState<any>([])

  const fetch = useCallback(() => {
    if (data && data?.user) {
      apiGetCompanyMembers(data?.user?.token, params.slug).then((res) => {
        // console.log()
        setMembers(res?.members || [])
      })
    }
  }, [data, params])

  useEffect(() => {
    fetch()
  }, [fetch, data, params])

  const removeUser = useCallback(async (id: string) => {
    const token = data?.user?.token
    await apiRemoveUserFromCompany(token, params.slug, id)
    fetch()
  }, [data, params, fetch])

  return (
    <main className="flex-1 flex flex-col">
      <Card.Wrapper className="px-0 py-0">
        <table className="w-full border-collapse bg-transparent text-left text-sm text-gray-500">
          <thead className="bg-gray-950">
            <tr>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Name</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Email</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100"></th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-700 border-t border-gray-700">
            {members.map((member: any, index: number) => (
              <tr key={index} className="hover:bg-gray-950">
                <th className="flex gap-3 px-6 py-4 font-normal text-gray-100">
                  {/* <div className="relative h-10 w-10">
                    <img
                      className="h-full w-full rounded-full object-cover object-center"
                      src="https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80"
                      alt=""
                    />
                    <span className="absolute right-0 bottom-0 h-2 w-2 rounded-full bg-green-400 ring ring-white"></span>
                  </div> */}
                  <div className="text-sm">
                    <div className="font-medium text-gray-100">{member?.firstName} {member?.lastName}</div>
                  </div>
                </th>
                <td className="px-6 py-4">
                  <div className="text-sm text-gray-400">{member?.email}</div>
                </td>
                <td className="px-6 py-4">
                  <div className="flex justify-end gap-4">
                    <Link href={`/dashboard/company/${params.slug}/members/${member._id}/reports`} className="transition-all duration-300 text-gray-600 hover:text-indigo-500">
                      {/* <Icon icon="ph:trash" className="text-xl" /> */}
                      <span>Lihat Report</span>
                    </Link>
                    <button className="transition-all duration-300 text-gray-600 hover:text-red-500" onClick={() => removeUser(member?._id)}>
                      <Icon icon="ph:trash" className="text-xl" />
                    </button>
                  </div>
                </td>
              </tr>
            ))}
            {members.length == 0 && (
              <tr className="hover:bg-gray-950">
                <th colSpan={3}>
                  <div className="text-center py-4">No data found</div>
                </th>
              </tr>
            )}
          </tbody>
        </table>
      </Card.Wrapper>
    </main>
  )
}
