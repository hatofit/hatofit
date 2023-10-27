exports.id = 269;
exports.ids = [269];
exports.modules = {

/***/ 57344:
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

Promise.resolve(/* import() eager */).then(__webpack_require__.bind(__webpack_require__, 25775))

/***/ }),

/***/ 25775:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "default": () => (/* binding */ DashboardLayout)
});

// EXTERNAL MODULE: external "next/dist/compiled/react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(56786);
// EXTERNAL MODULE: ../../node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/navigation.js
var navigation = __webpack_require__(39589);
// EXTERNAL MODULE: ../../node_modules/.pnpm/next-auth@4.23.1_next@13.4.17_react-dom@18.2.0_react@18.2.0/node_modules/next-auth/react/index.js
var react = __webpack_require__(86457);
// EXTERNAL MODULE: ./components/layout/container.tsx
var container = __webpack_require__(84358);
// EXTERNAL MODULE: ./hooks/use-observe-route.ts
var use_observe_route = __webpack_require__(84699);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@iconify+react@4.1.1_react@18.2.0/node_modules/@iconify/react/dist/iconify.mjs
var iconify = __webpack_require__(12155);
// EXTERNAL MODULE: ../../node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/link.js
var next_link = __webpack_require__(21945);
var link_default = /*#__PURE__*/__webpack_require__.n(next_link);
// EXTERNAL MODULE: external "next/dist/compiled/react"
var react_ = __webpack_require__(18038);
;// CONCATENATED MODULE: ./app/dashboard/sidebar.tsx
/* __next_internal_client_entry_do_not_use__ Menus,default auto */ 






const Menus = [
    {
        type: "item",
        title: "Dashboard",
        icon: "uil:dashboard",
        href: "/dashboard"
    },
    {
        type: "spacer"
    },
    {
        type: "item",
        title: "My Exercises",
        icon: "material-symbols:exercise-outline",
        href: "/dashboard/exercise"
    },
    {
        type: "item",
        title: "Shared Exercises",
        icon: "material-symbols:exercise-outline",
        href: "/dashboard/shared-exercise"
    },
    {
        type: "spacer"
    },
    {
        type: "item",
        title: "Company",
        icon: "mdi:company",
        href: "/dashboard/company"
    },
    {
        type: "spacer"
    },
    {
        type: "item",
        title: "Settings",
        icon: "ic:outline-settings-suggest",
        href: "/dashboard/setting"
    }
];
function Sidebar() {
    const router = (0,navigation.useRouter)();
    const { data, status } = (0,react.useSession)();
    const [c, sc] = (0,react_.useState)(1);
    (0,use_observe_route/* default */.Z)(()=>sc((v)=>v + 1), ()=>sc((v)=>v + 1));
    const isMenuActive = (href)=>{
        // const allMenusActivated = Menus.map(menu => {
        //   console.log('[]', window.location.pathname.split('/').join('/'), menu.href)
        //   return window.location.pathname.split('/').join('/') === menu.href
        // })
        return window.location.pathname.split("/").join("/") === href;
    // let res = true
    // if (allMenusActivated.filter(menu => menu).length === 0) {
    //   res = false
    // } else if (allMenusActivated.filter(menu => menu).length === 1) {
    //   res = window.location.pathname.replaceAll('/', '').startsWith(href.replaceAll('/', ''))
    // } else {
    //   res = window.location.pathname.replaceAll('/', '').startsWith(href.replaceAll('/', ''))
    // }
    // return res
    };
    return /*#__PURE__*/ jsx_runtime_.jsx("div", {
        className: "w-[200px]",
        children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
            className: "bg-transparent rounded-lg shadow-lg",
            children: /*#__PURE__*/ jsx_runtime_.jsx("ul", {
                className: "flex flex-col",
                children: Menus.map((menu, index)=>/*#__PURE__*/ (0,jsx_runtime_.jsxs)(react_.Fragment, {
                        children: [
                            menu.type === "item" && menu.href && /*#__PURE__*/ jsx_runtime_.jsx("li", {
                                children: /*#__PURE__*/ (0,jsx_runtime_.jsxs)((link_default()), {
                                    href: menu.href,
                                    className: `flex items-center gap-4 hover:bg-gray-800/80 px-4 py-2 rounded ${isMenuActive(menu.href) ? "bg-gray-800/80" : ""}`,
                                    children: [
                                        /*#__PURE__*/ jsx_runtime_.jsx(iconify/* Icon */.JO, {
                                            icon: menu.icon,
                                            className: "text-xl"
                                        }),
                                        /*#__PURE__*/ jsx_runtime_.jsx("span", {
                                            className: "text-sm text-gray-100",
                                            children: menu.title
                                        })
                                    ]
                                }, Math.random())
                            }),
                            menu.type === "spacer" && /*#__PURE__*/ jsx_runtime_.jsx("li", {
                                children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
                                    className: "w-full h-0.5 mt-2 mb-2 bg-gray-950/75"
                                })
                            })
                        ]
                    }, index))
            })
        })
    });
}

