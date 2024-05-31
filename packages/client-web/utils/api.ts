import { type FetchResponse } from 'ofetch'

export const getApiUrl = (path: string = '') => {
  const $config = useRuntimeConfig()
  let baseUrl = $config.public.api.baseUrl || ''

  let schema = 'http'
  // find from baseUrl if have http or https
  if (baseUrl.includes('https://')) {
    schema = 'https'
  }
  // remove http or https from baseUrl
  baseUrl = baseUrl.replace(/https?:\/\//, '')

  const route = baseUrl.split('/')
  // path split / and merge with route split /
  route.push(...path.split('/'))
  // remove if have empty string
  return schema + '://' + route.filter(Boolean).join('/')
}

export namespace Api {
  // DATA MODEL
  export namespace DataModel {
    export interface BaseResponse {
      success: boolean
      message: string
    }
    export namespace Auth {
      export interface User {
        metricUnits: {
          energyUnits: string
          weightUnits: string
          heightUnits: string
        }
        email: string
        firstName: string
        lastName: string
      }
      export interface Dashboard {
        widgets: {
          name: string
          value: string
        }[]
      }
      export interface Delete {
        user: {
          _id: string
        }
      }
    }
    export namespace Session {
      export interface All {
        sessions: {
          _id: string
          userId: string
          startTime: number
          endTime: number
          createdAt: string

          timelines: {
            _id: string
            name: string
            startTime: number
          }[]

          data: {
            _id: string
            second: number
            timeStamp: number
            devices: {
              _id: string
              type: string
              identifier: string
              value: any
            }[]
          }[]

          withoutExercise: boolean

          exercise?: {
            _id: string,
            name: string,
          }
        }[]
      }
    }
    export namespace Report {
      export interface Get {
        report: {
          startTime: number
          endTime: number
          devices: {
            name: string
            identifier: string
          }[]
          reports: {
            type: string
            data: {
              device: string
              value: any
            }[]
          }[]
        }
        exercise: {
          _id: string
          name: string
        }
      }
    }
    export namespace Company {
      export interface Company {
        company: {
          id: string
          _id: string
          name: string
          description: string
          address: string
        }
      }
      export interface Companies {
        companies: Api.DataModel.Company.Company['company'][]
      }
      export interface Member {
        member: {
          _id: string
          email: string
          firstName: string
          lastName: string
          createdAt: string
        }
      }
      export interface Members {
        members: Api.DataModel.Company.Member['member'][]
      }
    }
  }


  // API
  export namespace Auth {
    export namespace Login {
      export const url = () => getApiUrl('/auth/login')
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Auth.User
    }
    export namespace Dashboard {
      export const url = () => getApiUrl('/auth/dashboard')
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Auth.Dashboard
    }
    export const logout = '/auth/logout'

    export namespace Register {
      export const url = () => getApiUrl('/auth/register')
      export const parseData = (
        data: {
          "email": string
          "password": string
          "confirmPassword": string
          "firstName": string
          "lastName": string
          "dateOfBirth": string
          "gender": string
          "weight": number
          "height": number
          "metricUnits": {
            "energyUnits": string
            "weightUnits": string
            "heightUnits": string
          }
        }
      ) => ({ ...data })
      export type response = Api.DataModel.BaseResponse
    }
    
    export namespace Delete {
      export const url = () => getApiUrl('/auth/delete')
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Auth.Delete
    }

    export namespace ForgotPasswordSendOTP {
      export const url = (email: string) => getApiUrl('/auth/forgot-password/' + email)
      export type response = Api.DataModel.BaseResponse
    }

    export namespace ForgotPasswordVerifyOTP {
      export const url = () => getApiUrl('/auth/forgot-password-verify')
      export type response = Api.DataModel.BaseResponse
      export const parseData = (
        data: {
          "email": string
          "code": string
        }
      ) => ({ ...data })
    }

    export namespace ForgotPasswordReset {
      export const url = () => getApiUrl('/auth/forgot-password-reset')
      export type response = Api.DataModel.BaseResponse
      export const parseData = (
        data: {
          "email": string
          "code": string
          "password": string
        }
      ) => ({ ...data })
    }
  }
  export namespace Session {
    export namespace All {
      export const url = () => getApiUrl('/session')
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Session.All
    }
  }
  export namespace Report {
    export namespace Get {
      export const url = (id: string) => getApiUrl(`/report/${id}`)
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Report.Get
    }
  }
  export namespace User {
    export namespace RequestDelete {
      export const url = () => getApiUrl('/user/request-delete')
      export type response = Api.DataModel.BaseResponse
      export const parseData = (
        data: {
          "code"?: string
          "email"?: string
        }
      ) => ({ ...data })
    }
  }
  export namespace Company {
    export namespace Company {
      export const url = (id: number) => getApiUrl('/company/' + id)
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Company.Company
    }
    export namespace Join {
      export const url = () => getApiUrl('/company/join')
      export type response = Api.DataModel.BaseResponse
    }
    export namespace Leave {
      export const url = () => getApiUrl('/company/leave')
      export type response = Api.DataModel.BaseResponse
    }
    export namespace Companies {
      export const url = () => getApiUrl('/company')
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Company.Companies
    }
    export namespace CreateCompany {
      export const url = () => getApiUrl('/company')
      export type response = Api.DataModel.BaseResponse
      export const parseData = (
        data: {
          "name": string
          "description": string
          "address": string
        }
      ) => ({ ...data })
    }
    export namespace UpdateCompany {
      export const url = (id: number) => getApiUrl('/company/' + id)
      export type response = Api.DataModel.BaseResponse
      export const parseData = (
        data: {
          "name": string
          "description": string
          "address": string
        }
      ) => ({ ...data })
    }
    export namespace Members {
      export const url = (companyId: number) => getApiUrl(`/company/${companyId}/member`)
      export type response = Api.DataModel.BaseResponse & Api.DataModel.Company.Members
    }
  }
}

export const parseErrorFromResponse = (response: FetchResponse<any>): [boolean, string] => {
  const data = response._data
  
  let isError: boolean = false
  let message: string = 'Unknown error'

  if (data && data.success === false) {
    isError = true
    message = data.message || 'Unknown error'
  }
  
  return [isError, message] 
}

export const parseErrorFromResponseWithToast = (response: FetchResponse<any>): [boolean, string] => {
  const $toast = useToast()
  const [isError, message] = parseErrorFromResponse(response)
  if (isError) {
    $toast.add({
      title: 'Error',
      description: message,
    })
  }
  return [isError, message]
}