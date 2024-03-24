import { _ as __nuxt_component_2$1 } from './nuxt-img-W22Q-Cte.mjs';
import { _ as __nuxt_component_0 } from './nuxt-link-OCBs7KG2.mjs';
import { _ as __nuxt_component_1, a as __nuxt_component_2 } from './Button-ccmqP4Ga.mjs';
import { _ as __nuxt_component_1$1 } from './Avatar-ZEXfj5Sj.mjs';
import { defineComponent, toRef, computed, useSSRContext, reactive, mergeProps, withCtx, createTextVNode, createVNode, unref } from 'vue';
import { twMerge, twJoin } from 'tailwind-merge';
import { u as useUI } from './selectMenu-bYLo63lK.mjs';
import { m as mergeConfig, a as appConfig, b as useSeoMeta, d as useAuth, e as useRoute } from '../server.mjs';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderClass, ssrRenderSlot, ssrInterpolate, ssrRenderList } from 'vue/server-renderer';
import { _ as _export_sfc } from './_plugin-vue_export-helper-yVxbj29m.mjs';
import { _ as __nuxt_component_2$2, a as __nuxt_component_3$1 } from './Input-llLWEMG5.mjs';
import { _ as __nuxt_component_6 } from './ButtonColorMode--Lbp2A-r.mjs';
import '../../nitro/node-server.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './Icon-1AUqRZK6.mjs';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import './index-1UftMXvm.mjs';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import './useFormGroup-UEyTjmzX.mjs';
import '@vueuse/core';

const alert = {
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
const config = mergeConfig(appConfig.ui.strategy, appConfig.ui.alert, alert);
const _sfc_main$1 = defineComponent({
  components: {
    UIcon: __nuxt_component_1,
    UAvatar: __nuxt_component_1$1,
    UButton: __nuxt_component_2
  },
  inheritAttrs: false,
  props: {
    title: {
      type: String,
      required: true
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
  const _component_UIcon = __nuxt_component_1;
  const _component_UAvatar = __nuxt_component_1$1;
  const _component_UButton = __nuxt_component_2;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: _ctx.alertClass }, _ctx.attrs, _attrs))}><div class="${ssrRenderClass([[_ctx.ui.gap, { "items-start": _ctx.description || _ctx.$slots.description, "items-center": !_ctx.description && !_ctx.$slots.description }], "flex"])}">`);
  if (_ctx.icon) {
    _push(ssrRenderComponent(_component_UIcon, {
      name: _ctx.icon,
      class: _ctx.ui.icon.base
    }, null, _parent));
  } else {
    _push(`<!---->`);
  }
  if (_ctx.avatar) {
    _push(ssrRenderComponent(_component_UAvatar, mergeProps({ size: _ctx.ui.avatar.size, ..._ctx.avatar }, {
      class: _ctx.ui.avatar.base
    }), null, _parent));
  } else {
    _push(`<!---->`);
  }
  _push(`<div class="${ssrRenderClass(_ctx.ui.inner)}"><p class="${ssrRenderClass(_ctx.ui.title)}">`);
  ssrRenderSlot(_ctx.$slots, "title", { title: _ctx.title }, () => {
    _push(`${ssrInterpolate(_ctx.title)}`);
  }, _push, _parent);
  _push(`</p>`);
  if (_ctx.description || _ctx.$slots.description) {
    _push(`<p class="${ssrRenderClass(_ctx.ui.description)}">`);
    ssrRenderSlot(_ctx.$slots, "description", { description: _ctx.description }, () => {
      _push(`${ssrInterpolate(_ctx.description)}`);
    }, _push, _parent);
    _push(`</p>`);
  } else {
    _push(`<!---->`);
  }
  if ((_ctx.description || _ctx.$slots.description) && _ctx.actions.length) {
    _push(`<div class="${ssrRenderClass(_ctx.ui.actions)}"><!--[-->`);
    ssrRenderList(_ctx.actions, (action, index) => {
      _push(ssrRenderComponent(_component_UButton, mergeProps({ key: index }, { ..._ctx.ui.default.actionButton || {}, ...action }, {
        onClick: ($event) => _ctx.onAction(action)
      }), null, _parent));
    });
    _push(`<!--]--></div>`);
  } else {
    _push(`<!---->`);
  }
  _push(`</div>`);
  if (_ctx.closeButton || !_ctx.description && !_ctx.$slots.description && _ctx.actions.length) {
    _push(`<div class="${ssrRenderClass(_ctx.twMerge(_ctx.ui.actions, "mt-0"))}">`);
    if (!_ctx.description && !_ctx.$slots.description && _ctx.actions.length) {
      _push(`<!--[-->`);
      ssrRenderList(_ctx.actions, (action, index) => {
        _push(ssrRenderComponent(_component_UButton, mergeProps({ key: index }, { ..._ctx.ui.default.actionButton || {}, ...action }, {
          onClick: ($event) => _ctx.onAction(action)
        }), null, _parent));
      });
      _push(`<!--]-->`);
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("node_modules/@nuxt/ui/dist/runtime/components/elements/Alert.vue");
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
      email: "test@mail.com",
      password: "password"
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
      } else if (["Wrong email or password"].includes(error.value || "")) {
        return error.value;
      }
      return "Something went wrong, please try again later.";
    });
    return (_ctx, _push, _parent, _attrs) => {
      const _component_NuxtImg = __nuxt_component_2$1;
      const _component_NuxtLink = __nuxt_component_0;
      const _component_UButton = __nuxt_component_2;
      const _component_UAlert = __nuxt_component_3;
      const _component_UFormGroup = __nuxt_component_2$2;
      const _component_UInput = __nuxt_component_3$1;
      const _component_ButtonColorMode = __nuxt_component_6;
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
      _push(`</div><div class="flex flex-col gap-4">`);
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
      _push(ssrRenderComponent(_component_UFormGroup, {
        label: "Email",
        required: ""
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UInput, {
              color: unref(error) ? "primary" : "gray",
              modelValue: unref(input).email,
              "onUpdate:modelValue": ($event) => unref(input).email = $event,
              type: "email",
              placeholder: "you@example.com",
              icon: "i-heroicons-envelope"
            }, null, _parent2, _scopeId));
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
      }, _parent));
      _push(ssrRenderComponent(_component_UFormGroup, {
        label: "Password",
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
        onClick: login
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`Login`);
          } else {
            return [
              createTextVNode("Login")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div><div class="flex justify-center"><p class="text-gray-600 dark:text-gray-300">`);
      _push(ssrRenderComponent(_component_NuxtLink, {
        to: "/auth/register",
        class: "text-primary-500"
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`register`);
          } else {
            return [
              createTextVNode("register")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(` if you don&#39;t have an account. </p></div></div><div><div class="flex gap-4">`);
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
//# sourceMappingURL=login-6dYAV_Nc.mjs.map
