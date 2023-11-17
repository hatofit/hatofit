import { LangSwitcher } from "@/app/[lang]/_lang"
import Container from "./container"

export const Footer = () => {
  return (
    <div className="border-t border-gray-700">
      <Container className="flex items-center h-full justify-between py-4">
        <div>
          &copy; 2023 Hatofit
        </div>
        <div>
          <LangSwitcher />
        </div>
      </Container>
    </div>
  )
}
