exports.id = 463;
exports.ids = [463];
exports.modules = {

/***/ 53289:
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

Promise.resolve(/* import() eager */).then(__webpack_require__.bind(__webpack_require__, 90480))

/***/ }),

/***/ 90480:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (/* binding */ DashboardCompanyDetailPage)
/* harmony export */ });
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(56786);
/* harmony import */ var react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__);
/* harmony import */ var _components_layout_container__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(84358);
/* harmony import */ var _hooks_use_observe_route__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(84699);
/* harmony import */ var _iconify_react__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(12155);
/* harmony import */ var next_auth_react__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(86457);
/* harmony import */ var next_auth_react__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(next_auth_react__WEBPACK_IMPORTED_MODULE_4__);
/* harmony import */ var next_link__WEBPACK_IMPORTED_MODULE_5__ = __webpack_require__(21945);
/* harmony import */ var next_link__WEBPACK_IMPORTED_MODULE_5___default = /*#__PURE__*/__webpack_require__.n(next_link__WEBPACK_IMPORTED_MODULE_5__);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_6__ = __webpack_require__(18038);
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_6___default = /*#__PURE__*/__webpack_require__.n(react__WEBPACK_IMPORTED_MODULE_6__);
/* __next_internal_client_entry_do_not_use__ default auto */ 






// import { DashboardCompanySection } from "./section";
const isMenuActive = (href)=>{
    return window.location.pathname.split("/").join("/") === href;
};
async function getCompanyDetail(token, id) {
    const url = `${"http://localhost:3000"}/api/company/${id}`;
    const res = await fetch(url, {
        cache: "no-cache",
        headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${token}`
        }
    });
    if (!res.ok) {
        throw new Error("Failed to fetch data");
    }
    return await res.json();
}
function DashboardCompanyDetailPage({ params, children }) {
    const Menus = (0,react__WEBPACK_IMPORTED_MODULE_6__.useMemo)(()=>[
            {
                type: "item",
                title: "Dashboard",
                icon: "uil:dashboard",
                href: `/dashboard/company/${params.slug}`
            },
            {
                type: "item",
                title: "Members",
                icon: "uil:users-alt",
                href: `/dashboard/company/${params.slug}/members`
            },
            {
                type: "item",
                title: "Owners",
                icon: "uil:user-md",
                href: `/dashboard/company/${params.slug}/owners`
            },
            {
                type: "spacer"
            },
            {
                type: "item",
                title: "Settings",
                icon: "ic:outline-settings-suggest",
                href: `/dashboard/company/${params.slug}/setting`
            }
        ], [
        params
    ]);
    const [cR, sCr] = (0,react__WEBPACK_IMPORTED_MODULE_6__.useState)(window?.location?.pathname || "");
    (0,_hooks_use_observe_route__WEBPACK_IMPORTED_MODULE_2__/* ["default"] */ .Z)(()=>sCr(window.location.pathname), ()=>sCr(window.location.pathname));
    const { data } = (0,next_auth_react__WEBPACK_IMPORTED_MODULE_4__.useSession)();
    const [companyData, setCompanyData] = (0,react__WEBPACK_IMPORTED_MODULE_6__.useState)({});
    (0,react__WEBPACK_IMPORTED_MODULE_6__.useEffect)(()=>{
        if (data && data?.user) {
            getCompanyDetail(data?.user?.token, params.slug).then((res)=>setCompanyData(res?.company || {}));
        }
    }, [
        data,
        params
    ]);
    return /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)(react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.Fragment, {
        children: [
            /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("div", {
                className: "bg-gray-950 w-full py-2",
                children: /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx(_components_layout_container__WEBPACK_IMPORTED_MODULE_1__/* ["default"] */ .Z, {
                    children: /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)("h1", {
                        children: [
                            /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx((next_link__WEBPACK_IMPORTED_MODULE_5___default()), {
                                href: `/dashboard/company`,
                                children: "Company"
                            }),
                            " ",
                            ">",
                            " ",
                            companyData?.name
                        ]
                    })
                })
            }),
            /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("div", {
                className: "flex min-h-[calc(100vh_-_72px)] py-4",
                children: /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)(_components_layout_container__WEBPACK_IMPORTED_MODULE_1__/* ["default"] */ .Z, {
                    className: "flex gap-4",
                    children: [
                        /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("div", {
                            className: "w-[200px]",
                            children: /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("div", {
                                className: "bg-transparent rounded-lg shadow-lg",
                                children: /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("ul", {
                                    className: "flex flex-col",
                                    children: Menus.map((menu, index)=>/*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)(react__WEBPACK_IMPORTED_MODULE_6__.Fragment, {
                                            children: [
                                                menu.type === "item" && menu.href && /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("li", {
                                                    children: /*#__PURE__*/ (0,react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsxs)((next_link__WEBPACK_IMPORTED_MODULE_5___default()), {
                                                        href: menu.href,
                                                        className: `flex items-center gap-4 hover:bg-gray-800/80 px-4 py-2 rounded ${isMenuActive(menu.href) ? "bg-gray-800/80" : ""}`,
                                                        children: [
                                                            /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx(_iconify_react__WEBPACK_IMPORTED_MODULE_3__/* .Icon */ .JO, {
                                                                icon: menu.icon,
                                                                className: "text-xl"
                                                            }),
                                                            /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("span", {
                                                                className: "text-sm text-gray-100",
                                                                children: menu.title
                                                            })
                                                        ]
                                                    }, Math.random())
                                                }),
                                                menu.type === "spacer" && /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("li", {
                                                    children: /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("div", {
                                                        className: "w-full h-0.5 mt-2 mb-2 bg-gray-950/75"
                                                    })
                                                })
                                            ]
                                        }, index))
                                })
                            })
                        }),
                        /*#__PURE__*/ react_jsx_runtime__WEBPACK_IMPORTED_MODULE_0__.jsx("div", {
                            className: "flex-1 flex",
                            children: children
                        })
                    ]
                })
            })
        ]
    });
}


/***/ }),

/***/ 44259:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   $$typeof: () => (/* binding */ $$typeof),
/* harmony export */   __esModule: () => (/* binding */ __esModule),
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var next_dist_build_webpack_loaders_next_flight_loader_module_proxy__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(54698);

const proxy = (0,next_dist_build_webpack_loaders_next_flight_loader_module_proxy__WEBPACK_IMPORTED_MODULE_0__.createProxy)(String.raw`/Users/viandwi24/projects/learn/hatofit/packages/web/app/dashboard/company/[slug]/layout.tsx`)

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