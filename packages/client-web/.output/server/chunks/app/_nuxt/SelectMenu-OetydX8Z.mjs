import { _ as __nuxt_component_1, u as useInjectButtonGroup } from './Button-ccmqP4Ga.mjs';
import { _ as __nuxt_component_1$1 } from './Avatar-ZEXfj5Sj.mjs';
import { defineComponent, ref, computed, toRaw, provide, onMounted, watch, h, Fragment, watchEffect, onUnmounted, nextTick, toRef, useSSRContext, inject, resolveComponent, createVNode, resolveDynamicComponent, mergeProps, withCtx, renderSlot, openBlock, createBlock, createCommentVNode, toDisplayString, renderList, createTextVNode, Transition } from 'vue';
import { useDebounceFn, computedAsync } from '@vueuse/core';
import { d as defu } from '../../nitro/node-server.mjs';
import { twMerge, twJoin } from 'tailwind-merge';
import { s as select, b as selectMenu, u as useUI, g as get } from './selectMenu-bYLo63lK.mjs';
import { u as u$2, x, k as a$1, o as o$1$1, y, e as c$2, l, K, H as H$1, T as T$1, t as t$1, b, m, N as N$1, f as p$2, p as p$1, i as u, w as w$1, h as h$1, g as p, j as usePopper, O, a as o$2 } from './usePopper-mt32Bdxz.mjs';
import { u as useFormGroup } from './useFormGroup-UEyTjmzX.mjs';
import { m as mergeConfig, a as appConfig } from '../server.mjs';
import { ssrRenderVNode, ssrRenderAttr, ssrIncludeBooleanAttr, ssrRenderClass, ssrRenderSlot, ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderList, ssrRenderStyle } from 'vue/server-renderer';
import { _ as _export_sfc } from './_plugin-vue_export-helper-yVxbj29m.mjs';
import { f as f$1, a, t as t$2 } from './micro-task-lHIuwgs5.mjs';

