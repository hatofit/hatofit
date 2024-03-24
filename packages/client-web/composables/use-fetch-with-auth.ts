export const useFetchWithAuth = <T>(urlStr: string, opts: object = {}) => {
  const $auth = useAuth()
  return useFetch<T>(urlStr, {
    baseURL: getApiUrl(),
    headers: {
      Authorization: `Bearer ${($auth.data.value?.user as any)?.token || ''}`,
    },
    ...opts,
  })
}