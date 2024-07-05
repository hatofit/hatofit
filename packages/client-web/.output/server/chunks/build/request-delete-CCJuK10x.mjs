import { _ as __nuxt_component_1 } from './Container-DpLOowOq.mjs';
import { _ as __nuxt_component_1$1 } from './Section-DHOkqozb.mjs';
import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { _ as __nuxt_component_3 } from './Form-uRAMIMTQ.mjs';
import { _ as __nuxt_component_4 } from './FormGroup-D_Rddz50.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { q as useLoadingIndicator, j as useToast, h as useAuth, i as useRoute, e as __nuxt_component_2 } from './server.mjs';
import { defineComponent, ref, mergeProps, withCtx, createVNode, unref, useSSRContext } from 'vue';
import { $ as $fetchWithAuth } from './fetch-Dko1vf_T.mjs';
import { ssrRenderComponent } from 'vue/server-renderer';
import { z } from 'zod';
import { A as Api } from './api-Bs5Sh9SF.mjs';
import { O as FetchError } from '../runtime.mjs';
import 'tailwind-merge';
import './id-CT9Cm1Vi.mjs';
import '@vueuse/core';
import './useFormGroup-4DdrZmPB.mjs';
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
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'node:fs';
import 'node:url';
import 'ipx';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "request-delete",
  __ssrInlineRender: true,
  setup(__props) {
    const $loading = useLoadingIndicator();
    const $toast = useToast();
    const $auth = useAuth();
    useRoute();
    const state = ref({
      email: ""
    });
    const schema = z.object({
      email: z.string().email("Invalid email address")
    });
    const submit = async () => {
      var _a;
      $loading.start();
      try {
        const res = await $fetchWithAuth(Api.User.RequestDelete.url(), {
          method: "DELETE",
          body: Api.User.RequestDelete.parseData(state.value)
        });
        console.log(res);
        $toast.add({
          title: "Account Delete Requested",
          description: "Your request has been sent to your email, please check your email to confirm.",
          color: "green"
        });
        setTimeout(() => {
          $auth.signOut({ callbackUrl: "/", redirect: true });
        }, 2e3);
      } catch (error) {
        console.error(error);
        let msg = "An error occurred while deleting your account, please try again later.";
        if (error instanceof FetchError) {
          msg = ((_a = error.data) == null ? void 0 : _a.message) || msg;
        }
        $toast.add({
          title: "Error",
          description: msg,
          color: "red"
        });
      }
      $loading.finish();
    };
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_1;
      const _component_PageSection = __nuxt_component_1$1;
      const _component_UCard = __nuxt_component_0;
      const _component_UForm = __nuxt_component_3;
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_UButton = __nuxt_component_2;
      _push(ssrRenderComponent(_component_PageContainer, mergeProps({ class: "flex-1 flex flex-col gap-4 justify-center" }, _attrs), {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_PageSection, { class: "flex flex-col items-center justify-center" }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UCard, { class: "w-full max-w-[500px]" }, {
                    header: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<h2 class="text-xl font-semibold"${_scopeId3}>Request Account Delete</h2>`);
                      } else {
                        return [
                          createVNode("h2", { class: "text-xl font-semibold" }, "Request Account Delete")
                        ];
                      }
                    }),
                    footer: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<div class="flex justify-end"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_UButton, {
                          variant: "solid",
                          color: "primary",
                          label: "Send Request to Email",
                          onClick: submit
                        }, null, _parent4, _scopeId3));
                        _push4(`</div>`);
                      } else {
                        return [
                          createVNode("div", { class: "flex justify-end" }, [
                            createVNode(_component_UButton, {
                              variant: "solid",
                              color: "primary",
                              label: "Send Request to Email",
                              onClick: submit
                            })
                          ])
                        ];
                      }
                    }),
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UForm, {
                          schema: unref(schema),
                          state: unref(state),
                          class: "flex flex-col gap-4"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UFormGroup, {
                                label: "Email",
                                name: "email",
                                required: ""
                              }, {
                                default: withCtx((_5, _push6, _parent6, _scopeId5) => {
                                  if (_push6) {
                                    _push6(ssrRenderComponent(_component_UInput, {
                                      modelValue: unref(state).email,
                                      "onUpdate:modelValue": ($event) => unref(state).email = $event,
                                      type: "email",
                                      placeholder: "you@example.com",
                                      icon: "i-heroicons-envelope"
                                    }, null, _parent6, _scopeId5));
                                  } else {
                                    return [
                                      createVNode(_component_UInput, {
                                        modelValue: unref(state).email,
                                        "onUpdate:modelValue": ($event) => unref(state).email = $event,
                                        type: "email",
                                        placeholder: "you@example.com",
                                        icon: "i-heroicons-envelope"
                                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                                    ];
                                  }
                                }),
                                _: 1
                              }, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UFormGroup, {
                                  label: "Email",
                                  name: "email",
                                  required: ""
                                }, {
                                  default: withCtx(() => [
                                    createVNode(_component_UInput, {
                                      modelValue: unref(state).email,
                                      "onUpdate:modelValue": ($event) => unref(state).email = $event,
                                      type: "email",
                                      placeholder: "you@example.com",
                                      icon: "i-heroicons-envelope"
                                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                                  ]),
                                  _: 1
                                })
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UForm, {
                            schema: unref(schema),
                            state: unref(state),
                            class: "flex flex-col gap-4"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UFormGroup, {
                                label: "Email",
                                name: "email",
                                required: ""
                              }, {
                                default: withCtx(() => [
                                  createVNode(_component_UInput, {
                                    modelValue: unref(state).email,
                                    "onUpdate:modelValue": ($event) => unref(state).email = $event,
                                    type: "email",
                                    placeholder: "you@example.com",
                                    icon: "i-heroicons-envelope"
                                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                                ]),
                                _: 1
                              })
                            ]),
                            _: 1
                          }, 8, ["schema", "state"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`<div class="w-full max-w-[500px] mt-4 text-center text-gray-500"${_scopeId2}> You also can delete account via dashboard, login and go to profile page. </div>`);
                } else {
                  return [
                    createVNode(_component_UCard, { class: "w-full max-w-[500px]" }, {
                      header: withCtx(() => [
                        createVNode("h2", { class: "text-xl font-semibold" }, "Request Account Delete")
                      ]),
                      footer: withCtx(() => [
                        createVNode("div", { class: "flex justify-end" }, [
                          createVNode(_component_UButton, {
                            variant: "solid",
                            color: "primary",
                            label: "Send Request to Email",
                            onClick: submit
                          })
                        ])
                      ]),
                      default: withCtx(() => [
                        createVNode(_component_UForm, {
                          schema: unref(schema),
                          state: unref(state),
                          class: "flex flex-col gap-4"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UFormGroup, {
                              label: "Email",
                              name: "email",
                              required: ""
                            }, {
                              default: withCtx(() => [
                                createVNode(_component_UInput, {
                                  modelValue: unref(state).email,
                                  "onUpdate:modelValue": ($event) => unref(state).email = $event,
                                  type: "email",
                                  placeholder: "you@example.com",
                                  icon: "i-heroicons-envelope"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ]),
                              _: 1
                            })
                          ]),
                          _: 1
                        }, 8, ["schema", "state"])
                      ]),
                      _: 1
                    }),
                    createVNode("div", { class: "w-full max-w-[500px] mt-4 text-center text-gray-500" }, " You also can delete account via dashboard, login and go to profile page. ")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_PageSection, { class: "flex flex-col items-center justify-center" }, {
                default: withCtx(() => [
                  createVNode(_component_UCard, { class: "w-full max-w-[500px]" }, {
                    header: withCtx(() => [
                      createVNode("h2", { class: "text-xl font-semibold" }, "Request Account Delete")
                    ]),
                    footer: withCtx(() => [
                      createVNode("div", { class: "flex justify-end" }, [
                        createVNode(_component_UButton, {
                          variant: "solid",
                          color: "primary",
                          label: "Send Request to Email",
                          onClick: submit
                        })
                      ])
                    ]),
                    default: withCtx(() => [
                      createVNode(_component_UForm, {
                        schema: unref(schema),
                        state: unref(state),
                        class: "flex flex-col gap-4"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UFormGroup, {
                            label: "Email",
                            name: "email",
                            required: ""
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UInput, {
                                modelValue: unref(state).email,
                                "onUpdate:modelValue": ($event) => unref(state).email = $event,
                                type: "email",
                                placeholder: "you@example.com",
                                icon: "i-heroicons-envelope"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          })
                        ]),
                        _: 1
                      }, 8, ["schema", "state"])
                    ]),
                    _: 1
                  }),
                  createVNode("div", { class: "w-full max-w-[500px] mt-4 text-center text-gray-500" }, " You also can delete account via dashboard, login and go to profile page. ")
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/user/request-delete.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=request-delete-CCJuK10x.mjs.map
