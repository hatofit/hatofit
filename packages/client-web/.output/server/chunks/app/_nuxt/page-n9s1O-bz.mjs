import { _ as _sfc_main$1 } from './DefaultPage-5YvfOBZP.mjs';
import { withCtx, renderSlot, useSSRContext } from 'vue';
import { ssrRenderComponent, ssrRenderSlot } from 'vue/server-renderer';
import { _ as _export_sfc } from './_plugin-vue_export-helper-yVxbj29m.mjs';
import './Container-k50csXi-.mjs';
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
import './nuxt-link-OCBs7KG2.mjs';
import './nuxt-img-W22Q-Cte.mjs';
import './Button-ccmqP4Ga.mjs';
import './Icon-1AUqRZK6.mjs';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import './index-1UftMXvm.mjs';
import './Dropdown-NTc5qQ1x.mjs';
import './Avatar-ZEXfj5Sj.mjs';
import './usePopper-mt32Bdxz.mjs';
import './ButtonColorMode--Lbp2A-r.mjs';
import './SelectMenu-OetydX8Z.mjs';
import '@vueuse/core';
import './useFormGroup-UEyTjmzX.mjs';
import './micro-task-lHIuwgs5.mjs';

const _sfc_main = {};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs) {
  const _component_BaseLayoutDefaultPage = _sfc_main$1;
  _push(ssrRenderComponent(_component_BaseLayoutDefaultPage, _attrs, {
    default: withCtx((_, _push2, _parent2, _scopeId) => {
      if (_push2) {
        ssrRenderSlot(_ctx.$slots, "default", {}, null, _push2, _parent2, _scopeId);
      } else {
        return [
          renderSlot(_ctx.$slots, "default")
        ];
      }
    }),
    _: 3
  }, _parent));
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("layouts/page.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const page = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { page as default };
//# sourceMappingURL=page-n9s1O-bz.mjs.map
