import { _ as _sfc_main$1 } from './Title-THJIYvs6.mjs';
import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { k as __nuxt_component_2$1 } from './server.mjs';
import { defineComponent, ref, unref, withCtx, createVNode, toDisplayString, useSSRContext } from 'vue';
import { u as useFetchWithAuth } from './use-fetch-with-auth-D9SMyDpm.mjs';
import { ssrRenderComponent, ssrRenderList, ssrInterpolate } from 'vue/server-renderer';
import { A as Api } from './api-Bs5Sh9SF.mjs';
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

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    const { data, pending } = useFetchWithAuth(Api.Auth.Dashboard.url(), {});
    ref([]);
    return (_ctx, _push, _parent, _attrs) => {
      var _a;
      const _component_PageTitle = _sfc_main$1;
      const _component_UCard = __nuxt_component_0;
      const _component_Icon = __nuxt_component_2$1;
      _push(`<!--[-->`);
      if (!unref(pending)) {
        _push(`<div class="flex-1">`);
        _push(ssrRenderComponent(_component_PageTitle, { text: "Your Result Today" }, null, _parent));
        _push(`<div class="w-full grid grid-cols-3 gap-4"><!--[-->`);
        ssrRenderList((_a = unref(data)) == null ? void 0 : _a.widgets, (item, i) => {
          _push(ssrRenderComponent(_component_UCard, {
            key: i,
            class: ["relative border-b", {
              "border-orange-500": i === 0,
              "border-green-500": i === 1,
              "border-blue-500": i === 2,
              "border-red-500": i === 3
            }]
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(ssrRenderComponent(_component_Icon, {
                  name: "healthicons:body-outline",
                  class: ["text-6xl absolute right-0 top-0 mt-6 mr-4", {
                    "text-orange-500": i === 0,
                    "text-green-500": i === 1,
                    "text-blue-500": i === 2,
                    "text-red-500": i === 3
                  }]
                }, null, _parent2, _scopeId));
                _push2(`<div class="font-bold text-3xl"${_scopeId}>${ssrInterpolate(item.value)}</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId}>${ssrInterpolate(item.name)}</div>`);
              } else {
                return [
                  createVNode(_component_Icon, {
                    name: "healthicons:body-outline",
                    class: ["text-6xl absolute right-0 top-0 mt-6 mr-4", {
                      "text-orange-500": i === 0,
                      "text-green-500": i === 1,
                      "text-blue-500": i === 2,
                      "text-red-500": i === 3
                    }]
                  }, null, 8, ["class"]),
                  createVNode("div", { class: "font-bold text-3xl" }, toDisplayString(item.value), 1),
                  createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, toDisplayString(item.name), 1)
                ];
              }
            }),
            _: 2
          }, _parent));
        });
        _push(`<!--]--></div></div>`);
      } else {
        _push(`<!---->`);
      }
      if (unref(pending)) {
        _push(`<div>`);
        _push(ssrRenderComponent(_component_PageTitle, { text: "Home" }, null, _parent));
        _push(`<div class="flex justify-center items-center">`);
        _push(ssrRenderComponent(_component_Icon, {
          name: "i-mingcute-loading-line",
          class: "text-4xl text-primary-500 animate-spin"
        }, null, _parent));
        _push(`</div></div>`);
      } else {
        _push(`<!---->`);
      }
      _push(`<!--]-->`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-W6JhATmG.mjs.map
