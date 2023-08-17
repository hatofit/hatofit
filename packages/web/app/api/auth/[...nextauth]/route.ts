import NextAuth from "next-auth"
import CredentialsProvider from "next-auth/providers/credentials"

declare module "next-auth" {
  interface User {
    id: number
    name: string
    email: string
    image: string
  }
}

const handler = NextAuth({
  providers: [
    CredentialsProvider({
      name: "Credentials",
      credentials: {
        username: { label: "Username", type: "text", placeholder: "jsmith" },
        password: { label: "Password", type: "password" }
      },
      async authorize(credentials) {
        const user = { id: 1, name: "J Smith", email: "john@mail.com", image: "https://via.placeholder.com/500" }
        if (user) {
          return user
        }
        return null
      }
    })
  ],
  pages: {
    signIn: "/login",
  },
  session: {
    strategy: "jwt",
  },
  secret: "secret",
  callbacks: {
    jwt({ token, user }) {
      if (user) {
        token.data = user
      }
      return token
    },
    session({ session, token }) {
      if (token.data) {
        session.user = token.data
      }
      return session
    },
    redirect({ url, baseUrl }) {
      console.log("redirect", url, baseUrl)
      return url.startsWith(baseUrl) ? url : baseUrl
    },
    signIn({ user, account, profile, email, credentials }) {
      console.log("signIn", user, account, profile, email, credentials)
      return true
    }
  }
})

export { handler as GET, handler as POST }
