import jwt from 'jsonwebtoken'
import { exceptObjectProp } from '../utils/obj'
import { User } from '../db'

// middlewares
// auth:jwt middleware
export interface RequestAuth {
  user: {
    _id: string
    email: string
  }
  token: string
}
export const AuthJwtMiddleware = async (req: any, res: any, next: any) => {
  let token: string | undefined = undefined
  if (req.headers['authorization'] as string) {
    token = (req.headers['authorization'] as string).split(' ')[1]
  } else if (req.query.token) {
    token = req.query.token as string
  }

  if (!token) {
    return res.status(401).json({
      success: false,
      message: 'Unauthorized',
      errorCode: 'auth.unauthorized'
    })
  }

  try {
    const jwtSecret = process.env.JWT_SECRET_KEY || 'polar'
    const decoded = jwt.verify(token, jwtSecret) as any
    const found = await User.findById(decoded.id)
    if (!found) {
      return res.status(404).json({
        success: false,
        message: 'User not found',
        errorCode: 'auth.user_not_found'
      })
    }

    req.auth = {
      user: exceptObjectProp(found.toObject(), ['password']),
      token,
    } as RequestAuth

    next()

  } catch (error) {
    return res.status(400).json({
      success: false,
      message: 'Invalid token',
      errorCode: 'auth.unauthorized.invalid_token'
    })
  }
}
