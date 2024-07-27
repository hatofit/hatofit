import { _ as __nuxt_component_0 } from './Container-BAnrzuKK.mjs';
import { _ as __nuxt_component_1 } from './Section-DHOkqozb.mjs';
import { _ as __nuxt_component_0$1 } from './Card-L1vIobqU.mjs';
import { k as __nuxt_component_2 } from './server.mjs';
import { _ as _sfc_main$1 } from './Title-THJIYvs6.mjs';
import { defineAsyncComponent, defineComponent, withCtx, unref, createVNode, toDisplayString, openBlock, createBlock, Suspense, createTextVNode, useSSRContext } from 'vue';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import { ssrRenderComponent, ssrInterpolate, ssrRenderSuspense } from 'vue/server-renderer';
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

const __nuxt_component_5_lazy = defineAsyncComponent(() => import('./DetailWidget-DCfAB-wd.mjs').then((c) => c.default || c));
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "[id]",
  __ssrInlineRender: true,
  setup(__props) {
    const $dayjs = useDayjs();
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_0;
      const _component_PageSection = __nuxt_component_1;
      const _component_UCard = __nuxt_component_0$1;
      const _component_Icon = __nuxt_component_2;
      const _component_PageTitle = _sfc_main$1;
      const _component_LazySessionWidgetDetailWidget = __nuxt_component_5_lazy;
      _push(ssrRenderComponent(_component_PageContainer, _attrs, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UCard, null, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<h2 class="text-xl font-semibold"${_scopeId3}>Walking Session</h2><div class="flex gap-4 mt-2 items-center"${_scopeId3}><div class="flex gap-1 items-center"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:calendar-20-regular",
                          class: "text-lg mb-0.5 text-red-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="text-xs"${_scopeId3}>${ssrInterpolate(unref($dayjs)().format("dddd, DD MMMM YYYY"))}</div></div><div class="flex gap-1 items-center"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:clock-20-regular",
                          class: "text-lg mb-0.5 text-green-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="text-xs"${_scopeId3}>${ssrInterpolate(unref($dayjs)().format("HH:mm"))}</div></div></div>`);
                      } else {
                        return [
                          createVNode("h2", { class: "text-xl font-semibold" }, "Walking Session"),
                          createVNode("div", { class: "flex gap-4 mt-2 items-center" }, [
                            createVNode("div", { class: "flex gap-1 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:calendar-20-regular",
                                class: "text-lg mb-0.5 text-red-500"
                              }),
                              createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)().format("dddd, DD MMMM YYYY")), 1)
                            ]),
                            createVNode("div", { class: "flex gap-1 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:clock-20-regular",
                                class: "text-lg mb-0.5 text-green-500"
                              }),
                              createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)().format("HH:mm")), 1)
                            ])
                          ])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UCard, null, {
                      default: withCtx(() => [
                        createVNode("h2", { class: "text-xl font-semibold" }, "Walking Session"),
                        createVNode("div", { class: "flex gap-4 mt-2 items-center" }, [
                          createVNode("div", { class: "flex gap-1 items-center" }, [
                            createVNode(_component_Icon, {
                              name: "fluent:calendar-20-regular",
                              class: "text-lg mb-0.5 text-red-500"
                            }),
                            createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)().format("dddd, DD MMMM YYYY")), 1)
                          ]),
                          createVNode("div", { class: "flex gap-1 items-center" }, [
                            createVNode(_component_Icon, {
                              name: "fluent:clock-20-regular",
                              class: "text-lg mb-0.5 text-green-500"
                            }),
                            createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)().format("HH:mm")), 1)
                          ])
                        ])
                      ]),
                      _: 1
                    })
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Quick Report" }, null, _parent3, _scopeId2));
                  _push3(`<div class="w-full grid grid-cols-3 gap-4"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-blue-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:timer-20-regular",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="font-bold text-3xl"${_scopeId3}>30m</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId3}>Time Exercise</div>`);
                      } else {
                        return [
                          createVNode(_component_Icon, {
                            name: "fluent:timer-20-regular",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "30m"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Time Exercise")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-orange-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "lets-icons:calories-light",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="font-bold text-3xl"${_scopeId3}>1 Cal</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId3}>Calories Burn</div>`);
                      } else {
                        return [
                          createVNode(_component_Icon, {
                            name: "lets-icons:calories-light",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "1 Cal"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Calories Burn")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-green-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "healthicons:body-outline",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="font-bold text-3xl"${_scopeId3}>19.03</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId3}>BMI</div>`);
                      } else {
                        return [
                          createVNode(_component_Icon, {
                            name: "healthicons:body-outline",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "19.03"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "BMI")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Quick Report" }),
                    createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                      createVNode(_component_UCard, { class: "relative border-b border-blue-500" }, {
                        default: withCtx(() => [
                          createVNode(_component_Icon, {
                            name: "fluent:timer-20-regular",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "30m"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Time Exercise")
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UCard, { class: "relative border-b border-orange-500" }, {
                        default: withCtx(() => [
                          createVNode(_component_Icon, {
                            name: "lets-icons:calories-light",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "1 Cal"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Calories Burn")
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UCard, { class: "relative border-b border-green-500" }, {
                        default: withCtx(() => [
                          createVNode(_component_Icon, {
                            name: "healthicons:body-outline",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "19.03"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "BMI")
                        ]),
                        _: 1
                      })
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Detail" }, null, _parent3, _scopeId2));
                  ssrRenderSuspense(_push3, {
                    fallback: () => {
                      _push3(` Loading... `);
                    },
                    default: () => {
                      _push3(ssrRenderComponent(_component_LazySessionWidgetDetailWidget, null, null, _parent3, _scopeId2));
                    },
                    _: 1
                  });
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Detail" }),
                    (openBlock(), createBlock(Suspense, null, {
                      fallback: withCtx(() => [
                        createTextVNode(" Loading... ")
                      ]),
                      default: withCtx(() => [
                        createVNode(_component_LazySessionWidgetDetailWidget)
                      ]),
                      _: 1
                    }))
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Devices" }, null, _parent3, _scopeId2));
                  _push3(`<div class="w-full grid grid-cols-3 gap-4"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-primary-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<div class="flex gap-4 items-center"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:smartwatch-20-regular",
                          class: "text-6xl text-primary-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="flex flex-col gap-1"${_scopeId3}><div class=""${_scopeId3}>Polar H10</div><div class="text-xs text-gray-600 dark:text-gray-300"${_scopeId3}>Polar</div></div></div>`);
                      } else {
                        return [
                          createVNode("div", { class: "flex gap-4 items-center" }, [
                            createVNode(_component_Icon, {
                              name: "fluent:smartwatch-20-regular",
                              class: "text-6xl text-primary-500"
                            }),
                            createVNode("div", { class: "flex flex-col gap-1" }, [
                              createVNode("div", { class: "" }, "Polar H10"),
                              createVNode("div", { class: "text-xs text-gray-600 dark:text-gray-300" }, "Polar")
                            ])
                          ])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Devices" }),
                    createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                      createVNode(_component_UCard, { class: "relative border-b border-primary-500" }, {
                        default: withCtx(() => [
                          createVNode("div", { class: "flex gap-4 items-center" }, [
                            createVNode(_component_Icon, {
                              name: "fluent:smartwatch-20-regular",
                              class: "text-6xl text-primary-500"
                            }),
                            createVNode("div", { class: "flex flex-col gap-1" }, [
                              createVNode("div", { class: "" }, "Polar H10"),
                              createVNode("div", { class: "text-xs text-gray-600 dark:text-gray-300" }, "Polar")
                            ])
                          ])
                        ]),
                        _: 1
                      })
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_UCard, null, {
                    default: withCtx(() => [
                      createVNode("h2", { class: "text-xl font-semibold" }, "Walking Session"),
                      createVNode("div", { class: "flex gap-4 mt-2 items-center" }, [
                        createVNode("div", { class: "flex gap-1 items-center" }, [
                          createVNode(_component_Icon, {
                            name: "fluent:calendar-20-regular",
                            class: "text-lg mb-0.5 text-red-500"
                          }),
                          createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)().format("dddd, DD MMMM YYYY")), 1)
                        ]),
                        createVNode("div", { class: "flex gap-1 items-center" }, [
                          createVNode(_component_Icon, {
                            name: "fluent:clock-20-regular",
                            class: "text-lg mb-0.5 text-green-500"
                          }),
                          createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)().format("HH:mm")), 1)
                        ])
                      ])
                    ]),
                    _: 1
                  })
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_PageTitle, { text: "Quick Report" }),
                  createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                    createVNode(_component_UCard, { class: "relative border-b border-blue-500" }, {
                      default: withCtx(() => [
                        createVNode(_component_Icon, {
                          name: "fluent:timer-20-regular",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                        }),
                        createVNode("div", { class: "font-bold text-3xl" }, "30m"),
                        createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Time Exercise")
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UCard, { class: "relative border-b border-orange-500" }, {
                      default: withCtx(() => [
                        createVNode(_component_Icon, {
                          name: "lets-icons:calories-light",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                        }),
                        createVNode("div", { class: "font-bold text-3xl" }, "1 Cal"),
                        createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Calories Burn")
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UCard, { class: "relative border-b border-green-500" }, {
                      default: withCtx(() => [
                        createVNode(_component_Icon, {
                          name: "healthicons:body-outline",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                        }),
                        createVNode("div", { class: "font-bold text-3xl" }, "19.03"),
                        createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "BMI")
                      ]),
                      _: 1
                    })
                  ])
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_PageTitle, { text: "Detail" }),
                  (openBlock(), createBlock(Suspense, null, {
                    fallback: withCtx(() => [
                      createTextVNode(" Loading... ")
                    ]),
                    default: withCtx(() => [
                      createVNode(_component_LazySessionWidgetDetailWidget)
                    ]),
                    _: 1
                  }))
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_PageTitle, { text: "Devices" }),
                  createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                    createVNode(_component_UCard, { class: "relative border-b border-primary-500" }, {
                      default: withCtx(() => [
                        createVNode("div", { class: "flex gap-4 items-center" }, [
                          createVNode(_component_Icon, {
                            name: "fluent:smartwatch-20-regular",
                            class: "text-6xl text-primary-500"
                          }),
                          createVNode("div", { class: "flex flex-col gap-1" }, [
                            createVNode("div", { class: "" }, "Polar H10"),
                            createVNode("div", { class: "text-xs text-gray-600 dark:text-gray-300" }, "Polar")
                          ])
                        ])
                      ]),
                      _: 1
                    })
                  ])
                ]),
                _: 1
              })
            ];
          }
        }),
        _: 1
      }, _parent));
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard.bak/user/session/[id].vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=_id_-hgW3o3q7.mjs.map
