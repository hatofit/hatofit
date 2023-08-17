import { useRouter } from "next/router";
import { useState } from "react";
import { LoginSection } from "./section";

export default async function LoginPage({ params }: { params: { slug: string } }) {
  return (
    <main className="flex-1">
      <div className="shadow border-b-2 border-white/[0.2] dark:bg-gray-950/[0.7]">
        <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6">
          <div className="flex justify-between items-center mb-2">
            <h2 className="font-semibold text-2xl">LOGIN</h2>
          </div>
        </div>
      </div>

      <LoginSection />
    </main>
  )
}
