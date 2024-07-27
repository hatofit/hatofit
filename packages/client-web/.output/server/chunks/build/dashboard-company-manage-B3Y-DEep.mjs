import { _ as _sfc_main$1 } from './Dashboard-tJcJnLVk.mjs';
import { _ as _sfc_main$2 } from './BannerCard-DLVc_2If.mjs';
import { i as useRoute, n as navigateTo, e as __nuxt_component_3 } from './server.mjs';
import { defineComponent, computed, withAsyncContext, unref, mergeProps, withCtx, createVNode, renderSlot, useSSRContext } from 'vue';
import { u as useFetchWithAuth } from './use-fetch-with-auth-N9InCXnT.mjs';
import { ssrRenderComponent, ssrRenderSlot } from 'vue/server-renderer';
import { A as Api } from './api-DoRhrA3A.mjs';
import './DefaultPage-Bm5mdKYg.mjs';
import './Container-BAnrzuKK.mjs';
import 'tailwind-merge';
import './nuxt-img-BJdlAb4P.mjs';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './Dropdown-lhX-bojE.mjs';
import './Kbd-CWGxBI2b.mjs';
import './id-CT9Cm1Vi.mjs';
import './tabs-B_zyHFOf.mjs';
import './usePopper-C-zM4LTl.mjs';
import './ButtonColorMode-jPH1DJjw.mjs';
import './SelectMenu-C_ltIwuW.mjs';
import '@tanstack/vue-virtual';
import './active-element-history-DcQBj1iE.mjs';
import '@vueuse/core';
import './useFormGroup-4DdrZmPB.mjs';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'devalue';
import '@unhead/ssr';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "dashboard-company-manage",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const $route = useRoute();
    const companyId = computed(() => Number($route.params.companyId || "0"));
    if (!companyId.value)
      navigateTo("/dashboard/company");
    const { data, pending } = ([__temp, __restore] = withAsyncContext(() => useFetchWithAuth(Api.Company.Company.url(companyId.value))), __temp = await __temp, __restore(), __temp);
    const prefix = computed(() => `/dashboard/company/${$route.params.companyId}/manage`);
    const links = computed(() => [
      [
        {
          label: "Home",
          icon: "i-heroicons-command-line",
          to: `${prefix.value}`
        }
      ],
      [
        {
          label: "Exercises",
          icon: "i-material-symbols-light-exercise-outline",
          to: `${prefix.value}/exercise`
        },
        {
          label: "Programs",
          icon: "i-heroicons-calendar",
          to: `${prefix.value}/program`
        }
      ],
      [
        {
          label: "Members",
          icon: "i-heroicons-user-group",
          to: `${prefix.value}/member`
        },
        {
          label: "Setting",
          icon: "i-heroicons-user",
          to: `${prefix.value}/setting`
        }
      ]
    ]);
    return (_ctx, _push, _parent, _attrs) => {
      const _component_BaseLayoutDashboard = _sfc_main$1;
      const _component_DashboardCompanyBannerCard = _sfc_main$2;
      const _component_UButton = __nuxt_component_3;
      if (unref(data)) {
        _push(ssrRenderComponent(_component_BaseLayoutDashboard, mergeProps({ links: unref(links) }, _attrs), {
          "dashboard-header": withCtx((_, _push2, _parent2, _scopeId) => {
            var _a, _b;
            if (_push2) {
              _push2(ssrRenderComponent(_component_DashboardCompanyBannerCard, {
                company: (_a = unref(data)) == null ? void 0 : _a.company,
                class: "mb-8"
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(`<div class="absolute z-10 top-0 left-0 m-4"${_scopeId2}>`);
                    _push3(ssrRenderComponent(_component_UButton, {
                      icon: "i-heroicons-arrow-left",
                      label: "Back",
                      variant: "solid",
                      to: `/dashboard/company/${unref($route).params.companyId}`
                    }, null, _parent3, _scopeId2));
                    _push3(`</div>`);
                  } else {
                    return [
                      createVNode("div", { class: "absolute z-10 top-0 left-0 m-4" }, [
                        createVNode(_component_UButton, {
                          icon: "i-heroicons-arrow-left",
                          label: "Back",
                          variant: "solid",
                          to: `/dashboard/company/${unref($route).params.companyId}`
                        }, null, 8, ["to"])
                      ])
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
            } else {
              return [
                createVNode(_component_DashboardCompanyBannerCard, {
                  company: (_b = unref(data)) == null ? void 0 : _b.company,
                  class: "mb-8"
                }, {
                  default: withCtx(() => [
                    createVNode("div", { class: "absolute z-10 top-0 left-0 m-4" }, [
                      createVNode(_component_UButton, {
                        icon: "i-heroicons-arrow-left",
                        label: "Back",
                        variant: "solid",
                        to: `/dashboard/company/${unref($route).params.companyId}`
                      }, null, 8, ["to"])
                    ])
                  ]),
                  _: 1
                }, 8, ["company"])
              ];
            }
          }),
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              ssrRenderSlot(_ctx.$slots, "default", {}, null, _push2, _parent2, _scopeId);
            } else {
              return [
                renderSlot(_ctx.$slots, "default")
              ];
            }
          }),
          _: 3
        }, _parent));
      } else {
        _push(`<!---->`);
      }
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("layouts/dashboard-company-manage.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=dashboard-company-manage-B3Y-DEep.mjs.map
