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
}