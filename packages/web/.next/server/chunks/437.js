"use strict";
exports.id = 437;
exports.ids = [437];
exports.modules = {

/***/ 7437:
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {


// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  zx: () => (/* binding */ Button),
  Zb: () => (/* binding */ Card),
  II: () => (/* binding */ Input)
});

// EXTERNAL MODULE: external "next/dist/compiled/react/jsx-runtime"
var jsx_runtime_ = __webpack_require__(56786);
;// CONCATENATED MODULE: ./utils/obj.ts
function allObjExcept(obj, keys) {
    const newObj = {
        ...obj
    };
    keys.forEach((key)=>{
        delete newObj[key];
    });
    return newObj;
}

;// CONCATENATED MODULE: ./components/ui/index.tsx


function Button(props) {
    return /*#__PURE__*/ jsx_runtime_.jsx("button", {
        // vercel button themes
        className: "duration-300 transition-all px-4 py-2 rounded-md dark:bg-gray-700 dark:hover:bg-gray-600 bg-gray-100 hover:bg-gray-200",
        ...props
    });
}
var Card;
(function(Card) {
    function Wrapper(props) {
        return /*#__PURE__*/ jsx_runtime_.jsx("div", {
            className: `bg-transparent rounded-lg shadow-lg p-6 border-2 border-gray-800 ${props?.className}`,
            ...allObjExcept(props, [
                "className"
            ])
        });
    }
    Card.Wrapper = Wrapper;
    function HeaderTitle(props) {
        return /*#__PURE__*/ jsx_runtime_.jsx("div", {
            className: "text-xl font-bold mb-4",
            children: props?.children
        });
    }
    Card.HeaderTitle = HeaderTitle;
})(Card || (Card = {}));
var Input;
(function(Input) {
    function Text(props) {
        return /*#__PURE__*/ jsx_runtime_.jsx("input", {
            type: "text",
            className: "flex-1 px-4 py-2 rounded-lg",
            ...props
        });
    }
    Input.Text = Text;
    function Select(props) {
        return /*#__PURE__*/ jsx_runtime_.jsx("select", {
            className: "flex-1 px-4 py-2 rounded-lg",
            ...props,
            children: props.data.map((item, index)=>/*#__PURE__*/ jsx_runtime_.jsx("option", {
                    value: item.value,
                    children: item.text
                }, index))
        });
    }
    Input.Select = Select;
})(Input || (Input = {}));


/***/ })

};
;