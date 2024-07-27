import { _ as _sfc_main$2 } from './Title-THJIYvs6.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-lhX-bojE.mjs';
import { m as mergeConfig, b as appConfig, f as useUI, j as useToast, e as __nuxt_component_3, a as __nuxt_component_0$3, _ as _export_sfc } from './server.mjs';
import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { _ as __nuxt_component_2 } from './nuxt-img-BJdlAb4P.mjs';
import { u as useId } from './id-CT9Cm1Vi.mjs';
import { defineComponent, toRef, computed, useSSRContext, ref, watch, reactive, mergeProps, unref, withCtx, createVNode, toDisplayString, createTextVNode, isRef, resolveComponent, renderSlot, openBlock, createBlock, createCommentVNode } from 'vue';
import { Y as Ye, G as Ge, S as Se, h as he, _ as __nuxt_component_6$1 } from './Modal-D84Qr6-q.mjs';
import { l as l$1 } from './tabs-B_zyHFOf.mjs';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderList, ssrInterpolate, ssrRenderClass, ssrRenderSlot } from 'vue/server-renderer';
import { _ as __nuxt_component_3$1 } from './Form-uRAMIMTQ.mjs';
import { _ as __nuxt_component_4 } from './FormGroup-D_Rddz50.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { _ as __nuxt_component_10 } from './Textarea-nwSmVUgI.mjs';
import { u as useFetchWithAuth } from './use-fetch-with-auth-N9InCXnT.mjs';
import { $ as $fetchWithAuth } from './fetch-B7X2m9-g.mjs';
import { A as Api, a as parseErrorFromResponseWithToast } from './api-DoRhrA3A.mjs';
import { z } from 'zod';
import { O as FetchError } from '../runtime.mjs';
import './Kbd-CWGxBI2b.mjs';
import 'tailwind-merge';
import './usePopper-C-zM4LTl.mjs';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'devalue';
import '@unhead/ssr';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'requrl';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import '@vueuse/core';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'node:fs';
import 'node:url';
import 'ipx';
import './active-element-history-DcQBj1iE.mjs';
import './useFormGroup-4DdrZmPB.mjs';

