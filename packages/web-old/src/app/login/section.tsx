'use client'

import { setCookie } from "cookies-next";
import { useRouter } from "next/navigation";
import { useState } from "react";
import axios from 'axios'

export function LoginSection() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const router = useRouter();

  const handleLogin = async () => {
    try {
      const url = `${process.env.NEXT_PUBLIC_API_BASE_URL}/api/auth/login`
      console.log(url)
      const response = await axios({
        method: "POST",
        url,
      });

      // Token berhasil diterima dari API
      const { token } = response.data;

      // Simpan token di cookie
      setCookie("jwt", token, {
        maxAge: 60 * 60 * 24, // Set durasi cookie sesuai kebutuhan
        path: "/", // Sesuaikan dengan path aplikasi Anda
      });

      // Redirect ke halaman setelah login berhasil
      router.push("/");
    } catch (error) {
      console.error("Gagal login", error);
    }
  }

  return (
    <div className="mt-6">
      <div className="flex flex-col max-w-screen-lg w-full mx-auto py-6">
        <div className="rounded bg-gray-950">
          <div className="p-4 flex flex-col gap-2">
            <div>
              <label className="block text-sm font-medium text-gray-400">Email</label>
              <input
                type="text"
                className="mt-1 block w-full px-4 py-2 rounded-md bg-gray-800 border-transparent focus:border-gray-500 focus:bg-gray-700 focus:ring-0"
                placeholder="Email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-400">Password</label>
              <input
                type="password"
                className="mt-1 block w-full px-4 py-2 rounded-md bg-gray-800 border-transparent focus:border-gray-500 focus:bg-gray-700 focus:ring-0"
                placeholder="Password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
              />
            </div>
            <div className="flex justify-end items-center">
              <button
                className="bg-gray-700 hover:bg-gray-600 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline"
                onClick={() => handleLogin()}
              >
                Login
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
