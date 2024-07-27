import { _ as __nuxt_component_0$1 } from './Card-L1vIobqU.mjs';
import { _ as __nuxt_component_0 } from './Kbd-CWGxBI2b.mjs';
import { defineComponent, toRef, computed, ref, useSSRContext, cloneVNode, h, resolveComponent, mergeProps, withCtx, createVNode, unref, toDisplayString, openBlock, createBlock, Fragment, renderList, createCommentVNode, createTextVNode } from 'vue';
import { d as defu } from '../runtime.mjs';
import { G as arrow, m as mergeConfig, b as appConfig, f as useUI, c as __nuxt_component_0$2, T as getSlotsChildren, h as useAuth, k as __nuxt_component_2, e as __nuxt_component_3, _ as _export_sfc } from './server.mjs';
import { u as usePopper } from './usePopper-C-zM4LTl.mjs';
import { ssrRenderAttrs, ssrRenderComponent, ssrRenderList, ssrInterpolate, ssrRenderSlot, ssrRenderClass, ssrRenderStyle, ssrRenderAttr } from 'vue/server-renderer';
import { twJoin } from 'tailwind-merge';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import dayjs from 'dayjs';
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
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import '@vueuse/core';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

var __defProp = Object.defineProperty;
var __defNormalProp = (obj, key, value) => key in obj ? __defProp(obj, key, { enumerable: true, configurable: true, writable: true, value }) : obj[key] = value;
var __publicField = (obj, key, value) => __defNormalProp(obj, key + "" , value);
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
const tooltip = {
  wrapper: "relative inline-flex",
  container: "z-20 group",
  width: "max-w-xs",
  background: "bg-white dark:bg-gray-900",
  color: "text-gray-900 dark:text-white",
  shadow: "shadow",
  rounded: "rounded",
  ring: "ring-1 ring-gray-200 dark:ring-gray-800",
  base: "[@media(pointer:coarse)]:hidden h-6 px-2 py-1 text-xs font-normal truncate relative",
  shortcuts: "hidden md:inline-flex flex-shrink-0 gap-0.5",
  middot: "mx-1 text-gray-700 dark:text-gray-200",
  // Syntax for `<Transition>` component https://vuejs.org/guide/built-ins/transition.html#css-based-transitions
  transition: {
    enterActiveClass: "transition ease-out duration-200",
    enterFromClass: "opacity-0 translate-y-1",
    enterToClass: "opacity-100 translate-y-0",
    leaveActiveClass: "transition ease-in duration-150",
    leaveFromClass: "opacity-100 translate-y-0",
    leaveToClass: "opacity-0 translate-y-1"
  },
  popper: {
    strategy: "fixed"
  },
  default: {
    openDelay: 0,
    closeDelay: 0
  },
  arrow: {
    ...arrow,
    base: "[@media(pointer:coarse)]:hidden invisible before:visible before:block before:rotate-45 before:z-[-1] before:w-2 before:h-2"
  }
};
const generatePastelColor = () => {
  const baseLight = 150;
  const range = 105;
  const r = baseLight + Math.floor(Math.random() * range);
  const g = baseLight + Math.floor(Math.random() * range);
  const b = baseLight + Math.floor(Math.random() * range);
  return `rgb(${r}, ${g}, ${b})`;
};
class ReportParser {
  constructor() {
    __publicField(this, "type", "");
  }
  // constructor() {
  //   const $dayjs = useDayjs()
  //   $dayjs
  // }
  parse(...args) {
    return {
      stats: [],
      type: this.type,
      labels: [],
      datasets: [
        {
          label: "",
          data: []
        }
      ],
      yMin: 0,
      yMax: 0
    };
  }
}
class ReportParserHR extends ReportParser {
  constructor() {
    super(...arguments);
    __publicField(this, "type", "hr");
  }
  parse(data) {
    const seconds = [];
    for (const item of data) {
      for (const [second, value] of item.value) {
        if (typeof second === "number" && !seconds.includes(second)) {
          seconds.push(second);
        }
      }
    }
    const devices_datas = [];
    for (const item of data) {
      const data2 = {
        data: {},
        borderColor: generatePastelColor(),
        label: item.device,
        tension: 0,
        borderWidth: 2,
        fill: "start",
        hidden: true
      };
      for (const [second, value] of item.value) {
        if (typeof second === "number" && seconds.includes(second)) {
          data2.data[second] = value;
        }
      }
      devices_datas.push(data2);
    }
    const virtual_device_data = {
      data: {},
      borderColor: generatePastelColor(),
      label: "Merged",
      tension: 0,
      borderWidth: 2,
      fill: "start"
    };
    for (const second of seconds) {
      const values = devices_datas.map((item) => item.data[second] || 0);
      virtual_device_data.data[second] = values.reduce((a, b) => a + b, 0) / values.length;
    }
    devices_datas.unshift(virtual_device_data);
    let range = "second";
    if (seconds[seconds.length - 1] > 100) {
      range = "minute";
    }
    const labels = [];
    if (range === "second") {
      for (const second of seconds) {
        labels.push(dayjs().startOf("day").add(second, "second").format("s") + "s");
      }
    } else {
      for (const second of seconds) {
        labels.push(dayjs().startOf("day").add(second, "second").format("mm:ss"));
      }
    }
    const stats = [
      {
        label: "Min",
        value: 0
      },
      {
        label: "Avg",
        value: 0
      },
      {
        label: "Max",
        value: 0
      }
    ];
    {
      const values = Object.values(virtual_device_data.data);
      stats[0].value = Math.round(Math.min(...values));
      stats[1].value = Math.round(values.reduce((a, b) => a + b, 0) / values.length);
      stats[2].value = Math.round(Math.max(...values));
    }
    return {
      type: this.type,
      stats,
      labels,
      datasets: devices_datas.map((item) => ({
        ...item,
        data: Object.values(item.data)
      })),
      yMin: Math.min(...devices_datas.map((item) => Math.min(...Object.values(item.data)))),
      yMax: Math.max(...devices_datas.map((item) => Math.max(...Object.values(item.data))))
    };
  }
}
const config$1 = mergeConfig(appConfig.ui.strategy, appConfig.ui.tooltip, tooltip);
const _sfc_main$2 = defineComponent({
  components: {
    UKbd: __nuxt_component_0
  },
  inheritAttrs: false,
  props: {
    text: {
      type: String,
      default: null
    },
    prevent: {
      type: Boolean,
      default: false
    },
    shortcuts: {
      type: Array,
      default: () => []
    },
    openDelay: {
      type: Number,
      default: () => config$1.default.openDelay
    },
    closeDelay: {
      type: Number,
      default: () => config$1.default.closeDelay
    },
    popper: {
      type: Object,
      default: () => ({})
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
    const { ui, attrs } = useUI("tooltip", toRef(props, "ui"), config$1, toRef(props, "class"));
    const popper = computed(() => defu({}, props.popper, ui.value.popper));
    const [trigger, container] = usePopper(popper.value);
    const open = ref(false);
    let openTimeout = null;
    let closeTimeout = null;
    function onMouseEnter() {
      if (closeTimeout) {
        clearTimeout(closeTimeout);
        closeTimeout = null;
      }
      if (open.value) {
        return;
      }
      openTimeout = openTimeout || setTimeout(() => {
        open.value = true;
        openTimeout = null;
      }, props.openDelay);
    }
    function onMouseLeave() {
      if (openTimeout) {
        clearTimeout(openTimeout);
        openTimeout = null;
      }
      if (!open.value) {
        return;
      }
      closeTimeout = closeTimeout || setTimeout(() => {
        open.value = false;
        closeTimeout = null;
      }, props.closeDelay);
    }
    return {
      // eslint-disable-next-line vue/no-dupe-keys
      ui,
      attrs,
      // eslint-disable-next-line vue/no-dupe-keys
      popper,
      trigger,
      container,
      open,
      onMouseEnter,
      onMouseLeave
    };
  }
});
function _sfc_ssrRender$1(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  var _a;
  const _component_UKbd = __nuxt_component_0;
  _push(`<div${ssrRenderAttrs(mergeProps({
    ref: "trigger",
    class: _ctx.ui.wrapper
  }, _ctx.attrs, _attrs))}>`);
  ssrRenderSlot(_ctx.$slots, "default", { open: _ctx.open }, () => {
    _push(` Hover `);
  }, _push, _parent);
  if (_ctx.open && !_ctx.prevent) {
    _push(`<div class="${ssrRenderClass([_ctx.ui.container, _ctx.ui.width])}"><template><div>`);
    if (_ctx.popper.arrow) {
      _push(`<div data-popper-arrow class="${ssrRenderClass(Object.values(_ctx.ui.arrow))}"></div>`);
    } else {
      _push(`<!---->`);
    }
    _push(`<div class="${ssrRenderClass([_ctx.ui.base, _ctx.ui.background, _ctx.ui.color, _ctx.ui.rounded, _ctx.ui.shadow, _ctx.ui.ring])}">`);
    ssrRenderSlot(_ctx.$slots, "text", {}, () => {
      _push(`${ssrInterpolate(_ctx.text)}`);
    }, _push, _parent);
    if ((_a = _ctx.shortcuts) == null ? void 0 : _a.length) {
      _push(`<span class="${ssrRenderClass(_ctx.ui.shortcuts)}"><span class="${ssrRenderClass(_ctx.ui.middot)}">\xB7</span><!--[-->`);
      ssrRenderList(_ctx.shortcuts, (shortcut) => {
        _push(ssrRenderComponent(_component_UKbd, {
          key: shortcut,
          size: "xs"
        }, {
          default: withCtx((_, _push2, _parent2, _scopeId) => {
            if (_push2) {
              _push2(`${ssrInterpolate(shortcut)}`);
            } else {
              return [
                createTextVNode(toDisplayString(shortcut), 1)
              ];
            }
          }),
          _: 2
        }, _parent));
      });
      _push(`<!--]--></span>`);
    } else {
      _push(`<!---->`);
    }
    _push(`</div></div></template></div>`);
  } else {
    _push(`<!---->`);
  }
  _push(`</div>`);
}
const _sfc_setup$2 = _sfc_main$2.setup;
_sfc_main$2.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("../../node_modules/@nuxt/ui/dist/runtime/components/overlays/Tooltip.vue");
  return _sfc_setup$2 ? _sfc_setup$2(props, ctx) : void 0;
};
const __nuxt_component_1 = /* @__PURE__ */ _export_sfc(_sfc_main$2, [["ssrRender", _sfc_ssrRender$1]]);
const meterConfig = mergeConfig(appConfig.ui.strategy, appConfig.ui.meter, meter);
const meterGroupConfig = mergeConfig(appConfig.ui.strategy, appConfig.ui.meterGroup, meterGroup);
const __nuxt_component_4 = defineComponent({
  components: {
    UIcon: __nuxt_component_0$2
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
          h(__nuxt_component_0$2, { name: (_a2 = (_a = clones.value[key]) == null ? void 0 : _a.props.icon) != null ? _a2 : props.icon }),
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
    UIcon: __nuxt_component_0$2
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
  const _component_UIcon = __nuxt_component_0$2;
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("../../node_modules/@nuxt/ui/dist/runtime/components/elements/Meter.vue");
  return _sfc_setup$1 ? _sfc_setup$1(props, ctx) : void 0;
};
const __nuxt_component_5 = /* @__PURE__ */ _export_sfc(_sfc_main$1, [["ssrRender", _sfc_ssrRender]]);
const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "StatWidget",
  __ssrInlineRender: true,
  props: {
    data: {
      type: Object,
      required: true
    }
  },
  setup(__props) {
    const props = __props;
    const $dayjs = useDayjs();
    const $auth = useAuth();
    const currentUserAge = computed(() => {
      var _a;
      try {
        return Math.abs(Number($dayjs((_a = $auth.data.value) == null ? void 0 : _a.user["dateOfBirth"]).diff($dayjs(), "year")));
      } catch (error) {
        return 0;
      }
    });
    function getIntensity(data, age) {
      const maxHeartRate = 208 - 0.7 * age;
      const intensityZones = {
        // nama_zona: [minimal_hr, max_hr]
        maximum: [0.9 * maxHeartRate, maxHeartRate, "90% - 100%"],
        anaerobic: [0.8 * maxHeartRate, 0.89 * maxHeartRate, "80% - 89%"],
        aerobic: [0.7 * maxHeartRate, 0.79 * maxHeartRate, "70% - 79%"],
        endurance: [0.6 * maxHeartRate, 0.69 * maxHeartRate, "60% - 69%"],
        recovery: [0.5 * maxHeartRate, 0.59 * maxHeartRate, "50% - 59%"],
        lifeActive: [0, 0.49 * maxHeartRate, "0% - 49%"]
      };
      const heartRates = data.datasets[0].data;
      const intensityCount = {
        maximum: 0,
        anaerobic: 0,
        aerobic: 0,
        endurance: 0,
        recovery: 0,
        lifeActive: 0
      };
      heartRates.forEach((heartRate) => {
        if (heartRate >= intensityZones.maximum[0] && heartRate <= intensityZones.maximum[1]) {
          intensityCount.maximum += 1;
        } else if (heartRate >= intensityZones.anaerobic[0] && heartRate <= intensityZones.anaerobic[1]) {
          intensityCount.anaerobic += 1;
        } else if (heartRate >= intensityZones.aerobic[0] && heartRate <= intensityZones.aerobic[1]) {
          intensityCount.aerobic += 1;
        } else if (heartRate >= intensityZones.endurance[0] && heartRate <= intensityZones.endurance[1]) {
          intensityCount.endurance += 1;
        } else if (heartRate >= intensityZones.recovery[0] && heartRate <= intensityZones.recovery[1]) {
          intensityCount.recovery += 1;
        } else {
          intensityCount.lifeActive += 1;
        }
      });
      const totalSeconds = heartRates.length;
      const intensitySummary2 = [];
      for (const [key, value] of Object.entries(intensityCount)) {
        intensitySummary2.push({
          name: key,
          seconds: value,
          percent: value / totalSeconds * 100,
          maxVal: intensityZones[key][1],
          minVal: intensityZones[key][0],
          label: `${key} ${intensityZones[key][2]}`
        });
      }
      console.log("intensitySummary", intensitySummary2);
      return intensitySummary2;
    }
    const intensitySummary = computed(() => {
      const hrdata = props.data.report.reports.find((r) => r.type === "hr");
      if (!hrdata)
        return;
      const parser = new ReportParserHR();
      const parsed = parser.parse(hrdata.data);
      return getIntensity(parsed, currentUserAge.value);
    });
    const displayTimeSeconds = (seconds) => {
      return $dayjs().startOf("day").add(seconds, "seconds").format("HH:mm:ss");
    };
    const getColor = (i) => {
      switch (i) {
        case 0:
          return "gray";
        case 1:
          return "red";
        case 2:
          return "yellow";
        case 3:
          return "green";
        case 4:
          return "green";
        default:
          return "gray";
      }
    };
    const recommendationMaxHr = computed(() => {
      const lists = [
        {
          label: "Tanaka",
          value: 208 - 0.7 * currentUserAge.value,
          func: `208 - (0.7 * ${currentUserAge.value})`,
          // if age < 30, priority: (0.7 * age) + 208
          priority: currentUserAge.value < 30 ? 10 : 2
        },
        {
          label: "Fox",
          value: 220 - currentUserAge.value,
          func: `220 - ${currentUserAge.value}`,
          priority: currentUserAge.value > 30 ? 10 : 2
        },
        {
          label: "Gellish",
          value: 207 - 0.7 * currentUserAge.value,
          func: `207 - (0.7 * ${currentUserAge.value})`,
          priority: 1
        },
        {
          label: "Nes",
          value: 211 - 0.64 * currentUserAge.value,
          func: `211 - (0.64 * ${currentUserAge.value})`,
          priority: 1
        }
      ];
      return lists;
    });
    const isShowAllFormulaMaxHrRecommendation = ref(false);
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UCard = __nuxt_component_0$1;
      const _component_UTooltip = __nuxt_component_1;
      const _component_Icon = __nuxt_component_2;
      const _component_UButton = __nuxt_component_3;
      const _component_UMeterGroup = __nuxt_component_4;
      const _component_UMeter = __nuxt_component_5;
      const _component_Doughnut = resolveComponent("Doughnut");
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col gap-4" }, _attrs))}>`);
      _push(ssrRenderComponent(_component_UCard, null, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-between"${_scopeId}><div class="flex items-end gap-2"${_scopeId}><h2 class="text-xl font-semibold"${_scopeId}>Heart rate</h2></div></div>`);
          } else {
            return [
              createVNode("div", { class: "flex justify-between" }, [
                createVNode("div", { class: "flex items-end gap-2" }, [
                  createVNode("h2", { class: "text-xl font-semibold" }, "Heart rate")
                ])
              ])
            ];
          }
        }),
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-around mb-6"${_scopeId}><!--[-->`);
            ssrRenderList([
              ["Age", unref(currentUserAge)],
              ["Recomendation Max HR", unref(recommendationMaxHr)[0].value, unref(recommendationMaxHr)[0].label]
            ], (stat, j) => {
              _push2(`<div class="text-center"${_scopeId}><div class="mb-2"${_scopeId}>${ssrInterpolate(stat[0])}</div><div class="text-5xl"${_scopeId}>${ssrInterpolate(stat[1])}</div>`);
              if (stat[2]) {
                _push2(`<div class="text-sm text-gray-500"${_scopeId}>`);
                _push2(ssrRenderComponent(_component_UTooltip, {
                  text: `Formula: ${unref(recommendationMaxHr)[0].func}`,
                  class: ""
                }, {
                  default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                    if (_push3) {
                      _push3(`<div${_scopeId2}>${ssrInterpolate(stat[2])}</div><div class="absolute right-[-15px] top-[-5px]"${_scopeId2}>`);
                      _push3(ssrRenderComponent(_component_Icon, {
                        name: "i-heroicons-information-circle",
                        class: "w-3 h-3"
                      }, null, _parent3, _scopeId2));
                      _push3(`</div>`);
                    } else {
                      return [
                        createVNode("div", null, toDisplayString(stat[2]), 1),
                        createVNode("div", { class: "absolute right-[-15px] top-[-5px]" }, [
                          createVNode(_component_Icon, {
                            name: "i-heroicons-information-circle",
                            class: "w-3 h-3"
                          })
                        ])
                      ];
                    }
                  }),
                  _: 2
                }, _parent2, _scopeId));
                _push2(`</div>`);
              } else {
                _push2(`<!---->`);
              }
              _push2(`</div>`);
            });
            _push2(`<!--]--></div>`);
            if (unref(isShowAllFormulaMaxHrRecommendation)) {
              _push2(`<div class="border-t border-gray-500/50 py-6 mt-6"${_scopeId}><div class="flex items-center justify-center mb-3"${_scopeId}>Another Recommendation Max HR</div><div class="grid grid-cols-4 gap-2"${_scopeId}><!--[-->`);
              ssrRenderList(unref(recommendationMaxHr), (rec, i) => {
                _push2(`<div class="border border-gray-500/50 p-2 rounded"${_scopeId}><div${_scopeId}>${ssrInterpolate(rec.label)}</div><div${_scopeId}>${ssrInterpolate(rec.value)}</div><div class="text-sm text-gray-500"${_scopeId}>`);
                _push2(ssrRenderComponent(_component_UTooltip, {
                  text: `Formula: ${rec.func}`,
                  class: ""
                }, {
                  default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                    if (_push3) {
                      _push3(`<div${_scopeId2}>${ssrInterpolate(rec.func)}</div><div class="absolute right-[-15px] top-[-5px]"${_scopeId2}>`);
                      _push3(ssrRenderComponent(_component_Icon, {
                        name: "i-heroicons-information-circle",
                        class: "w-3 h-3"
                      }, null, _parent3, _scopeId2));
                      _push3(`</div>`);
                    } else {
                      return [
                        createVNode("div", null, toDisplayString(rec.func), 1),
                        createVNode("div", { class: "absolute right-[-15px] top-[-5px]" }, [
                          createVNode(_component_Icon, {
                            name: "i-heroicons-information-circle",
                            class: "w-3 h-3"
                          })
                        ])
                      ];
                    }
                  }),
                  _: 2
                }, _parent2, _scopeId));
                _push2(`</div></div>`);
              });
              _push2(`<!--]--></div></div>`);
            } else {
              _push2(`<!---->`);
            }
            if (!unref(isShowAllFormulaMaxHrRecommendation)) {
              _push2(`<div class="flex justify-center items-center"${_scopeId}>`);
              _push2(ssrRenderComponent(_component_UButton, {
                label: "Show all heart rate formular",
                variant: "ghost",
                color: "blue",
                "trailing-icon": "i-heroicons-chevron-down",
                class: "animate-bounce",
                onClick: ($event) => isShowAllFormulaMaxHrRecommendation.value = true
              }, null, _parent2, _scopeId));
              _push2(`</div>`);
            } else {
              _push2(`<!---->`);
            }
          } else {
            return [
              createVNode("div", { class: "flex justify-around mb-6" }, [
                (openBlock(true), createBlock(Fragment, null, renderList([
                  ["Age", unref(currentUserAge)],
                  ["Recomendation Max HR", unref(recommendationMaxHr)[0].value, unref(recommendationMaxHr)[0].label]
                ], (stat, j) => {
                  return openBlock(), createBlock("div", { class: "text-center" }, [
                    createVNode("div", { class: "mb-2" }, toDisplayString(stat[0]), 1),
                    createVNode("div", { class: "text-5xl" }, toDisplayString(stat[1]), 1),
                    stat[2] ? (openBlock(), createBlock("div", {
                      key: 0,
                      class: "text-sm text-gray-500"
                    }, [
                      createVNode(_component_UTooltip, {
                        text: `Formula: ${unref(recommendationMaxHr)[0].func}`,
                        class: ""
                      }, {
                        default: withCtx(() => [
                          createVNode("div", null, toDisplayString(stat[2]), 1),
                          createVNode("div", { class: "absolute right-[-15px] top-[-5px]" }, [
                            createVNode(_component_Icon, {
                              name: "i-heroicons-information-circle",
                              class: "w-3 h-3"
                            })
                          ])
                        ]),
                        _: 2
                      }, 1032, ["text"])
                    ])) : createCommentVNode("", true)
                  ]);
                }), 256))
              ]),
              unref(isShowAllFormulaMaxHrRecommendation) ? (openBlock(), createBlock("div", {
                key: 0,
                class: "border-t border-gray-500/50 py-6 mt-6"
              }, [
                createVNode("div", { class: "flex items-center justify-center mb-3" }, "Another Recommendation Max HR"),
                createVNode("div", { class: "grid grid-cols-4 gap-2" }, [
                  (openBlock(true), createBlock(Fragment, null, renderList(unref(recommendationMaxHr), (rec, i) => {
                    return openBlock(), createBlock("div", {
                      key: i,
                      class: "border border-gray-500/50 p-2 rounded"
                    }, [
                      createVNode("div", null, toDisplayString(rec.label), 1),
                      createVNode("div", null, toDisplayString(rec.value), 1),
                      createVNode("div", { class: "text-sm text-gray-500" }, [
                        createVNode(_component_UTooltip, {
                          text: `Formula: ${rec.func}`,
                          class: ""
                        }, {
                          default: withCtx(() => [
                            createVNode("div", null, toDisplayString(rec.func), 1),
                            createVNode("div", { class: "absolute right-[-15px] top-[-5px]" }, [
                              createVNode(_component_Icon, {
                                name: "i-heroicons-information-circle",
                                class: "w-3 h-3"
                              })
                            ])
                          ]),
                          _: 2
                        }, 1032, ["text"])
                      ])
                    ]);
                  }), 128))
                ])
              ])) : createCommentVNode("", true),
              !unref(isShowAllFormulaMaxHrRecommendation) ? (openBlock(), createBlock("div", {
                key: 1,
                class: "flex justify-center items-center"
              }, [
                createVNode(_component_UButton, {
                  label: "Show all heart rate formular",
                  variant: "ghost",
                  color: "blue",
                  "trailing-icon": "i-heroicons-chevron-down",
                  class: "animate-bounce",
                  onClick: ($event) => isShowAllFormulaMaxHrRecommendation.value = true
                }, null, 8, ["onClick"])
              ])) : createCommentVNode("", true)
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_UCard, null, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-between"${_scopeId}><div class="flex items-end gap-2"${_scopeId}><h2 class="text-xl font-semibold"${_scopeId}>Training Intensity</h2></div></div>`);
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
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UMeterGroup, {
              min: 0,
              max: 100,
              size: "md",
              indicator: "",
              icon: "i-heroicons-minus"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<!--[-->`);
                  ssrRenderList(unref(intensitySummary), (intensity, i) => {
                    _push3(ssrRenderComponent(_component_UMeter, {
                      key: i,
                      value: intensity.percent,
                      color: getColor(i),
                      label: `${intensity.label}`,
                      icon: intensity.name === "maximum" ? "i-heroicons-fire-20-solid" : intensity.name === "anaerobic" ? "i-heroicons-fire-20-solid" : intensity.name === "aerobic" ? "i-heroicons-fire-20-solid" : intensity.name === "endurance" ? "i-heroicons-fire-20-solid" : "i-heroicons-fire-20-solid"
                    }, null, _parent3, _scopeId2));
                  });
                  _push3(`<!--]-->`);
                } else {
                  return [
                    (openBlock(true), createBlock(Fragment, null, renderList(unref(intensitySummary), (intensity, i) => {
                      return openBlock(), createBlock(_component_UMeter, {
                        key: i,
                        value: intensity.percent,
                        color: getColor(i),
                        label: `${intensity.label}`,
                        icon: intensity.name === "maximum" ? "i-heroicons-fire-20-solid" : intensity.name === "anaerobic" ? "i-heroicons-fire-20-solid" : intensity.name === "aerobic" ? "i-heroicons-fire-20-solid" : intensity.name === "endurance" ? "i-heroicons-fire-20-solid" : "i-heroicons-fire-20-solid"
                      }, null, 8, ["value", "color", "label", "icon"]);
                    }), 128))
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
            _push2(`<div class="border-t border-gray-500/50 py-6 mt-6"${_scopeId}><div${_scopeId}>Zone Summary</div><!--[-->`);
            ssrRenderList(unref(intensitySummary), (item) => {
              _push2(`<div class="flex justify-between"${_scopeId}><div class="text-sm"${_scopeId}>${ssrInterpolate(item.name)} (${ssrInterpolate(Math.round(item.minVal))} - ${ssrInterpolate(Math.round(item.maxVal))}bpm) </div><div class="text-xs"${_scopeId}>${ssrInterpolate(item.seconds)}s | ${ssrInterpolate(displayTimeSeconds(item.seconds))}</div></div>`);
            });
            _push2(`<!--]--></div>`);
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
                  (openBlock(true), createBlock(Fragment, null, renderList(unref(intensitySummary), (intensity, i) => {
                    return openBlock(), createBlock(_component_UMeter, {
                      key: i,
                      value: intensity.percent,
                      color: getColor(i),
                      label: `${intensity.label}`,
                      icon: intensity.name === "maximum" ? "i-heroicons-fire-20-solid" : intensity.name === "anaerobic" ? "i-heroicons-fire-20-solid" : intensity.name === "aerobic" ? "i-heroicons-fire-20-solid" : intensity.name === "endurance" ? "i-heroicons-fire-20-solid" : "i-heroicons-fire-20-solid"
                    }, null, 8, ["value", "color", "label", "icon"]);
                  }), 128))
                ]),
                _: 1
              }),
              createVNode("div", { class: "border-t border-gray-500/50 py-6 mt-6" }, [
                createVNode("div", null, "Zone Summary"),
                (openBlock(true), createBlock(Fragment, null, renderList(unref(intensitySummary), (item) => {
                  return openBlock(), createBlock("div", {
                    key: item.name,
                    class: "flex justify-between"
                  }, [
                    createVNode("div", { class: "text-sm" }, toDisplayString(item.name) + " (" + toDisplayString(Math.round(item.minVal)) + " - " + toDisplayString(Math.round(item.maxVal)) + "bpm) ", 1),
                    createVNode("div", { class: "text-xs" }, toDisplayString(item.seconds) + "s | " + toDisplayString(displayTimeSeconds(item.seconds)), 1)
                  ]);
                }), 128))
              ])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(ssrRenderComponent(_component_UCard, null, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-between"${_scopeId}><div class="flex items-end gap-2"${_scopeId}><h2 class="text-xl font-semibold"${_scopeId}>Energy Expenditure</h2></div></div>`);
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
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-around mb-6"${_scopeId}><!--[-->`);
            ssrRenderList([
              { label: "Active", value: "558cal" },
              { label: "Afterburn", value: "100cal" }
            ], (stat, j) => {
              _push2(`<div class="text-center"${_scopeId}><div class="mb-2"${_scopeId}>${ssrInterpolate(stat.label)}</div><div class="text-3xl"${_scopeId}>${ssrInterpolate(stat.value)}</div></div>`);
            });
            _push2(`<!--]--></div><div${_scopeId}>`);
            _push2(ssrRenderComponent(_component_Doughnut, {
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
            }, null, _parent2, _scopeId));
            _push2(`</div>`);
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
                createVNode(_component_Doughnut, {
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
      }, _parent));
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/SessionWidget/StatWidget.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=StatWidget-I_tSjMHw.mjs.map
