
import { NuxtAuthHandler } from '#auth'
import CredentialsProvider from 'next-auth/providers/credentials'
import type { DefaultSession, DefaultUser } from "next-auth"
import { Api } from '~/utils/api'
import axios, { AxiosError } from 'axios'

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

export default NuxtAuthHandler({
  secret: process.env.AUTH_SECRET,
  pages: {
    signIn: '/auth/login',
    error: '/auth/login',
    signOut: '/auth/login',
    newUser: '/register',
  },
  providers: [
    // @ts-expect-error You need to use .default here for it to work during SSR. May be fixed via Vite at some point
    CredentialsProvider.default({
      // The name to display on the sign in form (e.g. 'Sign in with...')
      name: 'Credentials',
      // The credentials is used to generate a suitable form on the sign in page.
      // You can specify whatever fields you are expecting to be submitted.
      // e.g. domain, username, password, 2FA token, etc.
      // You can pass any HTML attribute to the <input> tag through the object.
      credentials: {
        // email & password
        email: { label: 'email', type: 'email' },
        password: { label: 'password', type: 'password' }
      },
      async authorize (credentials: any, { query }: any) {
        const url = Api.Auth.Login.url()
        console.log('credentials url', url)
        try {
          const data = {
            email: query.email,
            password: query.password
          }
          const response = await axios({
            url,
            method: 'POST',
            data
          })

          console.log('credentials response', response.data)
          
          if (response.status === 200) {
            return {
              ...response.data.user,
              name: response.data?.user?.firstName + ' ' + response.data?.user?.lastName,
              token: response.data?.token,
            }
          } else if (response.data.message == 'User not found') {
            throw new Error('User not found')
          } else {
            if (!response.data.message) throw new Error('An error occurred')
            throw new Error(response.data.message)
          }
        } catch (error) {
          if (error instanceof AxiosError) {
            console.log('credentials response', error.response?.data)
            if (error.response?.data.message == 'User not found') {
              throw new Error('User not found')
            } else if (error.response?.data.message == 'Invalid email or password') {
              throw new Error('Wrong email or password')
            } else {
              console.error(error.response?.data, error)
            }
          } else if (error instanceof Error) {
            console.error(error)
            throw error
          }
          
          throw new Error('An error occurred')
        }

        return null


        // You need to provide your own logic here that takes the credentials
        // submitted and returns either a object representing a user or value
        // that is false/null if the credentials are invalid.
        // NOTE: THE BELOW LOGIC IS NOT SAFE OR PROPER FOR AUTHENTICATION!
        // example avatar images
        const user = {
          id: '1',
          name: 'J Smith',
          email: 'test@mail.com',
          password: 'password',
          avatar: 'https://www.gravatar.com/avatar/',
          role: 'user',
          // role: 'company',
        }
        if (query?.email === user.email && query?.password === user.password) {
          // Any object returned will be saved in `user` property of the JWT
          return user
        } else {
          // eslint-disable-next-line no-console
          console.error('Warning: Malicious login attempt registered, bad credentials provided')
          // If you return null then an error will be displayed advising the user to check their details.
          return null
          // You can also Reject this callback with an Error thus the user will be sent to the error page with the error message as a query parameter
        }
      }
    })
  ],
  callbacks: {
    jwt: async (arg) => {
      const { token, user } = arg
      try {
        if (user) {
          token.data = user
        }
        return token
      } catch (error) {
        throw error
      }
    },
    session: async ({session, token, user}) => {
      try {
        if (token.data) {
          session.user = token.data
        }
        return session
      } catch (error) {
        throw error
      }
    },
  }
})