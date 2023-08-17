import Container from "@/components/layout/container";
import Sidebar from "./sidebar";

export default function DashboardPage() {
  return (
    <main className="flex min-h-[calc(100vh_-_72px)] py-4">
      <Container className="flex gap-4">
        <Sidebar />
        <div className="flex-1">
          <div className="bg-gray-800 rounded-lg shadow-lg p-4">
            Welcome to dashboard
          </div>
        </div>
      </Container>
    </main>
  )
}
