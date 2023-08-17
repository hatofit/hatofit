import { SessionProvider } from "next-auth/react"
import { ThemeProvider } from "next-themes"
import { AppProps } from "next/app"

export default function HatofitApp({ Component, pageProps }: AppProps) {
  return (
    <ThemeProvider attribute="class" defaultTheme="dark">
      <SessionProvider session={pageProps?.session}>
        <Component {...pageProps} />
      </SessionProvider>
    </ThemeProvider>
  )
}
