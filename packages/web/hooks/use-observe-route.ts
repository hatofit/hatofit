import { useEffect } from "react";

export default function useObserveRoute(
  func: (url: string) => void,
  onStarFunc: (url: string) => void
) {
  useEffect(() => {
    const observeUrlChange = () => {
      let oldHref = document.location.href;
      func(oldHref);
      const body = document.querySelector("body");
      const observer = new MutationObserver(mutations => {
        if (oldHref !== document.location.href) {
          oldHref = document.location.href;
          onStarFunc(oldHref)
        }
      });
      observer.observe(document.body, { childList: true, subtree: true });
    };

    observeUrlChange()

    return () => {
      window.removeEventListener('DOMContentLoaded', observeUrlChange);
    };
  }, [])
}
