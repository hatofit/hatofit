import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { j as useToast, k as __nuxt_component_2$1, e as __nuxt_component_2 } from './server.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { defineComponent, withAsyncContext, computed, mergeProps, withCtx, createVNode, unref, useSSRContext } from 'vue';
import { u as useCompanyLayout } from './use-company-layout-DWK67hVH.mjs';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
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
import './useFormGroup-4DdrZmPB.mjs';
import './use-fetch-with-auth-D9SMyDpm.mjs';
import './api-Bs5Sh9SF.mjs';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const $toast = useToast();
    const { companyId, company } = ([__temp, __restore] = withAsyncContext(() => useCompanyLayout()), __temp = await __temp, __restore(), __temp);
    const invitationLink = computed(() => {
      let res = "";
      res = res.split("/").slice(0, -4).join("/");
      res += "/invite/" + (company == null ? void 0 : company.id);
      return res;
    });
    const copyToClipboard = () => {
      (void 0).clipboard.writeText(invitationLink.value);
      $toast.add({
        title: "Copied",
        description: "Invitation link copied to clipboard"
      });
    };
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UCard = __nuxt_component_0;
      const _component_Icon = __nuxt_component_2$1;
      const _component_UInput = __nuxt_component_5;
      const _component_UButton = __nuxt_component_2;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col w-full gap-6" }, _attrs))}><div class="w-full grid grid-cols-3 gap-4">`);
      _push(ssrRenderComponent(_component_UCard, { class: "relative border-b border-green-500" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_Icon, {
              name: "healthicons:body-outline",
              class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
            }, null, _parent2, _scopeId));
            _push2(`<div class="font-bold text-3xl"${_scopeId}>100</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId}>Members</div>`);
          } else {
            return [
              createVNode(_component_Icon, {
                name: "healthicons:body-outline",
                class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
              }),
              createVNode("div", { class: "font-bold text-3xl" }, "100"),
              createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Members")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      _push(ssrRenderComponent(_component_UCard, null, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-between"${_scopeId}><div class="font-bold text-xl"${_scopeId}>Invitation</div></div>`);
          } else {
            return [
              createVNode("div", { class: "flex justify-between" }, [
                createVNode("div", { class: "font-bold text-xl" }, "Invitation")
              ])
            ];
          }
        }),
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UInput, {
              "model-value": unref(invitationLink),
              disabled: "",
              class: "flex-1"
            }, null, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_UButton, {
              color: "primary",
              onClick: () => copyToClipboard(),
              class: "ml-2",
              icon: "i-heroicons-clipboard"
            }, null, _parent2, _scopeId));
            _push2(`</div>`);
          } else {
            return [
              createVNode("div", { class: "flex" }, [
                createVNode(_component_UInput, {
                  "model-value": unref(invitationLink),
                  disabled: "",
                  class: "flex-1"
                }, null, 8, ["model-value"]),
                createVNode(_component_UButton, {
                  color: "primary",
                  onClick: () => copyToClipboard(),
                  class: "ml-2",
                  icon: "i-heroicons-clipboard"
                }, null, 8, ["onClick"])
              ])
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/manage/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-j3NdBZXD.mjs.map
