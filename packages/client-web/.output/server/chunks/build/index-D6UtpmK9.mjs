import { _ as _sfc_main$1 } from './BannerCard-DLVc_2If.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-ClBfsRGA.mjs';
import { i as useRoute, n as navigateTo, e as __nuxt_component_2, k as __nuxt_component_2$1, a as __nuxt_component_0$3 } from './server.mjs';
import { m as me, p as pe, x as xe, I as Ie, y as ye } from './usePopper-jS7FPPLV.mjs';
import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { _ as __nuxt_component_0$1 } from './Table-DfC8Vppt.mjs';
import { defineComponent, computed, withAsyncContext, unref, mergeProps, withCtx, createVNode, toDisplayString, openBlock, createBlock, Fragment, renderList, createCommentVNode, useSSRContext } from 'vue';
import { u as useFetchWithAuth } from './use-fetch-with-auth-D9SMyDpm.mjs';
import { g as getTimeInMorS } from './date-DrT-bfza.mjs';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderList, ssrRenderClass, ssrInterpolate } from 'vue/server-renderer';
import { A as Api } from './api-Bs5Sh9SF.mjs';
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
import 'tailwind-merge';
import './id-CT9Cm1Vi.mjs';
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
import './useFormGroup-4DdrZmPB.mjs';
import './dayjs-DjHdTGjd.mjs';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const $route = useRoute();
    const companyId = computed(() => Number($route.params.companyId || "0"));
    if (!companyId.value)
      navigateTo("/dashboard/company");
    const { data, pending } = ([__temp, __restore] = withAsyncContext(() => useFetchWithAuth(Api.Company.Company.url(companyId.value))), __temp = await __temp, __restore(), __temp);
    const company_Id = computed(() => {
      var _a, _b;
      return (_b = (_a = data.value) == null ? void 0 : _a.company) == null ? void 0 : _b._id;
    });
    const Exercise = (() => {
      const { data: data2 } = useFetchWithAuth(Api.Company.Exercises.url(companyId.value));
      const columns = [
        {
          key: "no",
          label: "#"
        },
        {
          key: "name",
          label: "Name"
        },
        {
          key: "type",
          label: "type"
        },
        {
          key: "difficulty",
          label: "difficulty"
        },
        {
          key: "duration",
          label: "Duration"
        },
        {
          key: "actions"
        }
      ];
      const exercises = computed(() => {
        var _a;
        return (((_a = data2.value) == null ? void 0 : _a.exercises) || []).map((exercise, i) => ({
          no: i + 1,
          name: exercise.name,
          duration: exercise.duration + " seconds",
          type: exercise.type,
          difficulty: exercise.difficulty
        }));
      });
      return {
        data: data2,
        columns,
        exercises
      };
    })();
    const Session = (() => {
      const { data: data2, pending: pending2 } = useFetchWithAuth(Api.Session.All.url());
      return {
        sessions: computed(
          () => {
            var _a;
            return (((_a = data2.value) == null ? void 0 : _a.sessions) || []).filter((item) => item.companyId === company_Id.value);
          }
        )
      };
    })();
    const leave = async () => {
      var _a;
      try {
        const { data: _data, status } = await useFetchWithAuth(Api.Company.Leave.url(), {
          method: "DELETE",
          body: {
            code: (_a = data.value) == null ? void 0 : _a.company._id
          }
        });
        console.log(_data);
        navigateTo("/dashboard/company");
      } catch (error) {
        console.error(error);
      }
    };
    return (_ctx, _push, _parent, _attrs) => {
      var _a;
      const _component_DashboardCompanyBannerCard = _sfc_main$1;
      const _component_UDropdown = __nuxt_component_1;
      const _component_UButton = __nuxt_component_2;
      const _component_HeadlessTabGroup = me;
      const _component_HeadlessTabList = pe;
      const _component_HeadlessTab = xe;
      const _component_HeadlessTabPanels = Ie;
      const _component_HeadlessTabPanel = ye;
      const _component_UCard = __nuxt_component_0;
      const _component_Icon = __nuxt_component_2$1;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_UTable = __nuxt_component_0$1;
      if (unref(data)) {
        _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col gap-4" }, _attrs))}>`);
        _push(ssrRenderComponent(_component_DashboardCompanyBannerCard, {
          company: (_a = unref(data)) == null ? void 0 : _a.company
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`<div class="absolute z-10 top-0 right-0 m-4"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UDropdown, {
                items: [
                  ...unref(data).company.isAdmin ? [[
                    { label: "Manage Company", icon: "i-heroicons-cog", to: `${unref($route).params.companyId}/manage` }
                  ]] : [],
                  [
                    { label: "Leave company", icon: "i-heroicons-arrow-left-start-on-rectangle-20-solid", click: leave }
                  ]
                ]
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(ssrRenderComponent(_component_UButton, {
                      icon: "i-heroicons-cog",
                      variant: "ghost"
                    }, null, _parent3, _scopeId2));
                  } else {
                    return [
                      createVNode(_component_UButton, {
                        icon: "i-heroicons-cog",
                        variant: "ghost"
                      })
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(`</div>`);
            } else {
              return [
                createVNode("div", { class: "absolute z-10 top-0 right-0 m-4" }, [
                  createVNode(_component_UDropdown, {
                    items: [
                      ...unref(data).company.isAdmin ? [[
                        { label: "Manage Company", icon: "i-heroicons-cog", to: `${unref($route).params.companyId}/manage` }
                      ]] : [],
                      [
                        { label: "Leave company", icon: "i-heroicons-arrow-left-start-on-rectangle-20-solid", click: leave }
                      ]
                    ]
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UButton, {
                        icon: "i-heroicons-cog",
                        variant: "ghost"
                      })
                    ]),
                    _: 1
                  }, 8, ["items"])
                ])
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(ssrRenderComponent(_component_HeadlessTabGroup, null, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(ssrRenderComponent(_component_HeadlessTabList, { class: "border-b-2 w-auto border-gray-500/20 rounded" }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(`<!--[-->`);
                    ssrRenderList(["Home", "My Session", "Exercises", "Program", "Information"], (item, i) => {
                      _push3(ssrRenderComponent(_component_HeadlessTab, { as: "template" }, {
                        default: withCtx(({ selected }, _push4, _parent4, _scopeId3) => {
                          if (_push4) {
                            _push4(`<button class="${ssrRenderClass({
                              "px-2 py-2 text-sm ": true,
                              "rounded bg-gray-300/50 dark:bg-gray-700/50 font-bold": selected,
                              "": !selected
                            })}"${_scopeId3}>${ssrInterpolate(item)}</button>`);
                          } else {
                            return [
                              createVNode("button", {
                                class: {
                                  "px-2 py-2 text-sm ": true,
                                  "rounded bg-gray-300/50 dark:bg-gray-700/50 font-bold": selected,
                                  "": !selected
                                }
                              }, toDisplayString(item), 3)
                            ];
                          }
                        }),
                        _: 2
                      }, _parent3, _scopeId2));
                    });
                    _push3(`<!--]-->`);
                  } else {
                    return [
                      (openBlock(), createBlock(Fragment, null, renderList(["Home", "My Session", "Exercises", "Program", "Information"], (item, i) => {
                        return createVNode(_component_HeadlessTab, { as: "template" }, {
                          default: withCtx(({ selected }) => [
                            createVNode("button", {
                              class: {
                                "px-2 py-2 text-sm ": true,
                                "rounded bg-gray-300/50 dark:bg-gray-700/50 font-bold": selected,
                                "": !selected
                              }
                            }, toDisplayString(item), 3)
                          ]),
                          _: 2
                        }, 1024);
                      }), 64))
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(ssrRenderComponent(_component_HeadlessTabPanels, null, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(ssrRenderComponent(_component_HeadlessTabPanel, null, {
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        if (_push4) {
                          _push4(`<div${_scopeId3}><div class="font-semibold mb-4"${_scopeId3}>Your Result on this Company Today</div><div class="w-full grid grid-cols-3 gap-4"${_scopeId3}>`);
                          _push4(ssrRenderComponent(_component_UCard, { class: "relative border-b border-orange-500" }, {
                            default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                              if (_push5) {
                                _push5(ssrRenderComponent(_component_Icon, {
                                  name: "lets-icons:calories-light",
                                  class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                                }, null, _parent5, _scopeId4));
                                _push5(`<div class="font-bold text-3xl"${_scopeId4}>1 Cal</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId4}>Calories Burn</div>`);
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
                          }, _parent4, _scopeId3));
                          _push4(ssrRenderComponent(_component_UCard, { class: "relative border-b border-green-500" }, {
                            default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                              if (_push5) {
                                _push5(ssrRenderComponent(_component_Icon, {
                                  name: "healthicons:body-outline",
                                  class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                                }, null, _parent5, _scopeId4));
                                _push5(`<div class="font-bold text-3xl"${_scopeId4}>19.03</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId4}>BMI</div>`);
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
                          }, _parent4, _scopeId3));
                          _push4(`</div></div>`);
                        } else {
                          return [
                            createVNode("div", null, [
                              createVNode("div", { class: "font-semibold mb-4" }, "Your Result on this Company Today"),
                              createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
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
                            ])
                          ];
                        }
                      }),
                      _: 1
                    }, _parent3, _scopeId2));
                    _push3(ssrRenderComponent(_component_HeadlessTabPanel, null, {
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        var _a2, _b;
                        if (_push4) {
                          _push4(`<div class="flex flex-col gap-2"${_scopeId3}><!--[-->`);
                          ssrRenderList(unref(Session).sessions.value, (item, i) => {
                            _push4(ssrRenderComponent(_component_NuxtLink, {
                              key: i,
                              to: `/dashboard/session/${item._id}`,
                              class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
                            }, {
                              default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                                var _a3, _b2;
                                if (_push5) {
                                  _push5(`<div${_scopeId4}><div class="font-semibold mb-1"${_scopeId4}><span${_scopeId4}>${ssrInterpolate(((_a3 = item.exercise) == null ? void 0 : _a3.name) || "General")}</span></div><div class="text-sm flex gap-2 divide-x divide-gray-500/50"${_scopeId4}><div${_scopeId4}>${ssrInterpolate(_ctx.$dayjs(item.createdAt).format("dddd, DD MMMM YYYY"))}</div><div class="pl-2"${_scopeId4}>${ssrInterpolate(_ctx.$dayjs(item.createdAt).format("h:mm A"))}</div></div></div><div class="flex flex-col items-end"${_scopeId4}><div class="text-xs flex items-center"${_scopeId4}><div class="flex items-center gap-1"${_scopeId4}>`);
                                  _push5(ssrRenderComponent(_component_Icon, {
                                    name: "i-material-symbols-timer-outline-rounded",
                                    class: "text-lg text-green-500"
                                  }, null, _parent5, _scopeId4));
                                  _push5(`<span${_scopeId4}>${ssrInterpolate(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(item.startTime, item.endTime))}</span></div><div${_scopeId4}>`);
                                  _push5(ssrRenderComponent(_component_Icon, {
                                    name: "lets-icons:calories-light",
                                    class: "text-2xl text-orange-500"
                                  }, null, _parent5, _scopeId4));
                                  _push5(`<span${_scopeId4}>1Cal</span></div></div></div>`);
                                } else {
                                  return [
                                    createVNode("div", null, [
                                      createVNode("div", { class: "font-semibold mb-1" }, [
                                        createVNode("span", null, toDisplayString(((_b2 = item.exercise) == null ? void 0 : _b2.name) || "General"), 1)
                                      ]),
                                      createVNode("div", { class: "text-sm flex gap-2 divide-x divide-gray-500/50" }, [
                                        createVNode("div", null, toDisplayString(_ctx.$dayjs(item.createdAt).format("dddd, DD MMMM YYYY")), 1),
                                        createVNode("div", { class: "pl-2" }, toDisplayString(_ctx.$dayjs(item.createdAt).format("h:mm A")), 1)
                                      ])
                                    ]),
                                    createVNode("div", { class: "flex flex-col items-end" }, [
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
                            }, _parent4, _scopeId3));
                          });
                          _push4(`<!--]-->`);
                          if (!unref(Session).sessions.value || ((_a2 = unref(Session).sessions.value) == null ? void 0 : _a2.length) === 0) {
                            _push4(`<div class="text-center"${_scopeId3}>no session recorded</div>`);
                          } else {
                            _push4(`<!---->`);
                          }
                          _push4(`</div>`);
                        } else {
                          return [
                            createVNode("div", { class: "flex flex-col gap-2" }, [
                              (openBlock(true), createBlock(Fragment, null, renderList(unref(Session).sessions.value, (item, i) => {
                                return openBlock(), createBlock(_component_NuxtLink, {
                                  key: i,
                                  to: `/dashboard/session/${item._id}`,
                                  class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
                                }, {
                                  default: withCtx(() => {
                                    var _a3;
                                    return [
                                      createVNode("div", null, [
                                        createVNode("div", { class: "font-semibold mb-1" }, [
                                          createVNode("span", null, toDisplayString(((_a3 = item.exercise) == null ? void 0 : _a3.name) || "General"), 1)
                                        ]),
                                        createVNode("div", { class: "text-sm flex gap-2 divide-x divide-gray-500/50" }, [
                                          createVNode("div", null, toDisplayString(_ctx.$dayjs(item.createdAt).format("dddd, DD MMMM YYYY")), 1),
                                          createVNode("div", { class: "pl-2" }, toDisplayString(_ctx.$dayjs(item.createdAt).format("h:mm A")), 1)
                                        ])
                                      ]),
                                      createVNode("div", { class: "flex flex-col items-end" }, [
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
                                  }),
                                  _: 2
                                }, 1032, ["to"]);
                              }), 128)),
                              !unref(Session).sessions.value || ((_b = unref(Session).sessions.value) == null ? void 0 : _b.length) === 0 ? (openBlock(), createBlock("div", {
                                key: 0,
                                class: "text-center"
                              }, "no session recorded")) : createCommentVNode("", true)
                            ])
                          ];
                        }
                      }),
                      _: 1
                    }, _parent3, _scopeId2));
                    _push3(ssrRenderComponent(_component_HeadlessTabPanel, null, {
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        if (_push4) {
                          _push4(ssrRenderComponent(_component_UTable, {
                            columns: unref(Exercise).columns,
                            rows: unref(Exercise).exercises.value
                          }, null, _parent4, _scopeId3));
                        } else {
                          return [
                            createVNode(_component_UTable, {
                              columns: unref(Exercise).columns,
                              rows: unref(Exercise).exercises.value
                            }, null, 8, ["columns", "rows"])
                          ];
                        }
                      }),
                      _: 1
                    }, _parent3, _scopeId2));
                  } else {
                    return [
                      createVNode(_component_HeadlessTabPanel, null, {
                        default: withCtx(() => [
                          createVNode("div", null, [
                            createVNode("div", { class: "font-semibold mb-4" }, "Your Result on this Company Today"),
                            createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
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
                          ])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_HeadlessTabPanel, null, {
                        default: withCtx(() => {
                          var _a2;
                          return [
                            createVNode("div", { class: "flex flex-col gap-2" }, [
                              (openBlock(true), createBlock(Fragment, null, renderList(unref(Session).sessions.value, (item, i) => {
                                return openBlock(), createBlock(_component_NuxtLink, {
                                  key: i,
                                  to: `/dashboard/session/${item._id}`,
                                  class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
                                }, {
                                  default: withCtx(() => {
                                    var _a3;
                                    return [
                                      createVNode("div", null, [
                                        createVNode("div", { class: "font-semibold mb-1" }, [
                                          createVNode("span", null, toDisplayString(((_a3 = item.exercise) == null ? void 0 : _a3.name) || "General"), 1)
                                        ]),
                                        createVNode("div", { class: "text-sm flex gap-2 divide-x divide-gray-500/50" }, [
                                          createVNode("div", null, toDisplayString(_ctx.$dayjs(item.createdAt).format("dddd, DD MMMM YYYY")), 1),
                                          createVNode("div", { class: "pl-2" }, toDisplayString(_ctx.$dayjs(item.createdAt).format("h:mm A")), 1)
                                        ])
                                      ]),
                                      createVNode("div", { class: "flex flex-col items-end" }, [
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
                                  }),
                                  _: 2
                                }, 1032, ["to"]);
                              }), 128)),
                              !unref(Session).sessions.value || ((_a2 = unref(Session).sessions.value) == null ? void 0 : _a2.length) === 0 ? (openBlock(), createBlock("div", {
                                key: 0,
                                class: "text-center"
                              }, "no session recorded")) : createCommentVNode("", true)
                            ])
                          ];
                        }),
                        _: 1
                      }),
                      createVNode(_component_HeadlessTabPanel, null, {
                        default: withCtx(() => [
                          createVNode(_component_UTable, {
                            columns: unref(Exercise).columns,
                            rows: unref(Exercise).exercises.value
                          }, null, 8, ["columns", "rows"])
                        ]),
                        _: 1
                      })
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
            } else {
              return [
                createVNode(_component_HeadlessTabList, { class: "border-b-2 w-auto border-gray-500/20 rounded" }, {
                  default: withCtx(() => [
                    (openBlock(), createBlock(Fragment, null, renderList(["Home", "My Session", "Exercises", "Program", "Information"], (item, i) => {
                      return createVNode(_component_HeadlessTab, { as: "template" }, {
                        default: withCtx(({ selected }) => [
                          createVNode("button", {
                            class: {
                              "px-2 py-2 text-sm ": true,
                              "rounded bg-gray-300/50 dark:bg-gray-700/50 font-bold": selected,
                              "": !selected
                            }
                          }, toDisplayString(item), 3)
                        ]),
                        _: 2
                      }, 1024);
                    }), 64))
                  ]),
                  _: 1
                }),
                createVNode(_component_HeadlessTabPanels, null, {
                  default: withCtx(() => [
                    createVNode(_component_HeadlessTabPanel, null, {
                      default: withCtx(() => [
                        createVNode("div", null, [
                          createVNode("div", { class: "font-semibold mb-4" }, "Your Result on this Company Today"),
                          createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
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
                        ])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_HeadlessTabPanel, null, {
                      default: withCtx(() => {
                        var _a2;
                        return [
                          createVNode("div", { class: "flex flex-col gap-2" }, [
                            (openBlock(true), createBlock(Fragment, null, renderList(unref(Session).sessions.value, (item, i) => {
                              return openBlock(), createBlock(_component_NuxtLink, {
                                key: i,
                                to: `/dashboard/session/${item._id}`,
                                class: "transition-all duration-300 border border-main hover:border-primary-500 rounded-lg px-6 py-4 flex justify-between items-center"
                              }, {
                                default: withCtx(() => {
                                  var _a3;
                                  return [
                                    createVNode("div", null, [
                                      createVNode("div", { class: "font-semibold mb-1" }, [
                                        createVNode("span", null, toDisplayString(((_a3 = item.exercise) == null ? void 0 : _a3.name) || "General"), 1)
                                      ]),
                                      createVNode("div", { class: "text-sm flex gap-2 divide-x divide-gray-500/50" }, [
                                        createVNode("div", null, toDisplayString(_ctx.$dayjs(item.createdAt).format("dddd, DD MMMM YYYY")), 1),
                                        createVNode("div", { class: "pl-2" }, toDisplayString(_ctx.$dayjs(item.createdAt).format("h:mm A")), 1)
                                      ])
                                    ]),
                                    createVNode("div", { class: "flex flex-col items-end" }, [
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
                                }),
                                _: 2
                              }, 1032, ["to"]);
                            }), 128)),
                            !unref(Session).sessions.value || ((_a2 = unref(Session).sessions.value) == null ? void 0 : _a2.length) === 0 ? (openBlock(), createBlock("div", {
                              key: 0,
                              class: "text-center"
                            }, "no session recorded")) : createCommentVNode("", true)
                          ])
                        ];
                      }),
                      _: 1
                    }),
                    createVNode(_component_HeadlessTabPanel, null, {
                      default: withCtx(() => [
                        createVNode(_component_UTable, {
                          columns: unref(Exercise).columns,
                          rows: unref(Exercise).exercises.value
                        }, null, 8, ["columns", "rows"])
                      ]),
                      _: 1
                    })
                  ]),
                  _: 1
                })
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</div>`);
      } else {
        _push(`<!---->`);
      }
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-D6UtpmK9.mjs.map