;// CONCATENATED MODULE: ./app/dashboard/layout.tsx
/* __next_internal_client_entry_do_not_use__ default auto */ 






function DashboardLayout({ children }) {
    const pathname = (0,navigation.usePathname)();
    const { data, status } = (0,react.useSession)({
        required: true,
        onUnauthenticated () {
            return (0,navigation.redirect)("/login");
        }
    });
    const [cR, sCr] = (0,react_.useState)(window?.location?.pathname || "");
    const isNoSidebar = (0,react_.useMemo)(()=>{
        return cR.includes("dashboard/report/");
    }, [
        cR
    ]);
    (0,use_observe_route/* default */.Z)(()=>sCr(window.location.pathname), ()=>sCr(window.location.pathname));
    const isAllowerdUseLayout = (0,react_.useMemo)(()=>{
        const notAllowedList = [
            "/dashboard/company/"
        ];
        for (const route of notAllowedList){
            if (pathname.startsWith(route)) return false;
        }
        return true;
    }, [
        pathname
    ]);
    return /*#__PURE__*/ (0,jsx_runtime_.jsxs)(jsx_runtime_.Fragment, {
        children: [
            isAllowerdUseLayout && /*#__PURE__*/ jsx_runtime_.jsx("div", {
                className: "flex min-h-[calc(100vh_-_72px)] py-4",
                children: /*#__PURE__*/ (0,jsx_runtime_.jsxs)(container/* default */.Z, {
                    className: "flex gap-4",
                    children: [
                        !isNoSidebar && /*#__PURE__*/ jsx_runtime_.jsx(Sidebar, {}),
                        /*#__PURE__*/ jsx_runtime_.jsx("div", {
                            className: "flex-1 flex",
                            children: children
                        })
                    ]
                })
            }),
            !isAllowerdUseLayout && children
        ]
    });
}


/***/ }),

/***/ 84699:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   Z: () => (/* binding */ useObserveRoute)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_0__);

function useObserveRoute(func, onStarFunc) {
    (0,react__WEBPACK_IMPORTED_MODULE_0__.useEffect)(()=>{
        const observeUrlChange = ()=>{
            let oldHref = document.location.href;
            func(oldHref);
            const body = document.querySelector("body");
            const observer = new MutationObserver((mutations)=>{
                if (oldHref !== document.location.href) {
                    oldHref = document.location.href;
                    onStarFunc(oldHref);
                }
            });
            observer.observe(document.body, {
                childList: true,
                subtree: true
            });
        };
        observeUrlChange();
        return ()=>{
            window.removeEventListener("DOMContentLoaded", observeUrlChange);
        };
    }, []);
}


/***/ }),

/***/ 54924:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   $$typeof: () => (/* binding */ $$typeof),
/* harmony export */   __esModule: () => (/* binding */ __esModule),
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var next_dist_build_webpack_loaders_next_flight_loader_module_proxy__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(54698);

const proxy = (0,next_dist_build_webpack_loaders_next_flight_loader_module_proxy__WEBPACK_IMPORTED_MODULE_0__.createProxy)(String.raw`/Users/viandwi24/projects/learn/hatofit/packages/web/app/dashboard/layout.tsx`)

// Accessing the __esModule property and exporting $$typeof are required here.
// The __esModule getter forces the proxy target to create the default export
// and the $$typeof value is for rendering logic to determine if the module
// is a client boundary.
const { __esModule, $$typeof } = proxy;
const __default__ = proxy.default;


/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (__default__);

/***/ })

};
;