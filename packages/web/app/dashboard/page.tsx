import { Card } from "@/components/ui";
import { useEffect } from "react";
import { DashboardSection } from "./section";

async function getDashboardData() {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/auth/dashboard`
  const res = await fetch(url, {
    cache: 'no-cache',
  })

  if (!res.ok) {
    console.log('res', url, res.ok, res.status, res.statusText)
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

export default async function DashboardPage() {
  return (
    <main className="flex-1 flex flex-col">
      <DashboardSection />
    </main>
  )
}
