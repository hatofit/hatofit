import { _ as __nuxt_component_2$1 } from './nuxt-img-BJdlAb4P.mjs';
import { m as mergeConfig, b as appConfig, c as __nuxt_component_0$2, d as __nuxt_component_1, e as __nuxt_component_2, f as useUI, g as useSeoMeta, h as useAuth, i as useRoute, a as __nuxt_component_0$3, _ as _export_sfc } from './server.mjs';
import { defineComponent, toRef, computed, useSSRContext, reactive, ref, resolveComponent, mergeProps, withCtx, createTextVNode, createVNode, unref } from 'vue';
import { twMerge, twJoin } from 'tailwind-merge';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderClass, ssrRenderSlot, ssrInterpolate, ssrRenderList } from 'vue/server-renderer';
import { _ as __nuxt_component_4 } from './FormGroup-D_Rddz50.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { _ as _sfc_main$2 } from './ButtonColorMode-jPH1DJjw.mjs';
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
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import './id-CT9Cm1Vi.mjs';
import './useFormGroup-4DdrZmPB.mjs';

const alert$1 = {
  wrapper: "w-full relative overflow-hidden",
  inner: "w-0 flex-1",
  title: "text-sm font-medium",
  description: "mt-1 text-sm leading-4 opacity-90",
  actions: "flex items-center gap-2 mt-3 flex-shrink-0",
  shadow: "",
  rounded: "rounded-lg",
  padding: "p-4",
  gap: "gap-3",
  icon: {
    base: "flex-shrink-0 w-5 h-5"
  },
  avatar: {
    base: "flex-shrink-0 self-center",
    size: "md"
  },
  color: {
    white: {
      solid: "text-gray-900 dark:text-white bg-white dark:bg-gray-900 ring-1 ring-gray-200 dark:ring-gray-800"
    }
  },
  variant: {
    solid: "bg-{color}-500 dark:bg-{color}-400 text-white dark:text-gray-900",
    outline: "text-{color}-500 dark:text-{color}-400 ring-1 ring-inset ring-{color}-500 dark:ring-{color}-400",
    soft: "bg-{color}-50 dark:bg-{color}-400 dark:bg-opacity-10 text-{color}-500 dark:text-{color}-400",
    subtle: "bg-{color}-50 dark:bg-{color}-400 dark:bg-opacity-10 text-{color}-500 dark:text-{color}-400 ring-1 ring-inset ring-{color}-500 dark:ring-{color}-400 ring-opacity-25 dark:ring-opacity-25"
  },
  default: {
    color: "white",
    variant: "solid",
    icon: null,
    closeButton: null,
    actionButton: {
      size: "xs",
      color: "primary",
      variant: "link"
    }
  }
};
const config = mergeConfig(appConfig.ui.strategy, appConfig.ui.alert, alert$1);
const _sfc_main$1 = defineComponent({
  components: {
    UIcon: __nuxt_component_0$2,
    UAvatar: __nuxt_component_1,
    UButton: __nuxt_component_2
  },
  inheritAttrs: false,
  props: {
    title: {
      type: String,
      default: null
    },
    description: {
      type: String,
      default: null
    },
    icon: {
      type: String,
      default: () => config.default.icon
    },
    avatar: {
      type: Object,
      default: null
    },
    closeButton: {
      type: Object,
      default: () => config.default.closeButton
    },
    actions: {
      type: Array,
      default: () => []
    },
    color: {
      type: String,
      default: () => config.default.color,
      validator(value) {
        return [...appConfig.ui.colors, ...Object.keys(config.color)].includes(value);
      }
    },
    variant: {
      type: String,
      default: () => config.default.variant,
      validator(value) {
        return [
          ...Object.keys(config.variant),
          ...Object.values(config.color).flatMap((value2) => Object.keys(value2))
        ].includes(value);
      }
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
  emits: ["close"],
  setup(props) {
    const { ui, attrs } = useUI("alert", toRef(props, "ui"), config);
    const alertClass = computed(() => {
      var _a, _b;
      const variant = ((_b = (_a = ui.value.color) == null ? void 0 : _a[props.color]) == null ? void 0 : _b[props.variant]) || ui.value.variant[props.variant];
      return twMerge(twJoin(
        ui.value.wrapper,
        ui.value.rounded,
        ui.value.shadow,
        ui.value.padding,
        variant == null ? void 0 : variant.replaceAll("{color}", props.color)
      ), props.class);
    });
    function onAction(action) {
      if (action.click) {
        action.click();
      }
    }
    return {
      // eslint-disable-next-line vue/no-dupe-keys
      ui,
      attrs,
      alertClass,
      onAction,
      twMerge
    };
  }
});
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_UIcon = __nuxt_component_0$2;
  const _component_UAvatar = __nuxt_component_1;
  const _component_UButton = __nuxt_component_2;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: _ctx.alertClass }, _ctx.attrs, _attrs))}><div class="${ssrRenderClass([[_ctx.ui.gap, { "items-start": _ctx.description || _ctx.$slots.description, "items-center": !_ctx.description && !_ctx.$slots.description }], "flex"])}">`);
  ssrRenderSlot(_ctx.$slots, "icon", { icon: _ctx.icon }, () => {
    if (_ctx.icon) {
      _push(ssrRenderComponent(_component_UIcon, {
        name: _ctx.icon,
        class: _ctx.ui.icon.base
      }, null, _parent));
    } else {
      _push(`<!---->`);
    }
  }, _push, _parent);
  ssrRenderSlot(_ctx.$slots, "avatar", { avatar: _ctx.avatar }, () => {
    if (_ctx.avatar) {
      _push(ssrRenderComponent(_component_UAvatar, mergeProps({ size: _ctx.ui.avatar.size, ..._ctx.avatar }, {
        class: _ctx.ui.avatar.base
      }), null, _parent));
    } else {
      _push(`<!---->`);
    }
  }, _push, _parent);
  _push(`<div class="${ssrRenderClass(_ctx.ui.inner)}">`);
  if (_ctx.title || _ctx.$slots.title) {
    _push(`<p class="${ssrRenderClass(_ctx.ui.title)}">`);
    ssrRenderSlot(_ctx.$slots, "title", { title: _ctx.title }, () => {
      _push(`${ssrInterpolate(_ctx.title)}`);
    }, _push, _parent);
    _push(`</p>`);
  } else {
    _push(`<!---->`);
  }
  if (_ctx.description || _ctx.$slots.description) {
    _push(`<div class="${ssrRenderClass(_ctx.twMerge(_ctx.ui.description, !(_ctx.title && _ctx.$slots.title) && "mt-0 leading-5"))}">`);
    ssrRenderSlot(_ctx.$slots, "description", { description: _ctx.description }, () => {
      _push(`${ssrInterpolate(_ctx.description)}`);
    }, _push, _parent);
    _push(`</div>`);
  } else {
    _push(`<!---->`);
  }
  if ((_ctx.description || _ctx.$slots.description) && (_ctx.actions.length || _ctx.$slots.actions)) {
    _push(`<div class="${ssrRenderClass(_ctx.ui.actions)}">`);
    ssrRenderSlot(_ctx.$slots, "actions", {}, () => {
      _push(`<!--[-->`);
      ssrRenderList(_ctx.actions, (action, index) => {
        _push(ssrRenderComponent(_component_UButton, mergeProps({
          key: index,
          ref_for: true
        }, { ..._ctx.ui.default.actionButton || {}, ...action }, {
          onClick: ($event) => _ctx.onAction(action)
        }), null, _parent));
      });
      _push(`<!--]-->`);
    }, _push, _parent);
    _push(`</div>`);
  } else {
    _push(`<!---->`);
  }
  _push(`</div>`);
  if (_ctx.closeButton || !_ctx.description && !_ctx.$slots.description && _ctx.actions.length) {
    _push(`<div class="${ssrRenderClass(_ctx.twMerge(_ctx.ui.actions, "mt-0"))}">`);
    if (!_ctx.description && !_ctx.$slots.description && (_ctx.actions.length || _ctx.$slots.actions)) {
      ssrRenderSlot(_ctx.$slots, "actions", {}, () => {
        _push(`<!--[-->`);
        ssrRenderList(_ctx.actions, (action, index) => {
          _push(ssrRenderComponent(_component_UButton, mergeProps({
            key: index,
            ref_for: true
          }, { ..._ctx.ui.default.actionButton || {}, ...action }, {
            onClick: ($event) => _ctx.onAction(action)
          }), null, _parent));
        });
        _push(`<!--]-->`);
      }, _push, _parent);
    } else {
      _push(`<!---->`);
    }
    if (_ctx.closeButton) {
      _push(ssrRenderComponent(_component_UButton, mergeProps({ "aria-label": "Close" }, { ..._ctx.ui.default.closeButton || {}, ..._ctx.closeButton }, {
        onClick: ($event) => _ctx.$emit("close")
      }), null, _parent));
    } else {
      _push(`<!---->`);
    }
    _push(`</div>`);
  } else {
    _push(`<!---->`);
  }
  _push(`</div></div>`);
}
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("../../node_modules/@nuxt/ui/dist/runtime/components/elements/Alert.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_3 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["ssrRender", _sfc_ssrRender]]);
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "login",
  __ssrInlineRender: true,
  setup(__props) {
    useSeoMeta({
      title: "Login",
      description: "Login to access Hatofit"
    });
    const $auth = useAuth();
    const $route = useRoute();
    const input = reactive({
      email: "",
      password: "",
      otp: ""
    });
    const login = () => {
      $auth.signIn("credentials", {
        redirect: true,
        callbackUrl: "/dashboard"
      }, {
        email: input.email,
        password: input.password
      });
    };
    const error = computed(() => {
      return $route.query.error === "undefined" ? void 0 : $route.query.error;
    });
    const errorMessage = computed(() => {
      if (error.value === "CredentialsSignin") {
        return "Invalid email or password.";
      } else if (["Wrong email or password", "User not found"].includes(error.value || "")) {
        return error.value;
      }
      return "Something went wrong, please try again later.";
    });
    const mode = ref("login");
    const isForgotPasswordOtpSended = ref(false);
    const isForgotPasswordOtpVerified = ref(false);
    const forgotPasswordSendOTP = async () => {
      const http = await $fetch(Api.Auth.ForgotPasswordSendOTP.url(input.email), {
        method: "POST"
      });
      console.log(http);
      isForgotPasswordOtpSended.value = true;
    };
    const forgotPasswordVerifyOTP = async () => {
      try {
        const http = await $fetch(Api.Auth.ForgotPasswordVerifyOTP.url(), {
          method: "POST",
          body: JSON.stringify({
            email: input.email,
            code: input.otp
          })
        });
        console.log(http);
        isForgotPasswordOtpVerified.value = true;
        mode.value = "forgot_new_password";
      } catch (error2) {
        console.log(error2);
        alert("Invalid OTP");
        isForgotPasswordOtpVerified.value = false;
        isForgotPasswordOtpSended.value = false;
      }
    };
    const forgotPasswordReset = async () => {
      try {
        const http = await $fetch(Api.Auth.ForgotPasswordReset.url(), {
          method: "POST",
          body: JSON.stringify({
            email: input.email,
            code: input.otp,
            password: input.password
          })
        });
        console.log(http);
        alert("Password has been reset, please login with your new password.");
        isForgotPasswordOtpVerified.value = true;
        mode.value = "login";
      } catch (error2) {
        console.log(error2);
        alert("Invalid OTP");
        isForgotPasswordOtpVerified.value = false;
        isForgotPasswordOtpSended.value = false;
      }
    };
    return (_ctx, _push, _parent, _attrs) => {
      const _component_NuxtImg = __nuxt_component_2$1;
      const _component_NuxtLink = __nuxt_component_0$3;
      const _component_UButton = __nuxt_component_2;
      const _component_UAlert = __nuxt_component_3;
      const _component_Form = resolveComponent("Form");
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_ButtonColorMode = _sfc_main$2;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "w-screen h-screen flex flex-col justify-center items-center p-4" }, _attrs))}><div class="max-w-screen-xl flex flex-1 w-full max-h-[900px] overflow-hidden rounded-3xl bg-red-500 border-2 border-gray-500/50"><div class="flex-1 mx-auto w-full relative flex"><div class="-z-0 absolute top-0 left-0 w-full h-full overflow-visible bg-blue-500">`);
      _push(ssrRenderComponent(_component_NuxtImg, {
        src: "/images/scene/braden-collum-9HI8UJMSdZA-unsplash.jpg",
        alt: "Login",
        loading: "lazy",
        style: {
          width: "100%",
          height: "100%",
          objectFit: "cover",
          objectPosition: "center"
        }
      }, null, _parent));
      _push(`</div><div class="z-[1] flex-1 flex flex-row"><div class="w-0 lg:w-2/3 flex flex-col justify-end"><div class="h-[100px] pb-6 pl-8 flex items-center bg-gradient-to-t from-gray-950 to-transparent">`);
      _push(ssrRenderComponent(_component_NuxtImg, {
        src: "/images/logo/secondary-dark.png",
        alt: "Hatofit Logo",
        loading: "lazy",
        style: {
          width: "auto",
          height: "100%"
        }
      }, null, _parent));
      _push(`</div></div><div class="w-full md:w-1/2 lg:w-1/3 flex flex-col justify-between bg-gray-50 dark:bg-gray-950 p-8"><div>`);
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
      if (unref(mode) === "login") {
        _push(`<div class="flex flex-col gap-4">`);
        if (unref(error)) {
          _push(ssrRenderComponent(_component_UAlert, {
            icon: "i-heroicons-information-circle",
            color: "primary",
            variant: "solid",
            title: "Error",
            description: unref(errorMessage)
          }, null, _parent));
        } else {
          _push(`<!---->`);
        }
        _push(ssrRenderComponent(_component_Form, {
          onSubmit: login,
          class: "flex flex-col gap-4"
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(ssrRenderComponent(_component_UFormGroup, {
                label: "Email",
                required: ""
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(ssrRenderComponent(_component_UInput, {
                      color: unref(error) ? "primary" : "gray",
                      modelValue: unref(input).email,
                      "onUpdate:modelValue": ($event) => unref(input).email = $event,
                      type: "email",
                      placeholder: "you@example.com",
                      icon: "i-heroicons-envelope"
                    }, null, _parent3, _scopeId2));
                  } else {
                    return [
                      createVNode(_component_UInput, {
                        color: unref(error) ? "primary" : "gray",
                        modelValue: unref(input).email,
                        "onUpdate:modelValue": ($event) => unref(input).email = $event,
                        type: "email",
                        placeholder: "you@example.com",
                        icon: "i-heroicons-envelope"
                      }, null, 8, ["color", "modelValue", "onUpdate:modelValue"])
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(ssrRenderComponent(_component_UFormGroup, {
                label: "Password",
                required: ""
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(ssrRenderComponent(_component_UInput, {
                      color: unref(error) ? "primary" : "gray",
                      modelValue: unref(input).password,
                      "onUpdate:modelValue": ($event) => unref(input).password = $event,
                      type: "password",
                      placeholder: "your secret password",
                      icon: "i-heroicons-lock-closed"
                    }, null, _parent3, _scopeId2));
                    _push3(ssrRenderComponent(_component_UButton, {
                      variant: "link",
                      class: "text-xs float-right",
                      label: "Forgot Password?",
                      onClick: ($event) => mode.value = "forgot"
                    }, null, _parent3, _scopeId2));
                  } else {
                    return [
                      createVNode(_component_UInput, {
                        color: unref(error) ? "primary" : "gray",
                        modelValue: unref(input).password,
                        "onUpdate:modelValue": ($event) => unref(input).password = $event,
                        type: "password",
                        placeholder: "your secret password",
                        icon: "i-heroicons-lock-closed"
                      }, null, 8, ["color", "modelValue", "onUpdate:modelValue"]),
                      createVNode(_component_UButton, {
                        variant: "link",
                        class: "text-xs float-right",
                        label: "Forgot Password?",
                        onClick: ($event) => mode.value = "forgot"
                      }, null, 8, ["onClick"])
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
                size: "lg",
                onClick: login
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(`Login`);
                  } else {
                    return [
                      createTextVNode("Login")
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(`</div><div class="flex justify-center"${_scopeId}><p class="text-gray-600 dark:text-gray-300"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_NuxtLink, {
                to: "/auth/register",
                class: "text-primary-500"
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(`register`);
                  } else {
                    return [
                      createTextVNode("register")
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(` if you don&#39;t have an account. </p></div>`);
            } else {
              return [
                createVNode(_component_UFormGroup, {
                  label: "Email",
                  required: ""
                }, {
                  default: withCtx(() => [
                    createVNode(_component_UInput, {
                      color: unref(error) ? "primary" : "gray",
                      modelValue: unref(input).email,
                      "onUpdate:modelValue": ($event) => unref(input).email = $event,
                      type: "email",
                      placeholder: "you@example.com",
                      icon: "i-heroicons-envelope"
                    }, null, 8, ["color", "modelValue", "onUpdate:modelValue"])
                  ]),
                  _: 1
                }),
                createVNode(_component_UFormGroup, {
                  label: "Password",
                  required: ""
                }, {
                  default: withCtx(() => [
                    createVNode(_component_UInput, {
                      color: unref(error) ? "primary" : "gray",
                      modelValue: unref(input).password,
                      "onUpdate:modelValue": ($event) => unref(input).password = $event,
                      type: "password",
                      placeholder: "your secret password",
                      icon: "i-heroicons-lock-closed"
                    }, null, 8, ["color", "modelValue", "onUpdate:modelValue"]),
                    createVNode(_component_UButton, {
                      variant: "link",
                      class: "text-xs float-right",
                      label: "Forgot Password?",
                      onClick: ($event) => mode.value = "forgot"
                    }, null, 8, ["onClick"])
                  ]),
                  _: 1
                }),
                createVNode("div", { class: "flex justify-end" }, [
                  createVNode(_component_UButton, {
                    type: "submit",
                    variant: "solid",
                    class: "w-full flex justify-center",
                    size: "lg",
                    onClick: login
                  }, {
                    default: withCtx(() => [
                      createTextVNode("Login")
                    ]),
                    _: 1
                  })
                ]),
                createVNode("div", { class: "flex justify-center" }, [
                  createVNode("p", { class: "text-gray-600 dark:text-gray-300" }, [
                    createVNode(_component_NuxtLink, {
                      to: "/auth/register",
                      class: "text-primary-500"
                    }, {
                      default: withCtx(() => [
                        createTextVNode("register")
                      ]),
                      _: 1
                    }),
                    createTextVNode(" if you don't have an account. ")
                  ])
                ])
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</div>`);
      } else if (unref(mode) === "forgot") {
        _push(`<div class="flex flex-col gap-4">`);
        _push(ssrRenderComponent(_component_UFormGroup, {
          label: "Email",
          required: ""
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`<div class="flex gap-4"${_scopeId}><div class="flex-1"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UInput, {
                color: unref(error) ? "primary" : "gray",
                modelValue: unref(input).email,
                "onUpdate:modelValue": ($event) => unref(input).email = $event,
                type: "email",
                placeholder: "you@example.com",
                icon: "i-heroicons-envelope"
              }, null, _parent2, _scopeId));
              _push2(`</div><div${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UButton, {
                size: "sm",
                variant: "solid",
                class: "w-full flex justify-center",
                onClick: forgotPasswordSendOTP
              }, {
                default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                  if (_push3) {
                    _push3(`Send OTP`);
                  } else {
                    return [
                      createTextVNode("Send OTP")
                    ];
                  }
                }),
                _: 1
              }, _parent2, _scopeId));
              _push2(`<div class="flex justify-end"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UButton, {
                variant: "link",
                class: "text-xs",
                label: "Want To Login?",
                onClick: ($event) => mode.value = "login"
              }, null, _parent2, _scopeId));
              _push2(`</div></div></div>`);
            } else {
              return [
                createVNode("div", { class: "flex gap-4" }, [
                  createVNode("div", { class: "flex-1" }, [
                    createVNode(_component_UInput, {
                      color: unref(error) ? "primary" : "gray",
                      modelValue: unref(input).email,
                      "onUpdate:modelValue": ($event) => unref(input).email = $event,
                      type: "email",
                      placeholder: "you@example.com",
                      icon: "i-heroicons-envelope"
                    }, null, 8, ["color", "modelValue", "onUpdate:modelValue"])
                  ]),
                  createVNode("div", null, [
                    createVNode(_component_UButton, {
                      size: "sm",
                      variant: "solid",
                      class: "w-full flex justify-center",
                      onClick: forgotPasswordSendOTP
                    }, {
                      default: withCtx(() => [
                        createTextVNode("Send OTP")
                      ]),
                      _: 1
                    }),
                    createVNode("div", { class: "flex justify-end" }, [
                      createVNode(_component_UButton, {
                        variant: "link",
                        class: "text-xs",
                        label: "Want To Login?",
                        onClick: ($event) => mode.value = "login"
                      }, null, 8, ["onClick"])
                    ])
                  ])
                ])
              ];
            }
          }),
          _: 1
        }, _parent));
        if (unref(isForgotPasswordOtpSended)) {
          _push(ssrRenderComponent(_component_UFormGroup, {
            label: "OTP",
            required: ""
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(ssrRenderComponent(_component_UInput, {
                  color: unref(error) ? "primary" : "gray",
                  modelValue: unref(input).otp,
                  "onUpdate:modelValue": ($event) => unref(input).otp = $event,
                  type: "text",
                  placeholder: "OTP",
                  icon: "i-heroicons-key"
                }, null, _parent2, _scopeId));
              } else {
                return [
                  createVNode(_component_UInput, {
                    color: unref(error) ? "primary" : "gray",
                    modelValue: unref(input).otp,
                    "onUpdate:modelValue": ($event) => unref(input).otp = $event,
                    type: "text",
                    placeholder: "OTP",
                    icon: "i-heroicons-key"
                  }, null, 8, ["color", "modelValue", "onUpdate:modelValue"])
                ];
              }
            }),
            _: 1
          }, _parent));
        } else {
          _push(`<!---->`);
        }
        if (unref(isForgotPasswordOtpSended)) {
          _push(`<div class="flex justify-end">`);
          _push(ssrRenderComponent(_component_UButton, {
            variant: "solid",
            class: "w-full flex justify-center",
            size: "lg",
            onClick: forgotPasswordVerifyOTP
          }, {
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(`Verify`);
              } else {
                return [
                  createTextVNode("Verify")
                ];
              }
            }),
            _: 1
          }, _parent));
          _push(`</div>`);
        } else {
          _push(`<!---->`);
        }
        _push(`</div>`);
      } else if (unref(mode) === "forgot_new_password") {
        _push(`<div class="flex flex-col gap-4">`);
        _push(ssrRenderComponent(_component_UFormGroup, {
          label: "New Password",
          required: ""
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(ssrRenderComponent(_component_UInput, {
                color: unref(error) ? "primary" : "gray",
                modelValue: unref(input).password,
                "onUpdate:modelValue": ($event) => unref(input).password = $event,
                type: "password",
                placeholder: "your secret password",
                icon: "i-heroicons-lock-closed"
              }, null, _parent2, _scopeId));
            } else {
              return [
                createVNode(_component_UInput, {
                  color: unref(error) ? "primary" : "gray",
                  modelValue: unref(input).password,
                  "onUpdate:modelValue": ($event) => unref(input).password = $event,
                  type: "password",
                  placeholder: "your secret password",
                  icon: "i-heroicons-lock-closed"
                }, null, 8, ["color", "modelValue", "onUpdate:modelValue"])
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`<div class="flex justify-end">`);
        _push(ssrRenderComponent(_component_UButton, {
          variant: "solid",
          class: "w-full flex justify-center",
          size: "lg",
          onClick: forgotPasswordReset
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`Reset Password`);
            } else {
              return [
                createTextVNode("Reset Password")
              ];
            }
          }),
          _: 1
        }, _parent));
        _push(`</div></div>`);
      } else {
        _push(`<!---->`);
      }
      _push(`<div><div class="flex gap-4">`);
      _push(ssrRenderComponent(_component_ButtonColorMode, null, null, _parent));
      _push(`</div></div></div></div></div></div></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/auth/login.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=login-Bpg9pend.mjs.map
