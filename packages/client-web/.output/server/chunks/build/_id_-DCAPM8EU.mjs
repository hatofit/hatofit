import { _ as __nuxt_component_1 } from './Container-BL9-rOfc.mjs';
import { m as mergeConfig, b as appConfig, c as __nuxt_component_1$1, f as useUI, r as getSlotsChildren, i as useRoute, a as __nuxt_component_0$2, o as __nuxt_component_1$2, _ as _export_sfc } from './server.mjs';
import { _ as _sfc_main$2 } from './ButtonColorMode-ONifNTxo.mjs';
import { _ as __nuxt_component_1$3 } from './Section-DHOkqozb.mjs';
import { _ as __nuxt_component_0 } from './Card-BVh4Co2a.mjs';
import { _ as _sfc_main$3 } from './Title-THJIYvs6.mjs';
import { defineComponent, toRef, computed, cloneVNode, h, useSSRContext, defineAsyncComponent, withCtx, createVNode, unref, toDisplayString, openBlock, createBlock, Suspense, createTextVNode, createCommentVNode, Fragment, renderList, mergeProps } from 'vue';
import { twJoin } from 'tailwind-merge';
import { ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderSuspense, ssrRenderList, ssrRenderSlot, ssrRenderClass, ssrRenderStyle, ssrRenderAttr } from 'vue/server-renderer';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import { u as useFetchWithAuth } from './use-fetch-with-auth-DgNCIHBe.mjs';
import { g as getTimeInMorS } from './date-DrT-bfza.mjs';
import { Doughnut } from 'vue-chartjs';
import { Chart, ArcElement, Tooltip, Legend } from 'chart.js';
import { A as Api } from './api-CRdpv7Tu.mjs';
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

