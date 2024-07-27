import { provide, defineComponent, ref, h as h$1, computed, onMounted, watch, watchEffect, Fragment, onUnmounted, inject, cloneVNode, nextTick } from 'vue';

function t$3(e) {
  typeof queueMicrotask == "function" ? queueMicrotask(e) : Promise.resolve().then(e).catch((o2) => setTimeout(() => {
    throw o2;
  }));
}
let t$2 = Symbol("headlessui.useid"), i$5 = 0;
function I$1() {
  return inject(t$2, () => `${++i$5}`)();
}
function l$1(e) {
  provide(t$2, e);
}
function o$2(e) {
  var l2;
  if (e == null || e.value == null)
    return null;
  let n2 = (l2 = e.value.$el) != null ? l2 : e.value;
  return n2 instanceof Node ? n2 : null;
}
function u$4(r2, n2, ...a2) {
  if (r2 in n2) {
    let e = n2[r2];
    return typeof e == "function" ? e(...a2) : e;
  }
  let t2 = new Error(`Tried to handle "${r2}" but there is no handler defined. Only defined handlers are: ${Object.keys(n2).map((e) => `"${e}"`).join(", ")}.`);
  throw Error.captureStackTrace && Error.captureStackTrace(t2, u$4), t2;
}
var i$4 = Object.defineProperty;
var d$1 = (t2, e, r2) => e in t2 ? i$4(t2, e, { enumerable: true, configurable: true, writable: true, value: r2 }) : t2[e] = r2;
var n$2 = (t2, e, r2) => (d$1(t2, typeof e != "symbol" ? e + "" : e, r2), r2);
let s$2 = class s {
  constructor() {
    n$2(this, "current", this.detect());
    n$2(this, "currentId", 0);
  }
  set(e) {
    this.current !== e && (this.currentId = 0, this.current = e);
  }
  reset() {
    this.set(this.detect());
  }
  nextId() {
    return ++this.currentId;
  }
  get isServer() {
    return this.current === "server";
  }
  get isClient() {
    return this.current === "client";
  }
  detect() {
    return "server";
  }
};
let c$2 = new s$2();
function i$3(r2) {
  if (c$2.isServer)
    return null;
  if (r2 instanceof Node)
    return r2.ownerDocument;
  if (r2 != null && r2.hasOwnProperty("value")) {
    let n2 = o$2(r2);
    if (n2)
      return n2.ownerDocument;
  }
  return void 0;
}
let c$1 = ["[contentEditable=true]", "[tabindex]", "a[href]", "area[href]", "button:not([disabled])", "iframe", "input:not([disabled])", "select:not([disabled])", "textarea:not([disabled])"].map((e) => `${e}:not([tabindex='-1'])`).join(",");
var N$1 = ((n2) => (n2[n2.First = 1] = "First", n2[n2.Previous = 2] = "Previous", n2[n2.Next = 4] = "Next", n2[n2.Last = 8] = "Last", n2[n2.WrapAround = 16] = "WrapAround", n2[n2.NoScroll = 32] = "NoScroll", n2))(N$1 || {}), T$1 = ((o2) => (o2[o2.Error = 0] = "Error", o2[o2.Overflow = 1] = "Overflow", o2[o2.Success = 2] = "Success", o2[o2.Underflow = 3] = "Underflow", o2))(T$1 || {}), F = ((t2) => (t2[t2.Previous = -1] = "Previous", t2[t2.Next = 1] = "Next", t2))(F || {});
function E$1(e = (void 0).body) {
  return e == null ? [] : Array.from(e.querySelectorAll(c$1)).sort((r2, t2) => Math.sign((r2.tabIndex || Number.MAX_SAFE_INTEGER) - (t2.tabIndex || Number.MAX_SAFE_INTEGER)));
}
var h = ((t2) => (t2[t2.Strict = 0] = "Strict", t2[t2.Loose = 1] = "Loose", t2))(h || {});
function w$2(e, r2 = 0) {
  var t2;
  return e === ((t2 = i$3(e)) == null ? void 0 : t2.body) ? false : u$4(r2, { [0]() {
    return e.matches(c$1);
  }, [1]() {
    let l2 = e;
    for (; l2 !== null; ) {
      if (l2.matches(c$1))
        return true;
      l2 = l2.parentElement;
    }
    return false;
  } });
}
function _(e) {
  let r2 = i$3(e);
  nextTick(() => {
    r2 && !w$2(r2.activeElement, 0) && S$1(e);
  });
}
var y$1 = ((t2) => (t2[t2.Keyboard = 0] = "Keyboard", t2[t2.Mouse = 1] = "Mouse", t2))(y$1 || {});
function S$1(e) {
  e == null || e.focus({ preventScroll: true });
}
let H = ["textarea", "input"].join(",");
function I(e) {
  var r2, t2;
  return (t2 = (r2 = e == null ? void 0 : e.matches) == null ? void 0 : r2.call(e, H)) != null ? t2 : false;
}
function O(e, r2 = (t2) => t2) {
  return e.slice().sort((t2, l2) => {
    let o2 = r2(t2), i2 = r2(l2);
    if (o2 === null || i2 === null)
      return 0;
    let n2 = o2.compareDocumentPosition(i2);
    return n2 & Node.DOCUMENT_POSITION_FOLLOWING ? -1 : n2 & Node.DOCUMENT_POSITION_PRECEDING ? 1 : 0;
  });
}
function v$1(e, r2) {
  return P(E$1(), r2, { relativeTo: e });
}
function P(e, r2, { sorted: t2 = true, relativeTo: l2 = null, skipElements: o2 = [] } = {}) {
  var m;
  let i2 = (m = Array.isArray(e) ? e.length > 0 ? e[0].ownerDocument : void 0 : e == null ? void 0 : e.ownerDocument) != null ? m : void 0, n2 = Array.isArray(e) ? t2 ? O(e) : e : E$1(e);
  o2.length > 0 && n2.length > 1 && (n2 = n2.filter((s3) => !o2.includes(s3))), l2 = l2 != null ? l2 : i2.activeElement;
  let x = (() => {
    if (r2 & 5)
      return 1;
    if (r2 & 10)
      return -1;
    throw new Error("Missing Focus.First, Focus.Previous, Focus.Next or Focus.Last");
  })(), p2 = (() => {
    if (r2 & 1)
      return 0;
    if (r2 & 2)
      return Math.max(0, n2.indexOf(l2)) - 1;
    if (r2 & 4)
      return Math.max(0, n2.indexOf(l2)) + 1;
    if (r2 & 8)
      return n2.length - 1;
    throw new Error("Missing Focus.First, Focus.Previous, Focus.Next or Focus.Last");
  })(), L = r2 & 32 ? { preventScroll: true } : {}, a2 = 0, d2 = n2.length, u2;
  do {
    if (a2 >= d2 || a2 + d2 <= 0)
      return 0;
    let s3 = p2 + a2;
    if (r2 & 16)
      s3 = (s3 + d2) % d2;
    else {
      if (s3 < 0)
        return 3;
      if (s3 >= d2)
        return 1;
    }
    u2 = n2[s3], u2 == null || u2.focus(L), a2 += x;
  } while (u2 !== i2.activeElement);
  return r2 & 6 && I(u2) && u2.select(), 2;
}
function t$1() {
  return /iPhone/gi.test((void 0).navigator.platform) || /Mac/gi.test((void 0).navigator.platform) && (void 0).navigator.maxTouchPoints > 0;
}
function i$2() {
  return /Android/gi.test((void 0).navigator.userAgent);
}
function n$1() {
  return t$1() || i$2();
}
function u$3(e, t2, n2) {
  c$2.isServer || watchEffect((o2) => {
    (void 0).addEventListener(e, t2, n2), o2(() => (void 0).removeEventListener(e, t2, n2));
  });
}
function w$1(e, n2, t2) {
  c$2.isServer || watchEffect((o2) => {
    (void 0).addEventListener(e, n2, t2), o2(() => (void 0).removeEventListener(e, n2, t2));
  });
}
function w(f2, m, l2 = computed(() => true)) {
  function a2(e, r2) {
    if (!l2.value || e.defaultPrevented)
      return;
    let t2 = r2(e);
    if (t2 === null || !t2.getRootNode().contains(t2))
      return;
    let c2 = function o2(n2) {
      return typeof n2 == "function" ? o2(n2()) : Array.isArray(n2) || n2 instanceof Set ? n2 : [n2];
    }(f2);
    for (let o2 of c2) {
      if (o2 === null)
        continue;
      let n2 = o2 instanceof HTMLElement ? o2 : o$2(o2);
      if (n2 != null && n2.contains(t2) || e.composed && e.composedPath().includes(n2))
        return;
    }
    return !w$2(t2, h.Loose) && t2.tabIndex !== -1 && e.preventDefault(), m(e, t2);
  }
  let u2 = ref(null);
  u$3("pointerdown", (e) => {
    var r2, t2;
    l2.value && (u2.value = ((t2 = (r2 = e.composedPath) == null ? void 0 : r2.call(e)) == null ? void 0 : t2[0]) || e.target);
  }, true), u$3("mousedown", (e) => {
    var r2, t2;
    l2.value && (u2.value = ((t2 = (r2 = e.composedPath) == null ? void 0 : r2.call(e)) == null ? void 0 : t2[0]) || e.target);
  }, true), u$3("click", (e) => {
    n$1() || u2.value && (a2(e, () => u2.value), u2.value = null);
  }, true), u$3("touchend", (e) => a2(e, () => e.target instanceof HTMLElement ? e.target : null), true), w$1("blur", (e) => a2(e, () => (void 0).document.activeElement instanceof HTMLIFrameElement ? (void 0).document.activeElement : null), true);
}
function r$1(t2, e) {
  if (t2)
    return t2;
  let n2 = e != null ? e : "button";
  if (typeof n2 == "string" && n2.toLowerCase() === "button")
    return "button";
}
function s$1(t2, e) {
  let n2 = ref(r$1(t2.value.type, t2.value.as));
  return onMounted(() => {
    n2.value = r$1(t2.value.type, t2.value.as);
  }), watchEffect(() => {
    var u2;
    n2.value || o$2(e) && o$2(e) instanceof HTMLButtonElement && !((u2 = o$2(e)) != null && u2.hasAttribute("type")) && (n2.value = "button");
  }), n2;
}
function r(e) {
  return [e.screenX, e.screenY];
}
function u$2() {
  let e = ref([-1, -1]);
  return { wasMoved(n2) {
    let t2 = r(n2);
    return e.value[0] === t2[0] && e.value[1] === t2[1] ? false : (e.value = t2, true);
  }, update(n2) {
    e.value = r(n2);
  } };
}
function i$1({ container: e, accept: t2, walk: d2, enabled: o2 }) {
  watchEffect(() => {
    let r2 = e.value;
    if (!r2 || o2 !== void 0 && !o2.value)
      return;
    let l2 = i$3(e);
    if (!l2)
      return;
    let c2 = Object.assign((f2) => t2(f2), { acceptNode: t2 }), n2 = l2.createTreeWalker(r2, NodeFilter.SHOW_ELEMENT, c2, false);
    for (; n2.nextNode(); )
      d2(n2.currentNode);
  });
}
var N = ((o2) => (o2[o2.None = 0] = "None", o2[o2.RenderStrategy = 1] = "RenderStrategy", o2[o2.Static = 2] = "Static", o2))(N || {}), S = ((e) => (e[e.Unmount = 0] = "Unmount", e[e.Hidden = 1] = "Hidden", e))(S || {});
function A({ visible: r2 = true, features: t2 = 0, ourProps: e, theirProps: o2, ...i2 }) {
  var a2;
  let n2 = j(o2, e), l2 = Object.assign(i2, { props: n2 });
  if (r2 || t2 & 2 && n2.static)
    return y(l2);
  if (t2 & 1) {
    let d2 = (a2 = n2.unmount) == null || a2 ? 0 : 1;
    return u$4(d2, { [0]() {
      return null;
    }, [1]() {
      return y({ ...i2, props: { ...n2, hidden: true, style: { display: "none" } } });
    } });
  }
  return y(l2);
}
function y({ props: r2, attrs: t2, slots: e, slot: o2, name: i2 }) {
  var m, h2;
  let { as: n2, ...l2 } = T(r2, ["unmount", "static"]), a2 = (m = e.default) == null ? void 0 : m.call(e, o2), d2 = {};
  if (o2) {
    let u2 = false, c2 = [];
    for (let [p2, f2] of Object.entries(o2))
      typeof f2 == "boolean" && (u2 = true), f2 === true && c2.push(p2);
    u2 && (d2["data-headlessui-state"] = c2.join(" "));
  }
  if (n2 === "template") {
    if (a2 = b(a2 != null ? a2 : []), Object.keys(l2).length > 0 || Object.keys(t2).length > 0) {
      let [u2, ...c2] = a2 != null ? a2 : [];
      if (!v(u2) || c2.length > 0)
        throw new Error(['Passing props on "template"!', "", `The current component <${i2} /> is rendering a "template".`, "However we need to passthrough the following props:", Object.keys(l2).concat(Object.keys(t2)).map((s3) => s3.trim()).filter((s3, g2, R) => R.indexOf(s3) === g2).sort((s3, g2) => s3.localeCompare(g2)).map((s3) => `  - ${s3}`).join(`
`), "", "You can apply a few solutions:", ['Add an `as="..."` prop, to ensure that we render an actual element instead of a "template".', "Render a single element as the child so that we can forward the props onto that element."].map((s3) => `  - ${s3}`).join(`
`)].join(`
`));
      let p2 = j((h2 = u2.props) != null ? h2 : {}, l2, d2), f2 = cloneVNode(u2, p2, true);
      for (let s3 in p2)
        s3.startsWith("on") && (f2.props || (f2.props = {}), f2.props[s3] = p2[s3]);
      return f2;
    }
    return Array.isArray(a2) && a2.length === 1 ? a2[0] : a2;
  }
  return h$1(n2, Object.assign({}, l2, d2), { default: () => a2 });
}
function b(r2) {
  return r2.flatMap((t2) => t2.type === Fragment ? b(t2.children) : [t2]);
}
function j(...r2) {
  if (r2.length === 0)
    return {};
  if (r2.length === 1)
    return r2[0];
  let t2 = {}, e = {};
  for (let i2 of r2)
    for (let n2 in i2)
      n2.startsWith("on") && typeof i2[n2] == "function" ? (e[n2] != null || (e[n2] = []), e[n2].push(i2[n2])) : t2[n2] = i2[n2];
  if (t2.disabled || t2["aria-disabled"])
    return Object.assign(t2, Object.fromEntries(Object.keys(e).map((i2) => [i2, void 0])));
  for (let i2 in e)
    Object.assign(t2, { [i2](n2, ...l2) {
      let a2 = e[i2];
      for (let d2 of a2) {
        if (n2 instanceof Event && n2.defaultPrevented)
          return;
        d2(n2, ...l2);
      }
    } });
  return t2;
}
function E(r2) {
  let t2 = Object.assign({}, r2);
  for (let e in t2)
    t2[e] === void 0 && delete t2[e];
  return t2;
}
function T(r2, t2 = []) {
  let e = Object.assign({}, r2);
  for (let o2 of t2)
    o2 in e && delete e[o2];
  return e;
}
function v(r2) {
  return r2 == null ? false : typeof r2.type == "string" || typeof r2.type == "object" || typeof r2.type == "function";
}
var u$1 = ((e) => (e[e.None = 1] = "None", e[e.Focusable = 2] = "Focusable", e[e.Hidden = 4] = "Hidden", e))(u$1 || {});
let f$1 = defineComponent({ name: "Hidden", props: { as: { type: [Object, String], default: "div" }, features: { type: Number, default: 1 } }, setup(t2, { slots: n2, attrs: i2 }) {
  return () => {
    var r2;
    let { features: e, ...d2 } = t2, o2 = { "aria-hidden": (e & 2) === 2 ? true : (r2 = d2["aria-hidden"]) != null ? r2 : void 0, hidden: (e & 4) === 4 ? true : void 0, style: { position: "fixed", top: 1, left: 1, width: 1, height: 0, padding: 0, margin: -1, overflow: "hidden", clip: "rect(0, 0, 0, 0)", whiteSpace: "nowrap", borderWidth: "0", ...(e & 4) === 4 && (e & 2) !== 2 && { display: "none" } } };
    return A({ ourProps: o2, theirProps: d2, slot: {}, attrs: i2, slots: n2, name: "Hidden" });
  };
} });
let n = Symbol("Context");
var i = ((e) => (e[e.Open = 1] = "Open", e[e.Closed = 2] = "Closed", e[e.Closing = 4] = "Closing", e[e.Opening = 8] = "Opening", e))(i || {});
function s2() {
  return l() !== null;
}
function l() {
  return inject(n, null);
}
function t(o2) {
  provide(n, o2);
}
var o$1 = ((r2) => (r2.Space = " ", r2.Enter = "Enter", r2.Escape = "Escape", r2.Backspace = "Backspace", r2.Delete = "Delete", r2.ArrowLeft = "ArrowLeft", r2.ArrowUp = "ArrowUp", r2.ArrowRight = "ArrowRight", r2.ArrowDown = "ArrowDown", r2.Home = "Home", r2.End = "End", r2.PageUp = "PageUp", r2.PageDown = "PageDown", r2.Tab = "Tab", r2))(o$1 || {});
function u(l2) {
  throw new Error("Unexpected object: " + l2);
}
var c = ((i2) => (i2[i2.First = 0] = "First", i2[i2.Previous = 1] = "Previous", i2[i2.Next = 2] = "Next", i2[i2.Last = 3] = "Last", i2[i2.Specific = 4] = "Specific", i2[i2.Nothing = 5] = "Nothing", i2))(c || {});
function f(l2, n2) {
  let t2 = n2.resolveItems();
  if (t2.length <= 0)
    return null;
  let r2 = n2.resolveActiveIndex(), s3 = r2 != null ? r2 : -1;
  switch (l2.focus) {
    case 0: {
      for (let e = 0; e < t2.length; ++e)
        if (!n2.resolveDisabled(t2[e], e, t2))
          return e;
      return r2;
    }
    case 1: {
      s3 === -1 && (s3 = t2.length);
      for (let e = s3 - 1; e >= 0; --e)
        if (!n2.resolveDisabled(t2[e], e, t2))
          return e;
      return r2;
    }
    case 2: {
      for (let e = s3 + 1; e < t2.length; ++e)
        if (!n2.resolveDisabled(t2[e], e, t2))
          return e;
      return r2;
    }
    case 3: {
      for (let e = t2.length - 1; e >= 0; --e)
        if (!n2.resolveDisabled(t2[e], e, t2))
          return e;
      return r2;
    }
    case 4: {
      for (let e = 0; e < t2.length; ++e)
        if (n2.resolveId(t2[e], e, t2) === l2.id)
          return e;
      return r2;
    }
    case 5:
      return null;
    default:
      u(l2);
  }
}
let a = /([\u2700-\u27BF]|[\uE000-\uF8FF]|\uD83C[\uDC00-\uDFFF]|\uD83D[\uDC00-\uDFFF]|[\u2011-\u26FF]|\uD83E[\uDD10-\uDDFF])/g;
function o(e) {
  var r2, i2;
  let n2 = (r2 = e.innerText) != null ? r2 : "", t2 = e.cloneNode(true);
  if (!(t2 instanceof HTMLElement))
    return n2;
  let u2 = false;
  for (let f2 of t2.querySelectorAll('[hidden],[aria-hidden],[role="img"]'))
    f2.remove(), u2 = true;
  let l2 = u2 ? (i2 = t2.innerText) != null ? i2 : "" : n2;
  return a.test(l2) && (l2 = l2.replace(a, "")), l2;
}
function g(e) {
  let n2 = e.getAttribute("aria-label");
  if (typeof n2 == "string")
    return n2.trim();
  let t2 = e.getAttribute("aria-labelledby");
  if (t2) {
    let u2 = t2.split(" ").map((l2) => {
      let r2 = (void 0).getElementById(l2);
      if (r2) {
        let i2 = r2.getAttribute("aria-label");
        return typeof i2 == "string" ? i2.trim() : o(r2).trim();
      }
      return null;
    }).filter(Boolean);
    if (u2.length > 0)
      return u2.join(", ");
  }
  return o(e).trim();
}
function p(a2) {
  let t2 = ref(""), r2 = ref("");
  return () => {
    let e = o$2(a2);
    if (!e)
      return "";
    let l2 = e.innerText;
    if (t2.value === l2)
      return r2.value;
    let u2 = g(e).trim().toLowerCase();
    return t2.value = l2, r2.value = u2, u2;
  };
}
let d = defineComponent({ props: { onFocus: { type: Function, required: true } }, setup(t2) {
  let n2 = ref(true);
  return () => n2.value ? h$1(f$1, { as: "button", type: "button", features: u$1.Focusable, onFocus(o2) {
    o2.preventDefault();
    let e, a2 = 50;
    function r2() {
      var u2;
      if (a2-- <= 0) {
        e && cancelAnimationFrame(e);
        return;
      }
      if ((u2 = t2.onFocus) != null && u2.call(t2)) {
        n2.value = false, cancelAnimationFrame(e);
        return;
      }
      e = requestAnimationFrame(r2);
    }
    e = requestAnimationFrame(r2);
  } }) : null;
} });
var te = ((s3) => (s3[s3.Forwards = 0] = "Forwards", s3[s3.Backwards = 1] = "Backwards", s3))(te || {}), le = ((d2) => (d2[d2.Less = -1] = "Less", d2[d2.Equal = 0] = "Equal", d2[d2.Greater = 1] = "Greater", d2))(le || {});
let U = Symbol("TabsContext");
function C(a2) {
  let b2 = inject(U, null);
  if (b2 === null) {
    let s3 = new Error(`<${a2} /> is missing a parent <TabGroup /> component.`);
    throw Error.captureStackTrace && Error.captureStackTrace(s3, C), s3;
  }
  return b2;
}
let G = Symbol("TabsSSRContext"), me = defineComponent({ name: "TabGroup", emits: { change: (a2) => true }, props: { as: { type: [Object, String], default: "template" }, selectedIndex: { type: [Number], default: null }, defaultIndex: { type: [Number], default: 0 }, vertical: { type: [Boolean], default: false }, manual: { type: [Boolean], default: false } }, inheritAttrs: false, setup(a2, { slots: b2, attrs: s3, emit: d$12 }) {
  var E2;
  let i2 = ref((E2 = a2.selectedIndex) != null ? E2 : a2.defaultIndex), l2 = ref([]), r2 = ref([]), p2 = computed(() => a2.selectedIndex !== null), R = computed(() => p2.value ? a2.selectedIndex : i2.value);
  function y2(t2) {
    var c2;
    let n2 = O(u2.tabs.value, o$2), o2 = O(u2.panels.value, o$2), e = n2.filter((I2) => {
      var m;
      return !((m = o$2(I2)) != null && m.hasAttribute("disabled"));
    });
    if (t2 < 0 || t2 > n2.length - 1) {
      let I2 = u$4(i2.value === null ? 0 : Math.sign(t2 - i2.value), { [-1]: () => 1, [0]: () => u$4(Math.sign(t2), { [-1]: () => 0, [0]: () => 0, [1]: () => 1 }), [1]: () => 0 }), m = u$4(I2, { [0]: () => n2.indexOf(e[0]), [1]: () => n2.indexOf(e[e.length - 1]) });
      m !== -1 && (i2.value = m), u2.tabs.value = n2, u2.panels.value = o2;
    } else {
      let I2 = n2.slice(0, t2), h2 = [...n2.slice(t2), ...I2].find((W) => e.includes(W));
      if (!h2)
        return;
      let O2 = (c2 = n2.indexOf(h2)) != null ? c2 : u2.selectedIndex.value;
      O2 === -1 && (O2 = u2.selectedIndex.value), i2.value = O2, u2.tabs.value = n2, u2.panels.value = o2;
    }
  }
  let u2 = { selectedIndex: computed(() => {
    var t2, n2;
    return (n2 = (t2 = i2.value) != null ? t2 : a2.defaultIndex) != null ? n2 : null;
  }), orientation: computed(() => a2.vertical ? "vertical" : "horizontal"), activation: computed(() => a2.manual ? "manual" : "auto"), tabs: l2, panels: r2, setSelectedIndex(t2) {
    R.value !== t2 && d$12("change", t2), p2.value || y2(t2);
  }, registerTab(t2) {
    var o2;
    if (l2.value.includes(t2))
      return;
    let n2 = l2.value[i2.value];
    if (l2.value.push(t2), l2.value = O(l2.value, o$2), !p2.value) {
      let e = (o2 = l2.value.indexOf(n2)) != null ? o2 : i2.value;
      e !== -1 && (i2.value = e);
    }
  }, unregisterTab(t2) {
    let n2 = l2.value.indexOf(t2);
    n2 !== -1 && l2.value.splice(n2, 1);
  }, registerPanel(t2) {
    r2.value.includes(t2) || (r2.value.push(t2), r2.value = O(r2.value, o$2));
  }, unregisterPanel(t2) {
    let n2 = r2.value.indexOf(t2);
    n2 !== -1 && r2.value.splice(n2, 1);
  } };
  provide(U, u2);
  let T$12 = ref({ tabs: [], panels: [] }), x = ref(false);
  onMounted(() => {
    x.value = true;
  }), provide(G, computed(() => x.value ? null : T$12.value));
  let w2 = computed(() => a2.selectedIndex);
  return onMounted(() => {
    watch([w2], () => {
      var t2;
      return y2((t2 = a2.selectedIndex) != null ? t2 : a2.defaultIndex);
    }, { immediate: true });
  }), watchEffect(() => {
    if (!p2.value || R.value == null || u2.tabs.value.length <= 0)
      return;
    let t2 = O(u2.tabs.value, o$2);
    t2.some((o2, e) => o$2(u2.tabs.value[e]) !== o$2(o2)) && u2.setSelectedIndex(t2.findIndex((o2) => o$2(o2) === o$2(u2.tabs.value[R.value])));
  }), () => {
    let t2 = { selectedIndex: i2.value };
    return h$1(Fragment, [l2.value.length <= 0 && h$1(d, { onFocus: () => {
      for (let n2 of l2.value) {
        let o2 = o$2(n2);
        if ((o2 == null ? void 0 : o2.tabIndex) === 0)
          return o2.focus(), true;
      }
      return false;
    } }), A({ theirProps: { ...s3, ...T(a2, ["selectedIndex", "defaultIndex", "manual", "vertical", "onChange"]) }, ourProps: {}, slot: t2, slots: b2, attrs: s3, name: "TabGroup" })]);
  };
} }), pe = defineComponent({ name: "TabList", props: { as: { type: [Object, String], default: "div" } }, setup(a2, { attrs: b2, slots: s3 }) {
  let d2 = C("TabList");
  return () => {
    let i2 = { selectedIndex: d2.selectedIndex.value }, l2 = { role: "tablist", "aria-orientation": d2.orientation.value };
    return A({ ourProps: l2, theirProps: a2, slot: i2, attrs: b2, slots: s3, name: "TabList" });
  };
} }), xe = defineComponent({ name: "Tab", props: { as: { type: [Object, String], default: "button" }, disabled: { type: [Boolean], default: false }, id: { type: String, default: null } }, setup(a2, { attrs: b2, slots: s3, expose: d2 }) {
  var o2;
  let i2 = (o2 = a2.id) != null ? o2 : `headlessui-tabs-tab-${I$1()}`, l2 = C("Tab"), r2 = ref(null);
  d2({ el: r2, $el: r2 }), onMounted(() => l2.registerTab(r2)), onUnmounted(() => l2.unregisterTab(r2));
  let p2 = inject(G), R = computed(() => {
    if (p2.value) {
      let e = p2.value.tabs.indexOf(i2);
      return e === -1 ? p2.value.tabs.push(i2) - 1 : e;
    }
    return -1;
  }), y2 = computed(() => {
    let e = l2.tabs.value.indexOf(r2);
    return e === -1 ? R.value : e;
  }), u2 = computed(() => y2.value === l2.selectedIndex.value);
  function T2(e) {
    var I2;
    let c2 = e();
    if (c2 === T$1.Success && l2.activation.value === "auto") {
      let m = (I2 = i$3(r2)) == null ? void 0 : I2.activeElement, h2 = l2.tabs.value.findIndex((O2) => o$2(O2) === m);
      h2 !== -1 && l2.setSelectedIndex(h2);
    }
    return c2;
  }
  function x(e) {
    let c2 = l2.tabs.value.map((m) => o$2(m)).filter(Boolean);
    if (e.key === o$1.Space || e.key === o$1.Enter) {
      e.preventDefault(), e.stopPropagation(), l2.setSelectedIndex(y2.value);
      return;
    }
    switch (e.key) {
      case o$1.Home:
      case o$1.PageUp:
        return e.preventDefault(), e.stopPropagation(), T2(() => P(c2, N$1.First));
      case o$1.End:
      case o$1.PageDown:
        return e.preventDefault(), e.stopPropagation(), T2(() => P(c2, N$1.Last));
    }
    if (T2(() => u$4(l2.orientation.value, { vertical() {
      return e.key === o$1.ArrowUp ? P(c2, N$1.Previous | N$1.WrapAround) : e.key === o$1.ArrowDown ? P(c2, N$1.Next | N$1.WrapAround) : T$1.Error;
    }, horizontal() {
      return e.key === o$1.ArrowLeft ? P(c2, N$1.Previous | N$1.WrapAround) : e.key === o$1.ArrowRight ? P(c2, N$1.Next | N$1.WrapAround) : T$1.Error;
    } })) === T$1.Success)
      return e.preventDefault();
  }
  let w2 = ref(false);
  function E2() {
    var e;
    w2.value || (w2.value = true, !a2.disabled && ((e = o$2(r2)) == null || e.focus({ preventScroll: true }), l2.setSelectedIndex(y2.value), t$3(() => {
      w2.value = false;
    })));
  }
  function t2(e) {
    e.preventDefault();
  }
  let n2 = s$1(computed(() => ({ as: a2.as, type: b2.type })), r2);
  return () => {
    var m, h2;
    let e = { selected: u2.value, disabled: (m = a2.disabled) != null ? m : false }, { ...c2 } = a2, I2 = { ref: r2, onKeydown: x, onMousedown: t2, onClick: E2, id: i2, role: "tab", type: n2.value, "aria-controls": (h2 = o$2(l2.panels.value[y2.value])) == null ? void 0 : h2.id, "aria-selected": u2.value, tabIndex: u2.value ? 0 : -1, disabled: a2.disabled ? true : void 0 };
    return A({ ourProps: I2, theirProps: c2, slot: e, attrs: b2, slots: s3, name: "Tab" });
  };
} }), Ie = defineComponent({ name: "TabPanels", props: { as: { type: [Object, String], default: "div" } }, setup(a2, { slots: b2, attrs: s3 }) {
  let d2 = C("TabPanels");
  return () => {
    let i2 = { selectedIndex: d2.selectedIndex.value };
    return A({ theirProps: a2, ourProps: {}, slot: i2, attrs: s3, slots: b2, name: "TabPanels" });
  };
} }), ye = defineComponent({ name: "TabPanel", props: { as: { type: [Object, String], default: "div" }, static: { type: Boolean, default: false }, unmount: { type: Boolean, default: true }, id: { type: String, default: null }, tabIndex: { type: Number, default: 0 } }, setup(a2, { attrs: b2, slots: s3, expose: d2 }) {
  var T2;
  let i2 = (T2 = a2.id) != null ? T2 : `headlessui-tabs-panel-${I$1()}`, l2 = C("TabPanel"), r2 = ref(null);
  d2({ el: r2, $el: r2 }), onMounted(() => l2.registerPanel(r2)), onUnmounted(() => l2.unregisterPanel(r2));
  let p2 = inject(G), R = computed(() => {
    if (p2.value) {
      let x = p2.value.panels.indexOf(i2);
      return x === -1 ? p2.value.panels.push(i2) - 1 : x;
    }
    return -1;
  }), y2 = computed(() => {
    let x = l2.panels.value.indexOf(r2);
    return x === -1 ? R.value : x;
  }), u2 = computed(() => y2.value === l2.selectedIndex.value);
  return () => {
    var n2;
    let x = { selected: u2.value }, { tabIndex: w2, ...E2 } = a2, t2 = { ref: r2, id: i2, role: "tabpanel", "aria-labelledby": (n2 = o$2(l2.tabs.value[y2.value])) == null ? void 0 : n2.id, tabIndex: u2.value ? w2 : -1 };
    return !u2.value && a2.unmount && !a2.static ? h$1(f$1, { as: "span", "aria-hidden": true, ...t2 }) : A({ ourProps: t2, theirProps: E2, slot: x, attrs: b2, slots: s3, features: N.Static | N.RenderStrategy, visible: u2.value, name: "TabPanel" });
  };
} });

export { A, s$1 as B, i$1 as C, p as D, u$2 as E, f as F, c as G, v$1 as H, Ie as I, E as J, n$1 as K, N, O, P, S$1 as S, T, _, I$1 as a, l as b, i as c, u$4 as d, S as e, f$1 as f, t as g, c$2 as h, i$3 as i, w$1 as j, N$1 as k, l$1 as l, me as m, T$1 as n, o$2 as o, pe as p, o$1 as q, t$1 as r, s2 as s, t$3 as t, u$1 as u, w$2 as v, w, xe as x, ye as y, h as z };
//# sourceMappingURL=tabs-B_zyHFOf.mjs.map
