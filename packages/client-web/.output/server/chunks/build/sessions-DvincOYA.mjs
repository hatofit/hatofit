import { _ as _sfc_main$1 } from './Title-THJIYvs6.mjs';
import { a as __nuxt_component_0$3, k as __nuxt_component_2$1 } from './server.mjs';
import { defineComponent, computed, unref, withCtx, createVNode, toDisplayString, openBlock, createBlock, createCommentVNode, useSSRContext } from 'vue';
import { u as useFetchWithAuth } from './use-fetch-with-auth-D9SMyDpm.mjs';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import { g as getTimeInMorS } from './date-DrT-bfza.mjs';
import { ssrRenderComponent, ssrRenderList, ssrInterpolate } from 'vue/server-renderer';
import { A as Api } from './api-Bs5Sh9SF.mjs';
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
    const { data, pending } = useFetchWithAuth(Api.Session.All.url());
    const $dayjs = useDayjs();
    const sessions = computed(() => {
      var _a;
      return (((_a = data.value) == null ? void 0 : _a.sessions) || []).sort((a, b) => {
        return $dayjs(b.createdAt).diff($dayjs(a.createdAt));
      });
    });
    const todaySessions = computed(() => {
      return sessions.value.filter((item) => {
        return $dayjs(item.createdAt).isSame($dayjs(), "day");
      });
    });
    const otherDaySessions = computed(() => {
      return sessions.value.filter((item) => {
        return !$dayjs(item.createdAt).isSame($dayjs(), "day");
      });
    });
    return (_ctx, _push, _parent, _attrs) => {
      var _a;
      const _component_PageTitle = _sfc_main$1;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_Icon = __nuxt_component_2$1;
      _push(`<!--[-->`);
      if (!unref(pending)) {
        _push(`<div class="flex flex-col gap-8"><div class="w-full">`);
        _push(ssrRenderComponent(_component_PageTitle, { text: "Today" }, null, _parent));
        _push(`<div class="flex flex-col gap-2"><!--[-->`);
        ssrRenderList(unref(todaySessions), (item, i) => {
          _push(ssrRenderComponent(_component_NuxtLink, {
            key: i,
            to: `/dashboard/session/${item._id}`,
            class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              var _a2, _b;
              if (_push2) {
                _push2(`<div${_scopeId}><div class="font-semibold mb-1"${_scopeId}><span${_scopeId}>${ssrInterpolate(((_a2 = item.exercise) == null ? void 0 : _a2.name) || "General")}</span></div><div class="text-sm flex gap-2 divide-x divide-gray-500/50"${_scopeId}><div${_scopeId}>${ssrInterpolate(unref($dayjs)(item.createdAt).format("dddd, DD MMMM YYYY"))}</div><div class="pl-2"${_scopeId}>${ssrInterpolate(unref($dayjs)(item.createdAt).format("h:mm A"))}</div></div></div><div class="flex flex-col items-end justify-center"${_scopeId}>`);
                if (item["company"]) {
                  _push2(`<span class="text-xs text-red-300"${_scopeId}>Company: ${ssrInterpolate(item["company"]["name"])}</span>`);
                } else {
                  _push2(`<!---->`);
                }
                _push2(`<div class="text-xs flex items-center gap-2"${_scopeId}><div class="flex items-center gap-1"${_scopeId}>`);
                _push2(ssrRenderComponent(_component_Icon, {
                  name: "i-material-symbols-timer-outline-rounded",
                  class: "text-lg text-green-500"
                }, null, _parent2, _scopeId));
                _push2(`<span${_scopeId}>${ssrInterpolate(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(item.startTime, item.endTime))}</span></div><div${_scopeId}>`);
                _push2(ssrRenderComponent(_component_Icon, {
                  name: "lets-icons:calories-light",
                  class: "text-2xl text-orange-500"
                }, null, _parent2, _scopeId));
                _push2(`<span class="pt-1"${_scopeId}>1Cal</span></div>`);
                if (item["mood"]) {
                  _push2(`<div${_scopeId}>${ssrInterpolate(item["mood"])}</div>`);
                } else {
                  _push2(`<!---->`);
                }
                _push2(`</div></div>`);
              } else {
                return [
                  createVNode("div", null, [
                    createVNode("div", { class: "font-semibold mb-1" }, [
                      createVNode("span", null, toDisplayString(((_b = item.exercise) == null ? void 0 : _b.name) || "General"), 1)
                    ]),
                    createVNode("div", { class: "text-sm flex gap-2 divide-x divide-gray-500/50" }, [
                      createVNode("div", null, toDisplayString(unref($dayjs)(item.createdAt).format("dddd, DD MMMM YYYY")), 1),
                      createVNode("div", { class: "pl-2" }, toDisplayString(unref($dayjs)(item.createdAt).format("h:mm A")), 1)
                    ])
                  ]),
                  createVNode("div", { class: "flex flex-col items-end justify-center" }, [
                    item["company"] ? (openBlock(), createBlock("span", {
                      key: 0,
                      class: "text-xs text-red-300"
                    }, "Company: " + toDisplayString(item["company"]["name"]), 1)) : createCommentVNode("", true),
                    createVNode("div", { class: "text-xs flex items-center gap-2" }, [
                      createVNode("div", { class: "flex items-center gap-1" }, [
                        createVNode(_component_Icon, {
                          name: "i-material-symbols-timer-outline-rounded",
                          class: "text-lg text-green-500"
                        }),
                        createVNode("span", null, toDisplayString(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(item.startTime, item.endTime)), 1)
                      ]),
                      createVNode("div", null, [
                        createVNode(_component_Icon, {
                          name: "lets-icons:calories-light",
                          class: "text-2xl text-orange-500"
                        }),
                        createVNode("span", { class: "pt-1" }, "1Cal")
                      ]),
                      item["mood"] ? (openBlock(), createBlock("div", { key: 0 }, toDisplayString(item["mood"]), 1)) : createCommentVNode("", true)
                    ])
                  ])
                ];
              }
            }),
            _: 2
          }, _parent));
        });
        _push(`<!--]-->`);
        if (!unref(todaySessions) || ((_a = unref(todaySessions)) == null ? void 0 : _a.length) === 0) {
          _push(`<div class="text-center">no session recorded</div>`);
        } else {
          _push(`<!---->`);
        }
        _push(`</div></div><div>`);
        _push(ssrRenderComponent(_component_PageTitle, { text: "Another Day" }, null, _parent));
        _push(`<div class="flex flex-col gap-2"><!--[-->`);
        ssrRenderList(unref(otherDaySessions), (item, i) => {
          _push(ssrRenderComponent(_component_NuxtLink, {
            key: i,
            to: `/dashboard/session/${item._id}`,
            class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              var _a2, _b;
              if (_push2) {
                _push2(`<div${_scopeId}><div class="font-semibold mb-1"${_scopeId}>${ssrInterpolate(((_a2 = item.exercise) == null ? void 0 : _a2.name) || "General")}</div><div class="text-sm flex gap-2 divide-x divide-gray-500/50"${_scopeId}><div${_scopeId}>${ssrInterpolate(unref($dayjs)(item.createdAt).format("dddd, DD MMMM YYYY"))}</div><div class="pl-2"${_scopeId}>${ssrInterpolate(unref($dayjs)(item.createdAt).format("h:mm A"))}</div></div></div><div class="flex flex-col items-end"${_scopeId}>`);
                if (item["company"]) {
                  _push2(`<span class="text-xs text-red-300"${_scopeId}>Company: ${ssrInterpolate(item["company"]["name"])}</span>`);
                } else {
                  _push2(`<!---->`);
                }
                _push2(`<div class="text-xs flex items-center"${_scopeId}><div class="flex items-center gap-1"${_scopeId}>`);
                _push2(ssrRenderComponent(_component_Icon, {
                  name: "i-material-symbols-timer-outline-rounded",
                  class: "text-lg text-green-500"
                }, null, _parent2, _scopeId));
                _push2(`<span${_scopeId}>${ssrInterpolate(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(item.startTime, item.endTime))}</span></div><div${_scopeId}>`);
                _push2(ssrRenderComponent(_component_Icon, {
                  name: "lets-icons:calories-light",
                  class: "text-2xl text-orange-500"
                }, null, _parent2, _scopeId));
                _push2(`<span${_scopeId}>1Cal</span></div></div></div>`);
              } else {
                return [
                  createVNode("div", null, [
                    createVNode("div", { class: "font-semibold mb-1" }, toDisplayString(((_b = item.exercise) == null ? void 0 : _b.name) || "General"), 1),
                    createVNode("div", { class: "text-sm flex gap-2 divide-x divide-gray-500/50" }, [
                      createVNode("div", null, toDisplayString(unref($dayjs)(item.createdAt).format("dddd, DD MMMM YYYY")), 1),
                      createVNode("div", { class: "pl-2" }, toDisplayString(unref($dayjs)(item.createdAt).format("h:mm A")), 1)
                    ])
                  ]),
                  createVNode("div", { class: "flex flex-col items-end" }, [
                    item["company"] ? (openBlock(), createBlock("span", {
                      key: 0,
                      class: "text-xs text-red-300"
                    }, "Company: " + toDisplayString(item["company"]["name"]), 1)) : createCommentVNode("", true),
                    createVNode("div", { class: "text-xs flex items-center" }, [
                      createVNode("div", { class: "flex items-center gap-1" }, [
                        createVNode(_component_Icon, {
                          name: "i-material-symbols-timer-outline-rounded",
                          class: "text-lg text-green-500"
                        }),
                        createVNode("span", null, toDisplayString(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(item.startTime, item.endTime)), 1)
                      ]),
                      createVNode("div", null, [
                        createVNode(_component_Icon, {
                          name: "lets-icons:calories-light",
                          class: "text-2xl text-orange-500"
                        }),
                        createVNode("span", null, "1Cal")
                      ])
                    ])
                  ])
                ];
              }
            }),
            _: 2
          }, _parent));
        });
        _push(`<!--]--></div></div></div>`);
      } else {
        _push(`<!---->`);
      }
      if (unref(pending)) {
        _push(`<div>`);
        _push(ssrRenderComponent(_component_PageTitle, { text: "Sessions" }, null, _parent));
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/sessions.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=sessions-DvincOYA.mjs.map
