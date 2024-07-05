import { _ as __nuxt_component_1 } from './Container-DpLOowOq.mjs';
import { _ as __nuxt_component_1$1 } from './Section-DHOkqozb.mjs';
import { i as useRoute, h as useAuth, n as navigateTo, k as __nuxt_component_2$1, e as __nuxt_component_2 } from './server.mjs';
import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { defineComponent, computed, withAsyncContext, mergeProps, withCtx, unref, createVNode, createTextVNode, toDisplayString, openBlock, createBlock, useSSRContext } from 'vue';
import { a as useFetch, u as useFetchWithAuth } from './use-fetch-with-auth-D9SMyDpm.mjs';
import { ssrRenderComponent, ssrInterpolate } from 'vue/server-renderer';
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
  __name: "[uuid]",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const $route = useRoute();
    const uuid = computed(() => $route.params.uuid);
    const $auth = useAuth();
    if (!uuid.value)
      navigateTo("/");
    const { data: companyData, status } = ([__temp, __restore] = withAsyncContext(() => useFetch(Api.Company.Company.url(uuid.value), "$vwRwJjy6Ny")), __temp = await __temp, __restore(), __temp);
    const join = async () => {
      var _a;
      try {
        const { data, status: status2 } = await useFetchWithAuth(Api.Company.Join.url(), {
          method: "POST",
          body: {
            code: (_a = companyData.value) == null ? void 0 : _a.company._id
          }
        });
        navigateTo("/dashboard/company");
      } catch (error) {
        console.error(error);
      }
    };
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_1;
      const _component_PageSection = __nuxt_component_1$1;
      const _component_Icon = __nuxt_component_2$1;
      const _component_UCard = __nuxt_component_0;
      const _component_UButton = __nuxt_component_2;
      _push(ssrRenderComponent(_component_PageContainer, mergeProps({ class: "flex-1 flex flex-col gap-4 justify-center" }, _attrs), {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_PageSection, { class: "flex flex-col items-center justify-center" }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  if (unref(status) == "pending") {
                    _push3(`<div${_scopeId2}>`);
                    _push3(ssrRenderComponent(_component_Icon, {
                      name: "i-mingcute-loading-line",
                      class: "text-4xl text-primary-500 animate-spin"
                    }, null, _parent3, _scopeId2));
                    _push3(`</div>`);
                  } else if (unref(status) == "error") {
                    _push3(`<div${_scopeId2}><div class="text-red-500"${_scopeId2}>Error</div></div>`);
                  } else {
                    _push3(`<div class="w-full md:w-1/2"${_scopeId2}>`);
                    _push3(ssrRenderComponent(_component_UCard, null, {
                      header: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        if (_push4) {
                          _push4(`<div class="flex justify-between"${_scopeId3}><div class="font-bold text-xl"${_scopeId3}>Join Company</div></div>`);
                        } else {
                          return [
                            createVNode("div", { class: "flex justify-between" }, [
                              createVNode("div", { class: "font-bold text-xl" }, "Join Company")
                            ])
                          ];
                        }
                      }),
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        var _a, _b, _c, _d;
                        if (_push4) {
                          _push4(`<div class="flex flex-col gap-2"${_scopeId3}><p class="text-center"${_scopeId3}> You are invited to join <span class="font-bold"${_scopeId3}>${ssrInterpolate((_a = unref(companyData)) == null ? void 0 : _a.company.name)}</span>, located at ${ssrInterpolate((_b = unref(companyData)) == null ? void 0 : _b.company.address)}. </p><div class="flex justify-end items-center gap-2"${_scopeId3}>`);
                          _push4(ssrRenderComponent(_component_UButton, {
                            to: "/",
                            color: "gray"
                          }, {
                            default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                              if (_push5) {
                                _push5(`No, I dont`);
                              } else {
                                return [
                                  createTextVNode("No, I dont")
                                ];
                              }
                            }),
                            _: 1
                          }, _parent4, _scopeId3));
                          if (unref($auth).status.value == "authenticated") {
                            _push4(ssrRenderComponent(_component_UButton, {
                              color: "primary",
                              onClick: join
                            }, {
                              default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                                if (_push5) {
                                  _push5(`Join Company`);
                                } else {
                                  return [
                                    createTextVNode("Join Company")
                                  ];
                                }
                              }),
                              _: 1
                            }, _parent4, _scopeId3));
                          } else {
                            _push4(ssrRenderComponent(_component_UButton, {
                              color: "primary",
                              to: "/auth/login"
                            }, {
                              default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                                if (_push5) {
                                  _push5(`Login First`);
                                } else {
                                  return [
                                    createTextVNode("Login First")
                                  ];
                                }
                              }),
                              _: 1
                            }, _parent4, _scopeId3));
                          }
                          _push4(`</div></div>`);
                        } else {
                          return [
                            createVNode("div", { class: "flex flex-col gap-2" }, [
                              createVNode("p", { class: "text-center" }, [
                                createTextVNode(" You are invited to join "),
                                createVNode("span", { class: "font-bold" }, toDisplayString((_c = unref(companyData)) == null ? void 0 : _c.company.name), 1),
                                createTextVNode(", located at " + toDisplayString((_d = unref(companyData)) == null ? void 0 : _d.company.address) + ". ", 1)
                              ]),
                              createVNode("div", { class: "flex justify-end items-center gap-2" }, [
                                createVNode(_component_UButton, {
                                  to: "/",
                                  color: "gray"
                                }, {
                                  default: withCtx(() => [
                                    createTextVNode("No, I dont")
                                  ]),
                                  _: 1
                                }),
                                unref($auth).status.value == "authenticated" ? (openBlock(), createBlock(_component_UButton, {
                                  key: 0,
                                  color: "primary",
                                  onClick: join
                                }, {
                                  default: withCtx(() => [
                                    createTextVNode("Join Company")
                                  ]),
                                  _: 1
                                })) : (openBlock(), createBlock(_component_UButton, {
                                  key: 1,
                                  color: "primary",
                                  to: "/auth/login"
                                }, {
                                  default: withCtx(() => [
                                    createTextVNode("Login First")
                                  ]),
                                  _: 1
                                }))
                              ])
                            ])
                          ];
                        }
                      }),
                      _: 1
                    }, _parent3, _scopeId2));
                    _push3(`</div>`);
                  }
                } else {
                  return [
                    unref(status) == "pending" ? (openBlock(), createBlock("div", { key: 0 }, [
                      createVNode(_component_Icon, {
                        name: "i-mingcute-loading-line",
                        class: "text-4xl text-primary-500 animate-spin"
                      })
                    ])) : unref(status) == "error" ? (openBlock(), createBlock("div", { key: 1 }, [
                      createVNode("div", { class: "text-red-500" }, "Error")
                    ])) : (openBlock(), createBlock("div", {
                      key: 2,
                      class: "w-full md:w-1/2"
                    }, [
                      createVNode(_component_UCard, null, {
                        header: withCtx(() => [
                          createVNode("div", { class: "flex justify-between" }, [
                            createVNode("div", { class: "font-bold text-xl" }, "Join Company")
                          ])
                        ]),
                        default: withCtx(() => {
                          var _a, _b;
                          return [
                            createVNode("div", { class: "flex flex-col gap-2" }, [
                              createVNode("p", { class: "text-center" }, [
                                createTextVNode(" You are invited to join "),
                                createVNode("span", { class: "font-bold" }, toDisplayString((_a = unref(companyData)) == null ? void 0 : _a.company.name), 1),
                                createTextVNode(", located at " + toDisplayString((_b = unref(companyData)) == null ? void 0 : _b.company.address) + ". ", 1)
                              ]),
                              createVNode("div", { class: "flex justify-end items-center gap-2" }, [
                                createVNode(_component_UButton, {
                                  to: "/",
                                  color: "gray"
                                }, {
                                  default: withCtx(() => [
                                    createTextVNode("No, I dont")
                                  ]),
                                  _: 1
                                }),
                                unref($auth).status.value == "authenticated" ? (openBlock(), createBlock(_component_UButton, {
                                  key: 0,
                                  color: "primary",
                                  onClick: join
                                }, {
                                  default: withCtx(() => [
                                    createTextVNode("Join Company")
                                  ]),
                                  _: 1
                                })) : (openBlock(), createBlock(_component_UButton, {
                                  key: 1,
                                  color: "primary",
                                  to: "/auth/login"
                                }, {
                                  default: withCtx(() => [
                                    createTextVNode("Login First")
                                  ]),
                                  _: 1
                                }))
                              ])
                            ])
                          ];
                        }),
                        _: 1
                      })
                    ]))
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_PageSection, { class: "flex flex-col items-center justify-center" }, {
                default: withCtx(() => [
                  unref(status) == "pending" ? (openBlock(), createBlock("div", { key: 0 }, [
                    createVNode(_component_Icon, {
                      name: "i-mingcute-loading-line",
                      class: "text-4xl text-primary-500 animate-spin"
                    })
                  ])) : unref(status) == "error" ? (openBlock(), createBlock("div", { key: 1 }, [
                    createVNode("div", { class: "text-red-500" }, "Error")
                  ])) : (openBlock(), createBlock("div", {
                    key: 2,
                    class: "w-full md:w-1/2"
                  }, [
                    createVNode(_component_UCard, null, {
                      header: withCtx(() => [
                        createVNode("div", { class: "flex justify-between" }, [
                          createVNode("div", { class: "font-bold text-xl" }, "Join Company")
                        ])
                      ]),
                      default: withCtx(() => {
                        var _a, _b;
                        return [
                          createVNode("div", { class: "flex flex-col gap-2" }, [
                            createVNode("p", { class: "text-center" }, [
                              createTextVNode(" You are invited to join "),
                              createVNode("span", { class: "font-bold" }, toDisplayString((_a = unref(companyData)) == null ? void 0 : _a.company.name), 1),
                              createTextVNode(", located at " + toDisplayString((_b = unref(companyData)) == null ? void 0 : _b.company.address) + ". ", 1)
                            ]),
                            createVNode("div", { class: "flex justify-end items-center gap-2" }, [
                              createVNode(_component_UButton, {
                                to: "/",
                                color: "gray"
                              }, {
                                default: withCtx(() => [
                                  createTextVNode("No, I dont")
                                ]),
                                _: 1
                              }),
                              unref($auth).status.value == "authenticated" ? (openBlock(), createBlock(_component_UButton, {
                                key: 0,
                                color: "primary",
                                onClick: join
                              }, {
                                default: withCtx(() => [
                                  createTextVNode("Join Company")
                                ]),
                                _: 1
                              })) : (openBlock(), createBlock(_component_UButton, {
                                key: 1,
                                color: "primary",
                                to: "/auth/login"
                              }, {
                                default: withCtx(() => [
                                  createTextVNode("Login First")
                                ]),
                                _: 1
                              }))
                            ])
                          ])
                        ];
                      }),
                      _: 1
                    })
                  ]))
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/invite/[uuid].vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=_uuid_-5mifV_RR.mjs.map
