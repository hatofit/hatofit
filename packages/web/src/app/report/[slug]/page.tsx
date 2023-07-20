'use client';
import { Button } from '@/components/ui'
import { FaCalendar, FaClock, FaUserAstronaut } from 'react-icons/fa6'
import { ReportMainSection } from './section'
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
import { useEffect, useMemo } from 'react';

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

  const dataDate = dayjs.unix(reportData?.report?.startTime)

  const copyLink = () => {
    navigator.clipboard.writeText(window.location.href)
    console.log(reportData?.report?.startTime, dayjs.unix(reportData?.report?.startTime).format('DD MMMM YYYY'))
    alert('Link copied to clipboard')
  }

  return (
    <main className="flex-1">
      <div className="shadow border-b-2 border-white/[0.2] dark:bg-gray-950/[0.7]">
        <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6">
          <div className="flex justify-between items-center mb-2">
            <h2 className="font-semibold text-2xl">{reportData?.exercise?.name}</h2>
            <div>
              <Button onClick={() => copyLink()}>Share</Button>
            </div>
          </div>
          <div className="flex items-center space-x-3">
            <div className="text-xs text-gray-500 flex">
              <FaCalendar />
              <span className="ml-1">{reportData?.report?.startTime}</span>
            </div>
            <div className="text-xs text-gray-500 flex items-center">
              <FaClock />
              <span className="ml-1">17:39</span>
            </div>
            <div className="text-xs text-gray-500 flex items-center">
              <FaUserAstronaut />
              <span className="ml-1">viandwi24</span>
            </div>
          </div>
        </div>
      </div>
      <ReportMainSection data={reportData} />
    </main>
  )
}
