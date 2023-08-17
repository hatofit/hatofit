'use client'
import React, { useEffect } from 'react'
import useLocalStorage from '@/lib/use-local-storage'

const useColorMode = (): [string, React.Dispatch<React.SetStateAction<string>>] => {
  const [colorMode, setColorMode] = useLocalStorage<string>("color-mode", "dark")

  useEffect(() => {
    const className = "dark"
    const bodyClasses = window.document.body.parentElement?.classList
    colorMode === "dark" ? bodyClasses?.add(className) : bodyClasses?.remove(className)
  }, [colorMode])

  return [colorMode, setColorMode]
}

export default useColorMode
