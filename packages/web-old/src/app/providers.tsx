import { ThemeProvider } from "next-themes"

export default function Providers(props: { children: React.ReactNode }) {
  return (
    <ThemeProvider attribute="class" defaultTheme="dark">
      {props.children}
    </ThemeProvider>
  )
}
