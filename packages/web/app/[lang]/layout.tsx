import './globals.scss'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import { Providers } from "./providers"
import Navbar from "@/components/layout/navbar"
import Container from "@/components/layout/container"
import { LoadingBar } from '@/components/loading-bar'
import Head from 'next/head'
import { LangSwitcher } from './_lang'
import { Footer } from '@/components/layout/footer'


const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Hatofit',
  description: 'Hatofit',
}

export default function RootLayout({
  children,
  params,
}: {
  children: React.ReactNode
  params: any
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Providers>
          <LoadingBar />
          <Navbar />
          {children}
          <Footer />
        </Providers>
      </body>
    </html>
  )
}
