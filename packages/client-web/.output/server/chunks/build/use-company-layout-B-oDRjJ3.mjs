import { i as useRoute, n as navigateTo } from './server.mjs';
import { computed } from 'vue';
import { u as useFetchWithAuth } from './use-fetch-with-auth-N9InCXnT.mjs';
import { A as Api } from './api-DoRhrA3A.mjs';

const useCompanyLayout = async () => {
  var _a;
  const $route = useRoute();
  const companyId = computed(() => Number($route.params.companyId || "0"));
  if (!companyId.value)
    navigateTo("/dashboard/company");
  const { data } = await useFetchWithAuth(Api.Company.Company.url(companyId.value));
  return {
    companyId,
    company: (_a = data == null ? void 0 : data.value) == null ? void 0 : _a.company
  };
};

export { useCompanyLayout as u };
//# sourceMappingURL=use-company-layout-B-oDRjJ3.mjs.map
