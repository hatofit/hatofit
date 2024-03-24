import { _ as __nuxt_component_2 } from './nuxt-img-DTLp32d8.mjs';
import { mergeProps, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderSlot } from 'vue/server-renderer';
import { _ as _export_sfc } from './server.mjs';

const _sfc_main = {};
function _sfc_ssrRender(_ctx, _push, _parent, _attrs) {
  const _component_NuxtImg = __nuxt_component_2;
  _push(`<div${ssrRenderAttrs(mergeProps({ class: "h-[200px] rounded-xl flex flex-col justify-end bg-gray-200 dark:bg-gray-800 relative overflow-hidden" }, _attrs))}>`);
  _push(ssrRenderComponent(_component_NuxtImg, {
    src: "/images/scene/risen-wang-20jX9b35r_M-unsplash.jpg",
    alt: "Company Image",
    style: {
      position: "absolute",
      top: 0,
      left: 0,
      width: "100%",
      height: "100%",
      objectFit: "cover",
      objectPosition: "center",
      filter: "blur(2px) brightness(0.7)"
    }
  }, null, _parent));
  _push(`<div class="z-10 bg-gradient-to-t from-black to-transparent p-4"><div class="text-2xl font-bold">Company Name</div><div>company address</div></div>`);
  ssrRenderSlot(_ctx.$slots, "default", {}, null, _push, _parent);
  _push(`</div>`);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/Dashboard/Company/BannerCard.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const __nuxt_component_1 = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { __nuxt_component_1 as _ };
//# sourceMappingURL=BannerCard-1zljJoqz.mjs.map
