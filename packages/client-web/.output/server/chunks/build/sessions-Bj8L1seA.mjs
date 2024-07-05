import { _ as _sfc_main$1 } from './Title-THJIYvs6.mjs';
import { a as __nuxt_component_0$3, k as __nuxt_component_2$1 } from './server.mjs';
import { defineComponent, mergeProps, withCtx, createVNode, toDisplayString, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderList, ssrInterpolate } from 'vue/server-renderer';
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
import 'tailwind-merge';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "sessions",
  __ssrInlineRender: true,
  setup(__props) {
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageTitle = _sfc_main$1;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_Icon = __nuxt_component_2$1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col gap-8" }, _attrs))}><div class="w-full">`);
      _push(ssrRenderComponent(_component_PageTitle, { text: "Today" }, null, _parent));
      _push(`<div class="flex flex-col gap-2"><!--[-->`);
      ssrRenderList(3, (item, i) => {
        _push(ssrRenderComponent(_component_NuxtLink, {
          key: i,
          to: `/dashboard/session/${item}`,
          class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`<div${_scopeId}><div class="font-semibold mb-1"${_scopeId}> Walking </div><div class="text-sm"${_scopeId}>${ssrInterpolate(_ctx.$dayjs().format("dddd, DD MMMM YYYY"))}</div></div><div class="text-xs flex items-center"${_scopeId}><div class="flex items-center gap-1"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_Icon, {
                name: "i-material-symbols-timer-outline-rounded",
                class: "text-lg text-green-500"
              }, null, _parent2, _scopeId));
              _push2(`<span${_scopeId}>30m</span></div><div${_scopeId}>`);
              _push2(ssrRenderComponent(_component_Icon, {
                name: "lets-icons:calories-light",
                class: "text-2xl text-orange-500"
              }, null, _parent2, _scopeId));
              _push2(`<span${_scopeId}>1Cal</span></div></div>`);
            } else {
              return [
                createVNode("div", null, [
                  createVNode("div", { class: "font-semibold mb-1" }, " Walking "),
                  createVNode("div", { class: "text-sm" }, toDisplayString(_ctx.$dayjs().format("dddd, DD MMMM YYYY")), 1)
                ]),
                createVNode("div", { class: "text-xs flex items-center" }, [
                  createVNode("div", { class: "flex items-center gap-1" }, [
                    createVNode(_component_Icon, {
                      name: "i-material-symbols-timer-outline-rounded",
                      class: "text-lg text-green-500"
                    }),
                    createVNode("span", null, "30m")
                  ]),
                  createVNode("div", null, [
                    createVNode(_component_Icon, {
                      name: "lets-icons:calories-light",
                      class: "text-2xl text-orange-500"
                    }),
                    createVNode("span", null, "1Cal")
                  ])
                ])
              ];
            }
          }),
          _: 2
        }, _parent));
      });
      _push(`<!--]--></div></div><div>`);
      _push(ssrRenderComponent(_component_PageTitle, { text: "Another Day" }, null, _parent));
      _push(`<div class="flex flex-col gap-2"><div class="text-center">no session recorded</div></div></div></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard.bak/user/sessions.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=sessions-Bj8L1seA.mjs.map
