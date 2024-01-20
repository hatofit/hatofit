'use client'
import { Card, Input, Button } from "@/components/ui"
import { useSession } from "next-auth/react"
import { useCallback, useEffect, useState } from "react"
import dayjs from "dayjs"
import utc from 'dayjs/plugin/utc'
import timezone from 'dayjs/plugin/timezone'
dayjs.extend(utc)
dayjs.extend(timezone)


async function apiGetCompanySetting(token?: string, id?: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}/setting`
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

async function apiPostCompanySetting(token?: string, id?: string, data?: any) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/company/${id}/setting`
  const res = await fetch(url, {
    method: 'POST',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`
    },
    body: JSON.stringify(data)
  })

  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

export default function SettingSection({ params }: any) {
  const { data } = useSession()

  const [vals, setVals] = useState({
    name: "",
    meta: {
      description: "",
      address: "",
    }
  })

  const fetch = useCallback(() => {
    if (data && data?.user) {
      apiGetCompanySetting(data?.user?.token, params.slug)
        .then((res) => {
          setVals({
            name: res?.setting?.name,
            meta: {
              description: res?.setting?.meta?.description,
              address: res?.setting?.meta?.address,
            }
          })
        })
    }
  }, [data, params])

  useEffect(() => {
    fetch()
  }, [fetch, data, params])


  const save = useCallback(async () => {
    const token = data?.user?.token
    const res = await apiPostCompanySetting(token, params.slug, vals)
    window.location.reload()

    // if (re)
  }, [data, fetch, params, vals])

  return (
    <main className="flex-1 flex flex-col">
      <Card.Wrapper>
        <div>
          <Card.HeaderTitle>Setting Page</Card.HeaderTitle>
        </div>
        <div className="flex flex-col gap-4">
          <div className="flex items-center">
            <label className="w-1/4">Name</label>
            <div className="flex-1 flex">
              <Input.Text type="text" placeholder="name" value={vals.name} onChange={(e) => setVals({...vals, name: e.target.value })} />
            </div>
          </div>
          <div className="flex items-center">
            <label className="w-1/4">Description</label>
            <div className="flex-1 flex">
              <Input.Text type="text" placeholder="description" value={vals.meta.description} onChange={(e) => setVals({...vals, meta: { ...vals.meta, description: e.target.value } })} />
            </div>
          </div>
          <div className="flex items-center">
            <label className="w-1/4">Address</label>
            <div className="flex-1 flex">
              <Input.Text type="text" placeholder="address" value={vals.meta.address} onChange={(e) => setVals({...vals, meta: { ...vals.meta, address: e.target.value } })} />
            </div>
          </div>
          <div>
            <div className="flex justify-end">
              <Button onClick={save}>Save</Button>
            </div>
          </div>
        </div>
      </Card.Wrapper>
    </main>
  )
}
