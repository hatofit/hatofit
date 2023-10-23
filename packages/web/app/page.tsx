import Image from 'next/image'
import Link from 'next/link'

export default function Home() {
  return (
    <main className="flex text-gray-800 dark:text-gray-200">
      <section className="w-full flex flex-col items-center justify-center min-h-[calc(100vh_-_72px)] pb-[72px]">
        <h1 className="flex text-7xl relative">
          <span
            className="animated-text-bg drop-shadow-xl font-bold text-gray-100 relative"
            style={{
              '--content': 'Fit',
              '--start-color': '#007CF0',
              '--end-color': '#00DFD8',
              // '--animation-name': 'anim-fg-1'
            } as React.CSSProperties}
          >
            <span className="animated-text-fg">Fit</span>
          </span>
          <span className="mr-2">.</span>
          <span
            className="animated-text-bg drop-shadow-xl font-bold text-gray-100 relative"
            style={{
              '--content': 'Healthy',
              '--start-color': '#7928CA',
              '--end-color': '#FF0080',
              // '--animation-name': 'anim-fg-2'
            } as React.CSSProperties}
          >
            <span className="animated-text-fg">Healthy</span>
          </span>
          <span className="mr-2">.</span>
          <span
            className="animated-text-bg drop-shadow-xl font-bold text-gray-100 relative"
            style={{
              '--content': 'Energized',
              '--start-color': '#FF4D4D',
              '--end-color': '#F9CB28',
              // '--animation-name': 'anim-fg-3'
            } as React.CSSProperties}
          >
            <span className="animated-text-fg">Energized</span>
          </span>
        </h1>
        <div className="w-[500px] text-center mt-6 text-gray-400">
          Hatofit is a platform that helps you to be fit and healthy, help you to track and monitoring your health.
        </div>
        <div className="mt-6 flex gap-3">
          <Link href="/register" className="transition-all duration-300 cursor-pointer px-7 py-3 leading-loose text-base text-center font-semibold rounded-lg bg-blue-500 text-gray-300 hover:bg-blue-600">Start Now</Link>
          <Link href="/login" className="transition-all duration-300 cursor-pointer px-7 py-3 leading-loose text-base text-center font-semibold rounded-lg bg-gray-100 text-gray-700 hover:bg-gray-300">Login</Link>
        </div>
      </section>
    </main>
  )
}
