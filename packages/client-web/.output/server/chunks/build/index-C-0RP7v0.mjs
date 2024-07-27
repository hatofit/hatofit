import { _ as __nuxt_component_0 } from './Table-BxsFRJhE.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-lhX-bojE.mjs';
import { j as useToast, i as useRoute, e as __nuxt_component_3 } from './server.mjs';
import { _ as __nuxt_component_6 } from './Modal-D84Qr6-q.mjs';
import { _ as __nuxt_component_0$1 } from './Card-L1vIobqU.mjs';
import { defineAsyncComponent, defineComponent, withAsyncContext, computed, ref, unref, withCtx, createVNode, isRef, openBlock, createBlock, createCommentVNode, useSSRContext } from 'vue';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import { u as useCompanyLayout } from './use-company-layout-B-oDRjJ3.mjs';
import { u as useFetchWithAuth } from './use-fetch-with-auth-N9InCXnT.mjs';
import { ssrRenderAttrs, ssrInterpolate, ssrRenderComponent } from 'vue/server-renderer';
import { A as Api } from './api-DoRhrA3A.mjs';
import 'tailwind-merge';
import './useFormGroup-4DdrZmPB.mjs';
import '@vueuse/core';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './id-CT9Cm1Vi.mjs';
import './Kbd-CWGxBI2b.mjs';
import './tabs-B_zyHFOf.mjs';
import './usePopper-C-zM4LTl.mjs';
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
import './active-element-history-DcQBj1iE.mjs';

const __nuxt_component_5_lazy = defineAsyncComponent(() => import('./Session-D7ZlBVc2.mjs').then((c) => c.default || c));
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const $dayjs = useDayjs();
    useToast();
    const $route = useRoute();
    const { companyId } = ([__temp, __restore] = withAsyncContext(() => useCompanyLayout()), __temp = await __temp, __restore(), __temp);
    const exerciseId = computed(() => $route.params.companyId);
    const { data } = useFetchWithAuth(Api.Company.Exercise.url(companyId.value, exerciseId.value));
    const columns = [
      {
        key: "no",
        label: "#"
      },
      {
        key: "name",
        label: "Member"
      },
      {
        key: "createdAt",
        label: "Date"
      },
      {
        key: "actions"
      }
    ];
    const sessions = computed(() => {
      var _a;
      return (((_a = data.value) == null ? void 0 : _a.sessions) || []).map((exercise, i) => {
        var _a2, _b;
        return {
          no: i + 1,
          id: exercise._id,
          userId: exercise.userId,
          name: `${(_a2 = exercise == null ? void 0 : exercise.user) == null ? void 0 : _a2.firstName} ${(_b = exercise == null ? void 0 : exercise.user) == null ? void 0 : _b.lastName}`,
          createdAt: $dayjs(exercise.createdAt).format("dddd, DD MMMM YYYY h:mm A")
        };
      });
    });
    const reportOpenSessionId = ref();
    const isOpen = computed(() => !!reportOpenSessionId.value);
    const items = (row) => [
      [{
        label: "Show Report",
        icon: "i-heroicons-document-duplicate-20-solid",
        click: () => reportOpenSessionId.value = row.id
      }]
    ];
    return (_ctx, _push, _parent, _attrs) => {
      var _a, _b;
      const _component_UTable = __nuxt_component_0;
      const _component_UDropdown = __nuxt_component_1;
      const _component_UButton = __nuxt_component_3;
      const _component_UModal = __nuxt_component_6;
      const _component_UCard = __nuxt_component_0$1;
      const _component_LazySession = __nuxt_component_5_lazy;
      _push(`<div${ssrRenderAttrs(_attrs)}><div class="mb-6"><div><h2 class="text-3xl">${ssrInterpolate((_b = (_a = unref(data)) == null ? void 0 : _a.exercise) == null ? void 0 : _b.name)}</h2><p>Member Sessions</p></div></div>`);
      _push(ssrRenderComponent(_component_UTable, {
        columns,
        rows: unref(sessions)
      }, {
        "actions-data": withCtx(({ row }, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UDropdown, {
              items: items(row)
            }, {
              default: withCtx((_, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "gray",
                    variant: "ghost",
                    icon: "i-heroicons-ellipsis-horizontal-20-solid"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UButton, {
                      color: "gray",
                      variant: "ghost",
                      icon: "i-heroicons-ellipsis-horizontal-20-solid"
                    })
                  ];
                }
              }),
              _: 2
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UDropdown, {
                items: items(row)
              }, {
                default: withCtx(() => [
                  createVNode(_component_UButton, {
                    color: "gray",
                    variant: "ghost",
                    icon: "i-heroicons-ellipsis-horizontal-20-solid"
                  })
                ]),
                _: 2
              }, 1032, ["items"])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_UModal, {
        modelValue: unref(isOpen),
        "onUpdate:modelValue": ($event) => isRef(isOpen) ? isOpen.value = $event : null,
        ui: {
          width: "sm:max-w-5xl"
        }
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            if (unref(reportOpenSessionId)) {
              _push2(ssrRenderComponent(_component_UCard, null, {
                header: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(`<div class="flex justify-between"${_scopeId2}><h2 class="text-xl font-semibold"${_scopeId2}>Session Report</h2>`);
                    _push3(ssrRenderComponent(_component_UButton, {
                      color: "red",
                      variant: "soft",
                      icon: "i-heroicons-x-mark-20-solid",
                      onClick: ($event) => reportOpenSessionId.value = void 0
                    }, null, _parent3, _scopeId2));
                    _push3(`</div>`);
                  } else {
                    return [
                      createVNode("div", { class: "flex justify-between" }, [
                        createVNode("h2", { class: "text-xl font-semibold" }, "Session Report"),
                        createVNode(_component_UButton, {
                          color: "red",
                          variant: "soft",
                          icon: "i-heroicons-x-mark-20-solid",
                          onClick: ($event) => reportOpenSessionId.value = void 0
                        }, null, 8, ["onClick"])
                      ])
                    ];
                  }
                }),
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(ssrRenderComponent(_component_LazySession, { sessionId: unref(reportOpenSessionId) }, null, _parent3, _scopeId2));
                  } else {
                    return [
                      createVNode(_component_LazySession, { sessionId: unref(reportOpenSessionId) }, null, 8, ["sessionId"])
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
            } else {
              _push2(`<!---->`);
            }
          } else {
            return [
              unref(reportOpenSessionId) ? (openBlock(), createBlock(_component_UCard, { key: 0 }, {
                header: withCtx(() => [
                  createVNode("div", { class: "flex justify-between" }, [
                    createVNode("h2", { class: "text-xl font-semibold" }, "Session Report"),
                    createVNode(_component_UButton, {
                      color: "red",
                      variant: "soft",
                      icon: "i-heroicons-x-mark-20-solid",
                      onClick: ($event) => reportOpenSessionId.value = void 0
                    }, null, 8, ["onClick"])
                  ])
                ]),
                default: withCtx(() => [
                  createVNode(_component_LazySession, { sessionId: unref(reportOpenSessionId) }, null, 8, ["sessionId"])
                ]),
                _: 1
              })) : createCommentVNode("", true)
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/manage/exercise/[exerciseId]/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-C-0RP7v0.mjs.map
