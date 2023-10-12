'use client'
import NextNProgress from 'nextjs-progressbar'

export function LoadingBar() {
  return <NextNProgress
    height={100}
    color="red"
    stopDelayMs={5000}
    options={{ easing: 'ease', speed: 500 }}
  />
}
