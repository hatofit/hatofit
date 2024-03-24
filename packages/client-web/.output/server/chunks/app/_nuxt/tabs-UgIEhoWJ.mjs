import { defineComponent, ref, h, computed, provide, onMounted, watch, watchEffect, Fragment, onUnmounted, inject } from 'vue';
import { O, o as o$1, H as H$1, T as T$1, t, b, N as N$1, u as u$2, a as o$2, c as T, m, P, d as N } from './usePopper-mt32Bdxz.mjs';
import { f, a, t as t$1 } from './micro-task-lHIuwgs5.mjs';

let d = defineComponent({ props: { onFocus: { type: Function, required: true } }, setup(t2) {
  let n = ref(true);
  return () => n.value ? h(f, { as: "button", type: "button", features: a.Focusable, onFocus(o2) {
    o2.preventDefault();
    let e, a2 = 50;
    function r() {
      var u2;
      if (a2-- <= 0) {
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
var te = ((i) => (i[i.Forwards = 0] = "Forwards", i[i.Backwards = 1] = "Backwards", i))(te || {}), le = ((s) => (s[s.Less = -1] = "Less", s[s.Equal = 0] = "Equal", s[s.Greater = 1] = "Greater", s))(le || {});
let U = Symbol("TabsContext");
function k(a2) {
  let v = inject(U, null);
  if (v === null) {
    let i = new Error(`<${a2} /> is missing a parent <TabGroup /> component.`);
    throw Error.captureStackTrace && Error.captureStackTrace(i, k), i;
  }
  return v;
}
let j = Symbol("TabsSSRContext"), xe = defineComponent({ name: "TabGroup", emits: { change: (a2) => true }, props: { as: { type: [Object, String], default: "template" }, selectedIndex: { type: [Number], default: null }, defaultIndex: { type: [Number], default: 0 }, vertical: { type: [Boolean], default: false }, manual: { type: [Boolean], default: false } }, inheritAttrs: false, setup(a2, { slots: v, attrs: i, emit: s }) {
  var P2;
  let l = ref((P2 = a2.selectedIndex) != null ? P2 : a2.defaultIndex), n = ref([]), o$12 = ref([]), h$1 = computed(() => a2.selectedIndex !== null), b2 = computed(() => h$1.value ? a2.selectedIndex : l.value);
  function m2(t2) {
    var S;
    let e = O(r.tabs.value, o$1), u$1 = O(r.panels.value, o$1), f2 = e.filter((p) => {
      var g;
      return !((g = o$1(p)) != null && g.hasAttribute("disabled"));
    });
    if (t2 < 0 || t2 > e.length - 1) {
      let p = u$2(l.value === null ? 0 : Math.sign(t2 - l.value), { [-1]: () => 1, [0]: () => u$2(Math.sign(t2), { [-1]: () => 0, [0]: () => 0, [1]: () => 1 }), [1]: () => 0 }), g = u$2(p, { [0]: () => e.indexOf(f2[0]), [1]: () => e.indexOf(f2[f2.length - 1]) });
      g !== -1 && (l.value = g), r.tabs.value = e, r.panels.value = u$1;
    } else {
      let p = e.slice(0, t2), G = [...e.slice(t2), ...p].find((W) => f2.includes(W));
      if (!G)
        return;
      let B = (S = e.indexOf(G)) != null ? S : r.selectedIndex.value;
      B === -1 && (B = r.selectedIndex.value), l.value = B, r.tabs.value = e, r.panels.value = u$1;
    }
  }
  let r = { selectedIndex: computed(() => {
    var t2, e;
    return (e = (t2 = l.value) != null ? t2 : a2.defaultIndex) != null ? e : null;
  }), orientation: computed(() => a2.vertical ? "vertical" : "horizontal"), activation: computed(() => a2.manual ? "manual" : "auto"), tabs: n, panels: o$12, setSelectedIndex(t2) {
    b2.value !== t2 && s("change", t2), h$1.value || m2(t2);
  }, registerTab(t2) {
    var f2;
    if (n.value.includes(t2))
      return;
    let e = n.value[l.value];
    n.value.push(t2), n.value = O(n.value, o$1);
    let u2 = (f2 = n.value.indexOf(e)) != null ? f2 : l.value;
    u2 !== -1 && (l.value = u2);
  }, unregisterTab(t2) {
    let e = n.value.indexOf(t2);
    e !== -1 && n.value.splice(e, 1);
  }, registerPanel(t2) {
    o$12.value.includes(t2) || (o$12.value.push(t2), o$12.value = O(o$12.value, o$1));
  }, unregisterPanel(t2) {
    let e = o$12.value.indexOf(t2);
    e !== -1 && o$12.value.splice(e, 1);
  } };
  provide(U, r);
  let w = ref({ tabs: [], panels: [] }), y = ref(false);
  onMounted(() => {
    y.value = true;
  }), provide(j, computed(() => y.value ? null : w.value));
  let E = computed(() => a2.selectedIndex);
  return onMounted(() => {
    watch([E], () => {
      var t2;
      return m2((t2 = a2.selectedIndex) != null ? t2 : a2.defaultIndex);
    }, { immediate: true });
  }), watchEffect(() => {
    if (!h$1.value || b2.value == null || r.tabs.value.length <= 0)
      return;
    let t2 = O(r.tabs.value, o$1);
    t2.some((u2, f2) => o$1(r.tabs.value[f2]) !== o$1(u2)) && r.setSelectedIndex(t2.findIndex((u2) => o$1(u2) === o$1(r.tabs.value[b2.value])));
  }), () => {
    let t2 = { selectedIndex: l.value };
    return h(Fragment, [n.value.length <= 0 && h(d, { onFocus: () => {
      for (let e of n.value) {
        let u2 = o$1(e);
        if ((u2 == null ? void 0 : u2.tabIndex) === 0)
          return u2.focus(), true;
      }
      return false;
    } }), H$1({ theirProps: { ...i, ...T$1(a2, ["selectedIndex", "defaultIndex", "manual", "vertical", "onChange"]) }, ourProps: {}, slot: t2, slots: v, attrs: i, name: "TabGroup" })]);
  };
} }), Ie = defineComponent({ name: "TabList", props: { as: { type: [Object, String], default: "div" } }, setup(a2, { attrs: v, slots: i }) {
  let s = k("TabList");
  return () => {
    let l = { selectedIndex: s.selectedIndex.value }, n = { role: "tablist", "aria-orientation": s.orientation.value };
    return H$1({ ourProps: n, theirProps: a2, slot: l, attrs: v, slots: i, name: "TabList" });
  };
} }), ye = defineComponent({ name: "Tab", props: { as: { type: [Object, String], default: "button" }, disabled: { type: [Boolean], default: false }, id: { type: String, default: () => `headlessui-tabs-tab-${t()}` } }, setup(a2, { attrs: v, slots: i, expose: s }) {
  let l = k("Tab"), n = ref(null);
  s({ el: n, $el: n }), onMounted(() => l.registerTab(n)), onUnmounted(() => l.unregisterTab(n));
  let o$2$1 = inject(j), h2 = computed(() => {
    if (o$2$1.value) {
      let e = o$2$1.value.tabs.indexOf(a2.id);
      return e === -1 ? o$2$1.value.tabs.push(a2.id) - 1 : e;
    }
    return -1;
  }), b$1 = computed(() => {
    let e = l.tabs.value.indexOf(n);
    return e === -1 ? h2.value : e;
  }), m$1 = computed(() => b$1.value === l.selectedIndex.value);
  function r(e) {
    var f2;
    let u2 = e();
    if (u2 === T.Success && l.activation.value === "auto") {
      let S = (f2 = m(n)) == null ? void 0 : f2.activeElement, p = l.tabs.value.findIndex((g) => o$1(g) === S);
      p !== -1 && l.setSelectedIndex(p);
    }
    return u2;
  }
  function w(e) {
    let u$1 = l.tabs.value.map((S) => o$1(S)).filter(Boolean);
    if (e.key === o$2.Space || e.key === o$2.Enter) {
      e.preventDefault(), e.stopPropagation(), l.setSelectedIndex(b$1.value);
      return;
    }
    switch (e.key) {
      case o$2.Home:
      case o$2.PageUp:
        return e.preventDefault(), e.stopPropagation(), r(() => P(u$1, N.First));
      case o$2.End:
      case o$2.PageDown:
        return e.preventDefault(), e.stopPropagation(), r(() => P(u$1, N.Last));
    }
    if (r(() => u$2(l.orientation.value, { vertical() {
      return e.key === o$2.ArrowUp ? P(u$1, N.Previous | N.WrapAround) : e.key === o$2.ArrowDown ? P(u$1, N.Next | N.WrapAround) : T.Error;
    }, horizontal() {
      return e.key === o$2.ArrowLeft ? P(u$1, N.Previous | N.WrapAround) : e.key === o$2.ArrowRight ? P(u$1, N.Next | N.WrapAround) : T.Error;
    } })) === T.Success)
      return e.preventDefault();
  }
  let y = ref(false);
  function E() {
    var e;
    y.value || (y.value = true, !a2.disabled && ((e = o$1(n)) == null || e.focus({ preventScroll: true }), l.setSelectedIndex(b$1.value), t$1(() => {
      y.value = false;
    })));
  }
  function P$1(e) {
    e.preventDefault();
  }
  let t2 = b(computed(() => ({ as: a2.as, type: v.type })), n);
  return () => {
    var p;
    let e = { selected: m$1.value }, { id: u2, ...f2 } = a2, S = { ref: n, onKeydown: w, onMousedown: P$1, onClick: E, id: u2, role: "tab", type: t2.value, "aria-controls": (p = o$1(l.panels.value[b$1.value])) == null ? void 0 : p.id, "aria-selected": m$1.value, tabIndex: m$1.value ? 0 : -1, disabled: a2.disabled ? true : void 0 };
    return H$1({ ourProps: S, theirProps: f2, slot: e, attrs: v, slots: i, name: "Tab" });
  };
} }), Se = defineComponent({ name: "TabPanels", props: { as: { type: [Object, String], default: "div" } }, setup(a2, { slots: v, attrs: i }) {
  let s = k("TabPanels");
  return () => {
    let l = { selectedIndex: s.selectedIndex.value };
    return H$1({ theirProps: a2, ourProps: {}, slot: l, attrs: i, slots: v, name: "TabPanels" });
  };
} }), ge = defineComponent({ name: "TabPanel", props: { as: { type: [Object, String], default: "div" }, static: { type: Boolean, default: false }, unmount: { type: Boolean, default: true }, id: { type: String, default: () => `headlessui-tabs-panel-${t()}` }, tabIndex: { type: Number, default: 0 } }, setup(a2, { attrs: v, slots: i, expose: s }) {
  let l = k("TabPanel"), n = ref(null);
  s({ el: n, $el: n }), onMounted(() => l.registerPanel(n)), onUnmounted(() => l.unregisterPanel(n));
  let o$12 = inject(j), h$1 = computed(() => {
    if (o$12.value) {
      let r = o$12.value.panels.indexOf(a2.id);
      return r === -1 ? o$12.value.panels.push(a2.id) - 1 : r;
    }
    return -1;
  }), b2 = computed(() => {
    let r = l.panels.value.indexOf(n);
    return r === -1 ? h$1.value : r;
  }), m2 = computed(() => b2.value === l.selectedIndex.value);
  return () => {
    var t2;
    let r = { selected: m2.value }, { id: w, tabIndex: y, ...E } = a2, P2 = { ref: n, id: w, role: "tabpanel", "aria-labelledby": (t2 = o$1(l.tabs.value[b2.value])) == null ? void 0 : t2.id, tabIndex: m2.value ? y : -1 };
    return !m2.value && a2.unmount && !a2.static ? h(f, { as: "span", ...P2 }) : H$1({ ourProps: P2, theirProps: E, slot: r, attrs: v, slots: i, features: N$1.Static | N$1.RenderStrategy, visible: m2.value, name: "TabPanel" });
  };
} });

export { Ie as I, Se as S, ge as g, xe as x, ye as y };
//# sourceMappingURL=tabs-UgIEhoWJ.mjs.map
