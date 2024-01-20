import axios from "axios"
import { useSession } from "next-auth/react"
import { useEffect, useState } from "react"

export function useApiService({
  defaultData,
  body,
}: {
  defaultData?: any,
  body: any,
}) {
  const [isLoading, setIsLoading]  = useState(false)
  const session = useSession()
  const [data, setData] = useState<any>(defaultData)

  const fetch = async () => {
    setIsLoading(false)

    // fetch
    const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/report/share`
    const { status, data } = await axios({
      method: "POST",
      url,
      data: body,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': `Bearer ${session.data?.user.token}`
      }
    })

    try {

    } catch (error) {

    }

    setIsLoading(true)
  }

  useEffect(() => {
    fetch()
  }, [])

  return {
    isLoading,
    fetch,
    session,
  }
}
