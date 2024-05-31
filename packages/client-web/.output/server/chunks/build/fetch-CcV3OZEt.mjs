import { h as useAuth } from './server.mjs';
import { g as getApiUrl } from './api-CRdpv7Tu.mjs';

const $fetchWithAuth = (urlStr, opts = {}) => {
  var _a, _b;
  const $auth = useAuth();
  return $fetch(urlStr, {
    baseURL: getApiUrl(),
    headers: {
      Authorization: `Bearer ${((_b = (_a = $auth.data.value) == null ? void 0 : _a.user) == null ? void 0 : _b.token) || ""}`
    },
    ...opts
  });
};

export { $fetchWithAuth as $ };
//# sourceMappingURL=fetch-CcV3OZEt.mjs.map
