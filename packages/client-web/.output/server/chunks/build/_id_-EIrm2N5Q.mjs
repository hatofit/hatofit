import { _ as __nuxt_component_0 } from './Container-BAnrzuKK.mjs';
import { i as useRoute, a as __nuxt_component_0$3, k as __nuxt_component_2 } from './server.mjs';
import { _ as _sfc_main$1 } from './ButtonColorMode-jPH1DJjw.mjs';
import { defineAsyncComponent, defineComponent, computed, withCtx, createVNode, unref, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import { Chart, ArcElement, Tooltip, Legend } from 'chart.js';
import 'tailwind-merge';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
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
import '@vueuse/core';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const __nuxt_component_4_lazy = defineAsyncComponent(() => import('./Session-D7ZlBVc2.mjs').then((c) => c.default || c));
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "[id]",
  __ssrInlineRender: true,
  setup(__props) {
    Chart.register(ArcElement, Tooltip, Legend);
    const $route = useRoute();
    const sessionId = computed(() => $route.params.id);
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_0;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_Icon = __nuxt_component_2;
      const _component_ButtonColorMode = _sfc_main$1;
      const _component_LazySession = __nuxt_component_4_lazy;
      _push(`<div${ssrRenderAttrs(_attrs)}><div class="h-[68px] border-b border-main w-full sticky top-0 flex items-center z-30 bg-gray-50/75 dark:bg-gray-950/75 backdrop-filter backdrop-blur-lg">`);
      _push(ssrRenderComponent(_component_PageContainer, { class: "flex-1 max-w-screen-lg mx-auto flex justify-between" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_NuxtLink, {
              to: "/dashboard/sessions",
              class: "flex gap-2 items-center"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_Icon, {
                    name: "fluent:arrow-left-16-regular",
                    class: "text-lg"
                  }, null, _parent3, _scopeId2));
                  _push3(`<span${_scopeId2}>Back</span>`);
                } else {
                  return [
                    createVNode(_component_Icon, {
                      name: "fluent:arrow-left-16-regular",
                      class: "text-lg"
                    }),
                    createVNode("span", null, "Back")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`<div class="flex items-center gap-4 divide-x-2 divide-main"${_scopeId}><div class="pl-4"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_ButtonColorMode, null, null, _parent2, _scopeId));
            _push2(`</div></div>`);
          } else {
            return [
              createVNode(_component_NuxtLink, {
                to: "/dashboard/sessions",
                class: "flex gap-2 items-center"
              }, {
                default: withCtx(() => [
                  createVNode(_component_Icon, {
                    name: "fluent:arrow-left-16-regular",
                    class: "text-lg"
                  }),
                  createVNode("span", null, "Back")
                ]),
                _: 1
              }),
              createVNode("div", { class: "flex items-center gap-4 divide-x-2 divide-main" }, [
                createVNode("div", { class: "pl-4" }, [
                  createVNode(_component_ButtonColorMode)
                ])
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      _push(ssrRenderComponent(_component_LazySession, { sessionId: unref(sessionId) }, null, _parent));
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/session/[id].vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=_id_-EIrm2N5Q.mjs.map
