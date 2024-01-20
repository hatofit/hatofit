'use client'
import Container from "@/components/layout/container";
import { Link } from "@/components/ui";
import { useSession } from "next-auth/react";
import { useParams, useRouter } from "next/navigation";
import { useCallback, useEffect, useState } from "react";

async function getCompanyDetail(token?: string, id?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}`
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

export default function CompanyJoinPage({ params }: any) {
  const { data } = useSession()
  const router = useRouter()
  const lang = useParams()?.lang

  const [company, setCompany] = useState({
    name: '',
    meta: {
      address: '',
      description: ''
    }
  })

  useEffect(() => {
    getCompanyDetail(data?.user?.token, params?.id)
      .then((res) => setCompany(res?.company || {}))
  }, [data, params])

  const join = useCallback(() => {
    if (!data) {
      return router.push(`/${lang}/login`)
    }
    apiJoinCompany(data?.user?.token, params?.id)
      .then((res) => {
        router.push(`/${lang}/dashboard`)
      })
  }, [data, params])

  return (
    <div className="flex min-h-[calc(100vh_-_72px)] py-4">
      <Container className="flex gap-4">
        <main className="flex-1 flex flex-col justify-center items-center">
          <div className="border border-gray-700 p-6 rounded-lg w-[400px]">
            <div className="text-center text-lg font-bold">Wanna join to this company ?</div>
            <div className="mt-4 text-center">
              <div className="">{company.name}</div>
              <div className="text-sm">{company.meta.description}</div>
              <div className="text-sm">{company.meta.address}</div>
            </div>
            <div className="flex justify-end gap-4 mt-6">
              <button className="px-4 py-2 bg-primary-500 text-white rounded-md" onClick={() => join()}>
                {data ? 'Yes' : 'Login First'}
              </button>
              <Link className="px-4 py-2 bg-gray-800 text-white rounded-md" href="/">
                No
              </Link>
            </div>
          </div>
        </main>
      </Container>
    </div>
  )
}
