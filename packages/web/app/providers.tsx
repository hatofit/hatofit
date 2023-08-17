'use client'

import { ThemeProvider } from 'next-themes';
import { CacheProvider } from '@chakra-ui/next-js'
import { ChakraProvider, ColorModeScript, useColorMode, useTheme } from '@chakra-ui/react'
import { useDarkMode } from '@/hooks/use-dark-mode'
import { useEffect, useMemo, useState } from "react";
import { SessionProvider } from "next-auth/react"
// import theme from './theme'

export function Providers({
  children
}: {
  children: React.ReactNode
}) {
  const { systemTheme, theme, setTheme } = useTheme()
  const [mounted, setMounted] = useState(false)

  const currentTheme = useMemo(() => theme === 'system' ? systemTheme : theme, [theme, systemTheme])

  useEffect(() => {
    setMounted(true)
    if (currentTheme === 'dark') {
      window.document.body.parentElement?.classList.add('dark')
    } else {
      window.document.body.parentElement?.classList.remove('dark')
    }
  }, [])

  if (!mounted) return null

  // const { colorMode, toggleColorMode } = useColorMode()

  // useEffect(() => {
  //   console.log('colorMode', colorMode)
  //   if (colorMode === 'dark') {
  //     window.document.body.parentElement?.classList.add('dark')
  //   } else {
  //     window.document.body.parentElement?.classList.remove('dark')
  //   }
  // }, [colorMode])

  return (
    <SessionProvider>
      <ThemeProvider enableSystem={true} attribute="class">
        {children}
      </ThemeProvider>
    </SessionProvider>
  )
}