const slideover = {
  wrapper: "fixed inset-0 flex z-50",
  overlay: {
    base: "fixed inset-0 transition-opacity",
    background: "bg-gray-200/75 dark:bg-gray-800/75",
    // Syntax for `<TransitionRoot>` component https://headlessui.com/vue/transition#basic-example
    transition: {
      enter: "ease-in-out duration-500",
      enterFrom: "opacity-0",
      enterTo: "opacity-100",
      leave: "ease-in-out duration-500",
      leaveFrom: "opacity-100",
      leaveTo: "opacity-0"
    }
  },
  base: "relative flex-1 flex flex-col w-full focus:outline-none",
  background: "bg-white dark:bg-gray-900",
  ring: "",
  rounded: "",
  padding: "",
  shadow: "shadow-xl",
  width: "w-screen max-w-md",
  height: "h-screen max-h-96",
  translate: {
    base: "translate-x-0",
    left: "-translate-x-full rtl:translate-x-full",
    right: "translate-x-full rtl:-translate-x-full",
    top: "-translate-y-full",
    bottom: "translate-y-full"
  },
  // Syntax for `<TransitionRoot>` component https://headlessui.com/vue/transition#basic-example
  transition: {
    enter: "transform transition ease-in-out duration-300",
    leave: "transform transition ease-in-out duration-200"
  }
};
const config = mergeConfig(appConfig.ui.strategy, appConfig.ui.slideover, slideover);
const _sfc_main$1 = defineComponent({
  components: {
    HDialog: Ye,
    HDialogPanel: Ge,
    TransitionRoot: Se,
    TransitionChild: he
  },
  inheritAttrs: false,
  props: {
    modelValue: {
      type: Boolean,
      default: false
    },
    appear: {
      type: Boolean,
      default: false
    },
    side: {
      type: String,
      default: "right",
      validator: (value) => ["left", "right", "top", "bottom"].includes(value)
    },
    overlay: {
      type: Boolean,
      default: true
    },
    transition: {
      type: Boolean,
      default: true
    },
    preventClose: {
      type: Boolean,
      default: false
    },
    class: {
      type: [String, Object, Array],
      default: () => ""
    },
    ui: {
      type: Object,
      default: () => ({})
    }
  },
  emits: ["update:modelValue", "close", "close-prevented", "after-leave"],
  setup(props, { emit }) {
    const { ui, attrs } = useUI("slideover", toRef(props, "ui"), config, toRef(props, "class"));
    const isOpen = computed({
      get() {
        return props.modelValue;
      },
      set(value) {
        emit("update:modelValue", value);
      }
    });
    const transitionClass = computed(() => {
      if (!props.transition) {
        return {};
      }
      let enterFrom, leaveTo;
      switch (props.side) {
        case "left":
          enterFrom = ui.value.translate.left;
          leaveTo = ui.value.translate.left;
          break;
        case "right":
          enterFrom = ui.value.translate.right;
          leaveTo = ui.value.translate.right;
          break;
        case "top":
          enterFrom = ui.value.translate.top;
          leaveTo = ui.value.translate.top;
          break;
        case "bottom":
          enterFrom = ui.value.translate.bottom;
          leaveTo = ui.value.translate.bottom;
          break;
        default:
          enterFrom = ui.value.translate.right;
          leaveTo = ui.value.translate.right;
      }
      return {
        ...ui.value.transition,
        enterFrom,
        enterTo: ui.value.translate.base,
        leaveFrom: ui.value.translate.base,
        leaveTo
      };
    });
    const sideType = computed(() => {
      switch (props.side) {
        case "left":
          return "horizontal";
        case "right":
          return "horizontal";
        case "top":
          return "vertical";
        case "bottom":
          return "vertical";
        default:
          return "right";
      }
    });
    function close(value) {
      if (props.preventClose) {
        emit("close-prevented");
        return;
      }
      isOpen.value = value;
      emit("close");
    }
    const onAfterLeave = () => {
      emit("after-leave");
    };
    l$1(() => useId("$0eVPFG8lLQ"));
    return {
      // eslint-disable-next-line vue/no-dupe-keys
      ui,
      attrs,
      isOpen,
      transitionClass,
      sideType,
      onAfterLeave,
      close
    };
  }
});
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_TransitionRoot = resolveComponent("TransitionRoot");
  const _component_HDialog = resolveComponent("HDialog");
  const _component_TransitionChild = resolveComponent("TransitionChild");
  const _component_HDialogPanel = resolveComponent("HDialogPanel");
  _push(ssrRenderComponent(_component_TransitionRoot, mergeProps({
    as: "template",
    appear: _ctx.appear,
    show: _ctx.isOpen,
    onAfterLeave: _ctx.onAfterLeave
  }, _attrs), {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        _push2(ssrRenderComponent(_component_HDialog, mergeProps({
          class: [_ctx.ui.wrapper, { "justify-end": _ctx.side === "right" }, { "items-end": _ctx.side === "bottom" }]
        }, _ctx.attrs, { onClose: _ctx.close }), {
          default: withCtx((_2, _push3, _parent3, _scopeId2) => {
            if (_push3) {
              if (_ctx.overlay) {
                _push3(ssrRenderComponent(_component_TransitionChild, mergeProps({
                  as: "template",
                  appear: _ctx.appear
                }, _ctx.ui.overlay.transition), {
                  default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                    if (_push4) {
                      _push4(`<div class="${ssrRenderClass([_ctx.ui.overlay.base, _ctx.ui.overlay.background])}"${_scopeId3}></div>`);
                    } else {
                      return [
                        createVNode("div", {
                          class: [_ctx.ui.overlay.base, _ctx.ui.overlay.background]
                        }, null, 2)
                      ];
                    }
                  }),
                  _: 1
                }, _parent3, _scopeId2));
              } else {
                _push3(`<!---->`);
              }
              _push3(ssrRenderComponent(_component_TransitionChild, mergeProps({
                as: "template",
                appear: _ctx.appear
              }, _ctx.transitionClass), {
                default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                  if (_push4) {
                    _push4(ssrRenderComponent(_component_HDialogPanel, {
                      class: [_ctx.ui.base, _ctx.sideType === "horizontal" ? [_ctx.ui.width, "h-full"] : [_ctx.ui.height, "w-full"], _ctx.ui.background, _ctx.ui.ring, _ctx.ui.padding]
                    }, {
                      default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                        if (_push5) {
                          ssrRenderSlot(_ctx.$slots, "default", {}, null, _push5, _parent5, _scopeId4);
                        } else {
                          return [
                            renderSlot(_ctx.$slots, "default")
                          ];
                        }
                      }),
                      _: 3
                    }, _parent4, _scopeId3));
                  } else {
                    return [
                      createVNode(_component_HDialogPanel, {
                        class: [_ctx.ui.base, _ctx.sideType === "horizontal" ? [_ctx.ui.width, "h-full"] : [_ctx.ui.height, "w-full"], _ctx.ui.background, _ctx.ui.ring, _ctx.ui.padding]
                      }, {
                        default: withCtx(() => [
                          renderSlot(_ctx.$slots, "default")
                        ]),
                        _: 3
                      }, 8, ["class"])
                    ];
                  }
                }),
                _: 3
              }, _parent3, _scopeId2));
            } else {
              return [
                _ctx.overlay ? (openBlock(), createBlock(_component_TransitionChild, mergeProps({
                  key: 0,
                  as: "template",
                  appear: _ctx.appear
                }, _ctx.ui.overlay.transition), {
                  default: withCtx(() => [
                    createVNode("div", {
                      class: [_ctx.ui.overlay.base, _ctx.ui.overlay.background]
                    }, null, 2)
                  ]),
                  _: 1
                }, 16, ["appear"])) : createCommentVNode("", true),
                createVNode(_component_TransitionChild, mergeProps({
                  as: "template",
                  appear: _ctx.appear
                }, _ctx.transitionClass), {
                  default: withCtx(() => [
                    createVNode(_component_HDialogPanel, {
                      class: [_ctx.ui.base, _ctx.sideType === "horizontal" ? [_ctx.ui.width, "h-full"] : [_ctx.ui.height, "w-full"], _ctx.ui.background, _ctx.ui.ring, _ctx.ui.padding]
                    }, {
                      default: withCtx(() => [
                        renderSlot(_ctx.$slots, "default")
                      ]),
                      _: 3
                    }, 8, ["class"])
                  ]),
                  _: 3
                }, 16, ["appear"])
              ];
            }
          }),
          _: 3
        }, _parent2, _scopeId));
      } else {
        return [
          createVNode(_component_HDialog, mergeProps({
            class: [_ctx.ui.wrapper, { "justify-end": _ctx.side === "right" }, { "items-end": _ctx.side === "bottom" }]
          }, _ctx.attrs, { onClose: _ctx.close }), {
            default: withCtx(() => [
              _ctx.overlay ? (openBlock(), createBlock(_component_TransitionChild, mergeProps({
                key: 0,
                as: "template",
                appear: _ctx.appear
              }, _ctx.ui.overlay.transition), {
                default: withCtx(() => [
                  createVNode("div", {
                    class: [_ctx.ui.overlay.base, _ctx.ui.overlay.background]
                  }, null, 2)
                ]),
                _: 1
              }, 16, ["appear"])) : createCommentVNode("", true),
              createVNode(_component_TransitionChild, mergeProps({
                as: "template",
                appear: _ctx.appear
              }, _ctx.transitionClass), {
                default: withCtx(() => [
                  createVNode(_component_HDialogPanel, {
                    class: [_ctx.ui.base, _ctx.sideType === "horizontal" ? [_ctx.ui.width, "h-full"] : [_ctx.ui.height, "w-full"], _ctx.ui.background, _ctx.ui.ring, _ctx.ui.padding]
                  }, {
                    default: withCtx(() => [
                      renderSlot(_ctx.$slots, "default")
                    ]),
                    _: 3
                  }, 8, ["class"])
                ]),
                _: 3
              }, 16, ["appear"])
            ]),
            _: 3
          }, 16, ["class", "onClose"])
        ];
      }
    }),
    _: 3
  }, _parent));
}
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("../../node_modules/@nuxt/ui/dist/runtime/components/overlays/Slideover.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_6 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["ssrRender", _sfc_ssrRender]]);
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    const $toast = useToast();
    const createModelIsOpen = ref(false);
    const { data, refresh } = useFetchWithAuth(Api.Company.Companies.url());
    watch(data, (value) => {
      console.log("watch", value);
    });
    const CompanyCreateModal = (() => {
      const schema = z.object({
        name: z.string().min(4, "Must be at least 4 characters"),
        description: z.string().min(4, "Must be at least 4 characters"),
        address: z.string().min(4, "Must be at least 4 characters")
      });
      const state = reactive({
        name: "",
        description: "",
        address: ""
      });
      async function onSubmitRegister(event) {
        try {
          const res = await $fetchWithAuth(
            Api.Company.CreateCompany.url(),
            {
              method: "POST",
              body: Api.Company.CreateCompany.parseData({
                ...state
              })
            }
          );
          $toast.add({
            title: "Success",
            description: "Company created successfully"
          });
          createModelIsOpen.value = false;
          refresh();
        } catch (error) {
          if (error instanceof FetchError && error.response)
            parseErrorFromResponseWithToast(error.response);
        }
      }
      return {
        state,
        schema,
        onSubmitRegister
      };
    })();
    const CompanyJoinModal = (() => {
      const isOpen = ref(false);
      const schema = z.object({
        code: z.string().min(1, "Must be at least 4 characters")
      });
      const state = reactive({
        code: ""
      });
      const save = async () => {
        try {
          const res = await $fetchWithAuth(
            Api.Company.Join.url(),
            {
              method: "POST",
              body: JSON.stringify({ code: state.code })
            }
          );
          console.log("res", res);
          $toast.add({
            title: "Success",
            description: "Company joined successfully"
          });
          isOpen.value = false;
          refresh();
        } catch (error) {
          if (error instanceof FetchError && error.response)
            parseErrorFromResponseWithToast(error.response);
          console.error(error);
        }
      };
      return {
        isOpen,
        schema,
        state,
        save
      };
    })();
    return (_ctx, _push, _parent, _attrs) => {
      var _a, _b, _c;
      const _component_PageTitle = _sfc_main$2;
      const _component_UDropdown = __nuxt_component_1;
      const _component_UButton = __nuxt_component_3;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_UCard = __nuxt_component_0;
      const _component_NuxtImg = __nuxt_component_2;
      const _component_USlideover = __nuxt_component_6;
      const _component_UForm = __nuxt_component_3$1;
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_UTextarea = __nuxt_component_10;
      const _component_UModal = __nuxt_component_6$1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex-1" }, _attrs))}><div class="flex justify-between">`);
      _push(ssrRenderComponent(_component_PageTitle, { text: "Your Company" }, null, _parent));
      _push(`<div>`);
      _push(ssrRenderComponent(_component_UDropdown, {
        items: [
          [
            { label: "Create Company", icon: "i-heroicons-plus", click: () => createModelIsOpen.value = true },
            { label: "Join Company", icon: "i-heroicons-user-add", click: () => unref(CompanyJoinModal).isOpen.value = true }
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
      _push(`</div></div>`);
      if (((_b = (_a = unref(data)) == null ? void 0 : _a.companies) == null ? void 0 : _b.length) || 0 > 0) {
        _push(`<div class="w-full grid grid-cols-3 gap-4"><!--[-->`);
        ssrRenderList((_c = unref(data)) == null ? void 0 : _c.companies, (item, i) => {
          _push(ssrRenderComponent(_component_NuxtLink, {
            to: `/dashboard/company/${item.id}`,
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
                      _push3(`<div class="absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50"${_scopeId2}><div class="ml-1 text-gray-100"${_scopeId2}>${ssrInterpolate(item.name)}</div><div class="ml-1 text-xs text-gray-300"${_scopeId2}>${ssrInterpolate(item.description)}</div></div>`);
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
                        }),
                        createVNode("div", { class: "absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50" }, [
                          createVNode("div", { class: "ml-1 text-gray-100" }, toDisplayString(item.name), 1),
                          createVNode("div", { class: "ml-1 text-xs text-gray-300" }, toDisplayString(item.description), 1)
                        ])
                      ];
                    }
                  }),
                  _: 2
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
                      }),
                      createVNode("div", { class: "absolute top-0 left-0 w-full h-full flex flex-col justify-end pb-2 px-2 z-10 bg-black/50" }, [
                        createVNode("div", { class: "ml-1 text-gray-100" }, toDisplayString(item.name), 1),
                        createVNode("div", { class: "ml-1 text-xs text-gray-300" }, toDisplayString(item.description), 1)
                      ])
                    ]),
                    _: 2
                  }, 1024)
                ];
              }
            }),
            _: 2
          }, _parent));
        });
        _push(`<!--]--></div>`);
      } else {
        _push(`<div class="flex items-center justify-center h-[300px]"><div class="flex flex-col items-center gap-4"><div class="text-xs text-gray-500 dark:text-gray-400">You don&#39;t join any company yet, create your own company or join another company</div><div class="flex gap-4">`);
        _push(ssrRenderComponent(_component_UButton, {
          color: "primary",
          onClick: ($event) => createModelIsOpen.value = true
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`Create Company`);
            } else {
              return [
                createTextVNode("Create Company")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(ssrRenderComponent(_component_UButton, {
          color: "gray",
          onClick: ($event) => unref(CompanyJoinModal).isOpen.value = true
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`Join Company`);
            } else {
              return [
                createTextVNode("Join Company")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</div></div></div>`);
      }
      _push(ssrRenderComponent(_component_USlideover, {
        modelValue: unref(createModelIsOpen),
        "onUpdate:modelValue": ($event) => isRef(createModelIsOpen) ? createModelIsOpen.value = $event : null,
        "prevent-close": ""
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UCard, {
              class: "flex flex-col flex-1",
              ui: {
                body: {
                  base: "flex-1 overflow-y-auto p-4"
                },
                ring: "",
                divide: "divide-y divide-gray-100 dark:divide-gray-800"
              }
            }, {
              header: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<div class="flex items-center justify-between"${_scopeId2}><h3 class="text-base font-semibold leading-6 text-gray-900 dark:text-white"${_scopeId2}> Create New Company </h3>`);
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "gray",
                    variant: "ghost",
                    icon: "i-heroicons-x-mark-20-solid",
                    class: "-my-1",
                    onClick: ($event) => createModelIsOpen.value = false
                  }, null, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode("div", { class: "flex items-center justify-between" }, [
                      createVNode("h3", { class: "text-base font-semibold leading-6 text-gray-900 dark:text-white" }, " Create New Company "),
                      createVNode(_component_UButton, {
                        color: "gray",
                        variant: "ghost",
                        icon: "i-heroicons-x-mark-20-solid",
                        class: "-my-1",
                        onClick: ($event) => createModelIsOpen.value = false
                      }, null, 8, ["onClick"])
                    ])
                  ];
                }
              }),
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UForm, {
                    schema: unref(CompanyCreateModal).schema,
                    state: unref(CompanyCreateModal).state,
                    class: "flex flex-col gap-4",
                    onSubmit: unref(CompanyCreateModal).onSubmitRegister
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Name",
                          name: "name",
                          required: ""
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UInput, {
                                modelValue: unref(CompanyCreateModal).state.name,
                                "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.name = $event,
                                placeholder: "name"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UInput, {
                                  modelValue: unref(CompanyCreateModal).state.name,
                                  "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.name = $event,
                                  placeholder: "name"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Description",
                          name: "description",
                          required: ""
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UTextarea, {
                                modelValue: unref(CompanyCreateModal).state.description,
                                "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.description = $event,
                                placeholder: "description"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UTextarea, {
                                  modelValue: unref(CompanyCreateModal).state.description,
                                  "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.description = $event,
                                  placeholder: "description"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Address",
                          name: "address",
                          required: ""
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UTextarea, {
                                modelValue: unref(CompanyCreateModal).state.address,
                                "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.address = $event,
                                placeholder: "address"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UTextarea, {
                                  modelValue: unref(CompanyCreateModal).state.address,
                                  "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.address = $event,
                                  placeholder: "address"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(`<div class="flex justify-end gap-4"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_UButton, {
                          color: "primary",
                          type: "submit"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(`Create`);
                            } else {
                              return [
                                createTextVNode("Create")
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UButton, {
                          color: "red",
                          variant: "ghost",
                          onClick: ($event) => createModelIsOpen.value = false
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(`Cancel`);
                            } else {
                              return [
                                createTextVNode("Cancel")
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(`</div>`);
                      } else {
                        return [
                          createVNode(_component_UFormGroup, {
                            label: "Name",
                            name: "name",
                            required: ""
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UInput, {
                                modelValue: unref(CompanyCreateModal).state.name,
                                "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.name = $event,
                                placeholder: "name"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UFormGroup, {
                            label: "Description",
                            name: "description",
                            required: ""
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UTextarea, {
                                modelValue: unref(CompanyCreateModal).state.description,
                                "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.description = $event,
                                placeholder: "description"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UFormGroup, {
                            label: "Address",
                            name: "address",
                            required: ""
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UTextarea, {
                                modelValue: unref(CompanyCreateModal).state.address,
                                "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.address = $event,
                                placeholder: "address"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode("div", { class: "flex justify-end gap-4" }, [
                            createVNode(_component_UButton, {
                              color: "primary",
                              type: "submit"
                            }, {
                              default: withCtx(() => [
                                createTextVNode("Create")
                              ]),
                              _: 1
                            }),
                            createVNode(_component_UButton, {
                              color: "red",
                              variant: "ghost",
                              onClick: ($event) => createModelIsOpen.value = false
                            }, {
                              default: withCtx(() => [
                                createTextVNode("Cancel")
                              ]),
                              _: 1
                            }, 8, ["onClick"])
                          ])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UForm, {
                      schema: unref(CompanyCreateModal).schema,
                      state: unref(CompanyCreateModal).state,
                      class: "flex flex-col gap-4",
                      onSubmit: unref(CompanyCreateModal).onSubmitRegister
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UFormGroup, {
                          label: "Name",
                          name: "name",
                          required: ""
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UInput, {
                              modelValue: unref(CompanyCreateModal).state.name,
                              "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.name = $event,
                              placeholder: "name"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UFormGroup, {
                          label: "Description",
                          name: "description",
                          required: ""
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UTextarea, {
                              modelValue: unref(CompanyCreateModal).state.description,
                              "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.description = $event,
                              placeholder: "description"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UFormGroup, {
                          label: "Address",
                          name: "address",
                          required: ""
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UTextarea, {
                              modelValue: unref(CompanyCreateModal).state.address,
                              "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.address = $event,
                              placeholder: "address"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode("div", { class: "flex justify-end gap-4" }, [
                          createVNode(_component_UButton, {
                            color: "primary",
                            type: "submit"
                          }, {
                            default: withCtx(() => [
                              createTextVNode("Create")
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UButton, {
                            color: "red",
                            variant: "ghost",
                            onClick: ($event) => createModelIsOpen.value = false
                          }, {
                            default: withCtx(() => [
                              createTextVNode("Cancel")
                            ]),
                            _: 1
                          }, 8, ["onClick"])
                        ])
                      ]),
                      _: 1
                    }, 8, ["schema", "state", "onSubmit"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UCard, {
                class: "flex flex-col flex-1",
                ui: {
                  body: {
                    base: "flex-1 overflow-y-auto p-4"
                  },
                  ring: "",
                  divide: "divide-y divide-gray-100 dark:divide-gray-800"
                }
              }, {
                header: withCtx(() => [
                  createVNode("div", { class: "flex items-center justify-between" }, [
                    createVNode("h3", { class: "text-base font-semibold leading-6 text-gray-900 dark:text-white" }, " Create New Company "),
                    createVNode(_component_UButton, {
                      color: "gray",
                      variant: "ghost",
                      icon: "i-heroicons-x-mark-20-solid",
                      class: "-my-1",
                      onClick: ($event) => createModelIsOpen.value = false
                    }, null, 8, ["onClick"])
                  ])
                ]),
                default: withCtx(() => [
                  createVNode(_component_UForm, {
                    schema: unref(CompanyCreateModal).schema,
                    state: unref(CompanyCreateModal).state,
                    class: "flex flex-col gap-4",
                    onSubmit: unref(CompanyCreateModal).onSubmitRegister
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UFormGroup, {
                        label: "Name",
                        name: "name",
                        required: ""
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            modelValue: unref(CompanyCreateModal).state.name,
                            "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.name = $event,
                            placeholder: "name"
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Description",
                        name: "description",
                        required: ""
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UTextarea, {
                            modelValue: unref(CompanyCreateModal).state.description,
                            "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.description = $event,
                            placeholder: "description"
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Address",
                        name: "address",
                        required: ""
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UTextarea, {
                            modelValue: unref(CompanyCreateModal).state.address,
                            "onUpdate:modelValue": ($event) => unref(CompanyCreateModal).state.address = $event,
                            placeholder: "address"
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode("div", { class: "flex justify-end gap-4" }, [
                        createVNode(_component_UButton, {
                          color: "primary",
                          type: "submit"
                        }, {
                          default: withCtx(() => [
                            createTextVNode("Create")
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UButton, {
                          color: "red",
                          variant: "ghost",
                          onClick: ($event) => createModelIsOpen.value = false
                        }, {
                          default: withCtx(() => [
                            createTextVNode("Cancel")
                          ]),
                          _: 1
                        }, 8, ["onClick"])
                      ])
                    ]),
                    _: 1
                  }, 8, ["schema", "state", "onSubmit"])
                ]),
                _: 1
              })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_UModal, {
        modelValue: unref(CompanyJoinModal).isOpen.value,
        "onUpdate:modelValue": ($event) => unref(CompanyJoinModal).isOpen.value = $event
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UCard, { ui: { ring: "", divide: "divide-y divide-gray-100 dark:divide-gray-800" } }, {
              header: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<h2 class="text-xl font-semibold"${_scopeId2}>Join Company</h2>`);
                } else {
                  return [
                    createVNode("h2", { class: "text-xl font-semibold" }, "Join Company")
                  ];
                }
              }),
              footer: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<div class="flex justify-end gap-4"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "primary",
                    onClick: unref(CompanyJoinModal).save
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`Join`);
                      } else {
                        return [
                          createTextVNode("Join")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "red",
                    variant: "ghost",
                    onClick: ($event) => unref(CompanyJoinModal).isOpen.value = false
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`Cancel`);
                      } else {
                        return [
                          createTextVNode("Cancel")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode("div", { class: "flex justify-end gap-4" }, [
                      createVNode(_component_UButton, {
                        color: "primary",
                        onClick: unref(CompanyJoinModal).save
                      }, {
                        default: withCtx(() => [
                          createTextVNode("Join")
                        ]),
                        _: 1
                      }, 8, ["onClick"]),
                      createVNode(_component_UButton, {
                        color: "red",
                        variant: "ghost",
                        onClick: ($event) => unref(CompanyJoinModal).isOpen.value = false
                      }, {
                        default: withCtx(() => [
                          createTextVNode("Cancel")
                        ]),
                        _: 1
                      }, 8, ["onClick"])
                    ])
                  ];
                }
              }),
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UForm, {
                    state: unref(CompanyJoinModal).state,
                    schema: unref(CompanyJoinModal).schema,
                    class: "flex flex-col gap-4"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Company ID",
                          name: "code",
                          required: ""
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UInput, {
                                placeholder: "code",
                                modelValue: unref(CompanyJoinModal).state.code,
                                "onUpdate:modelValue": ($event) => unref(CompanyJoinModal).state.code = $event
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UInput, {
                                  placeholder: "code",
                                  modelValue: unref(CompanyJoinModal).state.code,
                                  "onUpdate:modelValue": ($event) => unref(CompanyJoinModal).state.code = $event
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UFormGroup, {
                            label: "Company ID",
                            name: "code",
                            required: ""
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UInput, {
                                placeholder: "code",
                                modelValue: unref(CompanyJoinModal).state.code,
                                "onUpdate:modelValue": ($event) => unref(CompanyJoinModal).state.code = $event
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          })
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UForm, {
                      state: unref(CompanyJoinModal).state,
                      schema: unref(CompanyJoinModal).schema,
                      class: "flex flex-col gap-4"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UFormGroup, {
                          label: "Company ID",
                          name: "code",
                          required: ""
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UInput, {
                              placeholder: "code",
                              modelValue: unref(CompanyJoinModal).state.code,
                              "onUpdate:modelValue": ($event) => unref(CompanyJoinModal).state.code = $event
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        })
                      ]),
                      _: 1
                    }, 8, ["state", "schema"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UCard, { ui: { ring: "", divide: "divide-y divide-gray-100 dark:divide-gray-800" } }, {
                header: withCtx(() => [
                  createVNode("h2", { class: "text-xl font-semibold" }, "Join Company")
                ]),
                footer: withCtx(() => [
                  createVNode("div", { class: "flex justify-end gap-4" }, [
                    createVNode(_component_UButton, {
                      color: "primary",
                      onClick: unref(CompanyJoinModal).save
                    }, {
                      default: withCtx(() => [
                        createTextVNode("Join")
                      ]),
                      _: 1
                    }, 8, ["onClick"]),
                    createVNode(_component_UButton, {
                      color: "red",
                      variant: "ghost",
                      onClick: ($event) => unref(CompanyJoinModal).isOpen.value = false
                    }, {
                      default: withCtx(() => [
                        createTextVNode("Cancel")
                      ]),
                      _: 1
                    }, 8, ["onClick"])
                  ])
                ]),
                default: withCtx(() => [
                  createVNode(_component_UForm, {
                    state: unref(CompanyJoinModal).state,
                    schema: unref(CompanyJoinModal).schema,
                    class: "flex flex-col gap-4"
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UFormGroup, {
                        label: "Company ID",
                        name: "code",
                        required: ""
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            placeholder: "code",
                            modelValue: unref(CompanyJoinModal).state.code,
                            "onUpdate:modelValue": ($event) => unref(CompanyJoinModal).state.code = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      })
                    ]),
                    _: 1
                  }, 8, ["state", "schema"])
                ]),
                _: 1
              })
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-CK5owxuy.mjs.map