const meter = {
  wrapper: "w-full flex flex-col gap-2",
  indicator: {
    container: "min-w-fit transition-all",
    text: "text-gray-400 dark:text-gray-500 text-end",
    size: {
      "2xs": "text-xs",
      xs: "text-xs",
      sm: "text-sm",
      md: "text-sm",
      lg: "text-sm",
      xl: "text-base",
      "2xl": "text-base"
    }
  },
  meter: {
    base: "appearance-none block w-full bg-none overflow-y-hidden",
    background: "bg-gray-200 dark:bg-gray-700",
    color: "text-{color}-500 dark:text-{color}-400",
    ring: "",
    rounded: "rounded-full",
    shadow: "",
    size: {
      "2xs": "h-px",
      xs: "h-0.5",
      sm: "h-1",
      md: "h-2",
      lg: "h-3",
      xl: "h-4",
      "2xl": "h-5"
    },
    appearance: {
      inner: "[&::-webkit-meter-inner-element]:block [&::-webkit-meter-inner-element]:relative [&::-webkit-meter-inner-element]:border-none [&::-webkit-meter-inner-element]:bg-none [&::-webkit-meter-inner-element]:bg-transparent",
      meter: "[&::-webkit-meter-bar]:border-none [&::-webkit-meter-bar]:bg-none [&::-webkit-meter-bar]:bg-transparent",
      bar: "[&::-webkit-meter-optimum-value]:border-none [&::-webkit-meter-optimum-value]:bg-none [&::-webkit-meter-optimum-value]:bg-current",
      value: "[&::-moz-meter-bar]:border-none [&::-moz-meter-bar]:bg-none [&::-moz-meter-bar]:bg-current"
    },
    bar: {
      transition: "[&::-webkit-meter-optimum-value]:transition-all [&::-moz-meter-bar]:transition-all",
      ring: "",
      rounded: "[&::-webkit-meter-optimum-value]:rounded-full [&::-moz-meter-bar]:rounded-full",
      size: {
        "2xs": "[&::-webkit-meter-optimum-value]:h-px [&::-moz-meter-bar]:h-px",
        xs: "[&::-webkit-meter-optimum-value]:h-0.5 [&::-moz-meter-bar]:h-0.5",
        sm: "[&::-webkit-meter-optimum-value]:h-1 [&::-moz-meter-bar]:h-1",
        md: "[&::-webkit-meter-optimum-value]:h-2 [&::-moz-meter-bar]:h-2",
        lg: "[&::-webkit-meter-optimum-value]:h-3 [&::-moz-meter-bar]:h-3",
        xl: "[&::-webkit-meter-optimum-value]:h-4 [&::-moz-meter-bar]:h-4",
        "2xl": "[&::-webkit-meter-optimum-value]:h-5 [&::-moz-meter-bar]:h-5"
      }
    }
  },
  label: {
    base: "flex gap-2 items-center",
    text: "truncate",
    color: "text-{color}-500 dark:text-{color}-400",
    size: {
      "2xs": "text-xs",
      xs: "text-xs",
      sm: "text-sm",
      md: "text-sm",
      lg: "text-sm",
      xl: "text-base",
      "2xl": "text-base"
    }
  },
  color: {
    white: "text-white dark:text-black",
    black: "text-black dark:text-white",
    gray: "text-gray-500 dark:text-gray-400"
  },
  default: {
    size: "md",
    color: "primary"
  }
};
const meterGroup = {
  wrapper: "flex flex-col gap-2 w-full",
  base: "flex flex-row flex-nowrap flex-shrink overflow-hidden",
  background: "bg-gray-200 dark:bg-gray-700",
  transition: "transition-all",
  rounded: "rounded-full",
  shadow: "",
  list: "list-disc list-inside",
  orientation: {
    "rounded-none": { left: "rounded-s-none", right: "rounded-e-none" },
    "rounded-sm": { left: "rounded-s-sm", right: "rounded-e-sm" },
    rounded: { left: "rounded-s", right: "rounded-e" },
    "rounded-md": { left: "rounded-s-md", right: "rounded-e-md" },
    "rounded-lg": { left: "rounded-s-lg", right: "rounded-e-lg" },
    "rounded-xl": { left: "rounded-s-xl", right: "rounded-e-xl" },
    "rounded-2xl": { left: "rounded-s-2xl", right: "rounded-e-2xl" },
    "rounded-3xl": { left: "rounded-s-3xl", right: "rounded-e-3xl" },
    "rounded-full": { left: "rounded-s-full", right: "rounded-e-full" }
  },
  default: {
    size: "md",
    icon: "i-heroicons-minus-20-solid"
  }
};
const meterConfig = mergeConfig(appConfig.ui.strategy, appConfig.ui.meter, meter);
const meterGroupConfig = mergeConfig(appConfig.ui.strategy, appConfig.ui.meterGroup, meterGroup);
const __nuxt_component_8 = defineComponent({
  components: {
    UIcon: __nuxt_component_1$1
  },
  inheritAttrs: false,
  slots: Object,
  props: {
    min: {
      type: Number,
      default: 0
    },
    max: {
      type: Number,
      default: 100
    },
    size: {
      type: String,
      default: () => meterConfig.default.size,
      validator(value) {
        return Object.keys(meterConfig.meter.bar.size).includes(value);
      }
    },
    indicator: {
      type: Boolean,
      default: false
    },
    icon: {
      type: String,
      default: () => meterGroupConfig.default.icon
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
  setup(props, { slots }) {
    const { ui, attrs } = useUI("meterGroup", toRef(props, "ui"), meterGroupConfig);
    const { ui: uiMeter } = useUI("meter", void 0, meterConfig);
    if (!slots.default) {
      throw new Error("Meter Group has no Meter children.");
    }
    const normalizedMin = computed(() => props.min > props.max ? props.max : props.min);
    const normalizedMax = computed(() => props.max < props.min ? props.min : props.max);
    const children = computed(() => getSlotsChildren(slots));
    const rounded = computed(() => ui.value.orientation[ui.value.rounded]);
    function clampPercent(value, min, max) {
      if (min == max) {
        return value < min ? 0 : 100;
      }
      if (min > max) {
        max = [min, min = max][0];
      }
      const percent2 = (value - min) / (max - min) * 100;
      return Math.max(0, Math.min(100, percent2));
    }
    const labels = computed(() => {
      return children.value.map((node) => node.props.label);
    });
    const percents = computed(() => {
      return children.value.map((node) => clampPercent(node.props.value, props.min, props.max));
    });
    const percent = computed(() => {
      return Math.max(0, Math.max(percents.value.reduce((prev, percent2) => prev + percent2, 0)));
    });
    const clones = computed(() => children.value.map((node, index) => {
      var _a, _b, _c, _d, _e, _f, _g, _h, _i, _j, _k, _l, _m;
      const vProps = {};
      vProps.style = { width: `${percents.value[index]}%` };
      vProps.size = props.size;
      vProps.min = normalizedMin.value;
      vProps.max = normalizedMax.value;
      vProps.ui = ((_a = node.props) == null ? void 0 : _a.ui) || {};
      vProps.ui.wrapper = ((_c = (_b = node.props) == null ? void 0 : _b.ui) == null ? void 0 : _c.wrapper) || "";
      vProps.ui.wrapper += [
        (_e = (_d = node.props) == null ? void 0 : _d.ui) == null ? void 0 : _e.wrapper,
        ui.value.background,
        ui.value.transition
      ].filter(Boolean).join(" ");
      vProps.ui.meter = ((_g = (_f = node.props) == null ? void 0 : _f.ui) == null ? void 0 : _g.meter) || {};
      vProps.ui.meter.background = `bg-${node.props.color}-500 dark:bg-${node.props.color}-400`;
      vProps.ui.meter.rounded = "rounded-none";
      vProps.ui.meter.bar = ((_j = (_i = (_h = node.props) == null ? void 0 : _h.ui) == null ? void 0 : _i.meter) == null ? void 0 : _j.bar) || {};
      if (index === 0) {
        vProps.ui.meter.rounded = `${rounded.value.left} rounded-e-none`;
      }
      if (index === children.value.length - 1) {
        vProps.ui.meter.rounded = `${rounded.value.right} rounded-s-none`;
      }
      labels.value[index] = node.props.label;
      const clone = cloneVNode(node, vProps);
      (_k = clone.children) == null ? true : delete _k.label;
      (_l = clone.props) == null ? true : delete _l.indicator;
      (_m = clone.props) == null ? true : delete _m.label;
      return clone;
    }));
    const baseClass = computed(() => {
      return twJoin(
        ui.value.base,
        ui.value.background,
        ui.value.rounded,
        ui.value.shadow,
        uiMeter.value.meter.size[props.size]
      );
    });
    const indicatorContainerClass = computed(() => {
      return twJoin(
        uiMeter.value.indicator.container
      );
    });
    const indicatorClass = computed(() => {
      return twJoin(
        uiMeter.value.indicator.text,
        uiMeter.value.indicator.size[props.size]
      );
    });
    const vNodeChildren = computed(() => {
      const vNodeSlots = [
        void 0,
        h("div", { class: baseClass.value }, clones.value),
        void 0
      ];
      if (props.indicator) {
        vNodeSlots[0] = h("div", { class: indicatorContainerClass.value }, [
          h("div", { class: indicatorClass.value, style: { width: `${percent.value}%` } }, Math.round(percent.value) + "%")
        ]);
      } else if (slots.indicator) {
        vNodeSlots[0] = slots.indicator({ percent: percent.value });
      }
      vNodeSlots[2] = h("ol", { class: ui.value.list }, labels.value.map((label, key) => {
        var _a2;
        var _a;
        const labelClass = computed(() => {
          var _a3, _b2;
          var _a22, _b;
          return twJoin(
            uiMeter.value.label.base,
            uiMeter.value.label.text,
            (_b2 = uiMeter.value.color[(_a22 = clones.value[key]) == null ? void 0 : _a22.props.color]) != null ? _b2 : uiMeter.value.label.color.replaceAll("{color}", (_a3 = (_b = clones.value[key]) == null ? void 0 : _b.props.color) != null ? _a3 : uiMeter.value.default.color),
            uiMeter.value.label.size[props.size]
          );
        });
        return h("li", { class: labelClass.value }, [
          h(__nuxt_component_1$1, { name: (_a2 = (_a = clones.value[key]) == null ? void 0 : _a.props.icon) != null ? _a2 : props.icon }),
          `${label} (${Math.round(percents.value[key])}%)`
        ]);
      }));
      return vNodeSlots;
    });
    return () => h("div", { class: ui.value.wrapper, ...attrs.value }, vNodeChildren.value);
  }
});
const config = mergeConfig(appConfig.ui.strategy, appConfig.ui.meter, meter);
const _sfc_main$1 = defineComponent({
  components: {
    UIcon: __nuxt_component_1$1
  },
  inheritAttrs: false,
  slots: Object,
  props: {
    value: {
      type: Number,
      default: 0
    },
    min: {
      type: Number,
      default: 0
    },
    max: {
      type: Number,
      default: 100
    },
    indicator: {
      type: Boolean,
      default: false
    },
    label: {
      type: String,
      default: null
    },
    size: {
      type: String,
      default: () => config.default.size,
      validator(value) {
        return Object.keys(config.meter.size).includes(value);
      }
    },
    color: {
      type: String,
      default: () => config.default.color,
      validator(value) {
        return [...appConfig.ui.colors, ...Object.keys(config.color)].includes(value);
      }
    },
    icon: {
      type: String,
      default: null
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
  setup(props) {
    const { ui, attrs } = useUI("meter", toRef(props, "ui"), config, toRef(props, "class"));
    function clampPercent(value, min, max) {
      if (min == max) {
        return value < min ? 0 : 100;
      }
      if (min > max) {
        max = [min, min = max][0];
      }
      const percent2 = (value - min) / (max - min) * 100;
      return Math.max(0, Math.min(100, percent2));
    }
    const indicatorContainerClass = computed(() => {
      return twJoin(
        ui.value.indicator.container
      );
    });
    const indicatorClass = computed(() => {
      return twJoin(
        ui.value.indicator.text,
        ui.value.indicator.size[props.size]
      );
    });
    const meterClass = computed(() => {
      var _a;
      return twJoin(
        ui.value.meter.base,
        ui.value.meter.background,
        ui.value.meter.ring,
        ui.value.meter.rounded,
        ui.value.meter.shadow,
        (_a = ui.value.color[props.color]) != null ? _a : ui.value.meter.color.replaceAll("{color}", props.color),
        ui.value.meter.size[props.size]
      );
    });
    const meterAppearanceClass = computed(() => {
      return twJoin(
        ui.value.meter.appearance.inner,
        ui.value.meter.appearance.meter,
        ui.value.meter.appearance.bar,
        ui.value.meter.appearance.value
      );
    });
    const meterBarClass = computed(() => {
      return twJoin(
        ui.value.meter.bar.transition,
        ui.value.meter.bar.ring,
        ui.value.meter.bar.rounded,
        ui.value.meter.bar.size[props.size]
      );
    });
    const labelClass = computed(() => {
      var _a;
      return twJoin(
        ui.value.label.base,
        ui.value.label.text,
        (_a = ui.value.color[props.color]) != null ? _a : ui.value.label.color.replaceAll("{color}", props.color),
        ui.value.label.size[props.size]
      );
    });
    const normalizedMin = computed(() => props.min > props.max ? props.max : props.min);
    const normalizedMax = computed(() => props.max < props.min ? props.min : props.max);
    const percent = computed(() => clampPercent(Number(props.value), normalizedMin.value, normalizedMax.value));
    return {
      // eslint-disable-next-line vue/no-dupe-keys
      ui,
      attrs,
      indicatorContainerClass,
      indicatorClass,
      meterClass,
      meterAppearanceClass,
      meterBarClass,
      labelClass,
      normalizedMin,
      normalizedMax,
      percent
    };
  }
});
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_UIcon = __nuxt_component_1$1;
  _push(`<div${ssrRenderAttrs(mergeProps({
    class: _ctx.ui.wrapper
  }, _ctx.attrs, _attrs))}>`);
  if (_ctx.indicator || _ctx.$slots.indicator) {
    ssrRenderSlot(_ctx.$slots, "indicator", { percent: _ctx.percent, value: _ctx.value }, () => {
      _push(`<div class="${ssrRenderClass(_ctx.indicatorContainerClass)}" style="${ssrRenderStyle({ width: `${_ctx.percent}%` })}"><div class="${ssrRenderClass(_ctx.indicatorClass)}">${ssrInterpolate(Math.round(_ctx.percent))}% </div></div>`);
    }, _push, _parent);
  } else {
    _push(`<!---->`);
  }
  _push(`<meter${ssrRenderAttr("value", _ctx.value)}${ssrRenderAttr("min", _ctx.normalizedMin)}${ssrRenderAttr("max", _ctx.normalizedMax)} class="${ssrRenderClass([_ctx.meterClass, _ctx.meterAppearanceClass, _ctx.meterBarClass])}"></meter>`);
  if (_ctx.label || _ctx.$slots.label) {
    ssrRenderSlot(_ctx.$slots, "label", { percent: _ctx.percent, value: _ctx.value }, () => {
      _push(`<div class="${ssrRenderClass(_ctx.labelClass)}">`);
      if (_ctx.icon) {
        _push(ssrRenderComponent(_component_UIcon, { name: _ctx.icon }, null, _parent));
      } else {
        _push(`<!---->`);
      }
      _push(` ${ssrInterpolate(_ctx.label)}</div>`);
    }, _push, _parent);
  } else {
    _push(`<!---->`);
  }
  _push(`</div>`);
}
const _sfc_setup$1 = _sfc_main$1.setup;
_sfc_main$1.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("node_modules/@nuxt/ui/dist/runtime/components/elements/Meter.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_9 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["ssrRender", _sfc_ssrRender]]);
const __nuxt_component_7_lazy = defineAsyncComponent(() => import('./DetailWidget-B1poF25h.mjs').then((c) => c.default || c));
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "[id]",
  __ssrInlineRender: true,
  setup(__props) {
    Chart.register(ArcElement, Tooltip, Legend);
    const $dayjs = useDayjs();
    const $route = useRoute();
    const sessionId = computed(() => $route.params.id);
    const { data, pending } = useFetchWithAuth(Api.Report.Get.url(sessionId.value));
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_1;
      const _component_NuxtLink = __nuxt_component_0$2;
      const _component_Icon = __nuxt_component_1$2;
      const _component_ButtonColorMode = _sfc_main$2;
      const _component_PageSection = __nuxt_component_1$3;
      const _component_UCard = __nuxt_component_0;
      const _component_PageTitle = _sfc_main$3;
      const _component_LazySessionWidgetDetailWidget = __nuxt_component_7_lazy;
      const _component_UMeterGroup = __nuxt_component_8;
      const _component_UMeter = __nuxt_component_9;
      _push(`<div${ssrRenderAttrs(_attrs)}><div class="h-[68px] border-b border-main w-full sticky top-0 flex items-center z-30 bg-gray-50/75 dark:bg-gray-950/75 backdrop-filter backdrop-blur-lg">`);
      _push(ssrRenderComponent(_component_PageContainer, { class: "flex-1 max-w-screen-lg mx-auto flex justify-between" }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_NuxtLink, {
              to: "/dashboard/sessions",
              class: "flex gap-2 items-center"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_Icon, {
                    name: "fluent:arrow-left-16-regular",
                    class: "text-lg"
                  }, null, _parent3, _scopeId2));
                  _push3(`<span${_scopeId2}>Back</span>`);
                } else {
                  return [
                    createVNode(_component_Icon, {
                      name: "fluent:arrow-left-16-regular",
                      class: "text-lg"
                    }),
                    createVNode("span", null, "Back")
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`<div class="flex items-center gap-4 divide-x-2 divide-main"${_scopeId}><div class="pl-4"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_ButtonColorMode, null, null, _parent2, _scopeId));
            _push2(`</div></div>`);
          } else {
            return [
              createVNode(_component_NuxtLink, {
                to: "/dashboard/sessions",
                class: "flex gap-2 items-center"
              }, {
                default: withCtx(() => [
                  createVNode(_component_Icon, {
                    name: "fluent:arrow-left-16-regular",
                    class: "text-lg"
                  }),
                  createVNode("span", null, "Back")
                ]),
                _: 1
              }),
              createVNode("div", { class: "flex items-center gap-4 divide-x-2 divide-main" }, [
                createVNode("div", { class: "pl-4" }, [
                  createVNode(_component_ButtonColorMode)
                ])
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      _push(ssrRenderComponent(_component_PageContainer, null, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UCard, null, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      var _a, _b, _c, _d, _e, _f, _g, _h, _i, _j;
                      if (_push4) {
                        _push4(`<h2 class="text-xl font-semibold"${_scopeId3}>${ssrInterpolate(((_b = (_a = unref(data)) == null ? void 0 : _a.exercise) == null ? void 0 : _b.name) || "General")}</h2><div class="flex gap-4 mt-2 items-center"${_scopeId3}><div class="flex gap-1 items-center"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:calendar-20-regular",
                          class: "text-lg mb-0.5 text-red-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="text-xs"${_scopeId3}>${ssrInterpolate(unref($dayjs)((_c = unref(data)) == null ? void 0 : _c.report.startTime).format("dddd, DD MMMM YYYY"))}</div></div><div class="flex gap-1 items-center"${_scopeId3}>`);
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:clock-20-regular",
                          class: "text-lg mb-0.5 text-green-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="text-xs"${_scopeId3}>${ssrInterpolate(unref($dayjs)((_d = unref(data)) == null ? void 0 : _d.report.startTime).format("HH:mm:ss"))} - ${ssrInterpolate(unref($dayjs)((_e = unref(data)) == null ? void 0 : _e.report.endTime).format("HH:mm:ss"))}</div></div></div>`);
                      } else {
                        return [
                          createVNode("h2", { class: "text-xl font-semibold" }, toDisplayString(((_g = (_f = unref(data)) == null ? void 0 : _f.exercise) == null ? void 0 : _g.name) || "General"), 1),
                          createVNode("div", { class: "flex gap-4 mt-2 items-center" }, [
                            createVNode("div", { class: "flex gap-1 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:calendar-20-regular",
                                class: "text-lg mb-0.5 text-red-500"
                              }),
                              createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)((_h = unref(data)) == null ? void 0 : _h.report.startTime).format("dddd, DD MMMM YYYY")), 1)
                            ]),
                            createVNode("div", { class: "flex gap-1 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:clock-20-regular",
                                class: "text-lg mb-0.5 text-green-500"
                              }),
                              createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)((_i = unref(data)) == null ? void 0 : _i.report.startTime).format("HH:mm:ss")) + " - " + toDisplayString(unref($dayjs)((_j = unref(data)) == null ? void 0 : _j.report.endTime).format("HH:mm:ss")), 1)
                            ])
                          ])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UCard, null, {
                      default: withCtx(() => {
                        var _a, _b, _c, _d, _e;
                        return [
                          createVNode("h2", { class: "text-xl font-semibold" }, toDisplayString(((_b = (_a = unref(data)) == null ? void 0 : _a.exercise) == null ? void 0 : _b.name) || "General"), 1),
                          createVNode("div", { class: "flex gap-4 mt-2 items-center" }, [
                            createVNode("div", { class: "flex gap-1 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:calendar-20-regular",
                                class: "text-lg mb-0.5 text-red-500"
                              }),
                              createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)((_c = unref(data)) == null ? void 0 : _c.report.startTime).format("dddd, DD MMMM YYYY")), 1)
                            ]),
                            createVNode("div", { class: "flex gap-1 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:clock-20-regular",
                                class: "text-lg mb-0.5 text-green-500"
                              }),
                              createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)((_d = unref(data)) == null ? void 0 : _d.report.startTime).format("HH:mm:ss")) + " - " + toDisplayString(unref($dayjs)((_e = unref(data)) == null ? void 0 : _e.report.endTime).format("HH:mm:ss")), 1)
                            ])
                          ])
                        ];
                      }),
                      _: 1
                    })
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Quick Report" }, null, _parent3, _scopeId2));
                  _push3(`<div class="w-full grid grid-cols-3 gap-4"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-blue-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      var _a, _b, _c, _d;
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "fluent:timer-20-regular",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="font-bold text-3xl"${_scopeId3}>${ssrInterpolate(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(((_a = unref(data)) == null ? void 0 : _a.report.startTime) || 0, ((_b = unref(data)) == null ? void 0 : _b.report.endTime) || 0))}</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId3}>Time Exercise</div>`);
                      } else {
                        return [
                          createVNode(_component_Icon, {
                            name: "fluent:timer-20-regular",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, toDisplayString(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(((_c = unref(data)) == null ? void 0 : _c.report.startTime) || 0, ((_d = unref(data)) == null ? void 0 : _d.report.endTime) || 0)), 1),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Time Exercise")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-orange-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "lets-icons:calories-light",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="font-bold text-3xl"${_scopeId3}>1 Cal</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId3}>Calories Burn</div>`);
                      } else {
                        return [
                          createVNode(_component_Icon, {
                            name: "lets-icons:calories-light",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "1 Cal"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Calories Burn")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-green-500" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_Icon, {
                          name: "healthicons:body-outline",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                        }, null, _parent4, _scopeId3));
                        _push4(`<div class="font-bold text-3xl"${_scopeId3}>19.03</div><div class="ml-1 text-gray-600 dark:text-gray-300"${_scopeId3}>BMI</div>`);
                      } else {
                        return [
                          createVNode(_component_Icon, {
                            name: "healthicons:body-outline",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "19.03"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "BMI")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Quick Report" }),
                    createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                      createVNode(_component_UCard, { class: "relative border-b border-blue-500" }, {
                        default: withCtx(() => {
                          var _a, _b;
                          return [
                            createVNode(_component_Icon, {
                              name: "fluent:timer-20-regular",
                              class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                            }),
                            createVNode("div", { class: "font-bold text-3xl" }, toDisplayString(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(((_a = unref(data)) == null ? void 0 : _a.report.startTime) || 0, ((_b = unref(data)) == null ? void 0 : _b.report.endTime) || 0)), 1),
                            createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Time Exercise")
                          ];
                        }),
                        _: 1
                      }),
                      createVNode(_component_UCard, { class: "relative border-b border-orange-500" }, {
                        default: withCtx(() => [
                          createVNode(_component_Icon, {
                            name: "lets-icons:calories-light",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "1 Cal"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Calories Burn")
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UCard, { class: "relative border-b border-green-500" }, {
                        default: withCtx(() => [
                          createVNode(_component_Icon, {
                            name: "healthicons:body-outline",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, "19.03"),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "BMI")
                        ]),
                        _: 1
                      })
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Detail" }, null, _parent3, _scopeId2));
                  if (unref(data)) {
                    ssrRenderSuspense(_push3, {
                      fallback: () => {
                        _push3(` Loading... `);
                      },
                      default: () => {
                        _push3(ssrRenderComponent(_component_LazySessionWidgetDetailWidget, { data: unref(data) }, null, _parent3, _scopeId2));
                      },
                      _: 1
                    });
                  } else {
                    _push3(`<!---->`);
                  }
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Detail" }),
                    unref(data) ? (openBlock(), createBlock(Suspense, { key: 0 }, {
                      fallback: withCtx(() => [
                        createTextVNode(" Loading... ")
                      ]),
                      default: withCtx(() => [
                        createVNode(_component_LazySessionWidgetDetailWidget, { data: unref(data) }, null, 8, ["data"])
                      ]),
                      _: 1
                    })) : createCommentVNode("", true)
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Stats" }, null, _parent3, _scopeId2));
                  _push3(`<div class="flex flex-col gap-4"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UCard, null, {
                    header: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<div class="flex justify-between"${_scopeId3}><div class="flex items-end gap-2"${_scopeId3}><h2 class="text-xl font-semibold"${_scopeId3}>Training Intensity</h2></div></div>`);
                      } else {
                        return [
                          createVNode("div", { class: "flex justify-between" }, [
                            createVNode("div", { class: "flex items-end gap-2" }, [
                              createVNode("h2", { class: "text-xl font-semibold" }, "Training Intensity")
                            ])
                          ])
                        ];
                      }
                    }),
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UMeterGroup, {
                          min: 0,
                          max: 100,
                          size: "md",
                          indicator: "",
                          icon: "i-heroicons-minus"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UMeter, {
                                value: 20,
                                color: "gray",
                                label: "Maximum 90-100%"
                              }, null, _parent5, _scopeId4));
                              _push5(ssrRenderComponent(_component_UMeter, {
                                value: 10,
                                color: "red",
                                label: "Anaerobic 80-89%"
                              }, null, _parent5, _scopeId4));
                              _push5(ssrRenderComponent(_component_UMeter, {
                                value: 5,
                                color: "yellow",
                                label: "Aerobic 70-79%"
                              }, null, _parent5, _scopeId4));
                              _push5(ssrRenderComponent(_component_UMeter, {
                                value: 80,
                                color: "green",
                                label: "Endurance 60-69%"
                              }, null, _parent5, _scopeId4));
                              _push5(ssrRenderComponent(_component_UMeter, {
                                value: 15,
                                color: "green",
                                label: "Recovery 50-59%"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UMeter, {
                                  value: 20,
                                  color: "gray",
                                  label: "Maximum 90-100%"
                                }),
                                createVNode(_component_UMeter, {
                                  value: 10,
                                  color: "red",
                                  label: "Anaerobic 80-89%"
                                }),
                                createVNode(_component_UMeter, {
                                  value: 5,
                                  color: "yellow",
                                  label: "Aerobic 70-79%"
                                }),
                                createVNode(_component_UMeter, {
                                  value: 80,
                                  color: "green",
                                  label: "Endurance 60-69%"
                                }),
                                createVNode(_component_UMeter, {
                                  value: 15,
                                  color: "green",
                                  label: "Recovery 50-59%"
                                })
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UMeterGroup, {
                            min: 0,
                            max: 100,
                            size: "md",
                            indicator: "",
                            icon: "i-heroicons-minus"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UMeter, {
                                value: 20,
                                color: "gray",
                                label: "Maximum 90-100%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 10,
                                color: "red",
                                label: "Anaerobic 80-89%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 5,
                                color: "yellow",
                                label: "Aerobic 70-79%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 80,
                                color: "green",
                                label: "Endurance 60-69%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 15,
                                color: "green",
                                label: "Recovery 50-59%"
                              })
                            ]),
                            _: 1
                          })
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UCard, null, {
                    header: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<div class="flex justify-between"${_scopeId3}><div class="flex items-end gap-2"${_scopeId3}><h2 class="text-xl font-semibold"${_scopeId3}>Energy Expenditure</h2></div></div>`);
                      } else {
                        return [
                          createVNode("div", { class: "flex justify-between" }, [
                            createVNode("div", { class: "flex items-end gap-2" }, [
                              createVNode("h2", { class: "text-xl font-semibold" }, "Energy Expenditure")
                            ])
                          ])
                        ];
                      }
                    }),
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<div class="flex justify-around mb-6"${_scopeId3}><!--[-->`);
                        ssrRenderList([
                          { label: "Active", value: "558cal" },
                          { label: "Afterburn", value: "100cal" }
                        ], (stat, j) => {
                          _push4(`<div class="text-center"${_scopeId3}><div class="mb-2"${_scopeId3}>${ssrInterpolate(stat.label)}</div><div class="text-3xl"${_scopeId3}>${ssrInterpolate(stat.value)}</div></div>`);
                        });
                        _push4(`<!--]--></div><div${_scopeId3}>`);
                        _push4(ssrRenderComponent(unref(Doughnut), {
                          data: {
                            labels: ["Afterburn", "Active"],
                            datasets: [
                              {
                                backgroundColor: ["#41B883", "#E46651"],
                                data: [75, 25]
                              }
                            ]
                          },
                          options: {
                            responsive: true,
                            maintainAspectRatio: false
                          }
                        }, null, _parent4, _scopeId3));
                        _push4(`</div>`);
                      } else {
                        return [
                          createVNode("div", { class: "flex justify-around mb-6" }, [
                            (openBlock(), createBlock(Fragment, null, renderList([
                              { label: "Active", value: "558cal" },
                              { label: "Afterburn", value: "100cal" }
                            ], (stat, j) => {
                              return createVNode("div", { class: "text-center" }, [
                                createVNode("div", { class: "mb-2" }, toDisplayString(stat.label), 1),
                                createVNode("div", { class: "text-3xl" }, toDisplayString(stat.value), 1)
                              ]);
                            }), 64))
                          ]),
                          createVNode("div", null, [
                            createVNode(unref(Doughnut), {
                              data: {
                                labels: ["Afterburn", "Active"],
                                datasets: [
                                  {
                                    backgroundColor: ["#41B883", "#E46651"],
                                    data: [75, 25]
                                  }
                                ]
                              },
                              options: {
                                responsive: true,
                                maintainAspectRatio: false
                              }
                            })
                          ])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Stats" }),
                    createVNode("div", { class: "flex flex-col gap-4" }, [
                      createVNode(_component_UCard, null, {
                        header: withCtx(() => [
                          createVNode("div", { class: "flex justify-between" }, [
                            createVNode("div", { class: "flex items-end gap-2" }, [
                              createVNode("h2", { class: "text-xl font-semibold" }, "Training Intensity")
                            ])
                          ])
                        ]),
                        default: withCtx(() => [
                          createVNode(_component_UMeterGroup, {
                            min: 0,
                            max: 100,
                            size: "md",
                            indicator: "",
                            icon: "i-heroicons-minus"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UMeter, {
                                value: 20,
                                color: "gray",
                                label: "Maximum 90-100%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 10,
                                color: "red",
                                label: "Anaerobic 80-89%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 5,
                                color: "yellow",
                                label: "Aerobic 70-79%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 80,
                                color: "green",
                                label: "Endurance 60-69%"
                              }),
                              createVNode(_component_UMeter, {
                                value: 15,
                                color: "green",
                                label: "Recovery 50-59%"
                              })
                            ]),
                            _: 1
                          })
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UCard, null, {
                        header: withCtx(() => [
                          createVNode("div", { class: "flex justify-between" }, [
                            createVNode("div", { class: "flex items-end gap-2" }, [
                              createVNode("h2", { class: "text-xl font-semibold" }, "Energy Expenditure")
                            ])
                          ])
                        ]),
                        default: withCtx(() => [
                          createVNode("div", { class: "flex justify-around mb-6" }, [
                            (openBlock(), createBlock(Fragment, null, renderList([
                              { label: "Active", value: "558cal" },
                              { label: "Afterburn", value: "100cal" }
                            ], (stat, j) => {
                              return createVNode("div", { class: "text-center" }, [
                                createVNode("div", { class: "mb-2" }, toDisplayString(stat.label), 1),
                                createVNode("div", { class: "text-3xl" }, toDisplayString(stat.value), 1)
                              ]);
                            }), 64))
                          ]),
                          createVNode("div", null, [
                            createVNode(unref(Doughnut), {
                              data: {
                                labels: ["Afterburn", "Active"],
                                datasets: [
                                  {
                                    backgroundColor: ["#41B883", "#E46651"],
                                    data: [75, 25]
                                  }
                                ]
                              },
                              options: {
                                responsive: true,
                                maintainAspectRatio: false
                              }
                            })
                          ])
                        ]),
                        _: 1
                      })
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, null, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                var _a, _b;
                if (_push3) {
                  _push3(ssrRenderComponent(_component_PageTitle, { text: "Devices" }, null, _parent3, _scopeId2));
                  _push3(`<div class="w-full grid grid-cols-3 gap-4"${_scopeId2}><!--[-->`);
                  ssrRenderList((_a = unref(data)) == null ? void 0 : _a.report.devices, (item, i) => {
                    _push3(ssrRenderComponent(_component_UCard, { class: "relative border-b border-primary-500" }, {
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        if (_push4) {
                          _push4(`<div class="flex gap-4 items-center"${_scopeId3}>`);
                          _push4(ssrRenderComponent(_component_Icon, {
                            name: "fluent:smartwatch-20-regular",
                            class: "text-6xl text-primary-500"
                          }, null, _parent4, _scopeId3));
                          _push4(`<div class="flex flex-col gap-1"${_scopeId3}><div class=""${_scopeId3}>${ssrInterpolate(item.name)}</div><div class="text-xs text-gray-600 dark:text-gray-300"${_scopeId3}>${ssrInterpolate(item.identifier)}</div></div></div>`);
                        } else {
                          return [
                            createVNode("div", { class: "flex gap-4 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:smartwatch-20-regular",
                                class: "text-6xl text-primary-500"
                              }),
                              createVNode("div", { class: "flex flex-col gap-1" }, [
                                createVNode("div", { class: "" }, toDisplayString(item.name), 1),
                                createVNode("div", { class: "text-xs text-gray-600 dark:text-gray-300" }, toDisplayString(item.identifier), 1)
                              ])
                            ])
                          ];
                        }
                      }),
                      _: 2
                    }, _parent3, _scopeId2));
                  });
                  _push3(`<!--]--></div>`);
                } else {
                  return [
                    createVNode(_component_PageTitle, { text: "Devices" }),
                    createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                      (openBlock(true), createBlock(Fragment, null, renderList((_b = unref(data)) == null ? void 0 : _b.report.devices, (item, i) => {
                        return openBlock(), createBlock(_component_UCard, { class: "relative border-b border-primary-500" }, {
                          default: withCtx(() => [
                            createVNode("div", { class: "flex gap-4 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:smartwatch-20-regular",
                                class: "text-6xl text-primary-500"
                              }),
                              createVNode("div", { class: "flex flex-col gap-1" }, [
                                createVNode("div", { class: "" }, toDisplayString(item.name), 1),
                                createVNode("div", { class: "text-xs text-gray-600 dark:text-gray-300" }, toDisplayString(item.identifier), 1)
                              ])
                            ])
                          ]),
                          _: 2
                        }, 1024);
                      }), 256))
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_UCard, null, {
                    default: withCtx(() => {
                      var _a, _b, _c, _d, _e;
                      return [
                        createVNode("h2", { class: "text-xl font-semibold" }, toDisplayString(((_b = (_a = unref(data)) == null ? void 0 : _a.exercise) == null ? void 0 : _b.name) || "General"), 1),
                        createVNode("div", { class: "flex gap-4 mt-2 items-center" }, [
                          createVNode("div", { class: "flex gap-1 items-center" }, [
                            createVNode(_component_Icon, {
                              name: "fluent:calendar-20-regular",
                              class: "text-lg mb-0.5 text-red-500"
                            }),
                            createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)((_c = unref(data)) == null ? void 0 : _c.report.startTime).format("dddd, DD MMMM YYYY")), 1)
                          ]),
                          createVNode("div", { class: "flex gap-1 items-center" }, [
                            createVNode(_component_Icon, {
                              name: "fluent:clock-20-regular",
                              class: "text-lg mb-0.5 text-green-500"
                            }),
                            createVNode("div", { class: "text-xs" }, toDisplayString(unref($dayjs)((_d = unref(data)) == null ? void 0 : _d.report.startTime).format("HH:mm:ss")) + " - " + toDisplayString(unref($dayjs)((_e = unref(data)) == null ? void 0 : _e.report.endTime).format("HH:mm:ss")), 1)
                          ])
                        ])
                      ];
                    }),
                    _: 1
                  })
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_PageTitle, { text: "Quick Report" }),
                  createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                    createVNode(_component_UCard, { class: "relative border-b border-blue-500" }, {
                      default: withCtx(() => {
                        var _a, _b;
                        return [
                          createVNode(_component_Icon, {
                            name: "fluent:timer-20-regular",
                            class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-blue-500"
                          }),
                          createVNode("div", { class: "font-bold text-3xl" }, toDisplayString(("getTimeInMorS" in _ctx ? _ctx.getTimeInMorS : unref(getTimeInMorS))(((_a = unref(data)) == null ? void 0 : _a.report.startTime) || 0, ((_b = unref(data)) == null ? void 0 : _b.report.endTime) || 0)), 1),
                          createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Time Exercise")
                        ];
                      }),
                      _: 1
                    }),
                    createVNode(_component_UCard, { class: "relative border-b border-orange-500" }, {
                      default: withCtx(() => [
                        createVNode(_component_Icon, {
                          name: "lets-icons:calories-light",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-orange-500"
                        }),
                        createVNode("div", { class: "font-bold text-3xl" }, "1 Cal"),
                        createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "Calories Burn")
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UCard, { class: "relative border-b border-green-500" }, {
                      default: withCtx(() => [
                        createVNode(_component_Icon, {
                          name: "healthicons:body-outline",
                          class: "text-6xl absolute right-0 top-0 mt-6 mr-4 text-green-500"
                        }),
                        createVNode("div", { class: "font-bold text-3xl" }, "19.03"),
                        createVNode("div", { class: "ml-1 text-gray-600 dark:text-gray-300" }, "BMI")
                      ]),
                      _: 1
                    })
                  ])
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_PageTitle, { text: "Detail" }),
                  unref(data) ? (openBlock(), createBlock(Suspense, { key: 0 }, {
                    fallback: withCtx(() => [
                      createTextVNode(" Loading... ")
                    ]),
                    default: withCtx(() => [
                      createVNode(_component_LazySessionWidgetDetailWidget, { data: unref(data) }, null, 8, ["data"])
                    ]),
                    _: 1
                  })) : createCommentVNode("", true)
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => [
                  createVNode(_component_PageTitle, { text: "Stats" }),
                  createVNode("div", { class: "flex flex-col gap-4" }, [
                    createVNode(_component_UCard, null, {
                      header: withCtx(() => [
                        createVNode("div", { class: "flex justify-between" }, [
                          createVNode("div", { class: "flex items-end gap-2" }, [
                            createVNode("h2", { class: "text-xl font-semibold" }, "Training Intensity")
                          ])
                        ])
                      ]),
                      default: withCtx(() => [
                        createVNode(_component_UMeterGroup, {
                          min: 0,
                          max: 100,
                          size: "md",
                          indicator: "",
                          icon: "i-heroicons-minus"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UMeter, {
                              value: 20,
                              color: "gray",
                              label: "Maximum 90-100%"
                            }),
                            createVNode(_component_UMeter, {
                              value: 10,
                              color: "red",
                              label: "Anaerobic 80-89%"
                            }),
                            createVNode(_component_UMeter, {
                              value: 5,
                              color: "yellow",
                              label: "Aerobic 70-79%"
                            }),
                            createVNode(_component_UMeter, {
                              value: 80,
                              color: "green",
                              label: "Endurance 60-69%"
                            }),
                            createVNode(_component_UMeter, {
                              value: 15,
                              color: "green",
                              label: "Recovery 50-59%"
                            })
                          ]),
                          _: 1
                        })
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UCard, null, {
                      header: withCtx(() => [
                        createVNode("div", { class: "flex justify-between" }, [
                          createVNode("div", { class: "flex items-end gap-2" }, [
                            createVNode("h2", { class: "text-xl font-semibold" }, "Energy Expenditure")
                          ])
                        ])
                      ]),
                      default: withCtx(() => [
                        createVNode("div", { class: "flex justify-around mb-6" }, [
                          (openBlock(), createBlock(Fragment, null, renderList([
                            { label: "Active", value: "558cal" },
                            { label: "Afterburn", value: "100cal" }
                          ], (stat, j) => {
                            return createVNode("div", { class: "text-center" }, [
                              createVNode("div", { class: "mb-2" }, toDisplayString(stat.label), 1),
                              createVNode("div", { class: "text-3xl" }, toDisplayString(stat.value), 1)
                            ]);
                          }), 64))
                        ]),
                        createVNode("div", null, [
                          createVNode(unref(Doughnut), {
                            data: {
                              labels: ["Afterburn", "Active"],
                              datasets: [
                                {
                                  backgroundColor: ["#41B883", "#E46651"],
                                  data: [75, 25]
                                }
                              ]
                            },
                            options: {
                              responsive: true,
                              maintainAspectRatio: false
                            }
                          })
                        ])
                      ]),
                      _: 1
                    })
                  ])
                ]),
                _: 1
              }),
              createVNode(_component_PageSection, null, {
                default: withCtx(() => {
                  var _a;
                  return [
                    createVNode(_component_PageTitle, { text: "Devices" }),
                    createVNode("div", { class: "w-full grid grid-cols-3 gap-4" }, [
                      (openBlock(true), createBlock(Fragment, null, renderList((_a = unref(data)) == null ? void 0 : _a.report.devices, (item, i) => {
                        return openBlock(), createBlock(_component_UCard, { class: "relative border-b border-primary-500" }, {
                          default: withCtx(() => [
                            createVNode("div", { class: "flex gap-4 items-center" }, [
                              createVNode(_component_Icon, {
                                name: "fluent:smartwatch-20-regular",
                                class: "text-6xl text-primary-500"
                              }),
                              createVNode("div", { class: "flex flex-col gap-1" }, [
                                createVNode("div", { class: "" }, toDisplayString(item.name), 1),
                                createVNode("div", { class: "text-xs text-gray-600 dark:text-gray-300" }, toDisplayString(item.identifier), 1)
                              ])
                            ])
                          ]),
                          _: 2
                        }, 1024);
                      }), 256))
                    ])
                  ];
                }),
                _: 1
              })
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/session/[id].vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=_id_-DCAPM8EU.mjs.map
