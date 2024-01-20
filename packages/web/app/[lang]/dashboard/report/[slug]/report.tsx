'use client'
import { Button } from '@/components/ui'
import { FaCalendar, FaClock, FaUserAstronaut } from 'react-icons/fa6'
import { ReportMainSection } from './section'
import dayjs from 'dayjs'
import dayjsutc from 'dayjs/plugin/utc'
import { useCallback, useEffect, useMemo, useState } from 'react';
import { Icon } from '@iconify/react'
import Link from 'next/link'
import { useSession } from 'next-auth/react'

dayjs.extend(dayjsutc)

export default function ReportSection({ reportData }: { reportData: any }) {
  const { data } = useSession()

  const copyLink = () => {
    navigator.clipboard.writeText(window.location.href)
    alert('Link copied to clipboard')
  }

  const [backUrl, setBackUrl] = useState<string>()
  const getBackUrl = () => {
    const urlparam = new URLSearchParams(window.location.search)
    if (urlparam.get('back')) return urlparam.get('back') as string
    return (data?.user?.id === reportData?.user?._id ? `/dashboard/exercise` : `/dashboard/shared-exercise`)
  }

  useEffect(() => {
    console.log('reportData', reportData)
    if (window) {
      setBackUrl(getBackUrl())
    }
  }, [])

  return (
    <>
      <div className="shadow border-b-2 border-white/[0.2] dark:bg-gray-950/[0.7]">
        <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6 px-6">
          <div className="flex justify-between items-center mb-2">
            <div>
              <Link href={backUrl || getBackUrl()} className="text-xs flex items-center mb-2">
                <Icon icon="uil:arrow-left" className="text-lg" />
                <span>back</span>
              </Link>
              <h2 className="font-semibold text-2xl">{reportData?.exercise?.name}</h2>
            </div>
            {/* <div>
              <Button onClick={() => copyLink()}>Share</Button>
            </div> */}
          </div>
          <div className="flex items-center space-x-3">
            <div className="text-xs text-gray-500 flex">
              <FaCalendar />
              <span className="ml-1">{dayjs.utc(reportData?.report?.startTime).local().format('DD MMMM YYYY')}</span>
            </div>
            <div className="text-xs text-gray-500 flex items-center">
              <FaClock />
              <span className="ml-1">
                {dayjs.utc(reportData?.report?.startTime).local().format('HH:mm:ss')}
              </span>
            </div>
            <div className="text-xs text-gray-500 flex items-center">
              <FaUserAstronaut />
              <span className="ml-1">{reportData?.user?.firstName} {reportData?.user?.lastName}</span>
            </div>
          </div>
        </div>
      </div>
      <ReportMainSection data={reportData} />
    </>
  )
}
