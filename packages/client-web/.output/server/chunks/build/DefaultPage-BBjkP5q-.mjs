import { _ as __nuxt_component_1 } from './Container-BL9-rOfc.mjs';
import { g as useSeoMeta, T as useSwitchLocalePath, h as useAuth, C as useRuntimeConfig, a as __nuxt_component_0$2, e as __nuxt_component_2$1, d as __nuxt_component_1$2, R as __nuxt_component_0$1, G as __nuxt_component_8 } from './server.mjs';
import { _ as __nuxt_component_2 } from './nuxt-img-rzz2qMzP.mjs';
import { _ as __nuxt_component_1$1 } from './Dropdown-BbTDYNmI.mjs';
import { _ as _sfc_main$1 } from './ButtonColorMode-ONifNTxo.mjs';
import { _ as __nuxt_component_9 } from './SelectMenu-kqbj49aQ.mjs';
import { defineComponent, ref, watch, mergeProps, withCtx, createVNode, unref, toDisplayString, openBlock, createBlock, createTextVNode, isRef, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderSlot } from 'vue/server-renderer';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "DefaultPage",
  __ssrInlineRender: true,
  setup(__props) {
    const $config = useRuntimeConfig();
    const meta = {
      title: "Hatofit - Be Fit and Healthy",
      description: "Hatofit is a platform that helps you to be fit and healthy, help you to track and monitoring your health.",
      image: "/images/logo/hatofit.png",
      url: $config.public.baseUrl
    };
    useSeoMeta({
      title: meta.title,
      description: meta.description,
      ogTitle: meta.title,
      ogDescription: meta.description,
      ogImage: meta.image,
      ogUrl: meta.url
    });
    const switchLocalePath = useSwitchLocalePath();
    const languages = [
      { id: "id", name: "Indonesia", icon: "\u{1F1EE}\u{1F1E9}" },
      { id: "en", name: "English", icon: "\u{1F1EC}\u{1F1E7}" }
    ];
    const languageSelected = ref(languages[1]);
    watch(languageSelected, (value) => {
      console.log("Language Selected:", value);
      switchLocalePath(value.id);
    });
    const $auth = useAuth();
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_1;
      const _component_NuxtLink = __nuxt_component_0$2;
      const _component_NuxtImg = __nuxt_component_2;
      const _component_UButton = __nuxt_component_2$1;
      const _component_UDropdown = __nuxt_component_1$1;
      const _component_UAvatar = __nuxt_component_1$2;
      const _component_ButtonColorMode = _sfc_main$1;
      const _component_ULink = __nuxt_component_0$1;
      const _component_ClientOnly = __nuxt_component_8;
      const _component_USelectMenu = __nuxt_component_9;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col min-h-screen w-full bg-gray-50 dark:bg-gray-950 text-gray-800 dark:text-gray-200" }, _attrs))}><div class="h-[68px] border-b border-main w-full sticky top-0 flex items-center z-30 bg-gray-50/75 dark:bg-gray-950/75 backdrop-filter backdrop-blur-lg">`);
      _push(ssrRenderComponent(_component_PageContainer, { class: "flex-1 max-w-screen-lg mx-auto flex justify-between" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_NuxtLink, {
              to: "/",
              class: "flex gap-2 items-center"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<div class="h-[24px] relative overflow-hidden"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_NuxtImg, {
                    src: "/images/logo/hatofit.png",
                    alt: "Hatofit Logo",
                    style: {
                      width: "auto",
                      height: "100%"
                    },
                    loading: "lazy"
                  }, null, _parent3, _scopeId2));
                  _push3(`</div><h1 class="text-2xl font-bold"${_scopeId2}>HATOFIT</h1>`);
                } else {
                  return [
                    createVNode("div", { class: "h-[24px] relative overflow-hidden" }, [
                      createVNode(_component_NuxtImg, {
                        src: "/images/logo/hatofit.png",
                        alt: "Hatofit Logo",
                        style: {
                          width: "auto",
                          height: "100%"
                        },
                        loading: "lazy"
                      })
                    ]),
                    createVNode("h1", { class: "text-2xl font-bold" }, "HATOFIT")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`<div class="flex items-center gap-4 divide-x-2 divide-main"${_scopeId}>`);
            if (unref($auth).status.value != "authenticated") {
              _push2(`<div class="flex gap-2"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UButton, {
                to: "/auth/register",
                variant: "link",
                color: "primary",
                label: "Register",
                icon: "i-heroicons-ui:document-add"
              }, null, _parent2, _scopeId));
              _push2(ssrRenderComponent(_component_UButton, {
                to: "/auth/login",
                variant: "solid",
                color: "primary",
                label: "Login"
              }, null, _parent2, _scopeId));
              _push2(`</div>`);
            } else {
              _push2(`<div class="flex flex-col items-center"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UDropdown, {
                items: [
                  [
                    { label: "Dashboard", icon: "i-heroicons-home", to: "/dashboard" },
                    { label: "Profile", icon: "i-heroicons-user", to: "/dashboard/profile" }
                  ],
                  [
                    { label: "Logout", icon: "i-heroicons-arrow-left-start-on-rectangle-20-solid", click: () => unref($auth).signOut({ callbackUrl: "/auth/login", redirect: true }) }
                  ]
                ]
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  var _a, _b, _c, _d, _e, _f, _g, _h;
                  if (_push3) {
                    _push3(`<div class="flex items-center"${_scopeId2}>`);
                    _push3(ssrRenderComponent(_component_UAvatar, {
                      src: (_b = (_a = unref($auth).data.value) == null ? void 0 : _a.user) == null ? void 0 : _b.avatar,
                      alt: "User Avatar",
                      size: "xs"
                    }, null, _parent3, _scopeId2));
                    _push3(`<span class="text-sm ml-3"${_scopeId2}>${ssrInterpolate((_d = (_c = unref($auth).data.value) == null ? void 0 : _c.user) == null ? void 0 : _d.name)}</span></div>`);
                  } else {
                    return [
                      createVNode("div", { class: "flex items-center" }, [
                        createVNode(_component_UAvatar, {
                          src: (_f = (_e = unref($auth).data.value) == null ? void 0 : _e.user) == null ? void 0 : _f.avatar,
                          alt: "User Avatar",
                          size: "xs"
                        }, null, 8, ["src"]),
                        createVNode("span", { class: "text-sm ml-3" }, toDisplayString((_h = (_g = unref($auth).data.value) == null ? void 0 : _g.user) == null ? void 0 : _h.name), 1)
                      ])
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(`</div>`);
            }
            _push2(`<div class="pl-4"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_ButtonColorMode, null, null, _parent2, _scopeId));
            _push2(`</div></div>`);
          } else {
            return [
              createVNode(_component_NuxtLink, {
                to: "/",
                class: "flex gap-2 items-center"
              }, {
                default: withCtx(() => [
                  createVNode("div", { class: "h-[24px] relative overflow-hidden" }, [
                    createVNode(_component_NuxtImg, {
                      src: "/images/logo/hatofit.png",
                      alt: "Hatofit Logo",
                      style: {
                        width: "auto",
                        height: "100%"
                      },
                      loading: "lazy"
                    })
                  ]),
                  createVNode("h1", { class: "text-2xl font-bold" }, "HATOFIT")
                ]),
                _: 1
              }),
              createVNode("div", { class: "flex items-center gap-4 divide-x-2 divide-main" }, [
                unref($auth).status.value != "authenticated" ? (openBlock(), createBlock("div", {
                  key: 0,
                  class: "flex gap-2"
                }, [
                  createVNode(_component_UButton, {
                    to: "/auth/register",
                    variant: "link",
                    color: "primary",
                    label: "Register",
                    icon: "i-heroicons-ui:document-add"
                  }),
                  createVNode(_component_UButton, {
                    to: "/auth/login",
                    variant: "solid",
                    color: "primary",
                    label: "Login"
                  })
                ])) : (openBlock(), createBlock("div", {
                  key: 1,
                  class: "flex flex-col items-center"
                }, [
                  createVNode(_component_UDropdown, {
                    items: [
                      [
                        { label: "Dashboard", icon: "i-heroicons-home", to: "/dashboard" },
                        { label: "Profile", icon: "i-heroicons-user", to: "/dashboard/profile" }
                      ],
                      [
                        { label: "Logout", icon: "i-heroicons-arrow-left-start-on-rectangle-20-solid", click: () => unref($auth).signOut({ callbackUrl: "/auth/login", redirect: true }) }
                      ]
                    ]
                  }, {
                    default: withCtx(() => {
                      var _a, _b, _c, _d;
                      return [
                        createVNode("div", { class: "flex items-center" }, [
                          createVNode(_component_UAvatar, {
                            src: (_b = (_a = unref($auth).data.value) == null ? void 0 : _a.user) == null ? void 0 : _b.avatar,
                            alt: "User Avatar",
                            size: "xs"
                          }, null, 8, ["src"]),
                          createVNode("span", { class: "text-sm ml-3" }, toDisplayString((_d = (_c = unref($auth).data.value) == null ? void 0 : _c.user) == null ? void 0 : _d.name), 1)
                        ])
                      ];
                    }),
                    _: 1
                  }, 8, ["items"])
                ])),
                createVNode("div", { class: "pl-4" }, [
                  createVNode(_component_ButtonColorMode)
                ])
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div><div class="flex-1 flex">`);
      ssrRenderSlot(_ctx.$slots, "default", {}, null, _push, _parent);
      _push(`</div><footer class="w-full flex justify-between border-t border-main items-center">`);
      _push(ssrRenderComponent(_component_PageContainer, { class: "py-2 flex-1 flex justify-between w-full items-center" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="text-sm flex items-center"${_scopeId}> \xA9 ${ssrInterpolate((/* @__PURE__ */ new Date()).getFullYear())} `);
            _push2(ssrRenderComponent(_component_UButton, {
              to: "/",
              variant: "link",
              class: ""
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`HATOFIT TEAM`);
                } else {
                  return [
                    createTextVNode("HATOFIT TEAM")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`</div><div class="flex items-center gap-1"${_scopeId}><div${_scopeId}>`);
            _push2(ssrRenderComponent(_component_ULink, { to: "/privacy-policies" }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UButton, {
                    variant: "link",
                    size: "xs"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(` Privacy Policies `);
                      } else {
                        return [
                          createTextVNode(" Privacy Policies ")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UButton, {
                      variant: "link",
                      size: "xs"
                    }, {
                      default: withCtx(() => [
                        createTextVNode(" Privacy Policies ")
                      ]),
                      _: 1
                    })
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`</div><div class="h-6 w-0.5 bg-gray-500/50 mr-2"${_scopeId}></div>`);
            _push2(ssrRenderComponent(_component_ClientOnly, null, {}, _parent2, _scopeId));
            _push2(`</div>`);
          } else {
            return [
              createVNode("div", { class: "text-sm flex items-center" }, [
                createTextVNode(" \xA9 " + toDisplayString((/* @__PURE__ */ new Date()).getFullYear()) + " ", 1),
                createVNode(_component_UButton, {
                  to: "/",
                  variant: "link",
                  class: ""
                }, {
                  default: withCtx(() => [
                    createTextVNode("HATOFIT TEAM")
                  ]),
                  _: 1
                })
              ]),
              createVNode("div", { class: "flex items-center gap-1" }, [
                createVNode("div", null, [
                  createVNode(_component_ULink, { to: "/privacy-policies" }, {
                    default: withCtx(() => [
                      createVNode(_component_UButton, {
                        variant: "link",
                        size: "xs"
                      }, {
                        default: withCtx(() => [
                          createTextVNode(" Privacy Policies ")
                        ]),
                        _: 1
                      })
                    ]),
                    _: 1
                  })
                ]),
                createVNode("div", { class: "h-6 w-0.5 bg-gray-500/50 mr-2" }),
                createVNode(_component_ClientOnly, null, {
                  default: withCtx(() => [
                    createVNode(_component_USelectMenu, {
                      modelValue: unref(languageSelected),
                      "onUpdate:modelValue": ($event) => isRef(languageSelected) ? languageSelected.value = $event : null,
                      options: languages,
                      "option-attribute": "name"
                    }, {
                      label: withCtx(() => [
                        createVNode("span", null, toDisplayString(unref(languageSelected).icon), 1),
                        createVNode("span", { class: "truncate" }, toDisplayString(unref(languageSelected).name), 1)
                      ]),
                      option: withCtx(({ option: lang }) => [
                        createVNode("span", null, toDisplayString(lang.icon), 1),
                        createVNode("span", { class: "truncate" }, toDisplayString(lang.name), 1)
                      ]),
                      _: 1
                    }, 8, ["modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                })
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</footer></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/BaseLayout/DefaultPage.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as _ };
//# sourceMappingURL=DefaultPage-BBjkP5q-.mjs.map
