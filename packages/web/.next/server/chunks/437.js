exports.id = 437;
exports.ids = [437];
exports.modules = {

/***/ 5848:
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

Promise.resolve(/* import() eager */).then(__webpack_require__.t.bind(__webpack_require__, 4773, 23));
Promise.resolve(/* import() eager */).then(__webpack_require__.t.bind(__webpack_require__, 9887, 23));
Promise.resolve(/* import() eager */).then(__webpack_require__.t.bind(__webpack_require__, 9948, 23));
Promise.resolve(/* import() eager */).then(__webpack_require__.t.bind(__webpack_require__, 5743, 23));
Promise.resolve(/* import() eager */).then(__webpack_require__.t.bind(__webpack_require__, 3946, 23))

/***/ }),

/***/ 7449:
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

Promise.resolve(/* import() eager */).then(__webpack_require__.bind(__webpack_require__, 5874))

/***/ }),

/***/ 5874:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "default": () => (/* binding */ ColorModeProvider)
});

// EXTERNAL MODULE: external "next/dist/compiled/react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(6786);
// EXTERNAL MODULE: external "next/dist/compiled/react"
var react_ = __webpack_require__(8038);
;// CONCATENATED MODULE: ./src/lib/use-local-storage.tsx
/* __next_internal_client_entry_do_not_use__ default auto */ 
const useLocalStorage = (key, initialValue)=>{
    const [value, setValue] = (0,react_.useState)(()=>{
        if (false) {}
        return initialValue;
    });
    (0,react_.useEffect)(()=>{
        if (false) {}
    }, [
        key,
        value
    ]);
    return [
        value,
        setValue
    ];
};
/* harmony default export */ const use_local_storage = (useLocalStorage);

;// CONCATENATED MODULE: ./src/lib/use-color-mode.tsx
/* __next_internal_client_entry_do_not_use__ default auto */ 

const useColorMode = ()=>{
    const [colorMode, setColorMode] = use_local_storage("color-mode", "dark");
    (0,react_.useEffect)(()=>{
        const className = "dark";
        const bodyClasses = window.document.body.parentElement?.classList;
        colorMode === "dark" ? bodyClasses?.add(className) : bodyClasses?.remove(className);
    }, [
        colorMode
    ]);
    return [
        colorMode,
        setColorMode
    ];
};
/* harmony default export */ const use_color_mode = (useColorMode);

;// CONCATENATED MODULE: ./src/components/color-mode-provider.tsx
/* __next_internal_client_entry_do_not_use__ default auto */ 


function ColorModeProvider(props) {
    const [colorMode] = use_color_mode();
    return /*#__PURE__*/ jsx_runtime_.jsx(jsx_runtime_.Fragment, {
        children: props.children
    });
}


/***/ }),

/***/ 7931:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
// ESM COMPAT FLAG
__webpack_require__.r(__webpack_exports__);

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  "default": () => (/* binding */ RootLayout),
  metadata: () => (/* binding */ metadata)
});

// EXTERNAL MODULE: external "next/dist/compiled/react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(6786);
// EXTERNAL MODULE: ../../node_modules/.pnpm/next@13.4.7_react-dom@18.2.0_react@18.2.0/node_modules/next/font/google/target.css?{"path":"src/app/layout.tsx","import":"Inter","arguments":[{"subsets":["latin"]}],"variableName":"inter"}
var layout_tsx_import_Inter_arguments_subsets_latin_variableName_inter_ = __webpack_require__(5125);
var layout_tsx_import_Inter_arguments_subsets_latin_variableName_inter_default = /*#__PURE__*/__webpack_require__.n(layout_tsx_import_Inter_arguments_subsets_latin_variableName_inter_);
// EXTERNAL MODULE: ./src/app/globals.css
var globals = __webpack_require__(3188);
// EXTERNAL MODULE: ../../node_modules/.pnpm/next@13.4.7_react-dom@18.2.0_react@18.2.0/node_modules/next/dist/build/webpack/loaders/next-flight-loader/module-proxy.js
var module_proxy = __webpack_require__(2327);
;// CONCATENATED MODULE: ./src/components/color-mode-provider.tsx

const proxy = (0,module_proxy.createProxy)(String.raw`/Users/viandwi24/projects/learn/polar_hr_devices/packages/web/src/components/color-mode-provider.tsx`)

// Accessing the __esModule property and exporting $$typeof are required here.
// The __esModule getter forces the proxy target to create the default export
// and the $$typeof value is for rendering logic to determine if the module
// is a client boundary.
const { __esModule, $$typeof } = proxy;
const __default__ = proxy.default;


/* harmony default export */ const color_mode_provider = (__default__);
;// CONCATENATED MODULE: ./src/app/layout.tsx




const metadata = {
    title: "Hatofit",
    description: "your personal trainer assistant"
};
function RootLayout({ children }) {
    return /*#__PURE__*/ jsx_runtime_.jsx("html", {
        lang: "en",
        children: /*#__PURE__*/ jsx_runtime_.jsx("body", {
            className: `${(layout_tsx_import_Inter_arguments_subsets_latin_variableName_inter_default()).className} dark dark:bg-gray-950 dark:text-gray-100`,
            children: /*#__PURE__*/ jsx_runtime_.jsx(color_mode_provider, {
                children: /*#__PURE__*/ (0,jsx_runtime_.jsxs)("div", {
                    className: "flex flex-col min-h-screen",
                    children: [
                        /*#__PURE__*/ jsx_runtime_.jsx("div", {
                            className: "shadow border-b-2 border-white/[0.2]",
                            children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
                                className: "flex flex-col max-w-screen-lg w-full mx-auto py-6",
                                children: /*#__PURE__*/ jsx_runtime_.jsx("h1", {
                                    className: "text-4xl font-bold",
                                    children: "HATOFIT"
                                })
                            })
                        }),
                        /*#__PURE__*/ jsx_runtime_.jsx("div", {
                            className: "flex-1 flex dark:bg-gray-800",
                            children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
                                className: "flex-1 flex",
                                children: children
                            })
                        }),
                        /*#__PURE__*/ jsx_runtime_.jsx("div", {
                            className: "shadow border-b-2 border-white/[0.2] dark:bg-gray-950/[0.7]",
                            children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
                                className: "flex flex-col max-w-screen-lg w-full mx-auto py-6",
                                children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
                                    className: "flex justify-between items-center text-gray-400 text-sm",
                                    children: /*#__PURE__*/ jsx_runtime_.jsx("div", {
                                        children: "\xa9 2023 Hatofit all rights reserved"
                                    })
                                })
                            })
                        })
                    ]
                })
            })
        })
    });
}


/***/ }),

/***/ 9441:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var next_dist_lib_metadata_get_metadata_route__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(4348);
/* harmony import */ var next_dist_lib_metadata_get_metadata_route__WEBPACK_IMPORTED_MODULE_0___default = /*#__PURE__*/__webpack_require__.n(next_dist_lib_metadata_get_metadata_route__WEBPACK_IMPORTED_MODULE_0__);
  

  /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ((props) => {
    const imageData = {"type":"image/x-icon","sizes":"any"}
    const imageUrl = (0,next_dist_lib_metadata_get_metadata_route__WEBPACK_IMPORTED_MODULE_0__.fillMetadataSegment)(".", props.params, "favicon.ico")

    return [{
      ...imageData,
      url: imageUrl + "",
    }]
  });

/***/ }),

/***/ 3188:
/***/ (() => {



/***/ })

};
;