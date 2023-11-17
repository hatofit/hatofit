import { Button } from '@/components/ui'
import { FaCalendar, FaClock, FaUserAstronaut } from 'react-icons/fa6'
import { ReportMainSection } from './section'
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
import { useEffect, useMemo } from 'react';
import ReportSection from './report'

dayjs.extend(dayjsutc)

async function getReportData(slug: string) {
  const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/report/${slug}`
  const res = await fetch(url, {
    cache: 'no-cache',
  })

  if (!res.ok) {
    // This will activate the closest `error.js` Error Boundary
    throw new Error('Failed to fetch data')
  }

  return (await res.json())
}

export default async function Page({ params }: { params: { slug: string } }) {
  const reportData = await getReportData(params.slug)

  return (
    <main className="flex-1">
      <ReportSection reportData={reportData} />
    </main>
  )
}
