'use client'
import { useSession } from "next-auth/react"
import { useEffect } from "react"

export default function AuthCheck() {
  const { data, status } = useSession()

  useEffect(() => {
    console.log('auth', status, data)
  }, [data, status])

  return null
}
