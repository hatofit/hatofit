import { h as useAuth, e as __nuxt_component_3, k as __nuxt_component_2 } from './server.mjs';
import { _ as __nuxt_component_0 } from './Container-BAnrzuKK.mjs';
import { _ as __nuxt_component_2$1 } from './nuxt-img-BJdlAb4P.mjs';
import { defineComponent, computed, mergeProps, unref, withCtx, createVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderList, ssrRenderStyle, ssrInterpolate, ssrRenderComponent } from 'vue/server-renderer';
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
import 'tailwind-merge';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    const $auth = useAuth();
    const leadingsText = computed(() => [
      {
        text: "Healthy",
        startColor: "#007CF0",
        endColor: "#00DFD8",
        delay: 0
      },
      {
        text: "Energetic",
        startColor: "#7928CA",
        endColor: "#FF0080",
        delay: 2
      },
      {
        text: "Fit",
        startColor: "#FF4D4D",
        endColor: "#F9CB28",
        delay: 4
      }
    ]);
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UButton = __nuxt_component_3;
      const _component_Icon = __nuxt_component_2;
      const _component_PageContainer = __nuxt_component_0;
      const _component_NuxtImg = __nuxt_component_2$1;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex-1 flex flex-col w-full" }, _attrs))}><section class="h-screen flex flex-col items-center justify-center pb-12"><h2 class="text-center"><!--[-->`);
      ssrRenderList(unref(leadingsText), (item, i) => {
        _push(`<span style="${ssrRenderStyle(`--content: '${item.text}'; --start-color: ${item.startColor}; --end-color: ${item.endColor}; --animation-name: anim-fg-${i + 1}`)}" class="animated-text-bg drop-shadow-xl text-6xl sm:text-8xl md:text-8xl lg:text-8xl 2xl:text-8xl block font-black uppercase"><span class="animated-text-fg">${ssrInterpolate(item.text)}</span></span>`);
      });
      _push(`<!--]--></h2><div class="px-4 mt-6 text-center max-w-[500px] md:max-w-[600px]"><p> Hatofit is a platform that helps you to be fit and healthy, help you to track and monitoring your health. </p></div><div class="mt-6 flex gap-4">`);
      _push(ssrRenderComponent(_component_UButton, {
        label: `${unref($auth).status.value == "authenticated" ? "Dashboard" : "Login"}`,
        to: `${unref($auth).status.value == "authenticated" ? "/dashboard" : "/auth/login"}`,
        variant: "solid",
        color: "primary",
        size: "xl",
        class: "w-[120px] flex items-center justify-center"
      }, null, _parent));
      _push(ssrRenderComponent(_component_UButton, {
        label: "Download",
        to: "#download",
        variant: "solid",
        color: "gray",
        size: "xl",
        class: "w-[120px] flex items-center justify-center"
      }, null, _parent));
      _push(`</div><div class="mt-6">`);
      _push(ssrRenderComponent(_component_Icon, {
        name: "mdi:chevron-triple-down",
        class: "mt-6 animate-bounce text-3xl"
      }, null, _parent));
      _push(`</div></section><section id="download" class="h-screen min-h-[860px] flex flex-col justify-center py-20 bg-gray-100 dark:bg-gray-900">`);
      _push(ssrRenderComponent(_component_PageContainer, { class: "flex gap-6" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="w-1/2 relative"${_scopeId}><div class="absolute right-[36px] top-[-20px] w-[300px] transform rotate-[-10deg] bg-gradient-to-br from-primary to-secondary opacity-50"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_NuxtImg, {
              src: "/images/preview/hatofit-mobile-app-preview-2.webp",
              alt: "Hatofit Mobile Preview",
              loading: "lazy",
              style: {
                height: "auto",
                objectFit: "cover",
                objectPosition: "center"
              }
            }, null, _parent2, _scopeId));
            _push2(`</div><div class="w-[300px] relative flex"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_NuxtImg, {
              src: "/images/preview/hatofit-mobile-app-preview-1.webp",
              alt: "Hatofit Mobile Preview",
              loading: "lazy",
              style: {
                width: "100%",
                height: "auto",
                objectFit: "cover",
                objectPosition: "center"
              }
            }, null, _parent2, _scopeId));
            _push2(`</div></div><div class="w-1/2 flex flex-col justify-center items-center"${_scopeId}><div class="text-right flex flex-col items-end"${_scopeId}><h2 class="text-5xl font-bold text-gray-950 dark:text-gray-50"${_scopeId}>Download Hatofit Mobiles Apps</h2><div class="max-w-[400px]"${_scopeId}><p class="mt-4 text-gray-700 dark:text-gray-300"${_scopeId}> Hatofit currently available on Androi. Download now and start your healthy journey. </p></div><div class="flex justify-end items-center"${_scopeId}><a href="https://play.google.com/store/apps/details?id=com.hatofit.hatofit&amp;hl=en_US&amp;pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1"${_scopeId}><img class="h-[80px]" alt="Get it on Google Play" src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"${_scopeId}></a></div></div></div>`);
          } else {
            return [
              createVNode("div", { class: "w-1/2 relative" }, [
                createVNode("div", { class: "absolute right-[36px] top-[-20px] w-[300px] transform rotate-[-10deg] bg-gradient-to-br from-primary to-secondary opacity-50" }, [
                  createVNode(_component_NuxtImg, {
                    src: "/images/preview/hatofit-mobile-app-preview-2.webp",
                    alt: "Hatofit Mobile Preview",
                    loading: "lazy",
                    style: {
                      height: "auto",
                      objectFit: "cover",
                      objectPosition: "center"
                    }
                  })
                ]),
                createVNode("div", { class: "w-[300px] relative flex" }, [
                  createVNode(_component_NuxtImg, {
                    src: "/images/preview/hatofit-mobile-app-preview-1.webp",
                    alt: "Hatofit Mobile Preview",
                    loading: "lazy",
                    style: {
                      width: "100%",
                      height: "auto",
                      objectFit: "cover",
                      objectPosition: "center"
                    }
                  })
                ])
              ]),
              createVNode("div", { class: "w-1/2 flex flex-col justify-center items-center" }, [
                createVNode("div", { class: "text-right flex flex-col items-end" }, [
                  createVNode("h2", { class: "text-5xl font-bold text-gray-950 dark:text-gray-50" }, "Download Hatofit Mobiles Apps"),
                  createVNode("div", { class: "max-w-[400px]" }, [
                    createVNode("p", { class: "mt-4 text-gray-700 dark:text-gray-300" }, " Hatofit currently available on Androi. Download now and start your healthy journey. ")
                  ]),
                  createVNode("div", { class: "flex justify-end items-center" }, [
                    createVNode("a", { href: "https://play.google.com/store/apps/details?id=com.hatofit.hatofit&hl=en_US&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1" }, [
                      createVNode("img", {
                        class: "h-[80px]",
                        alt: "Get it on Google Play",
                        src: "https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png"
                      })
                    ])
                  ])
                ])
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</section></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-CxjFpK0A.mjs.map
