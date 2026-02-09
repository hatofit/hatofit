import type { DefaultSession, DefaultUser } from "next-auth"

interface User extends DefaultUser {
  avatar: string
  role: string
}

declare module 'next-auth' {
  interface User extends DefaultUser {
    avatar: string
    role: string
  }
  interface Session extends DefaultSession {
    user: User
  }
}