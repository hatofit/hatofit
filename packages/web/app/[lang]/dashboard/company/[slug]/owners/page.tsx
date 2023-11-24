'use client'
import Container from "@/components/layout/container";
import { Button, Card, Input } from "@/components/ui";
import { Icon } from "@iconify/react";
import { useSession } from "next-auth/react";
import Link from "next/link";
import { usePathname } from "next/navigation";
import { Dialog, Transition } from '@headlessui/react'
import { Fragment, useCallback, useEffect, useMemo, useState } from "react";

async function apiGetCompanyOwners(token?: string, id?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}/owners`
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

async function apiAddOwnerInCompany(token?: string, companyId?: string, email?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${companyId}/owners`
  const res = await fetch(url, {
    method: 'POST',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({
      email
    })
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

async function apiRemoveOwnerFromCompany(token?: string, companyId?: string, id?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${companyId}/owners`
  const res = await fetch(url, {
    method: 'DELETE',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify({
      userId: id
    })
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}



export default function DashboardCompanyDetailPage({ params }: { params: { slug: string } }) {
  const { data } = useSession()
  const [members, setMembers] = useState<any>([])
  const [modalShowAddOwner, setModalShowAddOwner] = useState(false)
  const [modalShowAddOwnerData, setModalShowAddOwnerData] = useState({
    email: ''
  })

  const fetch = useCallback(() => {
    if (data && data?.user) {
      apiGetCompanyOwners(data?.user?.token, params.slug).then((res) => {
        // console.log()
        const owners_data = res?.owners || []
        const users_data = res?.users || []
        const merge = []
        owners_data.forEach((owner: any) => {
          const user = users_data.find((user: any) => user._id == owner.userId)
          merge.push({ ...owner, ...user })
        })
        setMembers(merge)
      })
    }
  }, [data, params])

  useEffect(() => {
    fetch()
  }, [fetch, data, params])

  const addOwner = useCallback(async () => {
    setModalShowAddOwner(false)
    const token = data?.user?.token
    await apiAddOwnerInCompany(token, params.slug, modalShowAddOwnerData.email)
    fetch()
  }, [data, params, fetch, modalShowAddOwnerData])

  const removeOwner = useCallback(async (id: string) => {
    setModalShowAddOwner(false)
    const token = data?.user?.token
    await apiRemoveOwnerFromCompany(token, params.slug, id)
    fetch()
  }, [data, params, fetch, modalShowAddOwnerData])

  return (
    <main className="flex-1 flex flex-col">
      <div className="flex justify-end mb-4">
        <Button
          onClick={() => setModalShowAddOwner(true)}
        >
          Add
        </Button>
      </div>
      <Card.Wrapper className="px-0 py-0">
        <table className="w-full border-collapse bg-transparent text-left text-sm text-gray-500">
          <thead className="bg-gray-950">
            <tr>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Name</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Email</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100">Role</th>
              <th scope="col" className="px-6 py-4 font-medium text-gray-100"></th>
            </tr>
          </thead>
          <tbody className="divide-y divide-gray-700 border-t border-gray-700">
            {members.map((member: any, index: number) => (
              <tr key={index} className="hover:bg-gray-950">
                <th className="flex gap-3 px-6 py-4 font-normal text-gray-100">
                  <div className="text-sm">
                    <div className="font-medium text-gray-100">{member?.firstName} {member?.lastName}</div>
                  </div>
                </th>
                <td className="px-6 py-4">
                  <div className="text-sm text-gray-400">{member?.email}</div>
                </td>
                <td className="px-6 py-4">
                  <div className="text-sm text-gray-400">{member?.role}</div>
                </td>
                <td className="px-6 py-4">
                  <div className="flex justify-end gap-4">
                    <button className="transition-all duration-300 text-gray-600 hover:text-red-500" onClick={() => removeOwner(member?.userId)}>
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


      <Transition show={modalShowAddOwner} as={Fragment}>
        <Dialog onClose={() => setModalShowAddOwner(false)}>
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
                  <Dialog.Title className="text-xl font-semibold mb-4">Add Owner</Dialog.Title>
                  <div className="flex flex-col w-full mb-6 gap-4">
                    <div className="flex">
                      <Input.Text
                        type="email"
                        placeholder="User Email"
                        value={modalShowAddOwnerData.email}
                        onChange={(e) => setModalShowAddOwnerData(prev => ({ ...prev, email: e.target.value }))}
                      />
                    </div>
                  </div>

                  <div className="mt-4 flex justify-end gap-4">
                    <Button onClick={() => addOwner()}>Add</Button>
                    <Button onClick={() => setModalShowAddOwner(false)}>Cancel</Button>
                  </div>
                </Dialog.Panel>
              </div>
            </div>
          </Transition.Child>
        </Dialog>
      </Transition>
    </main>
  )
}
