import { defineComponent, ref, h, computed, provide, onMounted, watch, watchEffect, Fragment, onUnmounted, inject } from 'vue';
import { O, o as o$2, A, T, I as I$1, s as s$1, N, u as u$3, a as o$1, b as T$1, i as i$3, P, c as N$1 } from './usePopper-DnPFaP2s.mjs';
import { f, s, t } from './micro-task-DbFZIhYP.mjs';

let d = defineComponent({ props: { onFocus: { type: Function, required: true } }, setup(t2) {
  let n = ref(true);
  return () => n.value ? h(f, { as: "button", type: "button", features: s.Focusable, onFocus(o2) {
    o2.preventDefault();
    let e, a = 50;
    function r() {
      var u2;
      if (a-- <= 0) {
        e && cancelAnimationFrame(e);
        return;
      }
      if ((u2 = t2.onFocus) != null && u2.call(t2)) {
        n.value = false, cancelAnimationFrame(e);
        return;
      }
      e = requestAnimationFrame(r);
    }
    e = requestAnimationFrame(r);
  } }) : null;
} });
var te = ((s2) => (s2[s2.Forwards = 0] = "Forwards", s2[s2.Backwards = 1] = "Backwards", s2))(te || {}), le = ((o2) => (o2[o2.Less = -1] = "Less", o2[o2.Equal = 0] = "Equal", o2[o2.Greater = 1] = "Greater", o2))(le || {});
let U = Symbol("TabsContext");
function C(a) {
  let b = inject(U, null);
  if (b === null) {
    let s2 = new Error(`<${a} /> is missing a parent <TabGroup /> component.`);
    throw Error.captureStackTrace && Error.captureStackTrace(s2, C), s2;
  }
  return b;
}
let G = Symbol("TabsSSRContext"), pe = defineComponent({ name: "TabGroup", emits: { change: (a) => true }, props: { as: { type: [Object, String], default: "template" }, selectedIndex: { type: [Number], default: null }, defaultIndex: { type: [Number], default: 0 }, vertical: { type: [Boolean], default: false }, manual: { type: [Boolean], default: false } }, inheritAttrs: false, setup(a, { slots: b, attrs: s2, emit: o$12 }) {
  var w;
  let i2 = ref((w = a.selectedIndex) != null ? w : a.defaultIndex), l = ref([]), r = ref([]), x = computed(() => a.selectedIndex !== null), P2 = computed(() => x.value ? a.selectedIndex : i2.value);
  function y(t2) {
    var c;
    let n = O(u$1.tabs.value, o$2), d2 = O(u$1.panels.value, o$2), e = n.filter((I2) => {
      var p;
      return !((p = o$2(I2)) != null && p.hasAttribute("disabled"));
    });
    if (t2 < 0 || t2 > n.length - 1) {
      let I2 = u$3(i2.value === null ? 0 : Math.sign(t2 - i2.value), { [-1]: () => 1, [0]: () => u$3(Math.sign(t2), { [-1]: () => 0, [0]: () => 0, [1]: () => 1 }), [1]: () => 0 }), p = u$3(I2, { [0]: () => n.indexOf(e[0]), [1]: () => n.indexOf(e[e.length - 1]) });
      p !== -1 && (i2.value = p), u$1.tabs.value = n, u$1.panels.value = d2;
    } else {
      let I2 = n.slice(0, t2), D = [...n.slice(t2), ...I2].find((W) => e.includes(W));
      if (!D)
        return;
      let O2 = (c = n.indexOf(D)) != null ? c : u$1.selectedIndex.value;
      O2 === -1 && (O2 = u$1.selectedIndex.value), i2.value = O2, u$1.tabs.value = n, u$1.panels.value = d2;
    }
  }
  let u$1 = { selectedIndex: computed(() => {
    var t2, n;
    return (n = (t2 = i2.value) != null ? t2 : a.defaultIndex) != null ? n : null;
  }), orientation: computed(() => a.vertical ? "vertical" : "horizontal"), activation: computed(() => a.manual ? "manual" : "auto"), tabs: l, panels: r, setSelectedIndex(t2) {
    P2.value !== t2 && o$12("change", t2), x.value || y(t2);
  }, registerTab(t2) {
    var e;
    if (l.value.includes(t2))
      return;
    let n = l.value[i2.value];
    l.value.push(t2), l.value = O(l.value, o$2);
    let d2 = (e = l.value.indexOf(n)) != null ? e : i2.value;
    d2 !== -1 && (i2.value = d2);
  }, unregisterTab(t2) {
    let n = l.value.indexOf(t2);
    n !== -1 && l.value.splice(n, 1);
  }, registerPanel(t2) {
    r.value.includes(t2) || (r.value.push(t2), r.value = O(r.value, o$2));
  }, unregisterPanel(t2) {
    let n = r.value.indexOf(t2);
    n !== -1 && r.value.splice(n, 1);
  } };
  provide(U, u$1);
  let T$12 = ref({ tabs: [], panels: [] }), m = ref(false);
  onMounted(() => {
    m.value = true;
  }), provide(G, computed(() => m.value ? null : T$12.value));
  let R = computed(() => a.selectedIndex);
  return onMounted(() => {
    watch([R], () => {
      var t2;
      return y((t2 = a.selectedIndex) != null ? t2 : a.defaultIndex);
    }, { immediate: true });
  }), watchEffect(() => {
    if (!x.value || P2.value == null || u$1.tabs.value.length <= 0)
      return;
    let t2 = O(u$1.tabs.value, o$2);
    t2.some((d2, e) => o$2(u$1.tabs.value[e]) !== o$2(d2)) && u$1.setSelectedIndex(t2.findIndex((d2) => o$2(d2) === o$2(u$1.tabs.value[P2.value])));
  }), () => {
    let t2 = { selectedIndex: i2.value };
    return h(Fragment, [l.value.length <= 0 && h(d, { onFocus: () => {
      for (let n of l.value) {
        let d2 = o$2(n);
        if ((d2 == null ? void 0 : d2.tabIndex) === 0)
          return d2.focus(), true;
      }
      return false;
    } }), A({ theirProps: { ...s2, ...T(a, ["selectedIndex", "defaultIndex", "manual", "vertical", "onChange"]) }, ourProps: {}, slot: t2, slots: b, attrs: s2, name: "TabGroup" })]);
  };
} }), me = defineComponent({ name: "TabList", props: { as: { type: [Object, String], default: "div" } }, setup(a, { attrs: b, slots: s2 }) {
  let o2 = C("TabList");
  return () => {
    let i2 = { selectedIndex: o2.selectedIndex.value }, l = { role: "tablist", "aria-orientation": o2.orientation.value };
    return A({ ourProps: l, theirProps: a, slot: i2, attrs: b, slots: s2, name: "TabList" });
  };
} }), xe = defineComponent({ name: "Tab", props: { as: { type: [Object, String], default: "button" }, disabled: { type: [Boolean], default: false }, id: { type: String, default: null } }, setup(a, { attrs: b, slots: s2, expose: o$2$1 }) {
  var d2;
  let i$1 = (d2 = a.id) != null ? d2 : `headlessui-tabs-tab-${I$1()}`, l = C("Tab"), r = ref(null);
  o$2$1({ el: r, $el: r }), onMounted(() => l.registerTab(r)), onUnmounted(() => l.unregisterTab(r));
  let x = inject(G), P$1 = computed(() => {
    if (x.value) {
      let e = x.value.tabs.indexOf(i$1);
      return e === -1 ? x.value.tabs.push(i$1) - 1 : e;
    }
    return -1;
  }), y = computed(() => {
    let e = l.tabs.value.indexOf(r);
    return e === -1 ? P$1.value : e;
  }), u$1 = computed(() => y.value === l.selectedIndex.value);
  function T2(e) {
    var I2;
    let c = e();
    if (c === T$1.Success && l.activation.value === "auto") {
      let p = (I2 = i$3(r)) == null ? void 0 : I2.activeElement, D = l.tabs.value.findIndex((O2) => o$2(O2) === p);
      D !== -1 && l.setSelectedIndex(D);
    }
    return c;
  }
  function m(e) {
    let c = l.tabs.value.map((p) => o$2(p)).filter(Boolean);
    if (e.key === o$1.Space || e.key === o$1.Enter) {
      e.preventDefault(), e.stopPropagation(), l.setSelectedIndex(y.value);
      return;
    }
    switch (e.key) {
      case o$1.Home:
      case o$1.PageUp:
        return e.preventDefault(), e.stopPropagation(), T2(() => P(c, N$1.First));
      case o$1.End:
      case o$1.PageDown:
        return e.preventDefault(), e.stopPropagation(), T2(() => P(c, N$1.Last));
    }
    if (T2(() => u$3(l.orientation.value, { vertical() {
      return e.key === o$1.ArrowUp ? P(c, N$1.Previous | N$1.WrapAround) : e.key === o$1.ArrowDown ? P(c, N$1.Next | N$1.WrapAround) : T$1.Error;
    }, horizontal() {
      return e.key === o$1.ArrowLeft ? P(c, N$1.Previous | N$1.WrapAround) : e.key === o$1.ArrowRight ? P(c, N$1.Next | N$1.WrapAround) : T$1.Error;
    } })) === T$1.Success)
      return e.preventDefault();
  }
  let R = ref(false);
  function w() {
    var e;
    R.value || (R.value = true, !a.disabled && ((e = o$2(r)) == null || e.focus({ preventScroll: true }), l.setSelectedIndex(y.value), t(() => {
      R.value = false;
    })));
  }
  function t$1(e) {
    e.preventDefault();
  }
  let n = s$1(computed(() => ({ as: a.as, type: b.type })), r);
  return () => {
    var p;
    let e = { selected: u$1.value }, { ...c } = a, I2 = { ref: r, onKeydown: m, onMousedown: t$1, onClick: w, id: i$1, role: "tab", type: n.value, "aria-controls": (p = o$2(l.panels.value[y.value])) == null ? void 0 : p.id, "aria-selected": u$1.value, tabIndex: u$1.value ? 0 : -1, disabled: a.disabled ? true : void 0 };
    return A({ ourProps: I2, theirProps: c, slot: e, attrs: b, slots: s2, name: "Tab" });
  };
} }), Ie = defineComponent({ name: "TabPanels", props: { as: { type: [Object, String], default: "div" } }, setup(a, { slots: b, attrs: s2 }) {
  let o2 = C("TabPanels");
  return () => {
    let i2 = { selectedIndex: o2.selectedIndex.value };
    return A({ theirProps: a, ourProps: {}, slot: i2, attrs: s2, slots: b, name: "TabPanels" });
  };
} }), ye = defineComponent({ name: "TabPanel", props: { as: { type: [Object, String], default: "div" }, static: { type: Boolean, default: false }, unmount: { type: Boolean, default: true }, id: { type: String, default: null }, tabIndex: { type: Number, default: 0 } }, setup(a, { attrs: b, slots: s2, expose: o$12 }) {
  var T2;
  let i2 = (T2 = a.id) != null ? T2 : `headlessui-tabs-panel-${I$1()}`, l = C("TabPanel"), r = ref(null);
  o$12({ el: r, $el: r }), onMounted(() => l.registerPanel(r)), onUnmounted(() => l.unregisterPanel(r));
  let x = inject(G), P2 = computed(() => {
    if (x.value) {
      let m = x.value.panels.indexOf(i2);
      return m === -1 ? x.value.panels.push(i2) - 1 : m;
    }
    return -1;
  }), y = computed(() => {
    let m = l.panels.value.indexOf(r);
    return m === -1 ? P2.value : m;
  }), u2 = computed(() => y.value === l.selectedIndex.value);
  return () => {
    var n;
    let m = { selected: u2.value }, { tabIndex: R, ...w } = a, t2 = { ref: r, id: i2, role: "tabpanel", "aria-labelledby": (n = o$2(l.tabs.value[y.value])) == null ? void 0 : n.id, tabIndex: u2.value ? R : -1 };
    return !u2.value && a.unmount && !a.static ? h(f, { as: "span", "aria-hidden": true, ...t2 }) : A({ ourProps: t2, theirProps: w, slot: m, attrs: b, slots: s2, features: N.Static | N.RenderStrategy, visible: u2.value, name: "TabPanel" });
  };
} });

export { Ie as I, me as m, pe as p, xe as x, ye as y };
//# sourceMappingURL=tabs-BjiyUUe6.mjs.map
