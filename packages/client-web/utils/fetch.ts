export const $fetchWithAuth = <T>(urlStr: string, opts: object = {}) => {
  const $auth = useAuth()
  return $fetch<T>(urlStr, {
    baseURL: getApiUrl(),
    headers: {
      Authorization: `Bearer ${($auth.data.value?.user as any)?.token || ''}`,
    },
    ...opts,
  })
}