import { createTranslation } from '@/i18n/server'
import Link from 'next/link'

export default async function Home({ params: { lang }}: { params: { lang: string } }) {
  const { t } = await createTranslation(lang)

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
          {t('index.description')}
        </div>
        <div className="mt-6 flex gap-3">
          <Link href="/register" className="transition-all duration-300 cursor-pointer px-7 py-3 leading-loose text-base text-center font-semibold rounded-lg bg-primary-500 text-gray-300 hover:bg-primary-600">{t('index.start')}</Link>
          <Link href="/login" className="transition-all duration-300 cursor-pointer px-7 py-3 leading-loose text-base text-center font-semibold rounded-lg bg-gray-100 text-gray-700 hover:bg-gray-300">{t('index.login')}</Link>
        </div>
      </section>
    </main>
  )
}
