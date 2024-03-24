import { _ as _sfc_main$1 } from './Title-THJIYvs6.mjs';
import { _ as __nuxt_component_4 } from './Dropdown-DSh5-USd.mjs';
import { e as __nuxt_component_2, a as __nuxt_component_0$2 } from './server.mjs';
import { _ as __nuxt_component_0 } from './Card-BVh4Co2a.mjs';
import { _ as __nuxt_component_2$1 } from './nuxt-img-DTLp32d8.mjs';
import { defineComponent, mergeProps, withCtx, createVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import 'tailwind-merge';
import './id-C5IKnQCN.mjs';
import './usePopper-yd03S1dL.mjs';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
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
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageTitle = _sfc_main$1;
      const _component_UDropdown = __nuxt_component_4;
      const _component_UButton = __nuxt_component_2;
      const _component_NuxtLink = __nuxt_component_0$2;
      const _component_UCard = __nuxt_component_0;
      const _component_NuxtImg = __nuxt_component_2$1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex-1" }, _attrs))}><div class="flex justify-between">`);
      _push(ssrRenderComponent(_component_PageTitle, { text: "Your Company" }, null, _parent));
      _push(`<div>`);
      _push(ssrRenderComponent(_component_UDropdown, {
        items: [
          [
            { label: "Create Company", icon: "i-heroicons-plus" }
          ]
        ],
        popper: { placement: "bottom-end" }
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UButton, {
              color: "white",
              "trailing-icon": "i-majesticons-dots-horizontal"
            }, null, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UButton, {
                color: "white",
                "trailing-icon": "i-majesticons-dots-horizontal"
              })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div></div><div class="w-full grid grid-cols-3 gap-4">`);
      _push(ssrRenderComponent(_component_NuxtLink, {
        to: "/dashboard/company/1",
        class: "group"
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UCard, { class: "relative overflow-hidden border-b-2 h-[140px] border-orange-500 ring-2 ring-transparent group-hover:ring-gray-500" }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_NuxtImg, {
                    class: "absolute z-[1] top-0 left-0 transition-transform duration-300 transform scale-105 group-hover:scale-110",
                    src: "/images/scene/risen-wang-20jX9b35r_M-unsplash.jpg",
                    alt: "Company Image",
                    style: {
                      width: "100%",
                      height: "100%",
                      objectFit: "cover",
                      objectPosition: "center",
                      filter: "blur(2px) brightness(0.7)"
                    }
                  }, null, _parent3, _scopeId2));
                  _push3(`<div class="absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50"${_scopeId2}><div class="ml-1 text-gray-100"${_scopeId2}>Ketintang Gym</div><div class="ml-1 text-xs text-gray-300"${_scopeId2}>JL Ketintang No 1</div></div>`);
                } else {
                  return [
                    createVNode(_component_NuxtImg, {
                      class: "absolute z-[1] top-0 left-0 transition-transform duration-300 transform scale-105 group-hover:scale-110",
                      src: "/images/scene/risen-wang-20jX9b35r_M-unsplash.jpg",
                      alt: "Company Image",
                      style: {
                        width: "100%",
                        height: "100%",
                        objectFit: "cover",
                        objectPosition: "center",
                        filter: "blur(2px) brightness(0.7)"
                      }
                    }, null, 8, ["style"]),
                    createVNode("div", { class: "absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50" }, [
                      createVNode("div", { class: "ml-1 text-gray-100" }, "Ketintang Gym"),
                      createVNode("div", { class: "ml-1 text-xs text-gray-300" }, "JL Ketintang No 1")
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UCard, { class: "relative overflow-hidden border-b-2 h-[140px] border-orange-500 ring-2 ring-transparent group-hover:ring-gray-500" }, {
                default: withCtx(() => [
                  createVNode(_component_NuxtImg, {
                    class: "absolute z-[1] top-0 left-0 transition-transform duration-300 transform scale-105 group-hover:scale-110",
                    src: "/images/scene/risen-wang-20jX9b35r_M-unsplash.jpg",
                    alt: "Company Image",
                    style: {
                      width: "100%",
                      height: "100%",
                      objectFit: "cover",
                      objectPosition: "center",
                      filter: "blur(2px) brightness(0.7)"
                    }
                  }, null, 8, ["style"]),
                  createVNode("div", { class: "absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50" }, [
                    createVNode("div", { class: "ml-1 text-gray-100" }, "Ketintang Gym"),
                    createVNode("div", { class: "ml-1 text-xs text-gray-300" }, "JL Ketintang No 1")
                  ])
                ]),
                _: 1
              })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-Cfgu4YT3.mjs.map
