import { PageProps } from './../../../../../.next/types/app/layout';
import NextAuth, { DefaultUser } from "next-auth"
import Credentials from "next-auth/providers/credentials"


// define User Global types next-auth
declare module "next-auth" {
  export interface User extends DefaultUser {
    id: string
    image?: string

    firstName: string
    lastName: string
    name: string
    email: string
    token: string
  }

  interface Session {
    user: {
      firstName: string
      lastName: string
      name: string
      email: string
    }
  }
}

const login = async (email?: string, password?: string) => {
  const data = {
    success: true,
    message: "User found",
    user: {
      id: "123",
      firstName: "John",
      lastName: "Doe",
      email: "johdonme@mail.com",
      token: "waeaweaweawe",
    },
    token: "waeaweaweawe",
  }
  console.log('DATA', data)
  return data
}

const handler = NextAuth({
  session: {
    strategy: 'jwt',
  },
  providers: [
    Credentials({
      type: "credentials",
      name: "Custom",
      credentials: {
        email: { label: "Email", type: "text", placeholder: "Your email" },
        password: { label: "Password", type: "password" },
      },
      authorize: async (credentials) => {
        const u = await login(credentials?.email, credentials?.password) // login and get user data
        if (!u) return null

        return {
          id: u.user?.id,
          email: u.user?.email,
          firstName: u.user?.firstName,
          lastName: u.user?.lastName,
          name: `${u.user?.firstName} ${u.user?.lastName}`,
          token: u.user?.token,
        }
      },
    })
  ],
  secret: process.env.SECRET || "secret",
  callbacks: {
    jwt: async(data) => {
      const { token, user, account, } = data
      if (account) {
        token.account = {
          ...account,
          token: user.token,
        }
      }
      console.log('jwt', token, user, data)
      return token
    },
    session: async(param) => {
      console.log('SESSION', param)
      return param.session
    },
  }
})

export { handler as GET, handler as POST }
