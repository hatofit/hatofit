import { _ as __nuxt_component_2 } from './nuxt-img-BJdlAb4P.mjs';
import { g as useSeoMeta, j as useToast, n as navigateTo, a as __nuxt_component_0$3, e as __nuxt_component_2$1 } from './server.mjs';
import { _ as __nuxt_component_3 } from './Form-uRAMIMTQ.mjs';
import { _ as __nuxt_component_4 } from './FormGroup-D_Rddz50.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { _ as __nuxt_component_9 } from './Select-hmpclB81.mjs';
import { _ as _sfc_main$1 } from './ButtonColorMode-jPH1DJjw.mjs';
import { defineComponent, reactive, mergeProps, withCtx, createTextVNode, createVNode, unref, useSSRContext } from 'vue';
import { A as Api, p as parseErrorFromResponse } from './api-Bs5Sh9SF.mjs';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import { z } from 'zod';
import { O as FetchError } from '../runtime.mjs';
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
import 'tailwind-merge';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'node:fs';
import 'node:url';
import 'ipx';
import './id-CT9Cm1Vi.mjs';
import './useFormGroup-4DdrZmPB.mjs';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "register",
  __ssrInlineRender: true,
  setup(__props) {
    useSeoMeta({
      title: "Register",
      description: "Register account to access Hatofit"
    });
    const $toast = useToast();
    const schema = z.object({
      firstName: z.string().min(4, "Must be at least 4 characters"),
      lastName: z.string().min(4, "Must be at least 4 characters"),
      email: z.string().email("Invalid email address"),
      password: z.string().min(8, "Must be at least 8 characters"),
      confirmPassword: z.string().min(8, "Must be at least 8 characters"),
      dateOfBirth: z.string(),
      weight: z.number().min(0, "Must be at least 0"),
      height: z.number().min(0, "Must be at least 0"),
      gender: z.enum(["male", "female"])
    });
    const state = reactive({
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      confirmPassword: "",
      dateOfBirth: "04/24/2023",
      weight: 0,
      height: 0,
      gender: "male",
      "metricUnits": {
        "energyUnits": "j",
        "weightUnits": "kg",
        "heightUnits": "cm"
      }
    });
    async function onSubmitRegister(event) {
      console.log(event.data);
      try {
        const res = await $fetch(
          Api.Auth.Register.url(),
          {
            method: "POST",
            body: Api.Auth.Register.parseData({
              ...state
            })
          }
        );
        $toast.add({
          title: "Success",
          description: "Successfully registered"
        });
        navigateTo("/auth/login");
      } catch (error) {
        if (error instanceof FetchError && error.response) {
          const [isError, message] = parseErrorFromResponse(error.response);
          if (isError) {
            $toast.add({
              title: "Error",
              description: message
            });
            return;
          }
        }
        $toast.add({
          title: "Error",
          description: `Failed to register, cause: ${error}`
        });
      }
    }
    return (_ctx, _push, _parent, _attrs) => {
      const _component_NuxtImg = __nuxt_component_2;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_UButton = __nuxt_component_2$1;
      const _component_UForm = __nuxt_component_3;
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_USelect = __nuxt_component_9;
      const _component_ButtonColorMode = _sfc_main$1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "w-screen h-screen flex flex-col justify-center items-center p-4" }, _attrs))}><div class="max-w-screen-xl flex flex-1 w-full max-h-[900px] overflow-hidden rounded-3xl bg-red-500 border-2 border-gray-500/50"><div class="flex-1 mx-auto w-full relative flex"><div class="-z-0 absolute top-0 left-0 w-full h-full overflow-visible bg-blue-500">`);
      _push(ssrRenderComponent(_component_NuxtImg, {
        src: "/images/scene/braden-collum-9HI8UJMSdZA-unsplash.jpg",
        alt: "Register",
        loading: "lazy",
        style: {
          width: "100%",
          height: "100%",
          objectFit: "cover",
          objectPosition: "center"
        }
      }, null, _parent));
      _push(`</div><div class="z-[1] flex-1 flex flex-row"><div class="w-full md:w-1/2 lg:w-1/3 flex flex-col justify-between bg-gray-50 dark:bg-gray-950 p-8"><div>`);
      _push(ssrRenderComponent(_component_NuxtLink, { to: "/" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UButton, {
              variant: "link",
              color: "primary",
              icon: "i-heroicons-arrow-left"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`back`);
                } else {
                  return [
                    createTextVNode("back")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UButton, {
                variant: "link",
                color: "primary",
                icon: "i-heroicons-arrow-left"
              }, {
                default: withCtx(() => [
                  createTextVNode("back")
                ]),
                _: 1
              })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      _push(ssrRenderComponent(_component_UForm, {
        schema: unref(schema),
        state: unref(state),
        class: "flex flex-col gap-4",
        onSubmit: onSubmitRegister
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex gap-4"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "First Name",
              name: "firstName",
              required: "",
              class: "flex-1"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).firstName,
                    "onUpdate:modelValue": ($event) => unref(state).firstName = $event,
                    placeholder: "fist name"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).firstName,
                      "onUpdate:modelValue": ($event) => unref(state).firstName = $event,
                      placeholder: "fist name"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Last Name",
              name: "lastName",
              required: "",
              class: "flex-1"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).lastName,
                    "onUpdate:modelValue": ($event) => unref(state).lastName = $event,
                    placeholder: "last name"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).lastName,
                      "onUpdate:modelValue": ($event) => unref(state).lastName = $event,
                      placeholder: "last name"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`</div>`);
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Email",
              name: "email",
              required: ""
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).email,
                    "onUpdate:modelValue": ($event) => unref(state).email = $event,
                    type: "email",
                    placeholder: "you@example.com",
                    icon: "i-heroicons-envelope"
                  }, null, _parent3, _scopeId2));
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
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Password",
              name: "password",
              required: ""
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).password,
                    "onUpdate:modelValue": ($event) => unref(state).password = $event,
                    type: "password",
                    placeholder: "your secret password",
                    icon: "i-heroicons-lock-closed"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).password,
                      "onUpdate:modelValue": ($event) => unref(state).password = $event,
                      type: "password",
                      placeholder: "your secret password",
                      icon: "i-heroicons-lock-closed"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Confirm Password",
              name: "confirmPassword",
              required: ""
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).confirmPassword,
                    "onUpdate:modelValue": ($event) => unref(state).confirmPassword = $event,
                    type: "password",
                    placeholder: "your confirmation password",
                    icon: "i-heroicons-lock-closed"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).confirmPassword,
                      "onUpdate:modelValue": ($event) => unref(state).confirmPassword = $event,
                      type: "password",
                      placeholder: "your confirmation password",
                      icon: "i-heroicons-lock-closed"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`<div class="flex gap-4"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Weight",
              name: "weight",
              required: "",
              class: "flex-1"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).weight,
                    "onUpdate:modelValue": ($event) => unref(state).weight = $event,
                    type: "number",
                    placeholder: "your weight"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).weight,
                      "onUpdate:modelValue": ($event) => unref(state).weight = $event,
                      type: "number",
                      placeholder: "your weight"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Height",
              name: "height",
              required: "",
              class: "flex-1"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).height,
                    "onUpdate:modelValue": ($event) => unref(state).height = $event,
                    type: "number",
                    placeholder: "your height"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).height,
                      "onUpdate:modelValue": ($event) => unref(state).height = $event,
                      type: "number",
                      placeholder: "your height"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Gender",
              name: "gender",
              required: "",
              class: "flex-1"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_USelect, {
                    modelValue: unref(state).gender,
                    "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                    options: ["male", "female"]
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_USelect, {
                      modelValue: unref(state).gender,
                      "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                      options: ["male", "female"]
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`</div>`);
            _push2(ssrRenderComponent(_component_UFormGroup, {
              label: "Date Of Birth",
              name: "confirmPassword",
              required: ""
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UInput, {
                    modelValue: unref(state).dateOfBirth,
                    "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event,
                    type: "date",
                    placeholder: "your date of birth"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).dateOfBirth,
                      "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event,
                      type: "date",
                      placeholder: "your date of birth"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`<div class="flex justify-end"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UButton, {
              type: "submit",
              variant: "solid",
              class: "w-full flex justify-center",
              size: "lg"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`Register`);
                } else {
                  return [
                    createTextVNode("Register")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`</div><div class="flex justify-center"${_scopeId}><p class="text-gray-600 dark:text-gray-300"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_NuxtLink, {
              to: "/auth/login",
              class: "text-primary-500"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`login`);
                } else {
                  return [
                    createTextVNode("login")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(` if you already have an account. </p></div>`);
          } else {
            return [
              createVNode("div", { class: "flex gap-4" }, [
                createVNode(_component_UFormGroup, {
                  label: "First Name",
                  name: "firstName",
                  required: "",
                  class: "flex-1"
                }, {
                  default: withCtx(() => [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).firstName,
                      "onUpdate:modelValue": ($event) => unref(state).firstName = $event,
                      placeholder: "fist name"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                }),
                createVNode(_component_UFormGroup, {
                  label: "Last Name",
                  name: "lastName",
                  required: "",
                  class: "flex-1"
                }, {
                  default: withCtx(() => [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).lastName,
                      "onUpdate:modelValue": ($event) => unref(state).lastName = $event,
                      placeholder: "last name"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                })
              ]),
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
              }),
              createVNode(_component_UFormGroup, {
                label: "Password",
                name: "password",
                required: ""
              }, {
                default: withCtx(() => [
                  createVNode(_component_UInput, {
                    modelValue: unref(state).password,
                    "onUpdate:modelValue": ($event) => unref(state).password = $event,
                    type: "password",
                    placeholder: "your secret password",
                    icon: "i-heroicons-lock-closed"
                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                ]),
                _: 1
              }),
              createVNode(_component_UFormGroup, {
                label: "Confirm Password",
                name: "confirmPassword",
                required: ""
              }, {
                default: withCtx(() => [
                  createVNode(_component_UInput, {
                    modelValue: unref(state).confirmPassword,
                    "onUpdate:modelValue": ($event) => unref(state).confirmPassword = $event,
                    type: "password",
                    placeholder: "your confirmation password",
                    icon: "i-heroicons-lock-closed"
                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                ]),
                _: 1
              }),
              createVNode("div", { class: "flex gap-4" }, [
                createVNode(_component_UFormGroup, {
                  label: "Weight",
                  name: "weight",
                  required: "",
                  class: "flex-1"
                }, {
                  default: withCtx(() => [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).weight,
                      "onUpdate:modelValue": ($event) => unref(state).weight = $event,
                      type: "number",
                      placeholder: "your weight"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                }),
                createVNode(_component_UFormGroup, {
                  label: "Height",
                  name: "height",
                  required: "",
                  class: "flex-1"
                }, {
                  default: withCtx(() => [
                    createVNode(_component_UInput, {
                      modelValue: unref(state).height,
                      "onUpdate:modelValue": ($event) => unref(state).height = $event,
                      type: "number",
                      placeholder: "your height"
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                }),
                createVNode(_component_UFormGroup, {
                  label: "Gender",
                  name: "gender",
                  required: "",
                  class: "flex-1"
                }, {
                  default: withCtx(() => [
                    createVNode(_component_USelect, {
                      modelValue: unref(state).gender,
                      "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                      options: ["male", "female"]
                    }, null, 8, ["modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                })
              ]),
              createVNode(_component_UFormGroup, {
                label: "Date Of Birth",
                name: "confirmPassword",
                required: ""
              }, {
                default: withCtx(() => [
                  createVNode(_component_UInput, {
                    modelValue: unref(state).dateOfBirth,
                    "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event,
                    type: "date",
                    placeholder: "your date of birth"
                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                ]),
                _: 1
              }),
              createVNode("div", { class: "flex justify-end" }, [
                createVNode(_component_UButton, {
                  type: "submit",
                  variant: "solid",
                  class: "w-full flex justify-center",
                  size: "lg"
                }, {
                  default: withCtx(() => [
                    createTextVNode("Register")
                  ]),
                  _: 1
                })
              ]),
              createVNode("div", { class: "flex justify-center" }, [
                createVNode("p", { class: "text-gray-600 dark:text-gray-300" }, [
                  createVNode(_component_NuxtLink, {
                    to: "/auth/login",
                    class: "text-primary-500"
                  }, {
                    default: withCtx(() => [
                      createTextVNode("login")
                    ]),
                    _: 1
                  }),
                  createTextVNode(" if you already have an account. ")
                ])
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`<div><div>`);
      _push(ssrRenderComponent(_component_ButtonColorMode, null, null, _parent));
      _push(`</div></div></div><div class="w-0 lg:w-2/3 flex flex-col justify-end"><div class="h-[100px] pb-6 pr-8 flex items-center bg-gradient-to-t from-gray-950 to-transparent justify-end">`);
      _push(ssrRenderComponent(_component_NuxtImg, {
        src: "/images/logo/secondary-dark.png",
        alt: "Hatofit Logo",
        loading: "lazy",
        style: {
          width: "auto",
          height: "100%"
        }
      }, null, _parent));
      _push(`</div></div></div></div></div></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/auth/register.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=register-DsP2e29n.mjs.map
