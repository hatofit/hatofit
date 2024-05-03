import { t as t$1 } from './usePopper-BvwpwiAU.mjs';

let t = [];
function o() {
  let a = [], s = { addEventListener(e, t2, r, i) {
    return e.addEventListener(t2, r, i), s.add(() => e.removeEventListener(t2, r, i));
  }, requestAnimationFrame(...e) {
    let t2 = requestAnimationFrame(...e);
    s.add(() => cancelAnimationFrame(t2));
  }, nextFrame(...e) {
    s.requestAnimationFrame(() => {
      s.requestAnimationFrame(...e);
    });
  }, setTimeout(...e) {
    let t2 = setTimeout(...e);
    s.add(() => clearTimeout(t2));
  }, microTask(...e) {
    let t2 = { current: true };
    return t$1(() => {
      t2.current && e[0]();
    }), s.add(() => {
      t2.current = false;
    });
  }, style(e, t2, r) {
    let i = e.style.getPropertyValue(t2);
    return Object.assign(e.style, { [t2]: r }), this.add(() => {
      Object.assign(e.style, { [t2]: i });
    });
  }, group(e) {
    let t2 = o();
    return e(t2), this.add(() => t2.dispose());
  }, add(e) {
    return a.push(e), () => {
      let t2 = a.indexOf(e);
      if (t2 >= 0)
        for (let r of a.splice(t2, 1))
          r();
    };
  }, dispose() {
    for (let e of a.splice(0))
      e();
  } };
  return s;
}

export { o, t };
//# sourceMappingURL=disposables-BdeHelVJ.mjs.map
