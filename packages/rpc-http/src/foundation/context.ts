export default {
  contexts: {} as {
    [key: string]: any
  },
  get<T>(name: string, defaultValue?: any): T {
    return (this.contexts[name] || defaultValue) as T
  },
  set(name: string, value: any) {
    this.contexts[name] = value
  },
}

export interface Context {
  get<T>(name: string, defaultValue?: any): T
  set(name: string, value: any): void
}