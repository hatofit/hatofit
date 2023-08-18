'use client'
import { useState } from "react"
import { signIn } from "next-auth/react";

export default function LoginForm() {
  const [input, setInput] = useState({
    email: 'viandwicyber@gmail.com',
    password: 'password',
  })

  const login = async () => {
    const http = await signIn("credentials", {
      email: input.email,
      password: input.password,
      callbackUrl: "/dashboard",
      redirect: true,
    })
    console.log(http)
  }

  return (
    <div className="w-[300px] mt-6 flex flex-col gap-4">
      <div className="flex flex-col gap-2">
        <input
          type="email"
          className="w-full py-3 px-5 rounded-lg bg-gray-800 text-gray-100 border-2 border-gray-700 focus:outline-none focus:border-blue-500 transition-all duration-300"
          placeholder="Email address"
          value={input.email}
          onChange={(e) => setInput({ ...input, email: e.target.value })}
        />
        <input
          type="password"
          className="w-full py-3 px-5 rounded-lg bg-gray-800 text-gray-100 border-2 border-gray-700 focus:outline-none focus:border-blue-500 transition-all duration-300"
          placeholder="Password"
          value={input.password}
          onChange={(e) => setInput({ ...input, password: e.target.value })}
        />
      </div>
      <button
        className="transition-all duration-300 cursor-pointer w-full px-5 py-3 text-center font-semibold rounded-lg bg-gray-50 text-gray-800 hover:bg-gray-100"
        onClick={login}
      >
        Login
      </button>
    </div>
  )
}
