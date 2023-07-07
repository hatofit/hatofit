import { Button } from '@/components/ui'
import Image from 'next/image'
import { FaCalendar, FaClock, FaUserAstronaut } from 'react-icons/fa6'
import { Bar, Line, Scatter, Bubble } from 'react-chartjs-2'
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
  Filler,
} from 'chart.js'
import { HomeMainSection } from '@/app/page/index'

export default function Home() {
  return (
    <main className="flex-1">
      <div className="shadow border-b-2 border-white/[0.2] dark:bg-gray-950/[0.7]">
        <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6">
          <div className="flex justify-between items-center mb-2">
            <h2 className="font-semibold text-2xl">Cardio</h2>
            <div>
              <Button>Share</Button>
            </div>
          </div>
          <div className="flex items-center space-x-3">
            <div className="text-xs text-gray-500 flex">
              <FaCalendar />
              <span className="ml-1">03/06/2023</span>
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
      <HomeMainSection />
    </main>
  )
}
