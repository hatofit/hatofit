import { _ as __nuxt_component_2 } from './nuxt-img-W22Q-Cte.mjs';
import { _ as __nuxt_component_0 } from './nuxt-link-OCBs7KG2.mjs';
import { a as __nuxt_component_2$1 } from './Button-ccmqP4Ga.mjs';
import { _ as __nuxt_component_2$2, a as __nuxt_component_3 } from './Input-llLWEMG5.mjs';
import { _ as __nuxt_component_6 } from './ButtonColorMode--Lbp2A-r.mjs';
import { defineComponent, mergeProps, withCtx, createTextVNode, createVNode, useSSRContext } from 'vue';
import { b as useSeoMeta } from '../server.mjs';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import '../../nitro/node-server.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './_plugin-vue_export-helper-yVxbj29m.mjs';
import './Icon-1AUqRZK6.mjs';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import './index-1UftMXvm.mjs';
import 'tailwind-merge';
import './selectMenu-bYLo63lK.mjs';
import './useFormGroup-UEyTjmzX.mjs';
import '@vueuse/core';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "register",
  __ssrInlineRender: true,
  setup(__props) {
    useSeoMeta({
      title: "Register",
      description: "Register account to access Hatofit"
    });
    return (_ctx, _push, _parent, _attrs) => {
      const _component_NuxtImg = __nuxt_component_2;
      const _component_NuxtLink = __nuxt_component_0;
      const _component_UButton = __nuxt_component_2$1;
      const _component_UFormGroup = __nuxt_component_2$2;
      const _component_UInput = __nuxt_component_3;
      const _component_ButtonColorMode = __nuxt_component_6;
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
      _push(`</div><div class="flex flex-col gap-4"><div class="flex gap-4">`);
      _push(ssrRenderComponent(_component_UFormGroup, {
        label: "First Name",
        required: ""
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UInput, { placeholder: "fist name" }, null, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UInput, { placeholder: "fist name" })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_UFormGroup, {
        label: "Last Name",
        required: ""
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UInput, { placeholder: "last name" }, null, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UInput, { placeholder: "last name" })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      _push(ssrRenderComponent(_component_UFormGroup, {
        label: "Email",
        required: ""
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UInput, {
              type: "email",
              placeholder: "you@example.com",
              icon: "i-heroicons-envelope"
            }, null, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UInput, {
                type: "email",
                placeholder: "you@example.com",
                icon: "i-heroicons-envelope"
              })
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
              type: "password",
              placeholder: "your secret password",
              icon: "i-heroicons-lock-closed"
            }, null, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UInput, {
                type: "password",
                placeholder: "your secret password",
                icon: "i-heroicons-lock-closed"
              })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_UFormGroup, {
        label: "Confirm Password",
        required: ""
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UInput, {
              type: "password",
              placeholder: "your confirmation password",
              icon: "i-heroicons-lock-closed"
            }, null, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UInput, {
                type: "password",
                placeholder: "your confirmation password",
                icon: "i-heroicons-lock-closed"
              })
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`<div class="flex justify-end">`);
      _push(ssrRenderComponent(_component_UButton, {
        type: "submit",
        variant: "solid",
        class: "w-full flex justify-center",
        size: "lg"
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`Register`);
          } else {
            return [
              createTextVNode("Register")
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
            _push2(`login`);
          } else {
            return [
              createTextVNode("login")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(` if you already have an account. </p></div></div><div><div>`);
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
//# sourceMappingURL=register-Iqk-8wOG.mjs.map
