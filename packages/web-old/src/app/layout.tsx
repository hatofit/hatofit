import './globals.css'
import { Inter } from 'next/font/google'

import useColorMode from '@/lib/use-color-mode'
import ColorModeProvider from '@/components/color-mode-provider'

const inter = Inter({ subsets: ['latin'] })

export const metadata = {
  title: 'Hatofit', // a exercise app
  description: 'your personal trainer assistant',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={`${inter.className} dark dark:bg-gray-950 dark:text-gray-100`}>
        <ColorModeProvider>
          <div className="flex flex-col min-h-screen">
            <div className="shadow border-b-2 border-white/[0.2]">
              <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6">
                <h1 className="text-4xl font-bold">HATOFIT</h1>
              </div>
            </div>
            <div className="flex-1 flex dark:bg-gray-800">
              <div className="flex-1 flex">
                {children}
              </div>
            </div>
            <div className="shadow border-b-2 border-white/[0.2] dark:bg-gray-950/[0.7]">
              <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6">
                <div className="flex justify-between items-center text-gray-400 text-sm">
                  <div>&copy; 2023 Hatofit all rights reserved</div>
                </div>
              </div>
            </div>
          </div>
        </ColorModeProvider>
      </body>
    </html>
  )
}
