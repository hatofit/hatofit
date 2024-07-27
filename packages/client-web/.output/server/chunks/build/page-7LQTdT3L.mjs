import { _ as _sfc_main$1 } from './DefaultPage-Bm5mdKYg.mjs';
import { withCtx, renderSlot, useSSRContext } from 'vue';
import { ssrRenderComponent, ssrRenderSlot } from 'vue/server-renderer';
import { _ as _export_sfc } from './server.mjs';
import './Container-BAnrzuKK.mjs';
import 'tailwind-merge';
import './nuxt-img-BJdlAb4P.mjs';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './Dropdown-lhX-bojE.mjs';
import './Kbd-CWGxBI2b.mjs';
import './id-CT9Cm1Vi.mjs';
import './tabs-B_zyHFOf.mjs';
import './usePopper-C-zM4LTl.mjs';
import './ButtonColorMode-jPH1DJjw.mjs';
import './SelectMenu-C_ltIwuW.mjs';
import '@tanstack/vue-virtual';
import './active-element-history-DcQBj1iE.mjs';
import '@vueuse/core';
import './useFormGroup-4DdrZmPB.mjs';
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
import '@iconify/vue/dist/offline';
import '@iconify/vue';

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
//# sourceMappingURL=page-7LQTdT3L.mjs.map
