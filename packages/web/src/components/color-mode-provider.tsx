'use client'
import useColorMode from '@/lib/use-color-mode'
import React, { useEffect } from 'react'

export default function ColorModeProvider(props: { children: React.ReactNode }) {
  const [colorMode] = useColorMode()
  return (
    <>
      {props.children}
    </>
  )
}
