import { _ as __nuxt_component_0 } from './Card-qAFYAGDc.mjs';
import __nuxt_component_1 from './Icon-1AUqRZK6.mjs';
import { defineComponent, mergeProps, withCtx, createVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import 'tailwind-merge';
import './selectMenu-bYLo63lK.mjs';
import '../server.mjs';
import '../../nitro/node-server.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import './_plugin-vue_export-helper-yVxbj29m.mjs';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import './index-1UftMXvm.mjs';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UCard = __nuxt_component_0;
      const _component_Icon = __nuxt_component_1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "w-full grid grid-cols-3 gap-4" }, _attrs))}>`);
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
//# sourceMappingURL=index-s17QMup-.mjs.map
