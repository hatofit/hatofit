'use client'
import { Card, Input, Button } from "@/components/ui"
import { useSession } from "next-auth/react"
import Link from "next/link"
import { Dialog, Transition } from '@headlessui/react'
import { Fragment, useCallback, useEffect, useState } from "react"

async function getCompaniesCreatedByMe(token?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/create-by-me`
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

async function apiGetAuthCompanyLinked(token?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/auth/company-linked`
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

async function apiCreateNewCompany(token?: string, body?: any) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company`
  const res = await fetch(url, {
    method: 'POST',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify(body)
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

async function apiJoinCompany(token?: string, id?: any) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}/link`
  const res = await fetch(url, {
    method: 'POST',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

async function apiUnlinkCompany(token?: string, id?: any) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/unlink`
  const res = await fetch(url, {
    method: 'POST',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

export function DashboardCompanySection() {
  const { data, status, update } = useSession()
  const [companiesData, setCompaniesData] = useState<any[]>([])
  const [linkedCompany, setLinkedCompany] = useState<any>()

  // modal:create-company
  const [modalCreateCompany, setModalCreateCompany] = useState(false)
  const [modalCreateCompanyData, setModalCreateCompanyData] = useState({
    name: '',
    description: '',
    address: '',
  })

  const fetch = useCallback(() => {
    getCompaniesCreatedByMe(data?.user.token)
      .then((res) => {
        setCompaniesData(res?.companies || [])
      })
    apiGetAuthCompanyLinked(data?.user.token)
      .then((res) => {
        setLinkedCompany(res?.company || undefined)
      })
  }, [data])

  useEffect(() => {
    if (data && data?.user && data?.user?.token) {
      fetch()
    }
  }, [data, fetch])

  const createNewCompany = useCallback(async () => {
    const token = data?.user?.token
    const body = modalCreateCompanyData
    const res = await apiCreateNewCompany(token, body)
    fetch()
    setModalCreateCompany(false)
  }, [data, modalCreateCompanyData, fetch])


  // modal:join-company
  const [modalJoinCompany, setModalJoinCompany] = useState(false)
  const [modalJoinCompanyData, setModalJoinCompanyData] = useState({
    id: '',
  })
  const joinCompany = useCallback(async () => {
    const token = data?.user?.token
    const res = await apiJoinCompany(token, modalJoinCompanyData.id)
    fetch()
    setModalJoinCompany(false)
  }, [data, modalJoinCompanyData, fetch])
  const unlinkCompany = useCallback(async () => {
    const token = data?.user?.token
    const res = await apiUnlinkCompany(token)
    fetch()
  }, [data, fetch])

  return (
    <>
      <Card.Wrapper className="flex flex-col mb-4">
        <div className="flex justify-between">
          <Card.HeaderTitle>Linked Company</Card.HeaderTitle>
          <div>
            {(!(linkedCompany && linkedCompany?.name)) && (
              <Button onClick={() => setModalJoinCompany(true)} className="text-xs px-2 py-1">Join</Button>
            )}
            {((linkedCompany && linkedCompany?.name)) && (
              <Button onClick={() => unlinkCompany()} className="text-xs px-2 py-1">Unlink</Button>
            )}
          </div>
        </div>
        <div className="flex flex-col gap-2">
          {(linkedCompany && linkedCompany?.name) && (
            <div>
              Your account is linked to "{linkedCompany?.name}" Company.
            </div>
          )}
          {!(linkedCompany && linkedCompany?.name) && (
            <span className="text-gray-500">Your account doesnt linked to any company, click "Join" to start link.</span>
          )}
        </div>
      </Card.Wrapper>

      <Card.Wrapper className="flex flex-col">
        <div className="flex justify-between">
          <Card.HeaderTitle>Company Management</Card.HeaderTitle>
          <div>
            <Button onClick={() => setModalCreateCompany(true)} className="text-xs px-2 py-1">Create</Button>
          </div>
        </div>
        <div className="flex flex-col gap-2">
          {companiesData.map((item, index) => (
            <Link href={`/dashboard/company/${item._id}`} key={index} className="flex flex-col border border-gray-700 px-4 py-2 rounded hover:bg-gray-700 cursor-pointer">
              <div className="text-sm">{item?.name}</div>
              <div className="text-xs text-gray-100">
                {item?.meta?.description}
              </div>
            </Link>
          ))}
          {companiesData.length === 0 && (
            <div className="text-gray-500">No company found to your manage, create new company if you want manage a company.</div>
          )}
        </div>
      </Card.Wrapper>

      <Transition show={modalCreateCompany} as={Fragment}>
        <Dialog onClose={() => setModalCreateCompany(false)}>
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
                  <Dialog.Title className="text-xl font-semibold mb-4">Create new company</Dialog.Title>
                  <div className="flex flex-col w-full mb-6 gap-4">
                    <div className="flex">
                      <Input.Text
                        type="text"
                        placeholder="Company Name"
                        value={modalCreateCompanyData.name}
                        onChange={(e) => setModalCreateCompanyData(prev => ({ ...prev, name: e.target.value }))}
                      />
                    </div>
                    <div className="flex">
                      <Input.Text
                        type="text"
                        placeholder="Description"
                        value={modalCreateCompanyData.description}
                        onChange={(e) => setModalCreateCompanyData(prev => ({ ...prev, description: e.target.value }))}
                      />
                    </div>
                    <div className="flex">
                      <Input.Text
                        type="text"
                        placeholder="Address"
                        value={modalCreateCompanyData.address}
                        onChange={(e) => setModalCreateCompanyData(prev => ({ ...prev, address: e.target.value }))}
                      />
                    </div>
                  </div>

                  <div className="mt-4 flex justify-end gap-4">
                    <Button onClick={() => createNewCompany()}>Create</Button>
                    <Button onClick={() => setModalCreateCompany(false)}>Cancel</Button>
                  </div>
                </Dialog.Panel>
              </div>
            </div>
          </Transition.Child>
        </Dialog>
      </Transition>

      <Transition show={modalJoinCompany} as={Fragment}>
        <Dialog onClose={() => setModalJoinCompany(false)}>
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
                  <Dialog.Title className="text-xl font-semibold mb-4">Join to company</Dialog.Title>
                  <div className="flex flex-col w-full mb-6 gap-4">
                    <div className="flex">
                      <Input.Text
                        type="text"
                        placeholder="Company Id"
                        value={modalJoinCompanyData.id}
                        onChange={(e) => setModalJoinCompanyData(prev => ({ ...prev, id: e.target.value }))}
                      />
                    </div>
                  </div>

                  <div className="mt-4 flex justify-end gap-4">
                    <Button onClick={() => joinCompany()}>Join</Button>
                    <Button onClick={() => setModalJoinCompany(false)}>Cancel</Button>
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