function e(i2 = {}, s = null, t2 = []) {
  for (let [r, n2] of Object.entries(i2))
    o$1(t2, f(s, r), n2);
  return t2;
}
function f(i2, s) {
  return i2 ? i2 + "[" + s + "]" : s;
}
function o$1(i2, s, t2) {
  if (Array.isArray(t2))
    for (let [r, n2] of t2.entries())
      o$1(i2, f(s, r.toString()), n2);
  else
    t2 instanceof Date ? i2.push([s, t2.toISOString()]) : typeof t2 == "boolean" ? i2.push([s, t2 ? "1" : "0"]) : typeof t2 == "string" ? i2.push([s, t2]) : typeof t2 == "number" ? i2.push([s, `${t2}`]) : t2 == null ? i2.push([s, ""]) : e(t2, s, i2);
}
function d(u2, e2, r) {
  let i2 = ref(r == null ? void 0 : r.value), f2 = computed(() => u2.value !== void 0);
  return [computed(() => f2.value ? u2.value : i2.value), function(t2) {
    return f2.value || (i2.value = t2), e2 == null ? void 0 : e2(t2);
  }];
}
function t() {
  return /iPhone/gi.test((void 0).navigator.platform) || /Mac/gi.test((void 0).navigator.platform) && (void 0).navigator.maxTouchPoints > 0;
}
function i() {
  return /Android/gi.test((void 0).navigator.userAgent);
}
function n() {
  return t() || i();
}
function o() {
  let a2 = [], s = { addEventListener(e2, t2, r, i2) {
    return e2.addEventListener(t2, r, i2), s.add(() => e2.removeEventListener(t2, r, i2));
  }, requestAnimationFrame(...e2) {
    let t2 = requestAnimationFrame(...e2);
    s.add(() => cancelAnimationFrame(t2));
  }, nextFrame(...e2) {
    s.requestAnimationFrame(() => {
      s.requestAnimationFrame(...e2);
    });
  }, setTimeout(...e2) {
    let t2 = setTimeout(...e2);
    s.add(() => clearTimeout(t2));
  }, microTask(...e2) {
    let t2 = { current: true };
    return t$2(() => {
      t2.current && e2[0]();
    }), s.add(() => {
      t2.current = false;
    });
  }, style(e2, t2, r) {
    let i2 = e2.style.getPropertyValue(t2);
    return Object.assign(e2.style, { [t2]: r }), this.add(() => {
      Object.assign(e2.style, { [t2]: i2 });
    });
  }, group(e2) {
    let t2 = o();
    return e2(t2), this.add(() => t2.dispose());
  }, add(e2) {
    return a2.push(e2), () => {
      let t2 = a2.indexOf(e2);
      if (t2 >= 0)
        for (let r of a2.splice(t2, 1))
          r();
    };
  }, dispose() {
    for (let e2 of a2.splice(0))
      e2();
  } };
  return s;
}
function Oe(l2, y2) {
  return l2 === y2;
}
var Se = ((r) => (r[r.Open = 0] = "Open", r[r.Closed = 1] = "Closed", r))(Se || {}), Ce = ((r) => (r[r.Single = 0] = "Single", r[r.Multi = 1] = "Multi", r))(Ce || {}), ge = ((r) => (r[r.Pointer = 0] = "Pointer", r[r.Other = 1] = "Other", r))(ge || {});
let Y = Symbol("ComboboxContext");
function $$1(l2) {
  let y2 = inject(Y, null);
  if (y2 === null) {
    let r = new Error(`<${l2} /> is missing a parent <Combobox /> component.`);
    throw Error.captureStackTrace && Error.captureStackTrace(r, $$1), r;
  }
  return y2;
}
let Je = defineComponent({ name: "Combobox", emits: { "update:modelValue": (l2) => true }, props: { as: { type: [Object, String], default: "template" }, disabled: { type: [Boolean], default: false }, by: { type: [String, Function], default: () => Oe }, modelValue: { type: [Object, String, Number, Boolean], default: void 0 }, defaultValue: { type: [Object, String, Number, Boolean], default: void 0 }, form: { type: String, optional: true }, name: { type: String, optional: true }, nullable: { type: Boolean, default: false }, multiple: { type: [Boolean], default: false } }, inheritAttrs: false, setup(l$1, { slots: y$1, attrs: r, emit: w2 }) {
  let e$1 = ref(1), t2 = ref(null), S = ref(null), p2 = ref(null), d$1 = ref(null), b2 = ref({ static: false, hold: false }), v = ref([]), O$1 = ref(null), I = ref(1), P = ref(false);
  function j(n2 = (u2) => u2) {
    let u2 = O$1.value !== null ? v.value[O$1.value] : null, s = O(n2(v.value.slice()), (f2) => o$1$1(f2.dataRef.domRef)), a2 = u2 ? s.indexOf(u2) : null;
    return a2 === -1 && (a2 = null), { options: s, activeOptionIndex: a2 };
  }
  let k = computed(() => l$1.multiple ? 1 : 0), m2 = computed(() => l$1.nullable), [o2, h$12] = d(computed(() => l$1.modelValue), (n2) => w2("update:modelValue", n2), computed(() => l$1.defaultValue)), C = computed(() => o2.value === void 0 ? u$2(k.value, { [1]: [], [0]: void 0 }) : o2.value), E = null, R = null, i2 = { comboboxState: e$1, value: C, mode: k, compare(n2, u2) {
    if (typeof l$1.by == "string") {
      let s = l$1.by;
      return (n2 == null ? void 0 : n2[s]) === (u2 == null ? void 0 : u2[s]);
    }
    return l$1.by(n2, u2);
  }, defaultValue: computed(() => l$1.defaultValue), nullable: m2, inputRef: S, labelRef: t2, buttonRef: p2, optionsRef: d$1, disabled: computed(() => l$1.disabled), options: v, change(n2) {
    h$12(n2);
  }, activeOptionIndex: computed(() => {
    if (P.value && O$1.value === null && v.value.length > 0) {
      let n2 = v.value.findIndex((u2) => !u2.dataRef.disabled);
      n2 !== -1 && (O$1.value = n2);
    }
    return O$1.value;
  }), activationTrigger: I, optionsPropsRef: b2, closeCombobox() {
    P.value = false, !l$1.disabled && e$1.value !== 1 && (e$1.value = 1, O$1.value = null);
  }, openCombobox() {
    if (P.value = true, l$1.disabled || e$1.value === 0)
      return;
    let n2 = v.value.findIndex((u$12) => {
      let s = toRaw(u$12.dataRef.value);
      return u$2(k.value, { [0]: () => i2.compare(toRaw(i2.value.value), toRaw(s)), [1]: () => toRaw(i2.value.value).some((f2) => i2.compare(toRaw(f2), toRaw(s))) });
    });
    n2 !== -1 && (O$1.value = n2), e$1.value = 0;
  }, goToOption(n2, u2, s) {
    P.value = false, E !== null && cancelAnimationFrame(E), E = requestAnimationFrame(() => {
      if (l$1.disabled || d$1.value && !b2.value.static && e$1.value === 1)
        return;
      let a$12 = j();
      if (a$12.activeOptionIndex === null) {
        let T2 = a$12.options.findIndex((B) => !B.dataRef.disabled);
        T2 !== -1 && (a$12.activeOptionIndex = T2);
      }
      let f2 = x(n2 === a$1.Specific ? { focus: a$1.Specific, id: u2 } : { focus: n2 }, { resolveItems: () => a$12.options, resolveActiveIndex: () => a$12.activeOptionIndex, resolveId: (T2) => T2.id, resolveDisabled: (T2) => T2.dataRef.disabled });
      O$1.value = f2, I.value = s != null ? s : 1, v.value = a$12.options;
    });
  }, selectOption(n2) {
    let u$12 = v.value.find((a2) => a2.id === n2);
    if (!u$12)
      return;
    let { dataRef: s } = u$12;
    h$12(u$2(k.value, { [0]: () => s.value, [1]: () => {
      let a2 = toRaw(i2.value.value).slice(), f2 = toRaw(s.value), T2 = a2.findIndex((B) => i2.compare(f2, toRaw(B)));
      return T2 === -1 ? a2.push(f2) : a2.splice(T2, 1), a2;
    } }));
  }, selectActiveOption() {
    if (i2.activeOptionIndex.value === null)
      return;
    let { dataRef: n2, id: u$12 } = v.value[i2.activeOptionIndex.value];
    h$12(u$2(k.value, { [0]: () => n2.value, [1]: () => {
      let s = toRaw(i2.value.value).slice(), a2 = toRaw(n2.value), f2 = s.findIndex((T2) => i2.compare(a2, toRaw(T2)));
      return f2 === -1 ? s.push(a2) : s.splice(f2, 1), s;
    } })), i2.goToOption(a$1.Specific, u$12);
  }, registerOption(n2, u$12) {
    R && cancelAnimationFrame(R);
    let s = { id: n2, dataRef: u$12 }, a2 = j((f2) => (f2.push(s), f2));
    if (O$1.value === null) {
      let f2 = u$12.value.value;
      u$2(k.value, { [0]: () => i2.compare(toRaw(i2.value.value), toRaw(f2)), [1]: () => toRaw(i2.value.value).some((B) => i2.compare(toRaw(B), toRaw(f2))) }) && (a2.activeOptionIndex = a2.options.indexOf(s));
    }
    v.value = a2.options, O$1.value = a2.activeOptionIndex, I.value = 1, a2.options.some((f2) => !o$1$1(f2.dataRef.domRef)) && (R = requestAnimationFrame(() => {
      let f2 = j();
      v.value = f2.options, O$1.value = f2.activeOptionIndex;
    }));
  }, unregisterOption(n2) {
    var s;
    i2.activeOptionIndex.value !== null && ((s = i2.options.value[i2.activeOptionIndex.value]) == null ? void 0 : s.id) === n2 && (P.value = true);
    let u2 = j((a2) => {
      let f2 = a2.findIndex((T2) => T2.id === n2);
      return f2 !== -1 && a2.splice(f2, 1), a2;
    });
    v.value = u2.options, O$1.value = u2.activeOptionIndex, I.value = 1;
  } };
  y([S, p2, d$1], () => i2.closeCombobox(), computed(() => e$1.value === 0)), provide(Y, i2), c$2(computed(() => u$2(e$1.value, { [0]: l.Open, [1]: l.Closed })));
  let A2 = computed(() => i2.activeOptionIndex.value === null ? null : v.value[i2.activeOptionIndex.value].dataRef.value), F = computed(() => {
    var n2;
    return (n2 = o$1$1(S)) == null ? void 0 : n2.closest("form");
  });
  return onMounted(() => {
    watch([F], () => {
      if (!F.value || l$1.defaultValue === void 0)
        return;
      function n2() {
        i2.change(l$1.defaultValue);
      }
      return F.value.addEventListener("reset", n2), () => {
        var u2;
        (u2 = F.value) == null || u2.removeEventListener("reset", n2);
      };
    }, { immediate: true });
  }), () => {
    let { name: n2, disabled: u2, form: s, ...a2 } = l$1, f2 = { open: e$1.value === 0, disabled: u2, activeIndex: i2.activeOptionIndex.value, activeOption: A2.value, value: C.value };
    return h(Fragment, [...n2 != null && C.value != null ? e({ [n2]: C.value }).map(([T2, B]) => h(f$1, K({ features: a.Hidden, key: T2, as: "input", type: "hidden", hidden: true, readOnly: true, form: s, name: T2, value: B }))) : [], H$1({ theirProps: { ...r, ...T$1(a2, ["modelValue", "defaultValue", "nullable", "multiple", "onUpdate:modelValue", "by"]) }, ourProps: {}, slot: f2, slots: y$1, attrs: r, name: "Combobox" })]);
  };
} });
defineComponent({ name: "ComboboxLabel", props: { as: { type: [Object, String], default: "label" }, id: { type: String, default: () => `headlessui-combobox-label-${t$1()}` } }, setup(l2, { attrs: y2, slots: r }) {
  let w2 = $$1("ComboboxLabel");
  function e2() {
    var t2;
    (t2 = o$1$1(w2.inputRef)) == null || t2.focus({ preventScroll: true });
  }
  return () => {
    let t2 = { open: w2.comboboxState.value === 0, disabled: w2.disabled.value }, { id: S, ...p2 } = l2, d2 = { id: S, ref: w2.labelRef, onClick: e2 };
    return H$1({ ourProps: d2, theirProps: p2, slot: t2, attrs: y2, slots: r, name: "ComboboxLabel" });
  };
} });
let Ge = defineComponent({ name: "ComboboxButton", props: { as: { type: [Object, String], default: "button" }, id: { type: String, default: () => `headlessui-combobox-button-${t$1()}` } }, setup(l2, { attrs: y2, slots: r, expose: w2 }) {
  let e2 = $$1("ComboboxButton");
  w2({ el: e2.buttonRef, $el: e2.buttonRef });
  function t2(d2) {
    e2.disabled.value || (e2.comboboxState.value === 0 ? e2.closeCombobox() : (d2.preventDefault(), e2.openCombobox()), nextTick(() => {
      var b2;
      return (b2 = o$1$1(e2.inputRef)) == null ? void 0 : b2.focus({ preventScroll: true });
    }));
  }
  function S(d2) {
    switch (d2.key) {
      case o$2.ArrowDown:
        d2.preventDefault(), d2.stopPropagation(), e2.comboboxState.value === 1 && e2.openCombobox(), nextTick(() => {
          var b2;
          return (b2 = e2.inputRef.value) == null ? void 0 : b2.focus({ preventScroll: true });
        });
        return;
      case o$2.ArrowUp:
        d2.preventDefault(), d2.stopPropagation(), e2.comboboxState.value === 1 && (e2.openCombobox(), nextTick(() => {
          e2.value.value || e2.goToOption(a$1.Last);
        })), nextTick(() => {
          var b2;
          return (b2 = e2.inputRef.value) == null ? void 0 : b2.focus({ preventScroll: true });
        });
        return;
      case o$2.Escape:
        if (e2.comboboxState.value !== 0)
          return;
        d2.preventDefault(), e2.optionsRef.value && !e2.optionsPropsRef.value.static && d2.stopPropagation(), e2.closeCombobox(), nextTick(() => {
          var b2;
          return (b2 = e2.inputRef.value) == null ? void 0 : b2.focus({ preventScroll: true });
        });
        return;
    }
  }
  let p2 = b(computed(() => ({ as: l2.as, type: y2.type })), e2.buttonRef);
  return () => {
    var I, P;
    let d2 = { open: e2.comboboxState.value === 0, disabled: e2.disabled.value, value: e2.value.value }, { id: b2, ...v } = l2, O2 = { ref: e2.buttonRef, id: b2, type: p2.value, tabindex: "-1", "aria-haspopup": "listbox", "aria-controls": (I = o$1$1(e2.optionsRef)) == null ? void 0 : I.id, "aria-expanded": e2.comboboxState.value === 0, "aria-labelledby": e2.labelRef.value ? [(P = o$1$1(e2.labelRef)) == null ? void 0 : P.id, b2].join(" ") : void 0, disabled: e2.disabled.value === true ? true : void 0, onKeydown: S, onClick: t2 };
    return H$1({ ourProps: O2, theirProps: v, slot: d2, attrs: y2, slots: r, name: "ComboboxButton" });
  };
} }), Qe = defineComponent({ name: "ComboboxInput", props: { as: { type: [Object, String], default: "input" }, static: { type: Boolean, default: false }, unmount: { type: Boolean, default: true }, displayValue: { type: Function }, defaultValue: { type: String, default: void 0 }, id: { type: String, default: () => `headlessui-combobox-input-${t$1()}` } }, emits: { change: (l2) => true }, setup(l2, { emit: y2, attrs: r, slots: w2, expose: e2 }) {
  let t2 = $$1("ComboboxInput"), S = computed(() => m(o$1$1(t2.inputRef))), p2 = { value: false };
  e2({ el: t2.inputRef, $el: t2.inputRef });
  function d2() {
    t2.change(null);
    let o2 = o$1$1(t2.optionsRef);
    o2 && (o2.scrollTop = 0), t2.goToOption(a$1.Nothing);
  }
  let b2 = computed(() => {
    var h2;
    let o2 = t2.value.value;
    return o$1$1(t2.inputRef) ? typeof l2.displayValue != "undefined" && o2 !== void 0 ? (h2 = l2.displayValue(o2)) != null ? h2 : "" : typeof o2 == "string" ? o2 : "" : "";
  });
  onMounted(() => {
    watch([b2, t2.comboboxState, S], ([o2, h2], [C, E]) => {
      if (p2.value)
        return;
      let R = o$1$1(t2.inputRef);
      R && ((E === 0 && h2 === 1 || o2 !== C) && (R.value = o2), requestAnimationFrame(() => {
        var F;
        if (p2.value || !R || ((F = S.value) == null ? void 0 : F.activeElement) !== R)
          return;
        let { selectionStart: i2, selectionEnd: A2 } = R;
        Math.abs((A2 != null ? A2 : 0) - (i2 != null ? i2 : 0)) === 0 && i2 === 0 && R.setSelectionRange(R.value.length, R.value.length);
      }));
    }, { immediate: true }), watch([t2.comboboxState], ([o2], [h2]) => {
      if (o2 === 0 && h2 === 1) {
        if (p2.value)
          return;
        let C = o$1$1(t2.inputRef);
        if (!C)
          return;
        let E = C.value, { selectionStart: R, selectionEnd: i2, selectionDirection: A2 } = C;
        C.value = "", C.value = E, A2 !== null ? C.setSelectionRange(R, i2, A2) : C.setSelectionRange(R, i2);
      }
    });
  });
  let v = ref(false);
  function O2() {
    v.value = true;
  }
  function I() {
    o().nextFrame(() => {
      v.value = false;
    });
  }
  function P(o2) {
    switch (p2.value = true, o2.key) {
      case o$2.Enter:
        if (p2.value = false, t2.comboboxState.value !== 0 || v.value)
          return;
        if (o2.preventDefault(), o2.stopPropagation(), t2.activeOptionIndex.value === null) {
          t2.closeCombobox();
          return;
        }
        t2.selectActiveOption(), t2.mode.value === 0 && t2.closeCombobox();
        break;
      case o$2.ArrowDown:
        return p2.value = false, o2.preventDefault(), o2.stopPropagation(), u$2(t2.comboboxState.value, { [0]: () => t2.goToOption(a$1.Next), [1]: () => t2.openCombobox() });
      case o$2.ArrowUp:
        return p2.value = false, o2.preventDefault(), o2.stopPropagation(), u$2(t2.comboboxState.value, { [0]: () => t2.goToOption(a$1.Previous), [1]: () => {
          t2.openCombobox(), nextTick(() => {
            t2.value.value || t2.goToOption(a$1.Last);
          });
        } });
      case o$2.Home:
        if (o2.shiftKey)
          break;
        return p2.value = false, o2.preventDefault(), o2.stopPropagation(), t2.goToOption(a$1.First);
      case o$2.PageUp:
        return p2.value = false, o2.preventDefault(), o2.stopPropagation(), t2.goToOption(a$1.First);
      case o$2.End:
        if (o2.shiftKey)
          break;
        return p2.value = false, o2.preventDefault(), o2.stopPropagation(), t2.goToOption(a$1.Last);
      case o$2.PageDown:
        return p2.value = false, o2.preventDefault(), o2.stopPropagation(), t2.goToOption(a$1.Last);
      case o$2.Escape:
        if (p2.value = false, t2.comboboxState.value !== 0)
          return;
        o2.preventDefault(), t2.optionsRef.value && !t2.optionsPropsRef.value.static && o2.stopPropagation(), t2.nullable.value && t2.mode.value === 0 && t2.value.value === null && d2(), t2.closeCombobox();
        break;
      case o$2.Tab:
        if (p2.value = false, t2.comboboxState.value !== 0)
          return;
        t2.mode.value === 0 && t2.selectActiveOption(), t2.closeCombobox();
        break;
    }
  }
  function j(o2) {
    y2("change", o2), t2.nullable.value && t2.mode.value === 0 && o2.target.value === "" && d2(), t2.openCombobox();
  }
  function k() {
    p2.value = false;
  }
  let m$1 = computed(() => {
    var o2, h2, C, E;
    return (E = (C = (h2 = l2.defaultValue) != null ? h2 : t2.defaultValue.value !== void 0 ? (o2 = l2.displayValue) == null ? void 0 : o2.call(l2, t2.defaultValue.value) : null) != null ? C : t2.defaultValue.value) != null ? E : "";
  });
  return () => {
    var A2, F, n2, u2, s, a2;
    let o2 = { open: t2.comboboxState.value === 0 }, { id: h2, displayValue: C, onChange: E, ...R } = l2, i2 = { "aria-controls": (A2 = t2.optionsRef.value) == null ? void 0 : A2.id, "aria-expanded": t2.comboboxState.value === 0, "aria-activedescendant": t2.activeOptionIndex.value === null || (F = t2.options.value[t2.activeOptionIndex.value]) == null ? void 0 : F.id, "aria-labelledby": (s = (n2 = o$1$1(t2.labelRef)) == null ? void 0 : n2.id) != null ? s : (u2 = o$1$1(t2.buttonRef)) == null ? void 0 : u2.id, "aria-autocomplete": "list", id: h2, onCompositionstart: O2, onCompositionend: I, onKeydown: P, onInput: j, onBlur: k, role: "combobox", type: (a2 = r.type) != null ? a2 : "text", tabIndex: 0, ref: t2.inputRef, defaultValue: m$1.value, disabled: t2.disabled.value === true ? true : void 0 };
    return H$1({ ourProps: i2, theirProps: R, slot: o2, attrs: r, slots: w2, features: N$1.RenderStrategy | N$1.Static, name: "ComboboxInput" });
  };
} }), Xe = defineComponent({ name: "ComboboxOptions", props: { as: { type: [Object, String], default: "ul" }, static: { type: Boolean, default: false }, unmount: { type: Boolean, default: true }, hold: { type: [Boolean], default: false } }, setup(l$1, { attrs: y2, slots: r, expose: w2 }) {
  let e2 = $$1("ComboboxOptions"), t2 = `headlessui-combobox-options-${t$1()}`;
  w2({ el: e2.optionsRef, $el: e2.optionsRef }), watchEffect(() => {
    e2.optionsPropsRef.value.static = l$1.static;
  }), watchEffect(() => {
    e2.optionsPropsRef.value.hold = l$1.hold;
  });
  let S = p$2(), p$22 = computed(() => S !== null ? (S.value & l.Open) === l.Open : e2.comboboxState.value === 0);
  return p$1({ container: computed(() => o$1$1(e2.optionsRef)), enabled: computed(() => e2.comboboxState.value === 0), accept(d2) {
    return d2.getAttribute("role") === "option" ? NodeFilter.FILTER_REJECT : d2.hasAttribute("role") ? NodeFilter.FILTER_SKIP : NodeFilter.FILTER_ACCEPT;
  }, walk(d2) {
    d2.setAttribute("role", "none");
  } }), () => {
    var O2, I, P;
    let d2 = { open: e2.comboboxState.value === 0 }, b2 = { "aria-labelledby": (P = (O2 = o$1$1(e2.labelRef)) == null ? void 0 : O2.id) != null ? P : (I = o$1$1(e2.buttonRef)) == null ? void 0 : I.id, id: t2, ref: e2.optionsRef, role: "listbox", "aria-multiselectable": e2.mode.value === 1 ? true : void 0 }, v = T$1(l$1, ["hold"]);
    return H$1({ ourProps: b2, theirProps: v, slot: d2, attrs: y2, slots: r, features: N$1.RenderStrategy | N$1.Static, visible: p$22.value, name: "ComboboxOptions" });
  };
} }), Ye = defineComponent({ name: "ComboboxOption", props: { as: { type: [Object, String], default: "li" }, value: { type: [Object, String, Number, Boolean] }, disabled: { type: Boolean, default: false } }, setup(l2, { slots: y2, attrs: r, expose: w2 }) {
  let e2 = $$1("ComboboxOption"), t2 = `headlessui-combobox-option-${t$1()}`, S = ref(null);
  w2({ el: S, $el: S });
  let p2 = computed(() => e2.activeOptionIndex.value !== null ? e2.options.value[e2.activeOptionIndex.value].id === t2 : false), d2 = computed(() => u$2(e2.mode.value, { [0]: () => e2.compare(toRaw(e2.value.value), toRaw(l2.value)), [1]: () => toRaw(e2.value.value).some((m2) => e2.compare(toRaw(m2), toRaw(l2.value))) })), b2 = computed(() => ({ disabled: l2.disabled, value: l2.value, domRef: S }));
  onMounted(() => e2.registerOption(t2, b2)), onUnmounted(() => e2.unregisterOption(t2)), watchEffect(() => {
    e2.comboboxState.value === 0 && p2.value && e2.activationTrigger.value !== 0 && nextTick(() => {
      var m2, o2;
      return (o2 = (m2 = o$1$1(S)) == null ? void 0 : m2.scrollIntoView) == null ? void 0 : o2.call(m2, { block: "nearest" });
    });
  });
  function v(m2) {
    if (l2.disabled)
      return m2.preventDefault();
    e2.selectOption(t2), e2.mode.value === 0 && e2.closeCombobox(), n() || requestAnimationFrame(() => {
      var o2;
      return (o2 = o$1$1(e2.inputRef)) == null ? void 0 : o2.focus();
    });
  }
  function O2() {
    if (l2.disabled)
      return e2.goToOption(a$1.Nothing);
    e2.goToOption(a$1.Specific, t2);
  }
  let I = u();
  function P(m2) {
    I.update(m2);
  }
  function j(m2) {
    I.wasMoved(m2) && (l2.disabled || p2.value || e2.goToOption(a$1.Specific, t2, 0));
  }
  function k(m2) {
    I.wasMoved(m2) && (l2.disabled || p2.value && (e2.optionsPropsRef.value.hold || e2.goToOption(a$1.Nothing)));
  }
  return () => {
    let { disabled: m2 } = l2, o2 = { active: p2.value, selected: d2.value, disabled: m2 }, h2 = { id: t2, ref: S, role: "option", tabIndex: m2 === true ? void 0 : -1, "aria-disabled": m2 === true ? true : void 0, "aria-selected": d2.value, disabled: void 0, onClick: v, onFocus: O2, onPointerenter: P, onMouseenter: P, onPointermove: j, onMousemove: j, onPointerleave: k, onMouseleave: k };
    return H$1({ ourProps: h2, theirProps: l2, slot: o2, attrs: r, slots: y2, name: "ComboboxOption" });
  };
} });
function pe(t2, v) {
  return t2 === v;
}
var ce = ((l2) => (l2[l2.Open = 0] = "Open", l2[l2.Closed = 1] = "Closed", l2))(ce || {}), ve = ((l2) => (l2[l2.Single = 0] = "Single", l2[l2.Multi = 1] = "Multi", l2))(ve || {}), be = ((l2) => (l2[l2.Pointer = 0] = "Pointer", l2[l2.Other = 1] = "Other", l2))(be || {});
function me(t2) {
  requestAnimationFrame(() => requestAnimationFrame(t2));
}
let $ = Symbol("ListboxContext");
function A(t2) {
  let v = inject($, null);
  if (v === null) {
    let l2 = new Error(`<${t2} /> is missing a parent <Listbox /> component.`);
    throw Error.captureStackTrace && Error.captureStackTrace(l2, A), l2;
  }
  return v;
}
let Be = defineComponent({ name: "Listbox", emits: { "update:modelValue": (t2) => true }, props: { as: { type: [Object, String], default: "template" }, disabled: { type: [Boolean], default: false }, by: { type: [String, Function], default: () => pe }, horizontal: { type: [Boolean], default: false }, modelValue: { type: [Object, String, Number, Boolean], default: void 0 }, defaultValue: { type: [Object, String, Number, Boolean], default: void 0 }, form: { type: String, optional: true }, name: { type: String, optional: true }, multiple: { type: [Boolean], default: false } }, inheritAttrs: false, setup(t2, { slots: v, attrs: l$1, emit: L }) {
  let e$1 = ref(1), d$1 = ref(null), b2 = ref(null), m2 = ref(null), f2 = ref([]), o2 = ref(""), i2 = ref(null), T$1$1 = ref(1);
  function k(a2 = (n2) => n2) {
    let n2 = i2.value !== null ? f2.value[i2.value] : null, u2 = O(a2(f2.value.slice()), (O2) => o$1$1(O2.dataRef.domRef)), s = n2 ? u2.indexOf(n2) : null;
    return s === -1 && (s = null), { options: u2, activeOptionIndex: s };
  }
  let y$1 = computed(() => t2.multiple ? 1 : 0), [h$2, M] = d(computed(() => t2.modelValue), (a2) => L("update:modelValue", a2), computed(() => t2.defaultValue)), w$1$1 = computed(() => h$2.value === void 0 ? u$2(y$1.value, { [1]: [], [0]: void 0 }) : h$2.value), r = { listboxState: e$1, value: w$1$1, mode: y$1, compare(a2, n2) {
    if (typeof t2.by == "string") {
      let u2 = t2.by;
      return (a2 == null ? void 0 : a2[u2]) === (n2 == null ? void 0 : n2[u2]);
    }
    return t2.by(a2, n2);
  }, orientation: computed(() => t2.horizontal ? "horizontal" : "vertical"), labelRef: d$1, buttonRef: b2, optionsRef: m2, disabled: computed(() => t2.disabled), options: f2, searchQuery: o2, activeOptionIndex: i2, activationTrigger: T$1$1, closeListbox() {
    t2.disabled || e$1.value !== 1 && (e$1.value = 1, i2.value = null);
  }, openListbox() {
    t2.disabled || e$1.value !== 0 && (e$1.value = 0);
  }, goToOption(a$12, n2, u2) {
    if (t2.disabled || e$1.value === 1)
      return;
    let s = k(), O2 = x(a$12 === a$1.Specific ? { focus: a$1.Specific, id: n2 } : { focus: a$12 }, { resolveItems: () => s.options, resolveActiveIndex: () => s.activeOptionIndex, resolveId: (P) => P.id, resolveDisabled: (P) => P.dataRef.disabled });
    o2.value = "", i2.value = O2, T$1$1.value = u2 != null ? u2 : 1, f2.value = s.options;
  }, search(a2) {
    if (t2.disabled || e$1.value === 1)
      return;
    let u2 = o2.value !== "" ? 0 : 1;
    o2.value += a2.toLowerCase();
    let O2 = (i2.value !== null ? f2.value.slice(i2.value + u2).concat(f2.value.slice(0, i2.value + u2)) : f2.value).find((I) => I.dataRef.textValue.startsWith(o2.value) && !I.dataRef.disabled), P = O2 ? f2.value.indexOf(O2) : -1;
    P === -1 || P === i2.value || (i2.value = P, T$1$1.value = 1);
  }, clearSearch() {
    t2.disabled || e$1.value !== 1 && o2.value !== "" && (o2.value = "");
  }, registerOption(a2, n2) {
    let u2 = k((s) => [...s, { id: a2, dataRef: n2 }]);
    f2.value = u2.options, i2.value = u2.activeOptionIndex;
  }, unregisterOption(a2) {
    let n2 = k((u2) => {
      let s = u2.findIndex((O2) => O2.id === a2);
      return s !== -1 && u2.splice(s, 1), u2;
    });
    f2.value = n2.options, i2.value = n2.activeOptionIndex, T$1$1.value = 1;
  }, theirOnChange(a2) {
    t2.disabled || M(a2);
  }, select(a2) {
    t2.disabled || M(u$2(y$1.value, { [0]: () => a2, [1]: () => {
      let n2 = toRaw(r.value.value).slice(), u2 = toRaw(a2), s = n2.findIndex((O2) => r.compare(u2, toRaw(O2)));
      return s === -1 ? n2.push(u2) : n2.splice(s, 1), n2;
    } }));
  } };
  y([b2, m2], (a2, n2) => {
    var u2;
    r.closeListbox(), w$1(n2, h$1.Loose) || (a2.preventDefault(), (u2 = o$1$1(b2)) == null || u2.focus());
  }, computed(() => e$1.value === 0)), provide($, r), c$2(computed(() => u$2(e$1.value, { [0]: l.Open, [1]: l.Closed })));
  let x$1 = computed(() => {
    var a2;
    return (a2 = o$1$1(b2)) == null ? void 0 : a2.closest("form");
  });
  return onMounted(() => {
    watch([x$1], () => {
      if (!x$1.value || t2.defaultValue === void 0)
        return;
      function a2() {
        r.theirOnChange(t2.defaultValue);
      }
      return x$1.value.addEventListener("reset", a2), () => {
        var n2;
        (n2 = x$1.value) == null || n2.removeEventListener("reset", a2);
      };
    }, { immediate: true });
  }), () => {
    let { name: a2, modelValue: n2, disabled: u2, form: s, ...O2 } = t2, P = { open: e$1.value === 0, disabled: u2, value: w$1$1.value };
    return h(Fragment, [...a2 != null && w$1$1.value != null ? e({ [a2]: w$1$1.value }).map(([I, Q]) => h(f$1, K({ features: a.Hidden, key: I, as: "input", type: "hidden", hidden: true, readOnly: true, form: s, name: I, value: Q }))) : [], H$1({ ourProps: {}, theirProps: { ...l$1, ...T$1(O2, ["defaultValue", "onUpdate:modelValue", "horizontal", "multiple", "by"]) }, slot: P, slots: v, attrs: l$1, name: "Listbox" })]);
  };
} });
defineComponent({ name: "ListboxLabel", props: { as: { type: [Object, String], default: "label" }, id: { type: String, default: () => `headlessui-listbox-label-${t$1()}` } }, setup(t2, { attrs: v, slots: l2 }) {
  let L = A("ListboxLabel");
  function e2() {
    var d2;
    (d2 = o$1$1(L.buttonRef)) == null || d2.focus({ preventScroll: true });
  }
  return () => {
    let d2 = { open: L.listboxState.value === 0, disabled: L.disabled.value }, { id: b2, ...m2 } = t2, f2 = { id: b2, ref: L.labelRef, onClick: e2 };
    return H$1({ ourProps: f2, theirProps: m2, slot: d2, attrs: v, slots: l2, name: "ListboxLabel" });
  };
} });
let Ne = defineComponent({ name: "ListboxButton", props: { as: { type: [Object, String], default: "button" }, id: { type: String, default: () => `headlessui-listbox-button-${t$1()}` } }, setup(t2, { attrs: v, slots: l2, expose: L }) {
  let e2 = A("ListboxButton");
  L({ el: e2.buttonRef, $el: e2.buttonRef });
  function d2(o2) {
    switch (o2.key) {
      case o$2.Space:
      case o$2.Enter:
      case o$2.ArrowDown:
        o2.preventDefault(), e2.openListbox(), nextTick(() => {
          var i2;
          (i2 = o$1$1(e2.optionsRef)) == null || i2.focus({ preventScroll: true }), e2.value.value || e2.goToOption(a$1.First);
        });
        break;
      case o$2.ArrowUp:
        o2.preventDefault(), e2.openListbox(), nextTick(() => {
          var i2;
          (i2 = o$1$1(e2.optionsRef)) == null || i2.focus({ preventScroll: true }), e2.value.value || e2.goToOption(a$1.Last);
        });
        break;
    }
  }
  function b$1(o2) {
    switch (o2.key) {
      case o$2.Space:
        o2.preventDefault();
        break;
    }
  }
  function m2(o2) {
    e2.disabled.value || (e2.listboxState.value === 0 ? (e2.closeListbox(), nextTick(() => {
      var i2;
      return (i2 = o$1$1(e2.buttonRef)) == null ? void 0 : i2.focus({ preventScroll: true });
    })) : (o2.preventDefault(), e2.openListbox(), me(() => {
      var i2;
      return (i2 = o$1$1(e2.optionsRef)) == null ? void 0 : i2.focus({ preventScroll: true });
    })));
  }
  let f2 = b(computed(() => ({ as: t2.as, type: v.type })), e2.buttonRef);
  return () => {
    var y2, h2;
    let o2 = { open: e2.listboxState.value === 0, disabled: e2.disabled.value, value: e2.value.value }, { id: i2, ...T2 } = t2, k = { ref: e2.buttonRef, id: i2, type: f2.value, "aria-haspopup": "listbox", "aria-controls": (y2 = o$1$1(e2.optionsRef)) == null ? void 0 : y2.id, "aria-expanded": e2.listboxState.value === 0, "aria-labelledby": e2.labelRef.value ? [(h2 = o$1$1(e2.labelRef)) == null ? void 0 : h2.id, i2].join(" ") : void 0, disabled: e2.disabled.value === true ? true : void 0, onKeydown: d2, onKeyup: b$1, onClick: m2 };
    return H$1({ ourProps: k, theirProps: T2, slot: o2, attrs: v, slots: l2, name: "ListboxButton" });
  };
} }), He = defineComponent({ name: "ListboxOptions", props: { as: { type: [Object, String], default: "ul" }, static: { type: Boolean, default: false }, unmount: { type: Boolean, default: true }, id: { type: String, default: () => `headlessui-listbox-options-${t$1()}` } }, setup(t2, { attrs: v, slots: l$1, expose: L }) {
  let e2 = A("ListboxOptions"), d2 = ref(null);
  L({ el: e2.optionsRef, $el: e2.optionsRef });
  function b2(o2) {
    switch (d2.value && clearTimeout(d2.value), o2.key) {
      case o$2.Space:
        if (e2.searchQuery.value !== "")
          return o2.preventDefault(), o2.stopPropagation(), e2.search(o2.key);
      case o$2.Enter:
        if (o2.preventDefault(), o2.stopPropagation(), e2.activeOptionIndex.value !== null) {
          let i2 = e2.options.value[e2.activeOptionIndex.value];
          e2.select(i2.dataRef.value);
        }
        e2.mode.value === 0 && (e2.closeListbox(), nextTick(() => {
          var i2;
          return (i2 = o$1$1(e2.buttonRef)) == null ? void 0 : i2.focus({ preventScroll: true });
        }));
        break;
      case u$2(e2.orientation.value, { vertical: o$2.ArrowDown, horizontal: o$2.ArrowRight }):
        return o2.preventDefault(), o2.stopPropagation(), e2.goToOption(a$1.Next);
      case u$2(e2.orientation.value, { vertical: o$2.ArrowUp, horizontal: o$2.ArrowLeft }):
        return o2.preventDefault(), o2.stopPropagation(), e2.goToOption(a$1.Previous);
      case o$2.Home:
      case o$2.PageUp:
        return o2.preventDefault(), o2.stopPropagation(), e2.goToOption(a$1.First);
      case o$2.End:
      case o$2.PageDown:
        return o2.preventDefault(), o2.stopPropagation(), e2.goToOption(a$1.Last);
      case o$2.Escape:
        o2.preventDefault(), o2.stopPropagation(), e2.closeListbox(), nextTick(() => {
          var i2;
          return (i2 = o$1$1(e2.buttonRef)) == null ? void 0 : i2.focus({ preventScroll: true });
        });
        break;
      case o$2.Tab:
        o2.preventDefault(), o2.stopPropagation();
        break;
      default:
        o2.key.length === 1 && (e2.search(o2.key), d2.value = setTimeout(() => e2.clearSearch(), 350));
        break;
    }
  }
  let m2 = p$2(), f2 = computed(() => m2 !== null ? (m2.value & l.Open) === l.Open : e2.listboxState.value === 0);
  return () => {
    var y2, h2, M, w2;
    let o2 = { open: e2.listboxState.value === 0 }, { id: i2, ...T2 } = t2, k = { "aria-activedescendant": e2.activeOptionIndex.value === null || (y2 = e2.options.value[e2.activeOptionIndex.value]) == null ? void 0 : y2.id, "aria-multiselectable": e2.mode.value === 1 ? true : void 0, "aria-labelledby": (w2 = (h2 = o$1$1(e2.labelRef)) == null ? void 0 : h2.id) != null ? w2 : (M = o$1$1(e2.buttonRef)) == null ? void 0 : M.id, "aria-orientation": e2.orientation.value, id: i2, onKeydown: b2, role: "listbox", tabIndex: 0, ref: e2.optionsRef };
    return H$1({ ourProps: k, theirProps: T2, slot: o2, attrs: v, slots: l$1, features: N$1.RenderStrategy | N$1.Static, visible: f2.value, name: "ListboxOptions" });
  };
} }), Ue = defineComponent({ name: "ListboxOption", props: { as: { type: [Object, String], default: "li" }, value: { type: [Object, String, Number, Boolean] }, disabled: { type: Boolean, default: false }, id: { type: String, default: () => `headlessui-listbox.option-${t$1()}` } }, setup(t2, { slots: v, attrs: l2, expose: L }) {
  let e2 = A("ListboxOption"), d2 = ref(null);
  L({ el: d2, $el: d2 });
  let b2 = computed(() => e2.activeOptionIndex.value !== null ? e2.options.value[e2.activeOptionIndex.value].id === t2.id : false), m2 = computed(() => u$2(e2.mode.value, { [0]: () => e2.compare(toRaw(e2.value.value), toRaw(t2.value)), [1]: () => toRaw(e2.value.value).some((r) => e2.compare(toRaw(r), toRaw(t2.value))) })), f2 = computed(() => u$2(e2.mode.value, { [1]: () => {
    var x2;
    let r = toRaw(e2.value.value);
    return ((x2 = e2.options.value.find((a2) => r.some((n2) => e2.compare(toRaw(n2), toRaw(a2.dataRef.value))))) == null ? void 0 : x2.id) === t2.id;
  }, [0]: () => m2.value })), o2 = p(d2), i2 = computed(() => ({ disabled: t2.disabled, value: t2.value, get textValue() {
    return o2();
  }, domRef: d2 }));
  onMounted(() => e2.registerOption(t2.id, i2)), onUnmounted(() => e2.unregisterOption(t2.id)), onMounted(() => {
    watch([e2.listboxState, m2], () => {
      e2.listboxState.value === 0 && m2.value && u$2(e2.mode.value, { [1]: () => {
        f2.value && e2.goToOption(a$1.Specific, t2.id);
      }, [0]: () => {
        e2.goToOption(a$1.Specific, t2.id);
      } });
    }, { immediate: true });
  }), watchEffect(() => {
    e2.listboxState.value === 0 && b2.value && e2.activationTrigger.value !== 0 && nextTick(() => {
      var r, x2;
      return (x2 = (r = o$1$1(d2)) == null ? void 0 : r.scrollIntoView) == null ? void 0 : x2.call(r, { block: "nearest" });
    });
  });
  function T2(r) {
    if (t2.disabled)
      return r.preventDefault();
    e2.select(t2.value), e2.mode.value === 0 && (e2.closeListbox(), nextTick(() => {
      var x2;
      return (x2 = o$1$1(e2.buttonRef)) == null ? void 0 : x2.focus({ preventScroll: true });
    }));
  }
  function k() {
    if (t2.disabled)
      return e2.goToOption(a$1.Nothing);
    e2.goToOption(a$1.Specific, t2.id);
  }
  let y2 = u();
  function h2(r) {
    y2.update(r);
  }
  function M(r) {
    y2.wasMoved(r) && (t2.disabled || b2.value || e2.goToOption(a$1.Specific, t2.id, 0));
  }
  function w2(r) {
    y2.wasMoved(r) && (t2.disabled || b2.value && e2.goToOption(a$1.Nothing));
  }
  return () => {
    let { disabled: r } = t2, x2 = { active: b2.value, selected: m2.value, disabled: r }, { id: a2, value: n2, disabled: u2, ...s } = t2, O2 = { id: a2, ref: d2, role: "option", tabIndex: r === true ? void 0 : -1, "aria-disabled": r === true ? true : void 0, "aria-selected": m2.value, disabled: void 0, onClick: T2, onFocus: k, onPointerenter: h2, onMouseenter: h2, onPointermove: M, onMousemove: M, onPointerleave: w2, onMouseleave: w2 };
    return H$1({ ourProps: O2, theirProps: s, slot: x2, attrs: l2, slots: v, name: "ListboxOption" });
  };
} });
const config = mergeConfig(appConfig.ui.strategy, appConfig.ui.select, select);
const configMenu = mergeConfig(appConfig.ui.strategy, appConfig.ui.selectMenu, selectMenu);
const _sfc_main = defineComponent({
  components: {
    HCombobox: Je,
    HComboboxButton: Ge,
    HComboboxOptions: Xe,
    HComboboxOption: Ye,
    HComboboxInput: Qe,
    HListbox: Be,
    HListboxButton: Ne,
    HListboxOptions: He,
    HListboxOption: Ue,
    UIcon: __nuxt_component_1,
    UAvatar: __nuxt_component_1$1
  },
  inheritAttrs: false,
  props: {
    modelValue: {
      type: [String, Number, Object, Array],
      default: ""
    },
    query: {
      type: String,
      default: null
    },
    by: {
      type: String,
      default: void 0
    },
    options: {
      type: Array,
      default: () => []
    },
    id: {
      type: String,
      default: null
    },
    name: {
      type: String,
      default: null
    },
    required: {
      type: Boolean,
      default: false
    },
    icon: {
      type: String,
      default: null
    },
    loadingIcon: {
      type: String,
      default: () => config.default.loadingIcon
    },
    leadingIcon: {
      type: String,
      default: null
    },
    trailingIcon: {
      type: String,
      default: () => config.default.trailingIcon
    },
    trailing: {
      type: Boolean,
      default: false
    },
    leading: {
      type: Boolean,
      default: false
    },
    loading: {
      type: Boolean,
      default: false
    },
    selectedIcon: {
      type: String,
      default: () => configMenu.default.selectedIcon
    },
    disabled: {
      type: Boolean,
      default: false
    },
    multiple: {
      type: Boolean,
      default: false
    },
    searchable: {
      type: [Boolean, Function],
      default: false
    },
    searchablePlaceholder: {
      type: String,
      default: "Search..."
    },
    clearSearchOnClose: {
      type: Boolean,
      default: () => configMenu.default.clearSearchOnClose
    },
    debounce: {
      type: Number,
      default: 200
    },
    creatable: {
      type: Boolean,
      default: false
    },
    showCreateOptionWhen: {
      type: String,
      default: () => configMenu.default.showCreateOptionWhen
    },
    placeholder: {
      type: String,
      default: null
    },
    padded: {
      type: Boolean,
      default: true
    },
    size: {
      type: String,
      default: null,
      validator(value) {
        return Object.keys(config.size).includes(value);
      }
    },
    color: {
      type: String,
      default: () => config.default.color,
      validator(value) {
        return [...appConfig.ui.colors, ...Object.keys(config.color)].includes(value);
      }
    },
    variant: {
      type: String,
      default: () => config.default.variant,
      validator(value) {
        return [
          ...Object.keys(config.variant),
          ...Object.values(config.color).flatMap((value2) => Object.keys(value2))
        ].includes(value);
      }
    },
    optionAttribute: {
      type: String,
      default: "label"
    },
    valueAttribute: {
      type: String,
      default: null
    },
    searchAttributes: {
      type: Array,
      default: null
    },
    popper: {
      type: Object,
      default: () => ({})
    },
    selectClass: {
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
    },
    uiMenu: {
      type: Object,
      default: () => ({})
    }
  },
  emits: ["update:modelValue", "update:query", "open", "close", "change"],
  setup(props, { emit, slots }) {
    const { ui, attrs } = useUI("select", toRef(props, "ui"), config, toRef(props, "class"));
    const { ui: uiMenu } = useUI("selectMenu", toRef(props, "uiMenu"), configMenu);
    const popper = computed(() => defu({}, props.popper, uiMenu.value.popper));
    const [trigger, container] = usePopper(popper.value);
    const { size: sizeButtonGroup, rounded } = useInjectButtonGroup({ ui, props });
    const { emitFormBlur, emitFormChange, inputId, color, size: sizeFormGroup, name } = useFormGroup(props, config);
    const size = computed(() => sizeButtonGroup.value || sizeFormGroup.value);
    const internalQuery = ref("");
    const query = computed({
      get() {
        var _a;
        return (_a = props.query) != null ? _a : internalQuery.value;
      },
      set(value) {
        internalQuery.value = value;
        emit("update:query", value);
      }
    });
    const label = computed(() => {
      if (props.multiple) {
        if (Array.isArray(props.modelValue) && props.modelValue.length) {
          return `${props.modelValue.length} selected`;
        } else {
          return null;
        }
      } else {
        if (props.valueAttribute) {
          const option = props.options.find((option2) => option2[props.valueAttribute] === props.modelValue);
          return option ? option[props.optionAttribute] : null;
        } else {
          return ["string", "number"].includes(typeof props.modelValue) ? props.modelValue : props.modelValue[props.optionAttribute];
        }
      }
    });
    const selectClass = computed(() => {
      var _a, _b;
      const variant = ((_b = (_a = ui.value.color) == null ? void 0 : _a[color.value]) == null ? void 0 : _b[props.variant]) || ui.value.variant[props.variant];
      return twMerge(twJoin(
        ui.value.base,
        uiMenu.value.select,
        rounded.value,
        ui.value.size[size.value],
        ui.value.gap[size.value],
        props.padded ? ui.value.padding[size.value] : "p-0",
        variant == null ? void 0 : variant.replaceAll("{color}", color.value),
        (isLeading.value || slots.leading) && ui.value.leading.padding[size.value],
        (isTrailing.value || slots.trailing) && ui.value.trailing.padding[size.value]
      ), props.placeholder && !props.modelValue && ui.value.placeholder, props.selectClass);
    });
    const isLeading = computed(() => {
      return props.icon && props.leading || props.icon && !props.trailing || props.loading && !props.trailing || props.leadingIcon;
    });
    const isTrailing = computed(() => {
      return props.icon && props.trailing || props.loading && props.trailing || props.trailingIcon;
    });
    const leadingIconName = computed(() => {
      if (props.loading) {
        return props.loadingIcon;
      }
      return props.leadingIcon || props.icon;
    });
    const trailingIconName = computed(() => {
      if (props.loading && !isLeading.value) {
        return props.loadingIcon;
      }
      return props.trailingIcon || props.icon;
    });
    const leadingWrapperIconClass = computed(() => {
      return twJoin(
        ui.value.icon.leading.wrapper,
        ui.value.icon.leading.pointer,
        ui.value.icon.leading.padding[size.value]
      );
    });
    const leadingIconClass = computed(() => {
      return twJoin(
        ui.value.icon.base,
        color.value && appConfig.ui.colors.includes(color.value) && ui.value.icon.color.replaceAll("{color}", color.value),
        ui.value.icon.size[size.value],
        props.loading && ui.value.icon.loading
      );
    });
    const trailingWrapperIconClass = computed(() => {
      return twJoin(
        ui.value.icon.trailing.wrapper,
        ui.value.icon.trailing.pointer,
        ui.value.icon.trailing.padding[size.value]
      );
    });
    const trailingIconClass = computed(() => {
      return twJoin(
        ui.value.icon.base,
        color.value && appConfig.ui.colors.includes(color.value) && ui.value.icon.color.replaceAll("{color}", color.value),
        ui.value.icon.size[size.value],
        props.loading && !isLeading.value && ui.value.icon.loading
      );
    });
    const debouncedSearch = typeof props.searchable === "function" ? useDebounceFn(props.searchable, props.debounce) : void 0;
    const filteredOptions = computedAsync(async () => {
      if (props.searchable && debouncedSearch) {
        return await debouncedSearch(query.value);
      }
      if (query.value === "") {
        return props.options;
      }
      return props.options.filter((option) => {
        var _a;
        return (((_a = props.searchAttributes) == null ? void 0 : _a.length) ? props.searchAttributes : [props.optionAttribute]).some((searchAttribute) => {
          if (["string", "number"].includes(typeof option)) {
            return String(option).search(new RegExp(query.value, "i")) !== -1;
          }
          const child = get(option, searchAttribute);
          return child !== null && child !== void 0 && String(child).search(new RegExp(query.value, "i")) !== -1;
        });
      });
    });
    const createOption = computed(() => {
      if (query.value === "") {
        return null;
      }
      if (props.showCreateOptionWhen === "empty" && filteredOptions.value.length) {
        return null;
      }
      if (props.showCreateOptionWhen === "always") {
        const existingOption = filteredOptions.value.find((option) => ["string", "number"].includes(typeof option) ? option === query.value : option[props.optionAttribute] === query.value);
        if (existingOption) {
          return null;
        }
      }
      return ["string", "number"].includes(typeof props.modelValue) ? query.value : { [props.optionAttribute]: query.value };
    });
    function clearOnClose() {
      if (props.clearSearchOnClose) {
        query.value = "";
      }
    }
    watch(container, (value) => {
      if (value) {
        emit("open");
      } else {
        clearOnClose();
        emit("close");
        emitFormBlur();
      }
    });
    function onUpdate(event) {
      emit("update:modelValue", event);
      emit("change", event);
      emitFormChange();
    }
    function onChange(event) {
      query.value = event.target.value;
    }
    return {
      // eslint-disable-next-line vue/no-dupe-keys
      ui,
      // eslint-disable-next-line vue/no-dupe-keys
      uiMenu,
      attrs,
      // eslint-disable-next-line vue/no-dupe-keys
      name,
      inputId,
      // eslint-disable-next-line vue/no-dupe-keys
      popper,
      trigger,
      container,
      label,
      isLeading,
      isTrailing,
      // eslint-disable-next-line vue/no-dupe-keys
      selectClass,
      leadingIconName,
      leadingIconClass,
      leadingWrapperIconClass,
      trailingIconName,
      trailingIconClass,
      trailingWrapperIconClass,
      filteredOptions,
      createOption,
      // eslint-disable-next-line vue/no-dupe-keys
      query,
      onUpdate,
      onChange
    };
  }
});
function _sfc_ssrRender(_ctx, _push, _parent, _attrs, $props, $setup, $data, $options) {
  const _component_UIcon = __nuxt_component_1;
  const _component_HComboboxInput = resolveComponent("HComboboxInput");
  const _component_UAvatar = __nuxt_component_1$1;
  ssrRenderVNode(_push, createVNode(resolveDynamicComponent(_ctx.searchable ? "HCombobox" : "HListbox"), mergeProps({
    by: _ctx.by,
    name: _ctx.name,
    "model-value": _ctx.modelValue,
    multiple: _ctx.multiple,
    disabled: _ctx.disabled,
    as: "div",
    class: _ctx.ui.wrapper,
    "onUpdate:modelValue": _ctx.onUpdate
  }, _attrs), {
    default: withCtx(({ open }, _push2, _parent2, _scopeId) => {
      if (_push2) {
        if (_ctx.required) {
          _push2(`<input${ssrRenderAttr("value", _ctx.modelValue)}${ssrIncludeBooleanAttr(_ctx.required) ? " required" : ""} class="${ssrRenderClass(_ctx.uiMenu.required)}" tabindex="-1" aria-hidden="true"${_scopeId}>`);
        } else {
          _push2(`<!---->`);
        }
        ssrRenderVNode(_push2, createVNode(resolveDynamicComponent(_ctx.searchable ? "HComboboxButton" : "HListboxButton"), {
          ref: "trigger",
          as: "div",
          role: "button",
          class: _ctx.uiMenu.trigger
        }, {
          default: withCtx((_, _push3, _parent3, _scopeId2) => {
            if (_push3) {
              ssrRenderSlot(_ctx.$slots, "default", {
                open,
                disabled: _ctx.disabled,
                loading: _ctx.loading
              }, () => {
                _push3(`<button${ssrRenderAttrs(mergeProps({
                  id: _ctx.inputId,
                  class: _ctx.selectClass,
                  disabled: _ctx.disabled,
                  type: "button"
                }, _ctx.attrs))}${_scopeId2}>`);
                if (_ctx.isLeading && _ctx.leadingIconName || _ctx.$slots.leading) {
                  _push3(`<span class="${ssrRenderClass(_ctx.leadingWrapperIconClass)}"${_scopeId2}>`);
                  ssrRenderSlot(_ctx.$slots, "leading", {
                    disabled: _ctx.disabled,
                    loading: _ctx.loading
                  }, () => {
                    _push3(ssrRenderComponent(_component_UIcon, {
                      name: _ctx.leadingIconName,
                      class: _ctx.leadingIconClass
                    }, null, _parent3, _scopeId2));
                  }, _push3, _parent3, _scopeId2);
                  _push3(`</span>`);
                } else {
                  _push3(`<!---->`);
                }
                ssrRenderSlot(_ctx.$slots, "label", {}, () => {
                  if (_ctx.label) {
                    _push3(`<span class="${ssrRenderClass(_ctx.uiMenu.label)}"${_scopeId2}>${ssrInterpolate(_ctx.label)}</span>`);
                  } else {
                    _push3(`<span class="${ssrRenderClass(_ctx.uiMenu.label)}"${_scopeId2}>${ssrInterpolate(_ctx.placeholder || "\xA0")}</span>`);
                  }
                }, _push3, _parent3, _scopeId2);
                if (_ctx.isTrailing && _ctx.trailingIconName || _ctx.$slots.trailing) {
                  _push3(`<span class="${ssrRenderClass(_ctx.trailingWrapperIconClass)}"${_scopeId2}>`);
                  ssrRenderSlot(_ctx.$slots, "trailing", {
                    disabled: _ctx.disabled,
                    loading: _ctx.loading
                  }, () => {
                    _push3(ssrRenderComponent(_component_UIcon, {
                      name: _ctx.trailingIconName,
                      class: _ctx.trailingIconClass,
                      "aria-hidden": "true"
                    }, null, _parent3, _scopeId2));
                  }, _push3, _parent3, _scopeId2);
                  _push3(`</span>`);
                } else {
                  _push3(`<!---->`);
                }
                _push3(`</button>`);
              }, _push3, _parent3, _scopeId2);
            } else {
              return [
                renderSlot(_ctx.$slots, "default", {
                  open,
                  disabled: _ctx.disabled,
                  loading: _ctx.loading
                }, () => [
                  createVNode("button", mergeProps({
                    id: _ctx.inputId,
                    class: _ctx.selectClass,
                    disabled: _ctx.disabled,
                    type: "button"
                  }, _ctx.attrs), [
                    _ctx.isLeading && _ctx.leadingIconName || _ctx.$slots.leading ? (openBlock(), createBlock("span", {
                      key: 0,
                      class: _ctx.leadingWrapperIconClass
                    }, [
                      renderSlot(_ctx.$slots, "leading", {
                        disabled: _ctx.disabled,
                        loading: _ctx.loading
                      }, () => [
                        createVNode(_component_UIcon, {
                          name: _ctx.leadingIconName,
                          class: _ctx.leadingIconClass
                        }, null, 8, ["name", "class"])
                      ])
                    ], 2)) : createCommentVNode("", true),
                    renderSlot(_ctx.$slots, "label", {}, () => [
                      _ctx.label ? (openBlock(), createBlock("span", {
                        key: 0,
                        class: _ctx.uiMenu.label
                      }, toDisplayString(_ctx.label), 3)) : (openBlock(), createBlock("span", {
                        key: 1,
                        class: _ctx.uiMenu.label
                      }, toDisplayString(_ctx.placeholder || "\xA0"), 3))
                    ]),
                    _ctx.isTrailing && _ctx.trailingIconName || _ctx.$slots.trailing ? (openBlock(), createBlock("span", {
                      key: 1,
                      class: _ctx.trailingWrapperIconClass
                    }, [
                      renderSlot(_ctx.$slots, "trailing", {
                        disabled: _ctx.disabled,
                        loading: _ctx.loading
                      }, () => [
                        createVNode(_component_UIcon, {
                          name: _ctx.trailingIconName,
                          class: _ctx.trailingIconClass,
                          "aria-hidden": "true"
                        }, null, 8, ["name", "class"])
                      ])
                    ], 2)) : createCommentVNode("", true)
                  ], 16, ["id", "disabled"])
                ])
              ];
            }
          }),
          _: 2
        }), _parent2, _scopeId);
        if (open) {
          _push2(`<div class="${ssrRenderClass([_ctx.uiMenu.container, _ctx.uiMenu.width])}"${_scopeId}><template><div${_scopeId}>`);
          if (_ctx.popper.arrow) {
            _push2(`<div data-popper-arrow class="${ssrRenderClass(Object.values(_ctx.uiMenu.arrow))}"${_scopeId}></div>`);
          } else {
            _push2(`<!---->`);
          }
          ssrRenderVNode(_push2, createVNode(resolveDynamicComponent(_ctx.searchable ? "HComboboxOptions" : "HListboxOptions"), {
            static: "",
            class: [_ctx.uiMenu.base, _ctx.uiMenu.ring, _ctx.uiMenu.rounded, _ctx.uiMenu.shadow, _ctx.uiMenu.background, _ctx.uiMenu.padding, _ctx.uiMenu.height]
          }, {
            default: withCtx((_, _push3, _parent3, _scopeId2) => {
              if (_push3) {
                if (_ctx.searchable) {
                  _push3(ssrRenderComponent(_component_HComboboxInput, {
                    "display-value": () => _ctx.query,
                    name: "q",
                    placeholder: _ctx.searchablePlaceholder,
                    autofocus: "",
                    autocomplete: "off",
                    class: _ctx.uiMenu.input,
                    onChange: _ctx.onChange
                  }, null, _parent3, _scopeId2));
                } else {
                  _push3(`<!---->`);
                }
                _push3(`<!--[-->`);
                ssrRenderList(_ctx.filteredOptions, (option, index) => {
                  ssrRenderVNode(_push3, createVNode(resolveDynamicComponent(_ctx.searchable ? "HComboboxOption" : "HListboxOption"), {
                    key: index,
                    as: "template",
                    value: _ctx.valueAttribute ? option[_ctx.valueAttribute] : option,
                    disabled: option.disabled
                  }, {
                    default: withCtx(({ active, selected, disabled: optionDisabled }, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<li class="${ssrRenderClass([_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive, selected && _ctx.uiMenu.option.selected, optionDisabled && _ctx.uiMenu.option.disabled])}"${_scopeId3}><div class="${ssrRenderClass(_ctx.uiMenu.option.container)}"${_scopeId3}>`);
                        ssrRenderSlot(_ctx.$slots, "option", {
                          option,
                          active,
                          selected
                        }, () => {
                          if (option.icon) {
                            _push4(ssrRenderComponent(_component_UIcon, {
                              name: option.icon,
                              class: [_ctx.uiMenu.option.icon.base, active ? _ctx.uiMenu.option.icon.active : _ctx.uiMenu.option.icon.inactive, option.iconClass],
                              "aria-hidden": "true"
                            }, null, _parent4, _scopeId3));
                          } else if (option.avatar) {
                            _push4(ssrRenderComponent(_component_UAvatar, mergeProps({ size: _ctx.uiMenu.option.avatar.size, ...option.avatar }, {
                              class: _ctx.uiMenu.option.avatar.base,
                              "aria-hidden": "true"
                            }), null, _parent4, _scopeId3));
                          } else if (option.chip) {
                            _push4(`<span class="${ssrRenderClass(_ctx.uiMenu.option.chip.base)}" style="${ssrRenderStyle({ background: `#${option.chip}` })}"${_scopeId3}></span>`);
                          } else {
                            _push4(`<!---->`);
                          }
                          _push4(`<span class="truncate"${_scopeId3}>${ssrInterpolate(["string", "number"].includes(typeof option) ? option : option[_ctx.optionAttribute])}</span>`);
                        }, _push4, _parent4, _scopeId3);
                        _push4(`</div>`);
                        if (selected) {
                          _push4(`<span class="${ssrRenderClass([_ctx.uiMenu.option.selectedIcon.wrapper, _ctx.uiMenu.option.selectedIcon.padding])}"${_scopeId3}>`);
                          _push4(ssrRenderComponent(_component_UIcon, {
                            name: _ctx.selectedIcon,
                            class: _ctx.uiMenu.option.selectedIcon.base,
                            "aria-hidden": "true"
                          }, null, _parent4, _scopeId3));
                          _push4(`</span>`);
                        } else {
                          _push4(`<!---->`);
                        }
                        _push4(`</li>`);
                      } else {
                        return [
                          createVNode("li", {
                            class: [_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive, selected && _ctx.uiMenu.option.selected, optionDisabled && _ctx.uiMenu.option.disabled]
                          }, [
                            createVNode("div", {
                              class: _ctx.uiMenu.option.container
                            }, [
                              renderSlot(_ctx.$slots, "option", {
                                option,
                                active,
                                selected
                              }, () => [
                                option.icon ? (openBlock(), createBlock(_component_UIcon, {
                                  key: 0,
                                  name: option.icon,
                                  class: [_ctx.uiMenu.option.icon.base, active ? _ctx.uiMenu.option.icon.active : _ctx.uiMenu.option.icon.inactive, option.iconClass],
                                  "aria-hidden": "true"
                                }, null, 8, ["name", "class"])) : option.avatar ? (openBlock(), createBlock(_component_UAvatar, mergeProps({ key: 1 }, { size: _ctx.uiMenu.option.avatar.size, ...option.avatar }, {
                                  class: _ctx.uiMenu.option.avatar.base,
                                  "aria-hidden": "true"
                                }), null, 16, ["class"])) : option.chip ? (openBlock(), createBlock("span", {
                                  key: 2,
                                  class: _ctx.uiMenu.option.chip.base,
                                  style: { background: `#${option.chip}` }
                                }, null, 6)) : createCommentVNode("", true),
                                createVNode("span", { class: "truncate" }, toDisplayString(["string", "number"].includes(typeof option) ? option : option[_ctx.optionAttribute]), 1)
                              ])
                            ], 2),
                            selected ? (openBlock(), createBlock("span", {
                              key: 0,
                              class: [_ctx.uiMenu.option.selectedIcon.wrapper, _ctx.uiMenu.option.selectedIcon.padding]
                            }, [
                              createVNode(_component_UIcon, {
                                name: _ctx.selectedIcon,
                                class: _ctx.uiMenu.option.selectedIcon.base,
                                "aria-hidden": "true"
                              }, null, 8, ["name", "class"])
                            ], 2)) : createCommentVNode("", true)
                          ], 2)
                        ];
                      }
                    }),
                    _: 2
                  }), _parent3, _scopeId2);
                });
                _push3(`<!--]-->`);
                if (_ctx.creatable && _ctx.createOption) {
                  ssrRenderVNode(_push3, createVNode(resolveDynamicComponent(_ctx.searchable ? "HComboboxOption" : "HListboxOption"), {
                    value: _ctx.createOption,
                    as: "template"
                  }, {
                    default: withCtx(({ active, selected }, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`<li class="${ssrRenderClass([_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive])}"${_scopeId3}><div class="${ssrRenderClass(_ctx.uiMenu.option.container)}"${_scopeId3}>`);
                        ssrRenderSlot(_ctx.$slots, "option-create", {
                          option: _ctx.createOption,
                          active,
                          selected
                        }, () => {
                          _push4(`<span class="${ssrRenderClass(_ctx.uiMenu.option.create)}"${_scopeId3}>Create &quot;${ssrInterpolate(_ctx.createOption[_ctx.optionAttribute])}&quot;</span>`);
                        }, _push4, _parent4, _scopeId3);
                        _push4(`</div></li>`);
                      } else {
                        return [
                          createVNode("li", {
                            class: [_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive]
                          }, [
                            createVNode("div", {
                              class: _ctx.uiMenu.option.container
                            }, [
                              renderSlot(_ctx.$slots, "option-create", {
                                option: _ctx.createOption,
                                active,
                                selected
                              }, () => [
                                createVNode("span", {
                                  class: _ctx.uiMenu.option.create
                                }, 'Create "' + toDisplayString(_ctx.createOption[_ctx.optionAttribute]) + '"', 3)
                              ])
                            ], 2)
                          ], 2)
                        ];
                      }
                    }),
                    _: 2
                  }), _parent3, _scopeId2);
                } else if (_ctx.searchable && _ctx.query && !_ctx.filteredOptions.length) {
                  _push3(`<p class="${ssrRenderClass(_ctx.uiMenu.option.empty)}"${_scopeId2}>`);
                  ssrRenderSlot(_ctx.$slots, "option-empty", { query: _ctx.query }, () => {
                    _push3(` No results for &quot;${ssrInterpolate(_ctx.query)}&quot;. `);
                  }, _push3, _parent3, _scopeId2);
                  _push3(`</p>`);
                } else if (!_ctx.filteredOptions.length) {
                  _push3(`<p class="${ssrRenderClass(_ctx.uiMenu.empty)}"${_scopeId2}>`);
                  ssrRenderSlot(_ctx.$slots, "empty", { query: _ctx.query }, () => {
                    _push3(` No options. `);
                  }, _push3, _parent3, _scopeId2);
                  _push3(`</p>`);
                } else {
                  _push3(`<!---->`);
                }
              } else {
                return [
                  _ctx.searchable ? (openBlock(), createBlock(_component_HComboboxInput, {
                    key: 0,
                    "display-value": () => _ctx.query,
                    name: "q",
                    placeholder: _ctx.searchablePlaceholder,
                    autofocus: "",
                    autocomplete: "off",
                    class: _ctx.uiMenu.input,
                    onChange: _ctx.onChange
                  }, null, 8, ["display-value", "placeholder", "class", "onChange"])) : createCommentVNode("", true),
                  (openBlock(true), createBlock(Fragment, null, renderList(_ctx.filteredOptions, (option, index) => {
                    return openBlock(), createBlock(resolveDynamicComponent(_ctx.searchable ? "HComboboxOption" : "HListboxOption"), {
                      key: index,
                      as: "template",
                      value: _ctx.valueAttribute ? option[_ctx.valueAttribute] : option,
                      disabled: option.disabled
                    }, {
                      default: withCtx(({ active, selected, disabled: optionDisabled }) => [
                        createVNode("li", {
                          class: [_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive, selected && _ctx.uiMenu.option.selected, optionDisabled && _ctx.uiMenu.option.disabled]
                        }, [
                          createVNode("div", {
                            class: _ctx.uiMenu.option.container
                          }, [
                            renderSlot(_ctx.$slots, "option", {
                              option,
                              active,
                              selected
                            }, () => [
                              option.icon ? (openBlock(), createBlock(_component_UIcon, {
                                key: 0,
                                name: option.icon,
                                class: [_ctx.uiMenu.option.icon.base, active ? _ctx.uiMenu.option.icon.active : _ctx.uiMenu.option.icon.inactive, option.iconClass],
                                "aria-hidden": "true"
                              }, null, 8, ["name", "class"])) : option.avatar ? (openBlock(), createBlock(_component_UAvatar, mergeProps({ key: 1 }, { size: _ctx.uiMenu.option.avatar.size, ...option.avatar }, {
                                class: _ctx.uiMenu.option.avatar.base,
                                "aria-hidden": "true"
                              }), null, 16, ["class"])) : option.chip ? (openBlock(), createBlock("span", {
                                key: 2,
                                class: _ctx.uiMenu.option.chip.base,
                                style: { background: `#${option.chip}` }
                              }, null, 6)) : createCommentVNode("", true),
                              createVNode("span", { class: "truncate" }, toDisplayString(["string", "number"].includes(typeof option) ? option : option[_ctx.optionAttribute]), 1)
                            ])
                          ], 2),
                          selected ? (openBlock(), createBlock("span", {
                            key: 0,
                            class: [_ctx.uiMenu.option.selectedIcon.wrapper, _ctx.uiMenu.option.selectedIcon.padding]
                          }, [
                            createVNode(_component_UIcon, {
                              name: _ctx.selectedIcon,
                              class: _ctx.uiMenu.option.selectedIcon.base,
                              "aria-hidden": "true"
                            }, null, 8, ["name", "class"])
                          ], 2)) : createCommentVNode("", true)
                        ], 2)
                      ]),
                      _: 2
                    }, 1032, ["value", "disabled"]);
                  }), 128)),
                  _ctx.creatable && _ctx.createOption ? (openBlock(), createBlock(resolveDynamicComponent(_ctx.searchable ? "HComboboxOption" : "HListboxOption"), {
                    key: 1,
                    value: _ctx.createOption,
                    as: "template"
                  }, {
                    default: withCtx(({ active, selected }) => [
                      createVNode("li", {
                        class: [_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive]
                      }, [
                        createVNode("div", {
                          class: _ctx.uiMenu.option.container
                        }, [
                          renderSlot(_ctx.$slots, "option-create", {
                            option: _ctx.createOption,
                            active,
                            selected
                          }, () => [
                            createVNode("span", {
                              class: _ctx.uiMenu.option.create
                            }, 'Create "' + toDisplayString(_ctx.createOption[_ctx.optionAttribute]) + '"', 3)
                          ])
                        ], 2)
                      ], 2)
                    ]),
                    _: 3
                  }, 8, ["value"])) : _ctx.searchable && _ctx.query && !_ctx.filteredOptions.length ? (openBlock(), createBlock("p", {
                    key: 2,
                    class: _ctx.uiMenu.option.empty
                  }, [
                    renderSlot(_ctx.$slots, "option-empty", { query: _ctx.query }, () => [
                      createTextVNode(' No results for "' + toDisplayString(_ctx.query) + '". ', 1)
                    ])
                  ], 2)) : !_ctx.filteredOptions.length ? (openBlock(), createBlock("p", {
                    key: 3,
                    class: _ctx.uiMenu.empty
                  }, [
                    renderSlot(_ctx.$slots, "empty", { query: _ctx.query }, () => [
                      createTextVNode(" No options. ")
                    ])
                  ], 2)) : createCommentVNode("", true)
                ];
              }
            }),
            _: 2
          }), _parent2, _scopeId);
          _push2(`</div></template></div>`);
        } else {
          _push2(`<!---->`);
        }
      } else {
        return [
          _ctx.required ? (openBlock(), createBlock("input", {
            key: 0,
            value: _ctx.modelValue,
            required: _ctx.required,
            class: _ctx.uiMenu.required,
            tabindex: "-1",
            "aria-hidden": "true"
          }, null, 10, ["value", "required"])) : createCommentVNode("", true),
          (openBlock(), createBlock(resolveDynamicComponent(_ctx.searchable ? "HComboboxButton" : "HListboxButton"), {
            ref: "trigger",
            as: "div",
            role: "button",
            class: _ctx.uiMenu.trigger
          }, {
            default: withCtx(() => [
              renderSlot(_ctx.$slots, "default", {
                open,
                disabled: _ctx.disabled,
                loading: _ctx.loading
              }, () => [
                createVNode("button", mergeProps({
                  id: _ctx.inputId,
                  class: _ctx.selectClass,
                  disabled: _ctx.disabled,
                  type: "button"
                }, _ctx.attrs), [
                  _ctx.isLeading && _ctx.leadingIconName || _ctx.$slots.leading ? (openBlock(), createBlock("span", {
                    key: 0,
                    class: _ctx.leadingWrapperIconClass
                  }, [
                    renderSlot(_ctx.$slots, "leading", {
                      disabled: _ctx.disabled,
                      loading: _ctx.loading
                    }, () => [
                      createVNode(_component_UIcon, {
                        name: _ctx.leadingIconName,
                        class: _ctx.leadingIconClass
                      }, null, 8, ["name", "class"])
                    ])
                  ], 2)) : createCommentVNode("", true),
                  renderSlot(_ctx.$slots, "label", {}, () => [
                    _ctx.label ? (openBlock(), createBlock("span", {
                      key: 0,
                      class: _ctx.uiMenu.label
                    }, toDisplayString(_ctx.label), 3)) : (openBlock(), createBlock("span", {
                      key: 1,
                      class: _ctx.uiMenu.label
                    }, toDisplayString(_ctx.placeholder || "\xA0"), 3))
                  ]),
                  _ctx.isTrailing && _ctx.trailingIconName || _ctx.$slots.trailing ? (openBlock(), createBlock("span", {
                    key: 1,
                    class: _ctx.trailingWrapperIconClass
                  }, [
                    renderSlot(_ctx.$slots, "trailing", {
                      disabled: _ctx.disabled,
                      loading: _ctx.loading
                    }, () => [
                      createVNode(_component_UIcon, {
                        name: _ctx.trailingIconName,
                        class: _ctx.trailingIconClass,
                        "aria-hidden": "true"
                      }, null, 8, ["name", "class"])
                    ])
                  ], 2)) : createCommentVNode("", true)
                ], 16, ["id", "disabled"])
              ])
            ]),
            _: 2
          }, 1032, ["class"])),
          open ? (openBlock(), createBlock("div", {
            key: 1,
            ref: "container",
            class: [_ctx.uiMenu.container, _ctx.uiMenu.width]
          }, [
            createVNode(Transition, mergeProps({ appear: "" }, _ctx.uiMenu.transition), {
              default: withCtx(() => [
                createVNode("div", null, [
                  _ctx.popper.arrow ? (openBlock(), createBlock("div", {
                    key: 0,
                    "data-popper-arrow": "",
                    class: Object.values(_ctx.uiMenu.arrow)
                  }, null, 2)) : createCommentVNode("", true),
                  (openBlock(), createBlock(resolveDynamicComponent(_ctx.searchable ? "HComboboxOptions" : "HListboxOptions"), {
                    static: "",
                    class: [_ctx.uiMenu.base, _ctx.uiMenu.ring, _ctx.uiMenu.rounded, _ctx.uiMenu.shadow, _ctx.uiMenu.background, _ctx.uiMenu.padding, _ctx.uiMenu.height]
                  }, {
                    default: withCtx(() => [
                      _ctx.searchable ? (openBlock(), createBlock(_component_HComboboxInput, {
                        key: 0,
                        "display-value": () => _ctx.query,
                        name: "q",
                        placeholder: _ctx.searchablePlaceholder,
                        autofocus: "",
                        autocomplete: "off",
                        class: _ctx.uiMenu.input,
                        onChange: _ctx.onChange
                      }, null, 8, ["display-value", "placeholder", "class", "onChange"])) : createCommentVNode("", true),
                      (openBlock(true), createBlock(Fragment, null, renderList(_ctx.filteredOptions, (option, index) => {
                        return openBlock(), createBlock(resolveDynamicComponent(_ctx.searchable ? "HComboboxOption" : "HListboxOption"), {
                          key: index,
                          as: "template",
                          value: _ctx.valueAttribute ? option[_ctx.valueAttribute] : option,
                          disabled: option.disabled
                        }, {
                          default: withCtx(({ active, selected, disabled: optionDisabled }) => [
                            createVNode("li", {
                              class: [_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive, selected && _ctx.uiMenu.option.selected, optionDisabled && _ctx.uiMenu.option.disabled]
                            }, [
                              createVNode("div", {
                                class: _ctx.uiMenu.option.container
                              }, [
                                renderSlot(_ctx.$slots, "option", {
                                  option,
                                  active,
                                  selected
                                }, () => [
                                  option.icon ? (openBlock(), createBlock(_component_UIcon, {
                                    key: 0,
                                    name: option.icon,
                                    class: [_ctx.uiMenu.option.icon.base, active ? _ctx.uiMenu.option.icon.active : _ctx.uiMenu.option.icon.inactive, option.iconClass],
                                    "aria-hidden": "true"
                                  }, null, 8, ["name", "class"])) : option.avatar ? (openBlock(), createBlock(_component_UAvatar, mergeProps({ key: 1 }, { size: _ctx.uiMenu.option.avatar.size, ...option.avatar }, {
                                    class: _ctx.uiMenu.option.avatar.base,
                                    "aria-hidden": "true"
                                  }), null, 16, ["class"])) : option.chip ? (openBlock(), createBlock("span", {
                                    key: 2,
                                    class: _ctx.uiMenu.option.chip.base,
                                    style: { background: `#${option.chip}` }
                                  }, null, 6)) : createCommentVNode("", true),
                                  createVNode("span", { class: "truncate" }, toDisplayString(["string", "number"].includes(typeof option) ? option : option[_ctx.optionAttribute]), 1)
                                ])
                              ], 2),
                              selected ? (openBlock(), createBlock("span", {
                                key: 0,
                                class: [_ctx.uiMenu.option.selectedIcon.wrapper, _ctx.uiMenu.option.selectedIcon.padding]
                              }, [
                                createVNode(_component_UIcon, {
                                  name: _ctx.selectedIcon,
                                  class: _ctx.uiMenu.option.selectedIcon.base,
                                  "aria-hidden": "true"
                                }, null, 8, ["name", "class"])
                              ], 2)) : createCommentVNode("", true)
                            ], 2)
                          ]),
                          _: 2
                        }, 1032, ["value", "disabled"]);
                      }), 128)),
                      _ctx.creatable && _ctx.createOption ? (openBlock(), createBlock(resolveDynamicComponent(_ctx.searchable ? "HComboboxOption" : "HListboxOption"), {
                        key: 1,
                        value: _ctx.createOption,
                        as: "template"
                      }, {
                        default: withCtx(({ active, selected }) => [
                          createVNode("li", {
                            class: [_ctx.uiMenu.option.base, _ctx.uiMenu.option.rounded, _ctx.uiMenu.option.padding, _ctx.uiMenu.option.size, _ctx.uiMenu.option.color, active ? _ctx.uiMenu.option.active : _ctx.uiMenu.option.inactive]
                          }, [
                            createVNode("div", {
                              class: _ctx.uiMenu.option.container
                            }, [
                              renderSlot(_ctx.$slots, "option-create", {
                                option: _ctx.createOption,
                                active,
                                selected
                              }, () => [
                                createVNode("span", {
                                  class: _ctx.uiMenu.option.create
                                }, 'Create "' + toDisplayString(_ctx.createOption[_ctx.optionAttribute]) + '"', 3)
                              ])
                            ], 2)
                          ], 2)
                        ]),
                        _: 3
                      }, 8, ["value"])) : _ctx.searchable && _ctx.query && !_ctx.filteredOptions.length ? (openBlock(), createBlock("p", {
                        key: 2,
                        class: _ctx.uiMenu.option.empty
                      }, [
                        renderSlot(_ctx.$slots, "option-empty", { query: _ctx.query }, () => [
                          createTextVNode(' No results for "' + toDisplayString(_ctx.query) + '". ', 1)
                        ])
                      ], 2)) : !_ctx.filteredOptions.length ? (openBlock(), createBlock("p", {
                        key: 3,
                        class: _ctx.uiMenu.empty
                      }, [
                        renderSlot(_ctx.$slots, "empty", { query: _ctx.query }, () => [
                          createTextVNode(" No options. ")
                        ])
                      ], 2)) : createCommentVNode("", true)
                    ]),
                    _: 3
                  }, 8, ["class"]))
                ])
              ]),
              _: 3
            }, 16)
          ], 2)) : createCommentVNode("", true)
        ];
      }
    }),
    _: 3
  }), _parent);
}
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("node_modules/@nuxt/ui/dist/runtime/components/forms/SelectMenu.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};
const __nuxt_component_9 = /* @__PURE__ */ _export_sfc(_sfc_main, [["ssrRender", _sfc_ssrRender]]);

export { __nuxt_component_9 as _ };
//# sourceMappingURL=SelectMenu-OetydX8Z.mjs.map
