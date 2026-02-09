import { Api } from "~/utils/api"

export const useCompanyLayout = async () => {
  const $route = useRoute()
  const companyId = computed(() => Number($route.params.companyId as string || '0'))
  if (!companyId.value)  navigateTo('/dashboard/company')
  
  const { data } = await useFetchWithAuth<Api.Company.Company.response>(Api.Company.Company.url(companyId.value))

  return {
    companyId,
    company: data?.value?.company,
  }
}