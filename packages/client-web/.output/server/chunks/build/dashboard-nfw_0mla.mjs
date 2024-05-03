import { _ as _sfc_main$1 } from './Dashboard-BwcKMaMj.mjs';
import { i as useRoute, h as useAuth } from './server.mjs';
import { defineComponent, mergeProps, withCtx, renderSlot, useSSRContext } from 'vue';
import { ssrRenderComponent, ssrRenderSlot } from 'vue/server-renderer';
import './DefaultPage-CqeWAvFV.mjs';
import './Container-BL9-rOfc.mjs';
import 'tailwind-merge';
import './nuxt-img-DTLp32d8.mjs';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './Dropdown-CcLYNkkJ.mjs';
import './id-C5IKnQCN.mjs';
import './usePopper-BvwpwiAU.mjs';
import './ButtonColorMode-m-TzctVh.mjs';
import './SelectMenu-irH5ViIs.mjs';
import '@tanstack/vue-virtual';
import './disposables-BdeHelVJ.mjs';
import '@vueuse/core';
import './useFormGroup-4DdrZmPB.mjs';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const prefix = "/dashboard";
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "dashboard",
  __ssrInlineRender: true,
  setup(__props) {
    useRoute();
    useAuth();
    const links = [
      [
        {
          label: "Home",
          icon: "i-heroicons-command-line",
          to: `${prefix}`
        },
        {
          label: "Sessions",
          icon: "i-material-symbols-light-exercise-outline",
          to: `${prefix}/sessions`
        }
      ],
      [
        {
          label: "Company",
          icon: "i-heroicons-building-library",
          to: `${prefix}/company`
        }
      ],
      [
        {
          label: "Profile",
          icon: "i-heroicons-user",
          to: `${prefix}/profile`
        }
      ]
    ];
    return (_ctx, _push, _parent, _attrs) => {
      const _component_BaseLayoutDashboard = _sfc_main$1;
      _push(ssrRenderComponent(_component_BaseLayoutDashboard, mergeProps({ links }, _attrs), {
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
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("layouts/dashboard.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=dashboard-nfw_0mla.mjs.map
