exports.id = 390;
exports.ids = [390];
exports.modules = {

/***/ 67486:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(40207);

Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.BroadcastChannel = BroadcastChannel;
exports.apiBaseUrl = apiBaseUrl;
exports.fetchData = fetchData;
exports.now = now;

var _regenerator = _interopRequireDefault(__webpack_require__(94957));

var _defineProperty2 = _interopRequireDefault(__webpack_require__(86126));

var _asyncToGenerator2 = _interopRequireDefault(__webpack_require__(15357));

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? ownKeys(Object(source), !0).forEach(function (key) { (0, _defineProperty2.default)(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }

function fetchData(_x, _x2, _x3) {
  return _fetchData.apply(this, arguments);
}

function _fetchData() {
  _fetchData = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee(path, __NEXTAUTH, logger) {
    var _ref,
        ctx,
        _ref$req,
        req,
        url,
        _req$headers,
        options,
        res,
        data,
        _args = arguments;

    return _regenerator.default.wrap(function _callee$(_context) {
      while (1) {
        switch (_context.prev = _context.next) {
          case 0:
            _ref = _args.length > 3 && _args[3] !== undefined ? _args[3] : {}, ctx = _ref.ctx, _ref$req = _ref.req, req = _ref$req === void 0 ? ctx === null || ctx === void 0 ? void 0 : ctx.req : _ref$req;
            url = "".concat(apiBaseUrl(__NEXTAUTH), "/").concat(path);
            _context.prev = 2;
            options = {
              headers: _objectSpread({
                "Content-Type": "application/json"
              }, req !== null && req !== void 0 && (_req$headers = req.headers) !== null && _req$headers !== void 0 && _req$headers.cookie ? {
                cookie: req.headers.cookie
              } : {})
            };

            if (req !== null && req !== void 0 && req.body) {
              options.body = JSON.stringify(req.body);
              options.method = "POST";
            }

            _context.next = 7;
            return fetch(url, options);

          case 7:
            res = _context.sent;
            _context.next = 10;
            return res.json();

          case 10:
            data = _context.sent;

            if (res.ok) {
              _context.next = 13;
              break;
            }

            throw data;

          case 13:
            return _context.abrupt("return", Object.keys(data).length > 0 ? data : null);

          case 16:
            _context.prev = 16;
            _context.t0 = _context["catch"](2);
            logger.error("CLIENT_FETCH_ERROR", {
              error: _context.t0,
              url: url
            });
            return _context.abrupt("return", null);

          case 20:
          case "end":
            return _context.stop();
        }
      }
    }, _callee, null, [[2, 16]]);
  }));
  return _fetchData.apply(this, arguments);
}

function apiBaseUrl(__NEXTAUTH) {
  if (typeof window === "undefined") {
    return "".concat(__NEXTAUTH.baseUrlServer).concat(__NEXTAUTH.basePathServer);
  }

  return __NEXTAUTH.basePath;
}

function now() {
  return Math.floor(Date.now() / 1000);
}

function BroadcastChannel() {
  var name = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : "nextauth.message";
  return {
    receive: function receive(onReceive) {
      var handler = function handler(event) {
        var _event$newValue;

        if (event.key !== name) return;
        var message = JSON.parse((_event$newValue = event.newValue) !== null && _event$newValue !== void 0 ? _event$newValue : "{}");
        if ((message === null || message === void 0 ? void 0 : message.event) !== "session" || !(message !== null && message !== void 0 && message.data)) return;
        onReceive(message);
      };

      window.addEventListener("storage", handler);
      return function () {
        return window.removeEventListener("storage", handler);
      };
    },
    post: function post(message) {
      if (typeof window === "undefined") return;

      try {
        localStorage.setItem(name, JSON.stringify(_objectSpread(_objectSpread({}, message), {}, {
          timestamp: now()
        })));
      } catch (_unused) {}
    }
  };
}

/***/ }),

/***/ 74391:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(40207);

Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.UnsupportedStrategy = exports.UnknownError = exports.OAuthCallbackError = exports.MissingSecret = exports.MissingAuthorize = exports.MissingAdapterMethods = exports.MissingAdapter = exports.MissingAPIRoute = exports.InvalidCallbackUrl = exports.AccountNotLinkedError = void 0;
exports.adapterErrorHandler = adapterErrorHandler;
exports.capitalize = capitalize;
exports.eventsErrorHandler = eventsErrorHandler;
exports.upperSnake = upperSnake;

var _regenerator = _interopRequireDefault(__webpack_require__(94957));

var _asyncToGenerator2 = _interopRequireDefault(__webpack_require__(15357));

var _assertThisInitialized2 = _interopRequireDefault(__webpack_require__(99650));

var _defineProperty2 = _interopRequireDefault(__webpack_require__(86126));

var _classCallCheck2 = _interopRequireDefault(__webpack_require__(39472));

var _createClass2 = _interopRequireDefault(__webpack_require__(44204));

var _inherits2 = _interopRequireDefault(__webpack_require__(66250));

var _possibleConstructorReturn2 = _interopRequireDefault(__webpack_require__(888));

var _getPrototypeOf2 = _interopRequireDefault(__webpack_require__(80278));

var _wrapNativeSuper2 = _interopRequireDefault(__webpack_require__(19172));

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function _createSuperInternal() { var Super = (0, _getPrototypeOf2.default)(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = (0, _getPrototypeOf2.default)(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return (0, _possibleConstructorReturn2.default)(this, result); }; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); return true; } catch (e) { return false; } }

var UnknownError = function (_Error) {
  (0, _inherits2.default)(UnknownError, _Error);

  var _super = _createSuper(UnknownError);

  function UnknownError(error) {
    var _message;

    var _this;

    (0, _classCallCheck2.default)(this, UnknownError);
    _this = _super.call(this, (_message = error === null || error === void 0 ? void 0 : error.message) !== null && _message !== void 0 ? _message : error);
    _this.name = "UnknownError";
    _this.code = error.code;

    if (error instanceof Error) {
      _this.stack = error.stack;
    }

    return _this;
  }

  (0, _createClass2.default)(UnknownError, [{
    key: "toJSON",
    value: function toJSON() {
      return {
        name: this.name,
        message: this.message,
        stack: this.stack
      };
    }
  }]);
  return UnknownError;
}((0, _wrapNativeSuper2.default)(Error));

exports.UnknownError = UnknownError;

var OAuthCallbackError = function (_UnknownError) {
  (0, _inherits2.default)(OAuthCallbackError, _UnknownError);

  var _super2 = _createSuper(OAuthCallbackError);

  function OAuthCallbackError() {
    var _this2;

    (0, _classCallCheck2.default)(this, OAuthCallbackError);

    for (var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++) {
      args[_key] = arguments[_key];
    }

    _this2 = _super2.call.apply(_super2, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this2), "name", "OAuthCallbackError");
    return _this2;
  }

  return (0, _createClass2.default)(OAuthCallbackError);
}(UnknownError);

exports.OAuthCallbackError = OAuthCallbackError;

var AccountNotLinkedError = function (_UnknownError2) {
  (0, _inherits2.default)(AccountNotLinkedError, _UnknownError2);

  var _super3 = _createSuper(AccountNotLinkedError);

  function AccountNotLinkedError() {
    var _this3;

    (0, _classCallCheck2.default)(this, AccountNotLinkedError);

    for (var _len2 = arguments.length, args = new Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
      args[_key2] = arguments[_key2];
    }

    _this3 = _super3.call.apply(_super3, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this3), "name", "AccountNotLinkedError");
    return _this3;
  }

  return (0, _createClass2.default)(AccountNotLinkedError);
}(UnknownError);

exports.AccountNotLinkedError = AccountNotLinkedError;

var MissingAPIRoute = function (_UnknownError3) {
  (0, _inherits2.default)(MissingAPIRoute, _UnknownError3);

  var _super4 = _createSuper(MissingAPIRoute);

  function MissingAPIRoute() {
    var _this4;

    (0, _classCallCheck2.default)(this, MissingAPIRoute);

    for (var _len3 = arguments.length, args = new Array(_len3), _key3 = 0; _key3 < _len3; _key3++) {
      args[_key3] = arguments[_key3];
    }

    _this4 = _super4.call.apply(_super4, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this4), "name", "MissingAPIRouteError");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this4), "code", "MISSING_NEXTAUTH_API_ROUTE_ERROR");
    return _this4;
  }

  return (0, _createClass2.default)(MissingAPIRoute);
}(UnknownError);

exports.MissingAPIRoute = MissingAPIRoute;

var MissingSecret = function (_UnknownError4) {
  (0, _inherits2.default)(MissingSecret, _UnknownError4);

  var _super5 = _createSuper(MissingSecret);

  function MissingSecret() {
    var _this5;

    (0, _classCallCheck2.default)(this, MissingSecret);

    for (var _len4 = arguments.length, args = new Array(_len4), _key4 = 0; _key4 < _len4; _key4++) {
      args[_key4] = arguments[_key4];
    }

    _this5 = _super5.call.apply(_super5, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this5), "name", "MissingSecretError");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this5), "code", "NO_SECRET");
    return _this5;
  }

  return (0, _createClass2.default)(MissingSecret);
}(UnknownError);

exports.MissingSecret = MissingSecret;

var MissingAuthorize = function (_UnknownError5) {
  (0, _inherits2.default)(MissingAuthorize, _UnknownError5);

  var _super6 = _createSuper(MissingAuthorize);

  function MissingAuthorize() {
    var _this6;

    (0, _classCallCheck2.default)(this, MissingAuthorize);

    for (var _len5 = arguments.length, args = new Array(_len5), _key5 = 0; _key5 < _len5; _key5++) {
      args[_key5] = arguments[_key5];
    }

    _this6 = _super6.call.apply(_super6, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this6), "name", "MissingAuthorizeError");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this6), "code", "CALLBACK_CREDENTIALS_HANDLER_ERROR");
    return _this6;
  }

  return (0, _createClass2.default)(MissingAuthorize);
}(UnknownError);

exports.MissingAuthorize = MissingAuthorize;

var MissingAdapter = function (_UnknownError6) {
  (0, _inherits2.default)(MissingAdapter, _UnknownError6);

  var _super7 = _createSuper(MissingAdapter);

  function MissingAdapter() {
    var _this7;

    (0, _classCallCheck2.default)(this, MissingAdapter);

    for (var _len6 = arguments.length, args = new Array(_len6), _key6 = 0; _key6 < _len6; _key6++) {
      args[_key6] = arguments[_key6];
    }

    _this7 = _super7.call.apply(_super7, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this7), "name", "MissingAdapterError");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this7), "code", "EMAIL_REQUIRES_ADAPTER_ERROR");
    return _this7;
  }

  return (0, _createClass2.default)(MissingAdapter);
}(UnknownError);

exports.MissingAdapter = MissingAdapter;

var MissingAdapterMethods = function (_UnknownError7) {
  (0, _inherits2.default)(MissingAdapterMethods, _UnknownError7);

  var _super8 = _createSuper(MissingAdapterMethods);

  function MissingAdapterMethods() {
    var _this8;

    (0, _classCallCheck2.default)(this, MissingAdapterMethods);

    for (var _len7 = arguments.length, args = new Array(_len7), _key7 = 0; _key7 < _len7; _key7++) {
      args[_key7] = arguments[_key7];
    }

    _this8 = _super8.call.apply(_super8, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this8), "name", "MissingAdapterMethodsError");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this8), "code", "MISSING_ADAPTER_METHODS_ERROR");
    return _this8;
  }

  return (0, _createClass2.default)(MissingAdapterMethods);
}(UnknownError);

exports.MissingAdapterMethods = MissingAdapterMethods;

var UnsupportedStrategy = function (_UnknownError8) {
  (0, _inherits2.default)(UnsupportedStrategy, _UnknownError8);

  var _super9 = _createSuper(UnsupportedStrategy);

  function UnsupportedStrategy() {
    var _this9;

    (0, _classCallCheck2.default)(this, UnsupportedStrategy);

    for (var _len8 = arguments.length, args = new Array(_len8), _key8 = 0; _key8 < _len8; _key8++) {
      args[_key8] = arguments[_key8];
    }

    _this9 = _super9.call.apply(_super9, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this9), "name", "UnsupportedStrategyError");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this9), "code", "CALLBACK_CREDENTIALS_JWT_ERROR");
    return _this9;
  }

  return (0, _createClass2.default)(UnsupportedStrategy);
}(UnknownError);

exports.UnsupportedStrategy = UnsupportedStrategy;

var InvalidCallbackUrl = function (_UnknownError9) {
  (0, _inherits2.default)(InvalidCallbackUrl, _UnknownError9);

  var _super10 = _createSuper(InvalidCallbackUrl);

  function InvalidCallbackUrl() {
    var _this10;

    (0, _classCallCheck2.default)(this, InvalidCallbackUrl);

    for (var _len9 = arguments.length, args = new Array(_len9), _key9 = 0; _key9 < _len9; _key9++) {
      args[_key9] = arguments[_key9];
    }

    _this10 = _super10.call.apply(_super10, [this].concat(args));
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this10), "name", "InvalidCallbackUrl");
    (0, _defineProperty2.default)((0, _assertThisInitialized2.default)(_this10), "code", "INVALID_CALLBACK_URL_ERROR");
    return _this10;
  }

  return (0, _createClass2.default)(InvalidCallbackUrl);
}(UnknownError);

exports.InvalidCallbackUrl = InvalidCallbackUrl;

function upperSnake(s) {
  return s.replace(/([A-Z])/g, "_$1").toUpperCase();
}

function capitalize(s) {
  return "".concat(s[0].toUpperCase()).concat(s.slice(1));
}

function eventsErrorHandler(methods, logger) {
  return Object.keys(methods).reduce(function (acc, name) {
    acc[name] = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee() {
      var method,
          _args = arguments;
      return _regenerator.default.wrap(function _callee$(_context) {
        while (1) {
          switch (_context.prev = _context.next) {
            case 0:
              _context.prev = 0;
              method = methods[name];
              _context.next = 4;
              return method.apply(void 0, _args);

            case 4:
              return _context.abrupt("return", _context.sent);

            case 7:
              _context.prev = 7;
              _context.t0 = _context["catch"](0);
              logger.error("".concat(upperSnake(name), "_EVENT_ERROR"), _context.t0);

            case 10:
            case "end":
              return _context.stop();
          }
        }
      }, _callee, null, [[0, 7]]);
    }));
    return acc;
  }, {});
}

function adapterErrorHandler(adapter, logger) {
  if (!adapter) return;
  return Object.keys(adapter).reduce(function (acc, name) {
    acc[name] = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee2() {
      var _len10,
          args,
          _key10,
          method,
          e,
          _args2 = arguments;

      return _regenerator.default.wrap(function _callee2$(_context2) {
        while (1) {
          switch (_context2.prev = _context2.next) {
            case 0:
              _context2.prev = 0;

              for (_len10 = _args2.length, args = new Array(_len10), _key10 = 0; _key10 < _len10; _key10++) {
                args[_key10] = _args2[_key10];
              }

              logger.debug("adapter_".concat(name), {
                args: args
              });
              method = adapter[name];
              _context2.next = 6;
              return method.apply(void 0, args);

            case 6:
              return _context2.abrupt("return", _context2.sent);

            case 9:
              _context2.prev = 9;
              _context2.t0 = _context2["catch"](0);
              logger.error("adapter_error_".concat(name), _context2.t0);
              e = new UnknownError(_context2.t0);
              e.name = "".concat(capitalize(name), "Error");
              throw e;

            case 15:
            case "end":
              return _context2.stop();
          }
        }
      }, _callee2, null, [[0, 9]]);
    }));
    return acc;
  }, {});
}

/***/ }),

/***/ 86457:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(40207);

var _typeof = __webpack_require__(40345);

Object.defineProperty(exports, "__esModule", ({
  value: true
}));
var _exportNames = {
  SessionContext: true,
  useSession: true,
  getSession: true,
  getCsrfToken: true,
  getProviders: true,
  signIn: true,
  signOut: true,
  SessionProvider: true
};
exports.SessionContext = void 0;
exports.SessionProvider = SessionProvider;
exports.getCsrfToken = getCsrfToken;
exports.getProviders = getProviders;
exports.getSession = getSession;
exports.signIn = signIn;
exports.signOut = signOut;
exports.useSession = useSession;

var _regenerator = _interopRequireDefault(__webpack_require__(94957));

var _defineProperty2 = _interopRequireDefault(__webpack_require__(86126));

var _asyncToGenerator2 = _interopRequireDefault(__webpack_require__(15357));

var _slicedToArray2 = _interopRequireDefault(__webpack_require__(82237));

var React = _interopRequireWildcard(__webpack_require__(18038));

var _logger2 = _interopRequireWildcard(__webpack_require__(95792));

var _parseUrl = _interopRequireDefault(__webpack_require__(14633));

var _utils = __webpack_require__(67486);

var _jsxRuntime = __webpack_require__(56786);

var _types = __webpack_require__(5152);

Object.keys(_types).forEach(function (key) {
  if (key === "default" || key === "__esModule") return;
  if (Object.prototype.hasOwnProperty.call(_exportNames, key)) return;
  if (key in exports && exports[key] === _types[key]) return;
  Object.defineProperty(exports, key, {
    enumerable: true,
    get: function get() {
      return _types[key];
    }
  });
});

var _process$env$NEXTAUTH, _ref, _process$env$NEXTAUTH2, _process$env$NEXTAUTH3, _React$createContext;

function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function _getRequireWildcardCache(nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }

function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || _typeof(obj) !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? ownKeys(Object(source), !0).forEach(function (key) { (0, _defineProperty2.default)(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }

var __NEXTAUTH = {
  baseUrl: (0, _parseUrl.default)((_process$env$NEXTAUTH = process.env.NEXTAUTH_URL) !== null && _process$env$NEXTAUTH !== void 0 ? _process$env$NEXTAUTH : process.env.VERCEL_URL).origin,
  basePath: (0, _parseUrl.default)(process.env.NEXTAUTH_URL).path,
  baseUrlServer: (0, _parseUrl.default)((_ref = (_process$env$NEXTAUTH2 = process.env.NEXTAUTH_URL_INTERNAL) !== null && _process$env$NEXTAUTH2 !== void 0 ? _process$env$NEXTAUTH2 : process.env.NEXTAUTH_URL) !== null && _ref !== void 0 ? _ref : process.env.VERCEL_URL).origin,
  basePathServer: (0, _parseUrl.default)((_process$env$NEXTAUTH3 = process.env.NEXTAUTH_URL_INTERNAL) !== null && _process$env$NEXTAUTH3 !== void 0 ? _process$env$NEXTAUTH3 : process.env.NEXTAUTH_URL).path,
  _lastSync: 0,
  _session: undefined,
  _getSession: function _getSession() {}
};
var broadcast = (0, _utils.BroadcastChannel)();
var logger = (0, _logger2.proxyLogger)(_logger2.default, __NEXTAUTH.basePath);

function useOnline() {
  var _React$useState = React.useState(typeof navigator !== "undefined" ? navigator.onLine : false),
      _React$useState2 = (0, _slicedToArray2.default)(_React$useState, 2),
      isOnline = _React$useState2[0],
      setIsOnline = _React$useState2[1];

  var setOnline = function setOnline() {
    return setIsOnline(true);
  };

  var setOffline = function setOffline() {
    return setIsOnline(false);
  };

  React.useEffect(function () {
    window.addEventListener("online", setOnline);
    window.addEventListener("offline", setOffline);
    return function () {
      window.removeEventListener("online", setOnline);
      window.removeEventListener("offline", setOffline);
    };
  }, []);
  return isOnline;
}

var SessionContext = (_React$createContext = React.createContext) === null || _React$createContext === void 0 ? void 0 : _React$createContext.call(React, undefined);
exports.SessionContext = SessionContext;

function useSession(options) {
  if (!SessionContext) {
    throw new Error("React Context is unavailable in Server Components");
  }

  var value = React.useContext(SessionContext);

  if (!value && "production" !== "production") {}

  var _ref2 = options !== null && options !== void 0 ? options : {},
      required = _ref2.required,
      onUnauthenticated = _ref2.onUnauthenticated;

  var requiredAndNotLoading = required && value.status === "unauthenticated";
  React.useEffect(function () {
    if (requiredAndNotLoading) {
      var url = "/api/auth/signin?".concat(new URLSearchParams({
        error: "SessionRequired",
        callbackUrl: window.location.href
      }));
      if (onUnauthenticated) onUnauthenticated();else window.location.href = url;
    }
  }, [requiredAndNotLoading, onUnauthenticated]);

  if (requiredAndNotLoading) {
    return {
      data: value.data,
      update: value.update,
      status: "loading"
    };
  }

  return value;
}

function getSession(_x) {
  return _getSession2.apply(this, arguments);
}

function _getSession2() {
  _getSession2 = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee3(params) {
    var _params$broadcast;

    var session;
    return _regenerator.default.wrap(function _callee3$(_context3) {
      while (1) {
        switch (_context3.prev = _context3.next) {
          case 0:
            _context3.next = 2;
            return (0, _utils.fetchData)("session", __NEXTAUTH, logger, params);

          case 2:
            session = _context3.sent;

            if ((_params$broadcast = params === null || params === void 0 ? void 0 : params.broadcast) !== null && _params$broadcast !== void 0 ? _params$broadcast : true) {
              broadcast.post({
                event: "session",
                data: {
                  trigger: "getSession"
                }
              });
            }

            return _context3.abrupt("return", session);

          case 5:
          case "end":
            return _context3.stop();
        }
      }
    }, _callee3);
  }));
  return _getSession2.apply(this, arguments);
}

function getCsrfToken(_x2) {
  return _getCsrfToken.apply(this, arguments);
}

function _getCsrfToken() {
  _getCsrfToken = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee4(params) {
    var response;
    return _regenerator.default.wrap(function _callee4$(_context4) {
      while (1) {
        switch (_context4.prev = _context4.next) {
          case 0:
            _context4.next = 2;
            return (0, _utils.fetchData)("csrf", __NEXTAUTH, logger, params);

          case 2:
            response = _context4.sent;
            return _context4.abrupt("return", response === null || response === void 0 ? void 0 : response.csrfToken);

          case 4:
          case "end":
            return _context4.stop();
        }
      }
    }, _callee4);
  }));
  return _getCsrfToken.apply(this, arguments);
}

function getProviders() {
  return _getProviders.apply(this, arguments);
}

function _getProviders() {
  _getProviders = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee5() {
    return _regenerator.default.wrap(function _callee5$(_context5) {
      while (1) {
        switch (_context5.prev = _context5.next) {
          case 0:
            _context5.next = 2;
            return (0, _utils.fetchData)("providers", __NEXTAUTH, logger);

          case 2:
            return _context5.abrupt("return", _context5.sent);

          case 3:
          case "end":
            return _context5.stop();
        }
      }
    }, _callee5);
  }));
  return _getProviders.apply(this, arguments);
}

function signIn(_x3, _x4, _x5) {
  return _signIn.apply(this, arguments);
}

function _signIn() {
  _signIn = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee6(provider, options, authorizationParams) {
    var _ref5, _ref5$callbackUrl, callbackUrl, _ref5$redirect, redirect, baseUrl, providers, isCredentials, isEmail, isSupportingReturn, signInUrl, _signInUrl, res, data, _data$url, url, error;

    return _regenerator.default.wrap(function _callee6$(_context6) {
      while (1) {
        switch (_context6.prev = _context6.next) {
          case 0:
            _ref5 = options !== null && options !== void 0 ? options : {}, _ref5$callbackUrl = _ref5.callbackUrl, callbackUrl = _ref5$callbackUrl === void 0 ? window.location.href : _ref5$callbackUrl, _ref5$redirect = _ref5.redirect, redirect = _ref5$redirect === void 0 ? true : _ref5$redirect;
            baseUrl = (0, _utils.apiBaseUrl)(__NEXTAUTH);
            _context6.next = 4;
            return getProviders();

          case 4:
            providers = _context6.sent;

            if (providers) {
              _context6.next = 8;
              break;
            }

            window.location.href = "".concat(baseUrl, "/error");
            return _context6.abrupt("return");

          case 8:
            if (!(!provider || !(provider in providers))) {
              _context6.next = 11;
              break;
            }

            window.location.href = "".concat(baseUrl, "/signin?").concat(new URLSearchParams({
              callbackUrl: callbackUrl
            }));
            return _context6.abrupt("return");

          case 11:
            isCredentials = providers[provider].type === "credentials";
            isEmail = providers[provider].type === "email";
            isSupportingReturn = isCredentials || isEmail;
            signInUrl = "".concat(baseUrl, "/").concat(isCredentials ? "callback" : "signin", "/").concat(provider);
            _signInUrl = "".concat(signInUrl, "?").concat(new URLSearchParams(authorizationParams));
            _context6.t0 = fetch;
            _context6.t1 = _signInUrl;
            _context6.t2 = {
              "Content-Type": "application/x-www-form-urlencoded"
            };
            _context6.t3 = URLSearchParams;
            _context6.t4 = _objectSpread;
            _context6.t5 = _objectSpread({}, options);
            _context6.t6 = {};
            _context6.next = 25;
            return getCsrfToken();

          case 25:
            _context6.t7 = _context6.sent;
            _context6.t8 = callbackUrl;
            _context6.t9 = {
              csrfToken: _context6.t7,
              callbackUrl: _context6.t8,
              json: true
            };
            _context6.t10 = (0, _context6.t4)(_context6.t5, _context6.t6, _context6.t9);
            _context6.t11 = new _context6.t3(_context6.t10);
            _context6.t12 = {
              method: "post",
              headers: _context6.t2,
              body: _context6.t11
            };
            _context6.next = 33;
            return (0, _context6.t0)(_context6.t1, _context6.t12);

          case 33:
            res = _context6.sent;
            _context6.next = 36;
            return res.json();

          case 36:
            data = _context6.sent;

            if (!(redirect || !isSupportingReturn)) {
              _context6.next = 42;
              break;
            }

            url = (_data$url = data.url) !== null && _data$url !== void 0 ? _data$url : callbackUrl;
            window.location.href = url;
            if (url.includes("#")) window.location.reload();
            return _context6.abrupt("return");

          case 42:
            error = new URL(data.url).searchParams.get("error");

            if (!res.ok) {
              _context6.next = 46;
              break;
            }

            _context6.next = 46;
            return __NEXTAUTH._getSession({
              event: "storage"
            });

          case 46:
            return _context6.abrupt("return", {
              error: error,
              status: res.status,
              ok: res.ok,
              url: error ? null : data.url
            });

          case 47:
          case "end":
            return _context6.stop();
        }
      }
    }, _callee6);
  }));
  return _signIn.apply(this, arguments);
}

function signOut(_x6) {
  return _signOut.apply(this, arguments);
}

function _signOut() {
  _signOut = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee7(options) {
    var _options$redirect;

    var _ref6, _ref6$callbackUrl, callbackUrl, baseUrl, fetchOptions, res, data, _data$url2, url;

    return _regenerator.default.wrap(function _callee7$(_context7) {
      while (1) {
        switch (_context7.prev = _context7.next) {
          case 0:
            _ref6 = options !== null && options !== void 0 ? options : {}, _ref6$callbackUrl = _ref6.callbackUrl, callbackUrl = _ref6$callbackUrl === void 0 ? window.location.href : _ref6$callbackUrl;
            baseUrl = (0, _utils.apiBaseUrl)(__NEXTAUTH);
            _context7.t0 = {
              "Content-Type": "application/x-www-form-urlencoded"
            };
            _context7.t1 = URLSearchParams;
            _context7.next = 6;
            return getCsrfToken();

          case 6:
            _context7.t2 = _context7.sent;
            _context7.t3 = callbackUrl;
            _context7.t4 = {
              csrfToken: _context7.t2,
              callbackUrl: _context7.t3,
              json: true
            };
            _context7.t5 = new _context7.t1(_context7.t4);
            fetchOptions = {
              method: "post",
              headers: _context7.t0,
              body: _context7.t5
            };
            _context7.next = 13;
            return fetch("".concat(baseUrl, "/signout"), fetchOptions);

          case 13:
            res = _context7.sent;
            _context7.next = 16;
            return res.json();

          case 16:
            data = _context7.sent;
            broadcast.post({
              event: "session",
              data: {
                trigger: "signout"
              }
            });

            if (!((_options$redirect = options === null || options === void 0 ? void 0 : options.redirect) !== null && _options$redirect !== void 0 ? _options$redirect : true)) {
              _context7.next = 23;
              break;
            }

            url = (_data$url2 = data.url) !== null && _data$url2 !== void 0 ? _data$url2 : callbackUrl;
            window.location.href = url;
            if (url.includes("#")) window.location.reload();
            return _context7.abrupt("return");

          case 23:
            _context7.next = 25;
            return __NEXTAUTH._getSession({
              event: "storage"
            });

          case 25:
            return _context7.abrupt("return", data);

          case 26:
          case "end":
            return _context7.stop();
        }
      }
    }, _callee7);
  }));
  return _signOut.apply(this, arguments);
}

function SessionProvider(props) {
  if (!SessionContext) {
    throw new Error("React Context is unavailable in Server Components");
  }

  var children = props.children,
      basePath = props.basePath,
      refetchInterval = props.refetchInterval,
      refetchWhenOffline = props.refetchWhenOffline;
  if (basePath) __NEXTAUTH.basePath = basePath;
  var hasInitialSession = props.session !== undefined;
  __NEXTAUTH._lastSync = hasInitialSession ? (0, _utils.now)() : 0;

  var _React$useState3 = React.useState(function () {
    if (hasInitialSession) __NEXTAUTH._session = props.session;
    return props.session;
  }),
      _React$useState4 = (0, _slicedToArray2.default)(_React$useState3, 2),
      session = _React$useState4[0],
      setSession = _React$useState4[1];

  var _React$useState5 = React.useState(!hasInitialSession),
      _React$useState6 = (0, _slicedToArray2.default)(_React$useState5, 2),
      loading = _React$useState6[0],
      setLoading = _React$useState6[1];

  React.useEffect(function () {
    __NEXTAUTH._getSession = (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee() {
      var _ref4,
          event,
          storageEvent,
          _args = arguments;

      return _regenerator.default.wrap(function _callee$(_context) {
        while (1) {
          switch (_context.prev = _context.next) {
            case 0:
              _ref4 = _args.length > 0 && _args[0] !== undefined ? _args[0] : {}, event = _ref4.event;
              _context.prev = 1;
              storageEvent = event === "storage";

              if (!(storageEvent || __NEXTAUTH._session === undefined)) {
                _context.next = 10;
                break;
              }

              __NEXTAUTH._lastSync = (0, _utils.now)();
              _context.next = 7;
              return getSession({
                broadcast: !storageEvent
              });

            case 7:
              __NEXTAUTH._session = _context.sent;
              setSession(__NEXTAUTH._session);
              return _context.abrupt("return");

            case 10:
              if (!(!event || __NEXTAUTH._session === null || (0, _utils.now)() < __NEXTAUTH._lastSync)) {
                _context.next = 12;
                break;
              }

              return _context.abrupt("return");

            case 12:
              __NEXTAUTH._lastSync = (0, _utils.now)();
              _context.next = 15;
              return getSession();

            case 15:
              __NEXTAUTH._session = _context.sent;
              setSession(__NEXTAUTH._session);
              _context.next = 22;
              break;

            case 19:
              _context.prev = 19;
              _context.t0 = _context["catch"](1);
              logger.error("CLIENT_SESSION_ERROR", _context.t0);

            case 22:
              _context.prev = 22;
              setLoading(false);
              return _context.finish(22);

            case 25:
            case "end":
              return _context.stop();
          }
        }
      }, _callee, null, [[1, 19, 22, 25]]);
    }));

    __NEXTAUTH._getSession();

    return function () {
      __NEXTAUTH._lastSync = 0;
      __NEXTAUTH._session = undefined;

      __NEXTAUTH._getSession = function () {};
    };
  }, []);
  React.useEffect(function () {
    var unsubscribe = broadcast.receive(function () {
      return __NEXTAUTH._getSession({
        event: "storage"
      });
    });
    return function () {
      return unsubscribe();
    };
  }, []);
  React.useEffect(function () {
    var _props$refetchOnWindo = props.refetchOnWindowFocus,
        refetchOnWindowFocus = _props$refetchOnWindo === void 0 ? true : _props$refetchOnWindo;

    var visibilityHandler = function visibilityHandler() {
      if (refetchOnWindowFocus && document.visibilityState === "visible") __NEXTAUTH._getSession({
        event: "visibilitychange"
      });
    };

    document.addEventListener("visibilitychange", visibilityHandler, false);
    return function () {
      return document.removeEventListener("visibilitychange", visibilityHandler, false);
    };
  }, [props.refetchOnWindowFocus]);
  var isOnline = useOnline();
  var shouldRefetch = refetchWhenOffline !== false || isOnline;
  React.useEffect(function () {
    if (refetchInterval && shouldRefetch) {
      var refetchIntervalTimer = setInterval(function () {
        if (__NEXTAUTH._session) {
          __NEXTAUTH._getSession({
            event: "poll"
          });
        }
      }, refetchInterval * 1000);
      return function () {
        return clearInterval(refetchIntervalTimer);
      };
    }
  }, [refetchInterval, shouldRefetch]);
  var value = React.useMemo(function () {
    return {
      data: session,
      status: loading ? "loading" : session ? "authenticated" : "unauthenticated",
      update: function update(data) {
        return (0, _asyncToGenerator2.default)(_regenerator.default.mark(function _callee2() {
          var newSession;
          return _regenerator.default.wrap(function _callee2$(_context2) {
            while (1) {
              switch (_context2.prev = _context2.next) {
                case 0:
                  if (!(loading || !session)) {
                    _context2.next = 2;
                    break;
                  }

                  return _context2.abrupt("return");

                case 2:
                  setLoading(true);
                  _context2.t0 = _utils.fetchData;
                  _context2.t1 = __NEXTAUTH;
                  _context2.t2 = logger;
                  _context2.next = 8;
                  return getCsrfToken();

                case 8:
                  _context2.t3 = _context2.sent;
                  _context2.t4 = data;
                  _context2.t5 = {
                    csrfToken: _context2.t3,
                    data: _context2.t4
                  };
                  _context2.t6 = {
                    body: _context2.t5
                  };
                  _context2.t7 = {
                    req: _context2.t6
                  };
                  _context2.next = 15;
                  return (0, _context2.t0)("session", _context2.t1, _context2.t2, _context2.t7);

                case 15:
                  newSession = _context2.sent;
                  setLoading(false);

                  if (newSession) {
                    setSession(newSession);
                    broadcast.post({
                      event: "session",
                      data: {
                        trigger: "getSession"
                      }
                    });
                  }

                  return _context2.abrupt("return", newSession);

                case 19:
                case "end":
                  return _context2.stop();
              }
            }
          }, _callee2);
        }))();
      }
    };
  }, [session, loading]);
  return (0, _jsxRuntime.jsx)(SessionContext.Provider, {
    value: value,
    children: children
  });
}

/***/ }),

/***/ 5152:
/***/ ((__unused_webpack_module, exports) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));

/***/ }),

/***/ 95792:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";


var _interopRequireDefault = __webpack_require__(40207);

Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
exports.proxyLogger = proxyLogger;
exports.setLogger = setLogger;

var _defineProperty2 = _interopRequireDefault(__webpack_require__(86126));

var _errors = __webpack_require__(74391);

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? ownKeys(Object(source), !0).forEach(function (key) { (0, _defineProperty2.default)(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }

function formatError(o) {
  if (o instanceof Error && !(o instanceof _errors.UnknownError)) {
    return {
      message: o.message,
      stack: o.stack,
      name: o.name
    };
  }

  if (hasErrorProperty(o)) {
    var _o$message;

    o.error = formatError(o.error);
    o.message = (_o$message = o.message) !== null && _o$message !== void 0 ? _o$message : o.error.message;
  }

  return o;
}

function hasErrorProperty(x) {
  return !!(x !== null && x !== void 0 && x.error);
}

var _logger = {
  error: function error(code, metadata) {
    metadata = formatError(metadata);
    console.error("[next-auth][error][".concat(code, "]"), "\nhttps://next-auth.js.org/errors#".concat(code.toLowerCase()), metadata.message, metadata);
  },
  warn: function warn(code) {
    console.warn("[next-auth][warn][".concat(code, "]"), "\nhttps://next-auth.js.org/warnings#".concat(code.toLowerCase()));
  },
  debug: function debug(code, metadata) {
    console.log("[next-auth][debug][".concat(code, "]"), metadata);
  }
};

function setLogger() {
  var newLogger = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
  var debug = arguments.length > 1 ? arguments[1] : undefined;
  if (!debug) _logger.debug = function () {};
  if (newLogger.error) _logger.error = newLogger.error;
  if (newLogger.warn) _logger.warn = newLogger.warn;
  if (newLogger.debug) _logger.debug = newLogger.debug;
}

var _default = _logger;
exports["default"] = _default;

function proxyLogger() {
  var logger = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : _logger;
  var basePath = arguments.length > 1 ? arguments[1] : undefined;

  try {
    if (typeof window === "undefined") {
      return logger;
    }

    var clientLogger = {};

    var _loop = function _loop(level) {
      clientLogger[level] = function (code, metadata) {
        _logger[level](code, metadata);

        if (level === "error") {
          metadata = formatError(metadata);
        }

        ;
        metadata.client = true;
        var url = "".concat(basePath, "/_log");
        var body = new URLSearchParams(_objectSpread({
          level: level,
          code: code
        }, metadata));

        if (navigator.sendBeacon) {
          return navigator.sendBeacon(url, body);
        }

        return fetch(url, {
          method: "POST",
          body: body,
          keepalive: true
        });
      };
    };

    for (var level in logger) {
      _loop(level);
    }

    return clientLogger;
  } catch (_unused) {
    return _logger;
  }
}

/***/ }),

/***/ 14633:
/***/ ((__unused_webpack_module, exports) => {

"use strict";


Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = parseUrl;

function parseUrl(url) {
  var _url2;

  const defaultUrl = new URL("http://localhost:3000/api/auth");

  if (url && !url.startsWith("http")) {
    url = `https://${url}`;
  }

  const _url = new URL((_url2 = url) !== null && _url2 !== void 0 ? _url2 : defaultUrl);

  const path = (_url.pathname === "/" ? defaultUrl.pathname : _url.pathname).replace(/\/$/, "");
  const base = `${_url.origin}${path}`;
  return {
    origin: _url.origin,
    host: _url.host,
    path,
    base,
    toString: () => base
  };
}

/***/ }),

/***/ 3195:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

var __webpack_unused_export__;
var e=__webpack_require__(18038);function t(e){return e&&"object"==typeof e&&"default"in e?e:{default:e}}var n=/*#__PURE__*/t(e);const r=["light","dark"],a="(prefers-color-scheme: dark)",o="undefined"==typeof window,s=/*#__PURE__*/e.createContext(void 0),l={setTheme:e=>{},themes:[]},c=["light","dark"],m=({forcedTheme:t,disableTransitionOnChange:o=!1,enableSystem:l=!0,enableColorScheme:m=!0,storageKey:f="theme",themes:y=c,defaultTheme:v=(l?"system":"light"),attribute:$="data-theme",value:g,children:b,nonce:S})=>{const[T,p]=e.useState(()=>d(f,v)),[w,C]=e.useState(()=>d(f)),E=g?Object.values(g):y,k=e.useCallback(e=>{let t=e;if(!t)return;"system"===e&&l&&(t=h());const n=g?g[t]:t,a=o?u():null,s=document.documentElement;if("class"===$?(s.classList.remove(...E),n&&s.classList.add(n)):n?s.setAttribute($,n):s.removeAttribute($),m){const e=r.includes(v)?v:null,n=r.includes(t)?t:e;s.style.colorScheme=n}null==a||a()},[]),x=e.useCallback(e=>{p(e);try{localStorage.setItem(f,e)}catch(e){}},[t]),L=e.useCallback(e=>{const n=h(e);C(n),"system"===T&&l&&!t&&k("system")},[T,t]);e.useEffect(()=>{const e=window.matchMedia(a);return e.addListener(L),L(e),()=>e.removeListener(L)},[L]),e.useEffect(()=>{const e=e=>{e.key===f&&x(e.newValue||v)};return window.addEventListener("storage",e),()=>window.removeEventListener("storage",e)},[x]),e.useEffect(()=>{k(null!=t?t:T)},[t,T]);const I=e.useMemo(()=>({theme:T,setTheme:x,forcedTheme:t,resolvedTheme:"system"===T?w:T,themes:l?[...y,"system"]:y,systemTheme:l?w:void 0}),[T,x,t,w,l,y]);/*#__PURE__*/return n.default.createElement(s.Provider,{value:I},/*#__PURE__*/n.default.createElement(i,{forcedTheme:t,disableTransitionOnChange:o,enableSystem:l,enableColorScheme:m,storageKey:f,themes:y,defaultTheme:v,attribute:$,value:g,children:b,attrs:E,nonce:S}),b)},i=/*#__PURE__*/e.memo(({forcedTheme:e,storageKey:t,attribute:o,enableSystem:s,enableColorScheme:l,defaultTheme:c,value:m,attrs:i,nonce:d})=>{const u="system"===c,h="class"===o?`var d=document.documentElement,c=d.classList;c.remove(${i.map(e=>`'${e}'`).join(",")});`:`var d=document.documentElement,n='${o}',s='setAttribute';`,f=l?r.includes(c)&&c?`if(e==='light'||e==='dark'||!e)d.style.colorScheme=e||'${c}'`:"if(e==='light'||e==='dark')d.style.colorScheme=e":"",y=(e,t=!1,n=!0)=>{const a=m?m[e]:e,s=t?e+"|| ''":`'${a}'`;let c="";return l&&n&&!t&&r.includes(e)&&(c+=`d.style.colorScheme = '${e}';`),"class"===o?c+=t||a?`c.add(${s})`:"null":a&&(c+=`d[s](n,${s})`),c},v=e?`!function(){${h}${y(e)}}()`:s?`!function(){try{${h}var e=localStorage.getItem('${t}');if('system'===e||(!e&&${u})){var t='${a}',m=window.matchMedia(t);if(m.media!==t||m.matches){${y("dark")}}else{${y("light")}}}else if(e){${m?`var x=${JSON.stringify(m)};`:""}${y(m?"x[e]":"e",!0)}}${u?"":"else{"+y(c,!1,!1)+"}"}${f}}catch(e){}}()`:`!function(){try{${h}var e=localStorage.getItem('${t}');if(e){${m?`var x=${JSON.stringify(m)};`:""}${y(m?"x[e]":"e",!0)}}else{${y(c,!1,!1)};}${f}}catch(t){}}();`;/*#__PURE__*/return n.default.createElement("script",{nonce:d,dangerouslySetInnerHTML:{__html:v}})},()=>!0),d=(e,t)=>{if(o)return;let n;try{n=localStorage.getItem(e)||void 0}catch(e){}return n||t},u=()=>{const e=document.createElement("style");return e.appendChild(document.createTextNode("*{-webkit-transition:none!important;-moz-transition:none!important;-o-transition:none!important;-ms-transition:none!important;transition:none!important}")),document.head.appendChild(e),()=>{window.getComputedStyle(document.body),setTimeout(()=>{document.head.removeChild(e)},1)}},h=e=>(e||(e=window.matchMedia(a)),e.matches?"dark":"light");exports.f=t=>e.useContext(s)?/*#__PURE__*/n.default.createElement(e.Fragment,null,t.children):/*#__PURE__*/n.default.createElement(m,t),__webpack_unused_export__=()=>{var t;return null!==(t=e.useContext(s))&&void 0!==t?t:l};


/***/ }),

/***/ 23881:
/***/ ((module) => {

// Exports
module.exports = {
	"style": {"fontFamily":"'__Inter_e66fe9', '__Inter_Fallback_e66fe9'","fontStyle":"normal"},
	"className": "__className_e66fe9"
};


/***/ }),

/***/ 42374:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "addBasePath", ({
    enumerable: true,
    get: function() {
        return addBasePath;
    }
}));
const _addpathprefix = __webpack_require__(30893);
const _normalizetrailingslash = __webpack_require__(40639);
const basePath =  false || "";
function addBasePath(path, required) {
    return (0, _normalizetrailingslash.normalizePathTrailingSlash)( false ? 0 : (0, _addpathprefix.addPathPrefix)(path, basePath));
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=add-base-path.js.map


/***/ }),

/***/ 92704:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "addLocale", ({
    enumerable: true,
    get: function() {
        return addLocale;
    }
}));
const _normalizetrailingslash = __webpack_require__(40639);
const addLocale = function(path) {
    for(var _len = arguments.length, args = new Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++){
        args[_key - 1] = arguments[_key];
    }
    if (false) {}
    return path;
};
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=add-locale.js.map


/***/ }),

/***/ 13518:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "callServer", ({
    enumerable: true,
    get: function() {
        return callServer;
    }
}));
const _approuter = __webpack_require__(80131);
async function callServer(actionId, actionArgs) {
    const actionDispatcher = (0, _approuter.getServerActionDispatcher)();
    if (!actionDispatcher) {
        throw new Error("Invariant: missing action dispatcher.");
    }
    return new Promise((resolve, reject)=>{
        actionDispatcher({
            actionId,
            actionArgs,
            resolve,
            reject
        });
    });
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=app-call-server.js.map


/***/ }),

/***/ 79806:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "AppRouterAnnouncer", ({
    enumerable: true,
    get: function() {
        return AppRouterAnnouncer;
    }
}));
const _react = __webpack_require__(18038);
const _reactdom = __webpack_require__(98704);
const ANNOUNCER_TYPE = "next-route-announcer";
const ANNOUNCER_ID = "__next-route-announcer__";
function getAnnouncerNode() {
    var _existingAnnouncer_shadowRoot;
    const existingAnnouncer = document.getElementsByName(ANNOUNCER_TYPE)[0];
    if (existingAnnouncer == null ? void 0 : (_existingAnnouncer_shadowRoot = existingAnnouncer.shadowRoot) == null ? void 0 : _existingAnnouncer_shadowRoot.childNodes[0]) {
        return existingAnnouncer.shadowRoot.childNodes[0];
    } else {
        const container = document.createElement(ANNOUNCER_TYPE);
        container.style.cssText = "position:absolute";
        const announcer = document.createElement("div");
        announcer.ariaLive = "assertive";
        announcer.id = ANNOUNCER_ID;
        announcer.role = "alert";
        announcer.style.cssText = "position:absolute;border:0;height:1px;margin:-1px;padding:0;width:1px;clip:rect(0 0 0 0);overflow:hidden;white-space:nowrap;word-wrap:normal";
        // Use shadow DOM here to avoid any potential CSS bleed
        const shadow = container.attachShadow({
            mode: "open"
        });
        shadow.appendChild(announcer);
        document.body.appendChild(container);
        return announcer;
    }
}
function AppRouterAnnouncer(param) {
    let { tree } = param;
    const [portalNode, setPortalNode] = (0, _react.useState)(null);
    (0, _react.useEffect)(()=>{
        const announcer = getAnnouncerNode();
        setPortalNode(announcer);
        return ()=>{
            const container = document.getElementsByTagName(ANNOUNCER_TYPE)[0];
            if (container == null ? void 0 : container.isConnected) {
                document.body.removeChild(container);
            }
        };
    }, []);
    const [routeAnnouncement, setRouteAnnouncement] = (0, _react.useState)("");
    const previousTitle = (0, _react.useRef)();
    (0, _react.useEffect)(()=>{
        let currentTitle = "";
        if (document.title) {
            currentTitle = document.title;
        } else {
            const pageHeader = document.querySelector("h1");
            if (pageHeader) {
                currentTitle = pageHeader.innerText || pageHeader.textContent || "";
            }
        }
        // Only announce the title change, but not for the first load because screen
        // readers do that automatically.
        if (previousTitle.current !== undefined) {
            setRouteAnnouncement(currentTitle);
        }
        previousTitle.current = currentTitle;
    }, [
        tree
    ]);
    return portalNode ? /*#__PURE__*/ (0, _reactdom.createPortal)(routeAnnouncement, portalNode) : null;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=app-router-announcer.js.map


/***/ }),

/***/ 86739:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    RSC: function() {
        return RSC;
    },
    ACTION: function() {
        return ACTION;
    },
    NEXT_ROUTER_STATE_TREE: function() {
        return NEXT_ROUTER_STATE_TREE;
    },
    NEXT_ROUTER_PREFETCH: function() {
        return NEXT_ROUTER_PREFETCH;
    },
    NEXT_URL: function() {
        return NEXT_URL;
    },
    FETCH_CACHE_HEADER: function() {
        return FETCH_CACHE_HEADER;
    },
    RSC_CONTENT_TYPE_HEADER: function() {
        return RSC_CONTENT_TYPE_HEADER;
    },
    RSC_VARY_HEADER: function() {
        return RSC_VARY_HEADER;
    },
    FLIGHT_PARAMETERS: function() {
        return FLIGHT_PARAMETERS;
    },
    NEXT_RSC_UNION_QUERY: function() {
        return NEXT_RSC_UNION_QUERY;
    }
});
const RSC = "RSC";
const ACTION = "Next-Action";
const NEXT_ROUTER_STATE_TREE = "Next-Router-State-Tree";
const NEXT_ROUTER_PREFETCH = "Next-Router-Prefetch";
const NEXT_URL = "Next-Url";
const FETCH_CACHE_HEADER = "x-vercel-sc-headers";
const RSC_CONTENT_TYPE_HEADER = "text/x-component";
const RSC_VARY_HEADER = RSC + ", " + NEXT_ROUTER_STATE_TREE + ", " + NEXT_ROUTER_PREFETCH + ", " + NEXT_URL;
const FLIGHT_PARAMETERS = [
    [
        RSC
    ],
    [
        NEXT_ROUTER_STATE_TREE
    ],
    [
        NEXT_ROUTER_PREFETCH
    ]
];
const NEXT_RSC_UNION_QUERY = "_rsc";
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=app-router-headers.js.map


/***/ }),

/***/ 80131:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    getServerActionDispatcher: function() {
        return getServerActionDispatcher;
    },
    urlToUrlWithoutFlightMarker: function() {
        return urlToUrlWithoutFlightMarker;
    },
    default: function() {
        return AppRouter;
    }
});
const _interop_require_wildcard = __webpack_require__(45298);
const _react = /*#__PURE__*/ _interop_require_wildcard._(__webpack_require__(18038));
const _approutercontext = __webpack_require__(57085);
const _routerreducer = __webpack_require__(73078);
const _routerreducertypes = __webpack_require__(4574);
const _createhreffromurl = __webpack_require__(37554);
const _hooksclientcontext = __webpack_require__(39569);
const _usereducerwithdevtools = __webpack_require__(28539);
const _errorboundary = __webpack_require__(13423);
const _createinitialrouterstate = __webpack_require__(35436);
const _isbot = __webpack_require__(98735);
const _addbasepath = __webpack_require__(42374);
const _approuterannouncer = __webpack_require__(79806);
const _redirectboundary = __webpack_require__(59325);
const _findheadincache = __webpack_require__(40097);
const _infinitepromise = __webpack_require__(69185);
const _approuterheaders = __webpack_require__(86739);
const _removebasepath = __webpack_require__(37277);
const _hasbasepath = __webpack_require__(35753);
const isServer = "undefined" === "undefined";
// Ensure the initialParallelRoutes are not combined because of double-rendering in the browser with Strict Mode.
let initialParallelRoutes = isServer ? null : new Map();
let globalServerActionDispatcher = null;
function getServerActionDispatcher() {
    return globalServerActionDispatcher;
}
function urlToUrlWithoutFlightMarker(url) {
    const urlWithoutFlightParameters = new URL(url, location.origin);
    urlWithoutFlightParameters.searchParams.delete(_approuterheaders.NEXT_RSC_UNION_QUERY);
    if (true) {
        if (false) {}
    }
    return urlWithoutFlightParameters;
}
function isExternalURL(url) {
    return url.origin !== window.location.origin;
}
function HistoryUpdater(param) {
    let { tree, pushRef, canonicalUrl, sync } = param;
    (0, _react.useInsertionEffect)(()=>{
        // Identifier is shortened intentionally.
        // __NA is used to identify if the history entry can be handled by the app-router.
        // __N is used to identify if the history entry can be handled by the old router.
        const historyState = {
            __NA: true,
            tree
        };
        if (pushRef.pendingPush && (0, _createhreffromurl.createHrefFromUrl)(new URL(window.location.href)) !== canonicalUrl) {
            // This intentionally mutates React state, pushRef is overwritten to ensure additional push/replace calls do not trigger an additional history entry.
            pushRef.pendingPush = false;
            window.history.pushState(historyState, "", canonicalUrl);
        } else {
            window.history.replaceState(historyState, "", canonicalUrl);
        }
        sync();
    }, [
        tree,
        pushRef,
        canonicalUrl,
        sync
    ]);
    return null;
}
const createEmptyCacheNode = ()=>({
        status: _approutercontext.CacheStates.LAZY_INITIALIZED,
        data: null,
        subTreeData: null,
        parallelRoutes: new Map()
    });
function useServerActionDispatcher(dispatch) {
    const serverActionDispatcher = (0, _react.useCallback)((actionPayload)=>{
        (0, _react.startTransition)(()=>{
            dispatch({
                ...actionPayload,
                type: _routerreducertypes.ACTION_SERVER_ACTION,
                mutable: {},
                cache: createEmptyCacheNode()
            });
        });
    }, [
        dispatch
    ]);
    globalServerActionDispatcher = serverActionDispatcher;
}
/**
 * Server response that only patches the cache and tree.
 */ function useChangeByServerResponse(dispatch) {
    return (0, _react.useCallback)((previousTree, flightData, overrideCanonicalUrl)=>{
        (0, _react.startTransition)(()=>{
            dispatch({
                type: _routerreducertypes.ACTION_SERVER_PATCH,
                flightData,
                previousTree,
                overrideCanonicalUrl,
                cache: createEmptyCacheNode(),
                mutable: {}
            });
        });
    }, [
        dispatch
    ]);
}
function useNavigate(dispatch) {
    return (0, _react.useCallback)((href, navigateType, forceOptimisticNavigation, shouldScroll)=>{
        const url = new URL((0, _addbasepath.addBasePath)(href), location.href);
        return dispatch({
            type: _routerreducertypes.ACTION_NAVIGATE,
            url,
            isExternalUrl: isExternalURL(url),
            locationSearch: location.search,
            forceOptimisticNavigation,
            shouldScroll: shouldScroll != null ? shouldScroll : true,
            navigateType,
            cache: createEmptyCacheNode(),
            mutable: {}
        });
    }, [
        dispatch
    ]);
}
/**
 * The global router that wraps the application components.
 */ function Router(param) {
    let { buildId, initialHead, initialTree, initialCanonicalUrl, children, assetPrefix } = param;
    const initialState = (0, _react.useMemo)(()=>(0, _createinitialrouterstate.createInitialRouterState)({
            buildId,
            children,
            initialCanonicalUrl,
            initialTree,
            initialParallelRoutes,
            isServer,
            location: !isServer ? window.location : null,
            initialHead
        }), [
        buildId,
        children,
        initialCanonicalUrl,
        initialTree,
        initialHead
    ]);
    const [{ tree, cache, prefetchCache, pushRef, focusAndScrollRef, canonicalUrl, nextUrl }, dispatch, sync] = (0, _usereducerwithdevtools.useReducerWithReduxDevtools)(_routerreducer.reducer, initialState);
    (0, _react.useEffect)(()=>{
        // Ensure initialParallelRoutes is cleaned up from memory once it's used.
        initialParallelRoutes = null;
    }, []);
    // Add memoized pathname/query for useSearchParams and usePathname.
    const { searchParams, pathname } = (0, _react.useMemo)(()=>{
        const url = new URL(canonicalUrl,  true ? "http://n" : 0);
        return {
            // This is turned into a readonly class in `useSearchParams`
            searchParams: url.searchParams,
            pathname: (0, _hasbasepath.hasBasePath)(url.pathname) ? (0, _removebasepath.removeBasePath)(url.pathname) : url.pathname
        };
    }, [
        canonicalUrl
    ]);
    const changeByServerResponse = useChangeByServerResponse(dispatch);
    const navigate = useNavigate(dispatch);
    useServerActionDispatcher(dispatch);
    /**
   * The app router that is exposed through `useRouter`. It's only concerned with dispatching actions to the reducer, does not hold state.
   */ const appRouter = (0, _react.useMemo)(()=>{
        const routerInstance = {
            back: ()=>window.history.back(),
            forward: ()=>window.history.forward(),
            prefetch: (href, options)=>{
                // Don't prefetch for bots as they don't navigate.
                // Don't prefetch during development (improves compilation performance)
                if ((0, _isbot.isBot)(window.navigator.userAgent) || "production" === "development") {
                    return;
                }
                const url = new URL((0, _addbasepath.addBasePath)(href), location.href);
                // External urls can't be prefetched in the same way.
                if (isExternalURL(url)) {
                    return;
                }
                (0, _react.startTransition)(()=>{
                    var _options_kind;
                    dispatch({
                        type: _routerreducertypes.ACTION_PREFETCH,
                        url,
                        kind: (_options_kind = options == null ? void 0 : options.kind) != null ? _options_kind : _routerreducertypes.PrefetchKind.FULL
                    });
                });
            },
            replace: (href, options)=>{
                if (options === void 0) options = {};
                (0, _react.startTransition)(()=>{
                    var _options_scroll;
                    navigate(href, "replace", Boolean(options.forceOptimisticNavigation), (_options_scroll = options.scroll) != null ? _options_scroll : true);
                });
            },
            push: (href, options)=>{
                if (options === void 0) options = {};
                (0, _react.startTransition)(()=>{
                    var _options_scroll;
                    navigate(href, "push", Boolean(options.forceOptimisticNavigation), (_options_scroll = options.scroll) != null ? _options_scroll : true);
                });
            },
            refresh: ()=>{
                (0, _react.startTransition)(()=>{
                    dispatch({
                        type: _routerreducertypes.ACTION_REFRESH,
                        cache: createEmptyCacheNode(),
                        mutable: {},
                        origin: window.location.origin
                    });
                });
            },
            // @ts-ignore we don't want to expose this method at all
            fastRefresh: ()=>{
                if (true) {
                    throw new Error("fastRefresh can only be used in development mode. Please use refresh instead.");
                } else {}
            }
        };
        return routerInstance;
    }, [
        dispatch,
        navigate
    ]);
    (0, _react.useEffect)(()=>{
        // Exists for debugging purposes. Don't use in application code.
        if (window.next) {
            window.next.router = appRouter;
        }
    }, [
        appRouter
    ]);
    if (false) {}
    (0, _react.useEffect)(()=>{
        // If the app is restored from bfcache, it's possible that
        // pushRef.mpaNavigation is true, which would mean that any re-render of this component
        // would trigger the mpa navigation logic again from the lines below.
        // This will restore the router to the initial state in the event that the app is restored from bfcache.
        function handlePageShow(event) {
            if (!event.persisted) return;
            dispatch({
                type: _routerreducertypes.ACTION_RESTORE,
                url: new URL(window.location.href),
                tree: window.history.state
            });
        }
        window.addEventListener("pageshow", handlePageShow);
        return ()=>{
            window.removeEventListener("pageshow", handlePageShow);
        };
    }, [
        dispatch
    ]);
    // When mpaNavigation flag is set do a hard navigation to the new url.
    // Infinitely suspend because we don't actually want to rerender any child
    // components with the new URL and any entangled state updates shouldn't
    // commit either (eg: useTransition isPending should stay true until the page
    // unloads).
    //
    // This is a side effect in render. Don't try this at home, kids. It's
    // probably safe because we know this is a singleton component and it's never
    // in <Offscreen>. At least I hope so. (It will run twice in dev strict mode,
    // but that's... fine?)
    if (pushRef.mpaNavigation) {
        const location1 = window.location;
        if (pushRef.pendingPush) {
            location1.assign(canonicalUrl);
        } else {
            location1.replace(canonicalUrl);
        }
        // TODO-APP: Should we listen to navigateerror here to catch failed
        // navigations somehow? And should we call window.stop() if a SPA navigation
        // should interrupt an MPA one?
        (0, _react.use)((0, _infinitepromise.createInfinitePromise)());
    }
    /**
   * Handle popstate event, this is used to handle back/forward in the browser.
   * By default dispatches ACTION_RESTORE, however if the history entry was not pushed/replaced by app-router it will reload the page.
   * That case can happen when the old router injected the history entry.
   */ const onPopState = (0, _react.useCallback)((param)=>{
        let { state } = param;
        if (!state) {
            // TODO-APP: this case only happens when pushState/replaceState was called outside of Next.js. It should probably reload the page in this case.
            return;
        }
        // This case happens when the history entry was pushed by the `pages` router.
        if (!state.__NA) {
            window.location.reload();
            return;
        }
        // @ts-ignore useTransition exists
        // TODO-APP: Ideally the back button should not use startTransition as it should apply the updates synchronously
        // Without startTransition works if the cache is there for this path
        (0, _react.startTransition)(()=>{
            dispatch({
                type: _routerreducertypes.ACTION_RESTORE,
                url: new URL(window.location.href),
                tree: state.tree
            });
        });
    }, [
        dispatch
    ]);
    // Register popstate event to call onPopstate.
    (0, _react.useEffect)(()=>{
        window.addEventListener("popstate", onPopState);
        return ()=>{
            window.removeEventListener("popstate", onPopState);
        };
    }, [
        onPopState
    ]);
    const head = (0, _react.useMemo)(()=>{
        return (0, _findheadincache.findHeadInCache)(cache, tree[1]);
    }, [
        cache,
        tree
    ]);
    let content = /*#__PURE__*/ _react.default.createElement(_redirectboundary.RedirectBoundary, null, head, cache.subTreeData, /*#__PURE__*/ _react.default.createElement(_approuterannouncer.AppRouterAnnouncer, {
        tree: tree
    }));
    if (false) {}
    return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, /*#__PURE__*/ _react.default.createElement(HistoryUpdater, {
        tree: tree,
        pushRef: pushRef,
        canonicalUrl: canonicalUrl,
        sync: sync
    }), /*#__PURE__*/ _react.default.createElement(_hooksclientcontext.PathnameContext.Provider, {
        value: pathname
    }, /*#__PURE__*/ _react.default.createElement(_hooksclientcontext.SearchParamsContext.Provider, {
        value: searchParams
    }, /*#__PURE__*/ _react.default.createElement(_approutercontext.GlobalLayoutRouterContext.Provider, {
        value: {
            buildId,
            changeByServerResponse,
            tree,
            focusAndScrollRef,
            nextUrl
        }
    }, /*#__PURE__*/ _react.default.createElement(_approutercontext.AppRouterContext.Provider, {
        value: appRouter
    }, /*#__PURE__*/ _react.default.createElement(_approutercontext.LayoutRouterContext.Provider, {
        value: {
            childNodes: cache.parallelRoutes,
            tree: tree,
            // Root node always has `url`
            // Provided in AppTreeContext to ensure it can be overwritten in layout-router
            url: canonicalUrl
        }
    }, content))))));
}
function AppRouter(props) {
    const { globalErrorComponent, ...rest } = props;
    return /*#__PURE__*/ _react.default.createElement(_errorboundary.ErrorBoundary, {
        errorComponent: globalErrorComponent
    }, /*#__PURE__*/ _react.default.createElement(Router, rest));
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=app-router.js.map


/***/ }),

/***/ 54778:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "bailoutToClientRendering", ({
    enumerable: true,
    get: function() {
        return bailoutToClientRendering;
    }
}));
const _dynamicnossr = __webpack_require__(47431);
const _staticgenerationasyncstorage = __webpack_require__(25589);
function bailoutToClientRendering() {
    const staticGenerationStore = _staticgenerationasyncstorage.staticGenerationAsyncStorage.getStore();
    if (staticGenerationStore == null ? void 0 : staticGenerationStore.forceStatic) {
        return true;
    }
    if (staticGenerationStore == null ? void 0 : staticGenerationStore.isStaticGeneration) {
        (0, _dynamicnossr.suspense)();
    }
    return false;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=bailout-to-client-rendering.js.map


/***/ }),

/***/ 86157:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "clientHookInServerComponentError", ({
    enumerable: true,
    get: function() {
        return clientHookInServerComponentError;
    }
}));
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
function clientHookInServerComponentError(hookName) {
    if (false) {}
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=client-hook-in-server-component-error.js.map


/***/ }),

/***/ 13423:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    ErrorBoundaryHandler: function() {
        return ErrorBoundaryHandler;
    },
    GlobalError: function() {
        return GlobalError;
    },
    // Exported so that the import signature in the loaders can be identical to user
    // supplied custom global error signatures.
    default: function() {
        return _default;
    },
    ErrorBoundary: function() {
        return ErrorBoundary;
    }
});
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _navigation = __webpack_require__(89674);
const styles = {
    error: {
        // https://github.com/sindresorhus/modern-normalize/blob/main/modern-normalize.css#L38-L52
        fontFamily: 'system-ui,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji"',
        height: "100vh",
        textAlign: "center",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center"
    },
    text: {
        fontSize: "14px",
        fontWeight: 400,
        lineHeight: "28px",
        margin: "0 8px"
    }
};
class ErrorBoundaryHandler extends _react.default.Component {
    static getDerivedStateFromError(error) {
        return {
            error
        };
    }
    static getDerivedStateFromProps(props, state) {
        /**
     * Handles reset of the error boundary when a navigation happens.
     * Ensures the error boundary does not stay enabled when navigating to a new page.
     * Approach of setState in render is safe as it checks the previous pathname and then overrides
     * it as outlined in https://react.dev/reference/react/useState#storing-information-from-previous-renders
     */ if (props.pathname !== state.previousPathname && state.error) {
            return {
                error: null,
                previousPathname: props.pathname
            };
        }
        return {
            error: state.error,
            previousPathname: props.pathname
        };
    }
    render() {
        if (this.state.error) {
            return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, this.props.errorStyles, /*#__PURE__*/ _react.default.createElement(this.props.errorComponent, {
                error: this.state.error,
                reset: this.reset
            }));
        }
        return this.props.children;
    }
    constructor(props){
        super(props);
        this.reset = ()=>{
            this.setState({
                error: null
            });
        };
        this.state = {
            error: null,
            previousPathname: this.props.pathname
        };
    }
}
function GlobalError(param) {
    let { error } = param;
    const digest = error == null ? void 0 : error.digest;
    return /*#__PURE__*/ _react.default.createElement("html", {
        id: "__next_error__"
    }, /*#__PURE__*/ _react.default.createElement("head", null), /*#__PURE__*/ _react.default.createElement("body", null, /*#__PURE__*/ _react.default.createElement("div", {
        style: styles.error
    }, /*#__PURE__*/ _react.default.createElement("div", null, /*#__PURE__*/ _react.default.createElement("h2", {
        style: styles.text
    }, "Application error: a " + (digest ? "server" : "client") + "-side exception has occurred (see the " + (digest ? "server logs" : "browser console") + " for more information)."), digest ? /*#__PURE__*/ _react.default.createElement("p", {
        style: styles.text
    }, "Digest: " + digest) : null))));
}
const _default = GlobalError;
function ErrorBoundary(param) {
    let { errorComponent, errorStyles, children } = param;
    const pathname = (0, _navigation.usePathname)();
    if (errorComponent) {
        return /*#__PURE__*/ _react.default.createElement(ErrorBoundaryHandler, {
            pathname: pathname,
            errorComponent: errorComponent,
            errorStyles: errorStyles
        }, children);
    }
    return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, children);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=error-boundary.js.map


/***/ }),

/***/ 63118:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    DYNAMIC_ERROR_CODE: function() {
        return DYNAMIC_ERROR_CODE;
    },
    DynamicServerError: function() {
        return DynamicServerError;
    }
});
const DYNAMIC_ERROR_CODE = "DYNAMIC_SERVER_USAGE";
class DynamicServerError extends Error {
    constructor(type){
        super("Dynamic server usage: " + type);
        this.digest = DYNAMIC_ERROR_CODE;
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=hooks-server-context.js.map


/***/ }),

/***/ 69185:
/***/ ((module, exports) => {

"use strict";
/**
 * Used to cache in createInfinitePromise
 */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createInfinitePromise", ({
    enumerable: true,
    get: function() {
        return createInfinitePromise;
    }
}));
let infinitePromise;
function createInfinitePromise() {
    if (!infinitePromise) {
        // Only create the Promise once
        infinitePromise = new Promise(()=>{
        // This is used to debug when the rendering is never updated.
        // setTimeout(() => {
        //   infinitePromise = new Error('Infinite promise')
        //   resolve()
        // }, 5000)
        });
    }
    return infinitePromise;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=infinite-promise.js.map


/***/ }),

/***/ 36435:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "default", ({
    enumerable: true,
    get: function() {
        return OuterLayoutRouter;
    }
}));
const _interop_require_default = __webpack_require__(84813);
const _interop_require_wildcard = __webpack_require__(45298);
const _react = /*#__PURE__*/ _interop_require_wildcard._(__webpack_require__(18038));
const _reactdom = /*#__PURE__*/ _interop_require_default._(__webpack_require__(98704));
const _approutercontext = __webpack_require__(57085);
const _fetchserverresponse = __webpack_require__(17926);
const _infinitepromise = __webpack_require__(69185);
const _errorboundary = __webpack_require__(13423);
const _matchsegments = __webpack_require__(83395);
const _handlesmoothscroll = __webpack_require__(17887);
const _redirectboundary = __webpack_require__(59325);
const _notfoundboundary = __webpack_require__(41860);
const _getsegmentvalue = __webpack_require__(98904);
const _createroutercachekey = __webpack_require__(47046);
/**
 * Add refetch marker to router state at the point of the current layout segment.
 * This ensures the response returned is not further down than the current layout segment.
 */ function walkAddRefetch(segmentPathToWalk, treeToRecreate) {
    if (segmentPathToWalk) {
        const [segment, parallelRouteKey] = segmentPathToWalk;
        const isLast = segmentPathToWalk.length === 2;
        if ((0, _matchsegments.matchSegment)(treeToRecreate[0], segment)) {
            if (treeToRecreate[1].hasOwnProperty(parallelRouteKey)) {
                if (isLast) {
                    const subTree = walkAddRefetch(undefined, treeToRecreate[1][parallelRouteKey]);
                    return [
                        treeToRecreate[0],
                        {
                            ...treeToRecreate[1],
                            [parallelRouteKey]: [
                                subTree[0],
                                subTree[1],
                                subTree[2],
                                "refetch"
                            ]
                        }
                    ];
                }
                return [
                    treeToRecreate[0],
                    {
                        ...treeToRecreate[1],
                        [parallelRouteKey]: walkAddRefetch(segmentPathToWalk.slice(2), treeToRecreate[1][parallelRouteKey])
                    }
                ];
            }
        }
    }
    return treeToRecreate;
}
// TODO-APP: Replace with new React API for finding dom nodes without a `ref` when available
/**
 * Wraps ReactDOM.findDOMNode with additional logic to hide React Strict Mode warning
 */ function findDOMNode(instance) {
    // Tree-shake for server bundle
    if (true) return null;
    // Only apply strict mode warning when not in production
    if (false) {}
    return _reactdom.default.findDOMNode(instance);
}
const rectProperties = [
    "bottom",
    "height",
    "left",
    "right",
    "top",
    "width",
    "x",
    "y"
];
/**
 * Check if a HTMLElement is hidden or fixed/sticky position
 */ function shouldSkipElement(element) {
    // we ignore fixed or sticky positioned elements since they'll likely pass the "in-viewport" check
    // and will result in a situation we bail on scroll because of something like a fixed nav,
    // even though the actual page content is offscreen
    if ([
        "sticky",
        "fixed"
    ].includes(getComputedStyle(element).position)) {
        if (false) {}
        return true;
    }
    // Uses `getBoundingClientRect` to check if the element is hidden instead of `offsetParent`
    // because `offsetParent` doesn't consider document/body
    const rect = element.getBoundingClientRect();
    return rectProperties.every((item)=>rect[item] === 0);
}
/**
 * Check if the top corner of the HTMLElement is in the viewport.
 */ function topOfElementInViewport(element, viewportHeight) {
    const rect = element.getBoundingClientRect();
    return rect.top >= 0 && rect.top <= viewportHeight;
}
/**
 * Find the DOM node for a hash fragment.
 * If `top` the page has to scroll to the top of the page. This mirrors the browser's behavior.
 * If the hash fragment is an id, the page has to scroll to the element with that id.
 * If the hash fragment is a name, the page has to scroll to the first element with that name.
 */ function getHashFragmentDomNode(hashFragment) {
    // If the hash fragment is `top` the page has to scroll to the top of the page.
    if (hashFragment === "top") {
        return document.body;
    }
    var _document_getElementById;
    // If the hash fragment is an id, the page has to scroll to the element with that id.
    return (_document_getElementById = document.getElementById(hashFragment)) != null ? _document_getElementById : document.getElementsByName(hashFragment)[0];
}
class InnerScrollAndFocusHandler extends _react.default.Component {
    componentDidMount() {
        this.handlePotentialScroll();
    }
    componentDidUpdate() {
        // Because this property is overwritten in handlePotentialScroll it's fine to always run it when true as it'll be set to false for subsequent renders.
        if (this.props.focusAndScrollRef.apply) {
            this.handlePotentialScroll();
        }
    }
    render() {
        return this.props.children;
    }
    constructor(...args){
        super(...args);
        this.handlePotentialScroll = ()=>{
            // Handle scroll and focus, it's only applied once in the first useEffect that triggers that changed.
            const { focusAndScrollRef, segmentPath } = this.props;
            if (focusAndScrollRef.apply) {
                // segmentPaths is an array of segment paths that should be scrolled to
                // if the current segment path is not in the array, the scroll is not applied
                // unless the array is empty, in which case the scroll is always applied
                if (focusAndScrollRef.segmentPaths.length !== 0 && !focusAndScrollRef.segmentPaths.some((scrollRefSegmentPath)=>segmentPath.every((segment, index)=>(0, _matchsegments.matchSegment)(segment, scrollRefSegmentPath[index])))) {
                    return;
                }
                let domNode = null;
                const hashFragment = focusAndScrollRef.hashFragment;
                if (hashFragment) {
                    domNode = getHashFragmentDomNode(hashFragment);
                }
                // `findDOMNode` is tricky because it returns just the first child if the component is a fragment.
                // This already caused a bug where the first child was a <link/> in head.
                if (!domNode) {
                    domNode = findDOMNode(this);
                }
                // If there is no DOM node this layout-router level is skipped. It'll be handled higher-up in the tree.
                if (!(domNode instanceof Element)) {
                    return;
                }
                // Verify if the element is a HTMLElement and if we want to consider it for scroll behavior.
                // If the element is skipped, try to select the next sibling and try again.
                while(!(domNode instanceof HTMLElement) || shouldSkipElement(domNode)){
                    // No siblings found that match the criteria are found, so handle scroll higher up in the tree instead.
                    if (domNode.nextElementSibling === null) {
                        return;
                    }
                    domNode = domNode.nextElementSibling;
                }
                // State is mutated to ensure that the focus and scroll is applied only once.
                focusAndScrollRef.apply = false;
                focusAndScrollRef.onlyHashChange = false;
                focusAndScrollRef.hashFragment = null;
                focusAndScrollRef.segmentPaths = [];
                (0, _handlesmoothscroll.handleSmoothScroll)(()=>{
                    // In case of hash scroll, we only need to scroll the element into view
                    if (hashFragment) {
                        domNode.scrollIntoView();
                        return;
                    }
                    // Store the current viewport height because reading `clientHeight` causes a reflow,
                    // and it won't change during this function.
                    const htmlElement = document.documentElement;
                    const viewportHeight = htmlElement.clientHeight;
                    // If the element's top edge is already in the viewport, exit early.
                    if (topOfElementInViewport(domNode, viewportHeight)) {
                        return;
                    }
                    // Otherwise, try scrolling go the top of the document to be backward compatible with pages
                    // scrollIntoView() called on `<html/>` element scrolls horizontally on chrome and firefox (that shouldn't happen)
                    // We could use it to scroll horizontally following RTL but that also seems to be broken - it will always scroll left
                    // scrollLeft = 0 also seems to ignore RTL and manually checking for RTL is too much hassle so we will scroll just vertically
                    htmlElement.scrollTop = 0;
                    // Scroll to domNode if domNode is not in viewport when scrolled to top of document
                    if (!topOfElementInViewport(domNode, viewportHeight)) {
                        domNode.scrollIntoView();
                    }
                }, {
                    // We will force layout by querying domNode position
                    dontForceLayout: true,
                    onlyHashChange: focusAndScrollRef.onlyHashChange
                });
                // Set focus on the element
                domNode.focus();
            }
        };
    }
}
function ScrollAndFocusHandler(param) {
    let { segmentPath, children } = param;
    const context = (0, _react.useContext)(_approutercontext.GlobalLayoutRouterContext);
    if (!context) {
        throw new Error("invariant global layout router not mounted");
    }
    return /*#__PURE__*/ _react.default.createElement(InnerScrollAndFocusHandler, {
        segmentPath: segmentPath,
        focusAndScrollRef: context.focusAndScrollRef
    }, children);
}
/**
 * InnerLayoutRouter handles rendering the provided segment based on the cache.
 */ function InnerLayoutRouter(param) {
    let { parallelRouterKey, url, childNodes, childProp, segmentPath, tree, // isActive,
    cacheKey } = param;
    const context = (0, _react.useContext)(_approutercontext.GlobalLayoutRouterContext);
    if (!context) {
        throw new Error("invariant global layout router not mounted");
    }
    const { buildId, changeByServerResponse, tree: fullTree } = context;
    // Read segment path from the parallel router cache node.
    let childNode = childNodes.get(cacheKey);
    // If childProp is available this means it's the Flight / SSR case.
    if (childProp && // TODO-APP: verify if this can be null based on user code
    childProp.current !== null) {
        if (!childNode) {
            // Add the segment's subTreeData to the cache.
            // This writes to the cache when there is no item in the cache yet. It never *overwrites* existing cache items which is why it's safe in concurrent mode.
            childNode = {
                status: _approutercontext.CacheStates.READY,
                data: null,
                subTreeData: childProp.current,
                parallelRoutes: new Map()
            };
            childNodes.set(cacheKey, childNode);
        } else {
            if (childNode.status === _approutercontext.CacheStates.LAZY_INITIALIZED) {
                // @ts-expect-error we're changing it's type!
                childNode.status = _approutercontext.CacheStates.READY;
                // @ts-expect-error
                childNode.subTreeData = childProp.current;
            }
        }
    }
    // When childNode is not available during rendering client-side we need to fetch it from the server.
    if (!childNode || childNode.status === _approutercontext.CacheStates.LAZY_INITIALIZED) {
        /**
     * Router state with refetch marker added
     */ // TODO-APP: remove ''
        const refetchTree = walkAddRefetch([
            "",
            ...segmentPath
        ], fullTree);
        childNode = {
            status: _approutercontext.CacheStates.DATA_FETCH,
            data: (0, _fetchserverresponse.fetchServerResponse)(new URL(url, location.origin), refetchTree, context.nextUrl, buildId),
            subTreeData: null,
            head: childNode && childNode.status === _approutercontext.CacheStates.LAZY_INITIALIZED ? childNode.head : undefined,
            parallelRoutes: childNode && childNode.status === _approutercontext.CacheStates.LAZY_INITIALIZED ? childNode.parallelRoutes : new Map()
        };
        /**
     * Flight data fetch kicked off during render and put into the cache.
     */ childNodes.set(cacheKey, childNode);
    }
    // This case should never happen so it throws an error. It indicates there's a bug in the Next.js.
    if (!childNode) {
        throw new Error("Child node should always exist");
    }
    // This case should never happen so it throws an error. It indicates there's a bug in the Next.js.
    if (childNode.subTreeData && childNode.data) {
        throw new Error("Child node should not have both subTreeData and data");
    }
    // If cache node has a data request we have to unwrap response by `use` and update the cache.
    if (childNode.data) {
        /**
     * Flight response data
     */ // When the data has not resolved yet `use` will suspend here.
        const [flightData, overrideCanonicalUrl] = (0, _react.use)(childNode.data);
        // segmentPath from the server does not match the layout's segmentPath
        childNode.data = null;
        // setTimeout is used to start a new transition during render, this is an intentional hack around React.
        setTimeout(()=>{
            (0, _react.startTransition)(()=>{
                changeByServerResponse(fullTree, flightData, overrideCanonicalUrl);
            });
        });
        // Suspend infinitely as `changeByServerResponse` will cause a different part of the tree to be rendered.
        (0, _react.use)((0, _infinitepromise.createInfinitePromise)());
    }
    // If cache node has no subTreeData and no data request we have to infinitely suspend as the data will likely flow in from another place.
    // TODO-APP: double check users can't return null in a component that will kick in here.
    if (!childNode.subTreeData) {
        (0, _react.use)((0, _infinitepromise.createInfinitePromise)());
    }
    const subtree = /*#__PURE__*/ _react.default.createElement(_approutercontext.LayoutRouterContext.Provider, {
        value: {
            tree: tree[1][parallelRouterKey],
            childNodes: childNode.parallelRoutes,
            // TODO-APP: overriding of url for parallel routes
            url: url
        }
    }, childNode.subTreeData);
    // Ensure root layout is not wrapped in a div as the root layout renders `<html>`
    return subtree;
}
/**
 * Renders suspense boundary with the provided "loading" property as the fallback.
 * If no loading property is provided it renders the children without a suspense boundary.
 */ function LoadingBoundary(param) {
    let { children, loading, loadingStyles, hasLoading } = param;
    if (hasLoading) {
        return /*#__PURE__*/ _react.default.createElement(_react.Suspense, {
            fallback: /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, loadingStyles, loading)
        }, children);
    }
    return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, children);
}
function OuterLayoutRouter(param) {
    let { parallelRouterKey, segmentPath, childProp, error, errorStyles, templateStyles, loading, loadingStyles, hasLoading, template, notFound, notFoundStyles, styles } = param;
    const context = (0, _react.useContext)(_approutercontext.LayoutRouterContext);
    if (!context) {
        throw new Error("invariant expected layout router to be mounted");
    }
    const { childNodes, tree, url } = context;
    // Get the current parallelRouter cache node
    let childNodesForParallelRouter = childNodes.get(parallelRouterKey);
    // If the parallel router cache node does not exist yet, create it.
    // This writes to the cache when there is no item in the cache yet. It never *overwrites* existing cache items which is why it's safe in concurrent mode.
    if (!childNodesForParallelRouter) {
        childNodesForParallelRouter = new Map();
        childNodes.set(parallelRouterKey, childNodesForParallelRouter);
    }
    // Get the active segment in the tree
    // The reason arrays are used in the data format is that these are transferred from the server to the browser so it's optimized to save bytes.
    const treeSegment = tree[1][parallelRouterKey][0];
    const childPropSegment = childProp.segment;
    // If segment is an array it's a dynamic route and we want to read the dynamic route value as the segment to get from the cache.
    const currentChildSegmentValue = (0, _getsegmentvalue.getSegmentValue)(treeSegment);
    /**
   * Decides which segments to keep rendering, all segments that are not active will be wrapped in `<Offscreen>`.
   */ // TODO-APP: Add handling of `<Offscreen>` when it's available.
    const preservedSegments = [
        treeSegment
    ];
    return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, styles, preservedSegments.map((preservedSegment)=>{
        const isChildPropSegment = (0, _matchsegments.matchSegment)(preservedSegment, childPropSegment);
        const preservedSegmentValue = (0, _getsegmentvalue.getSegmentValue)(preservedSegment);
        const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(preservedSegment);
        return(/*
            - Error boundary
              - Only renders error boundary if error component is provided.
              - Rendered for each segment to ensure they have their own error state.
            - Loading boundary
              - Only renders suspense boundary if loading components is provided.
              - Rendered for each segment to ensure they have their own loading state.
              - Passed to the router during rendering to ensure it can be immediately rendered when suspending on a Flight fetch.
          */ /*#__PURE__*/ _react.default.createElement(_approutercontext.TemplateContext.Provider, {
            key: (0, _createroutercachekey.createRouterCacheKey)(preservedSegment, true),
            value: /*#__PURE__*/ _react.default.createElement(ScrollAndFocusHandler, {
                segmentPath: segmentPath
            }, /*#__PURE__*/ _react.default.createElement(_errorboundary.ErrorBoundary, {
                errorComponent: error,
                errorStyles: errorStyles
            }, /*#__PURE__*/ _react.default.createElement(LoadingBoundary, {
                hasLoading: hasLoading,
                loading: loading,
                loadingStyles: loadingStyles
            }, /*#__PURE__*/ _react.default.createElement(_notfoundboundary.NotFoundBoundary, {
                notFound: notFound,
                notFoundStyles: notFoundStyles
            }, /*#__PURE__*/ _react.default.createElement(_redirectboundary.RedirectBoundary, null, /*#__PURE__*/ _react.default.createElement(InnerLayoutRouter, {
                parallelRouterKey: parallelRouterKey,
                url: url,
                tree: tree,
                childNodes: childNodesForParallelRouter,
                childProp: isChildPropSegment ? childProp : null,
                segmentPath: segmentPath,
                cacheKey: cacheKey,
                isActive: currentChildSegmentValue === preservedSegmentValue
            }))))))
        }, templateStyles, template));
    }));
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=layout-router.js.map


/***/ }),

/***/ 83395:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    matchSegment: function() {
        return matchSegment;
    },
    canSegmentBeOverridden: function() {
        return canSegmentBeOverridden;
    }
});
const _getsegmentparam = __webpack_require__(41844);
const matchSegment = (existingSegment, segment)=>{
    // segment is either Array or string
    if (typeof existingSegment === "string") {
        if (typeof segment === "string") {
            // Common case: segment is just a string
            return existingSegment === segment;
        }
        return false;
    }
    if (typeof segment === "string") {
        return false;
    }
    return existingSegment[0] === segment[0] && existingSegment[1] === segment[1];
};
const canSegmentBeOverridden = (existingSegment, segment)=>{
    var _getSegmentParam;
    if (Array.isArray(existingSegment) || !Array.isArray(segment)) {
        return false;
    }
    return ((_getSegmentParam = (0, _getsegmentparam.getSegmentParam)(existingSegment)) == null ? void 0 : _getSegmentParam.param) === segment[0];
};
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=match-segments.js.map


/***/ }),

/***/ 89674:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
// useLayoutSegments() // Only the segments for the current place. ['children', 'dashboard', 'children', 'integrations'] -> /dashboard/integrations (/dashboard/layout.js would get ['children', 'dashboard', 'children', 'integrations'])

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    ReadonlyURLSearchParams: function() {
        return ReadonlyURLSearchParams;
    },
    useSearchParams: function() {
        return useSearchParams;
    },
    usePathname: function() {
        return usePathname;
    },
    ServerInsertedHTMLContext: function() {
        return _serverinsertedhtml.ServerInsertedHTMLContext;
    },
    useServerInsertedHTML: function() {
        return _serverinsertedhtml.useServerInsertedHTML;
    },
    useRouter: function() {
        return useRouter;
    },
    useParams: function() {
        return useParams;
    },
    useSelectedLayoutSegments: function() {
        return useSelectedLayoutSegments;
    },
    useSelectedLayoutSegment: function() {
        return useSelectedLayoutSegment;
    },
    redirect: function() {
        return _redirect.redirect;
    },
    notFound: function() {
        return _notfound.notFound;
    }
});
const _react = __webpack_require__(18038);
const _approutercontext = __webpack_require__(57085);
const _hooksclientcontext = __webpack_require__(39569);
const _clienthookinservercomponenterror = __webpack_require__(86157);
const _getsegmentvalue = __webpack_require__(98904);
const _serverinsertedhtml = __webpack_require__(79618);
const _redirect = __webpack_require__(4975);
const _notfound = __webpack_require__(40107);
const INTERNAL_URLSEARCHPARAMS_INSTANCE = Symbol("internal for urlsearchparams readonly");
function readonlyURLSearchParamsError() {
    return new Error("ReadonlyURLSearchParams cannot be modified");
}
class ReadonlyURLSearchParams {
    [Symbol.iterator]() {
        return this[INTERNAL_URLSEARCHPARAMS_INSTANCE][Symbol.iterator]();
    }
    append() {
        throw readonlyURLSearchParamsError();
    }
    delete() {
        throw readonlyURLSearchParamsError();
    }
    set() {
        throw readonlyURLSearchParamsError();
    }
    sort() {
        throw readonlyURLSearchParamsError();
    }
    constructor(urlSearchParams){
        this[INTERNAL_URLSEARCHPARAMS_INSTANCE] = urlSearchParams;
        this.entries = urlSearchParams.entries.bind(urlSearchParams);
        this.forEach = urlSearchParams.forEach.bind(urlSearchParams);
        this.get = urlSearchParams.get.bind(urlSearchParams);
        this.getAll = urlSearchParams.getAll.bind(urlSearchParams);
        this.has = urlSearchParams.has.bind(urlSearchParams);
        this.keys = urlSearchParams.keys.bind(urlSearchParams);
        this.values = urlSearchParams.values.bind(urlSearchParams);
        this.toString = urlSearchParams.toString.bind(urlSearchParams);
    }
}
function useSearchParams() {
    (0, _clienthookinservercomponenterror.clientHookInServerComponentError)("useSearchParams");
    const searchParams = (0, _react.useContext)(_hooksclientcontext.SearchParamsContext);
    // In the case where this is `null`, the compat types added in
    // `next-env.d.ts` will add a new overload that changes the return type to
    // include `null`.
    const readonlySearchParams = (0, _react.useMemo)(()=>{
        if (!searchParams) {
            // When the router is not ready in pages, we won't have the search params
            // available.
            return null;
        }
        return new ReadonlyURLSearchParams(searchParams);
    }, [
        searchParams
    ]);
    if (true) {
        // AsyncLocalStorage should not be included in the client bundle.
        const { bailoutToClientRendering } = __webpack_require__(54778);
        if (bailoutToClientRendering()) {
            // TODO-APP: handle dynamic = 'force-static' here and on the client
            return readonlySearchParams;
        }
    }
    return readonlySearchParams;
}
function usePathname() {
    (0, _clienthookinservercomponenterror.clientHookInServerComponentError)("usePathname");
    // In the case where this is `null`, the compat types added in `next-env.d.ts`
    // will add a new overload that changes the return type to include `null`.
    return (0, _react.useContext)(_hooksclientcontext.PathnameContext);
}
function useRouter() {
    (0, _clienthookinservercomponenterror.clientHookInServerComponentError)("useRouter");
    const router = (0, _react.useContext)(_approutercontext.AppRouterContext);
    if (router === null) {
        throw new Error("invariant expected app router to be mounted");
    }
    return router;
}
// this function performs a depth-first search of the tree to find the selected
// params
function getSelectedParams(tree, params) {
    if (params === void 0) params = {};
    const parallelRoutes = tree[1];
    for (const parallelRoute of Object.values(parallelRoutes)){
        const segment = parallelRoute[0];
        const isDynamicParameter = Array.isArray(segment);
        const segmentValue = isDynamicParameter ? segment[1] : segment;
        if (!segmentValue || segmentValue.startsWith("__PAGE__")) continue;
        // Ensure catchAll and optional catchall are turned into an array
        const isCatchAll = isDynamicParameter && (segment[2] === "c" || segment[2] === "oc");
        if (isCatchAll) {
            params[segment[0]] = segment[1].split("/");
        } else if (isDynamicParameter) {
            params[segment[0]] = segment[1];
        }
        params = getSelectedParams(parallelRoute, params);
    }
    return params;
}
function useParams() {
    (0, _clienthookinservercomponenterror.clientHookInServerComponentError)("useParams");
    const globalLayoutRouterContext = (0, _react.useContext)(_approutercontext.GlobalLayoutRouterContext);
    if (!globalLayoutRouterContext) {
        // This only happens in `pages`. Type is overwritten in navigation.d.ts
        return null;
    }
    return getSelectedParams(globalLayoutRouterContext.tree);
}
// TODO-APP: handle parallel routes
/**
 * Get the canonical parameters from the current level to the leaf node.
 */ function getSelectedLayoutSegmentPath(tree, parallelRouteKey, first, segmentPath) {
    if (first === void 0) first = true;
    if (segmentPath === void 0) segmentPath = [];
    let node;
    if (first) {
        // Use the provided parallel route key on the first parallel route
        node = tree[1][parallelRouteKey];
    } else {
        // After first parallel route prefer children, if there's no children pick the first parallel route.
        const parallelRoutes = tree[1];
        var _parallelRoutes_children;
        node = (_parallelRoutes_children = parallelRoutes.children) != null ? _parallelRoutes_children : Object.values(parallelRoutes)[0];
    }
    if (!node) return segmentPath;
    const segment = node[0];
    const segmentValue = (0, _getsegmentvalue.getSegmentValue)(segment);
    if (!segmentValue || segmentValue.startsWith("__PAGE__")) return segmentPath;
    segmentPath.push(segmentValue);
    return getSelectedLayoutSegmentPath(node, parallelRouteKey, false, segmentPath);
}
function useSelectedLayoutSegments(parallelRouteKey) {
    if (parallelRouteKey === void 0) parallelRouteKey = "children";
    (0, _clienthookinservercomponenterror.clientHookInServerComponentError)("useSelectedLayoutSegments");
    const { tree } = (0, _react.useContext)(_approutercontext.LayoutRouterContext);
    return getSelectedLayoutSegmentPath(tree, parallelRouteKey);
}
function useSelectedLayoutSegment(parallelRouteKey) {
    if (parallelRouteKey === void 0) parallelRouteKey = "children";
    (0, _clienthookinservercomponenterror.clientHookInServerComponentError)("useSelectedLayoutSegment");
    const selectedLayoutSegments = useSelectedLayoutSegments(parallelRouteKey);
    if (selectedLayoutSegments.length === 0) {
        return null;
    }
    return selectedLayoutSegments[0];
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=navigation.js.map


/***/ }),

/***/ 41860:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "NotFoundBoundary", ({
    enumerable: true,
    get: function() {
        return NotFoundBoundary;
    }
}));
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _navigation = __webpack_require__(89674);
class NotFoundErrorBoundary extends _react.default.Component {
    static getDerivedStateFromError(error) {
        if ((error == null ? void 0 : error.digest) === "NEXT_NOT_FOUND") {
            return {
                notFoundTriggered: true
            };
        }
        // Re-throw if error is not for 404
        throw error;
    }
    static getDerivedStateFromProps(props, state) {
        /**
     * Handles reset of the error boundary when a navigation happens.
     * Ensures the error boundary does not stay enabled when navigating to a new page.
     * Approach of setState in render is safe as it checks the previous pathname and then overrides
     * it as outlined in https://react.dev/reference/react/useState#storing-information-from-previous-renders
     */ if (props.pathname !== state.previousPathname && state.notFoundTriggered) {
            return {
                notFoundTriggered: false,
                previousPathname: props.pathname
            };
        }
        return {
            notFoundTriggered: state.notFoundTriggered,
            previousPathname: props.pathname
        };
    }
    render() {
        if (this.state.notFoundTriggered) {
            return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, /*#__PURE__*/ _react.default.createElement("meta", {
                name: "robots",
                content: "noindex"
            }),  false && /*#__PURE__*/ 0, this.props.notFoundStyles, this.props.notFound);
        }
        return this.props.children;
    }
    constructor(props){
        super(props);
        this.state = {
            notFoundTriggered: !!props.asNotFound,
            previousPathname: props.pathname
        };
    }
}
function NotFoundBoundary(param) {
    let { notFound, notFoundStyles, asNotFound, children } = param;
    const pathname = (0, _navigation.usePathname)();
    return notFound ? /*#__PURE__*/ _react.default.createElement(NotFoundErrorBoundary, {
        pathname: pathname,
        notFound: notFound,
        notFoundStyles: notFoundStyles,
        asNotFound: asNotFound
    }, children) : /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, children);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=not-found-boundary.js.map


/***/ }),

/***/ 40107:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    notFound: function() {
        return notFound;
    },
    isNotFoundError: function() {
        return isNotFoundError;
    }
});
const NOT_FOUND_ERROR_CODE = "NEXT_NOT_FOUND";
function notFound() {
    // eslint-disable-next-line no-throw-literal
    const error = new Error(NOT_FOUND_ERROR_CODE);
    error.digest = NOT_FOUND_ERROR_CODE;
    throw error;
}
function isNotFoundError(error) {
    return (error == null ? void 0 : error.digest) === NOT_FOUND_ERROR_CODE;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=not-found.js.map


/***/ }),

/***/ 29970:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/*
    This is a simple promise queue that allows you to limit the number of concurrent promises
    that are running at any given time. It's used to limit the number of concurrent
    prefetch requests that are being made to the server but could be used for other
    things as well.
*/ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "PromiseQueue", ({
    enumerable: true,
    get: function() {
        return PromiseQueue;
    }
}));
const _class_private_field_loose_base = __webpack_require__(15200);
const _class_private_field_loose_key = __webpack_require__(3070);
var _maxConcurrency = /*#__PURE__*/ _class_private_field_loose_key._("_maxConcurrency"), _runningCount = /*#__PURE__*/ _class_private_field_loose_key._("_runningCount"), _queue = /*#__PURE__*/ _class_private_field_loose_key._("_queue"), _processNext = /*#__PURE__*/ _class_private_field_loose_key._("_processNext");
class PromiseQueue {
    enqueue(promiseFn) {
        let taskResolve;
        let taskReject;
        const taskPromise = new Promise((resolve, reject)=>{
            taskResolve = resolve;
            taskReject = reject;
        });
        const task = async ()=>{
            try {
                _class_private_field_loose_base._(this, _runningCount)[_runningCount]++;
                const result = await promiseFn();
                taskResolve(result);
            } catch (error) {
                taskReject(error);
            } finally{
                _class_private_field_loose_base._(this, _runningCount)[_runningCount]--;
                _class_private_field_loose_base._(this, _processNext)[_processNext]();
            }
        };
        const enqueueResult = {
            promiseFn: taskPromise,
            task
        };
        // wonder if we should take a LIFO approach here
        _class_private_field_loose_base._(this, _queue)[_queue].push(enqueueResult);
        _class_private_field_loose_base._(this, _processNext)[_processNext]();
        return taskPromise;
    }
    bump(promiseFn) {
        const index = _class_private_field_loose_base._(this, _queue)[_queue].findIndex((item)=>item.promiseFn === promiseFn);
        if (index > -1) {
            const bumpedItem = _class_private_field_loose_base._(this, _queue)[_queue].splice(index, 1)[0];
            _class_private_field_loose_base._(this, _queue)[_queue].unshift(bumpedItem);
            _class_private_field_loose_base._(this, _processNext)[_processNext](true);
        }
    }
    constructor(maxConcurrency = 5){
        Object.defineProperty(this, _processNext, {
            value: processNext
        });
        Object.defineProperty(this, _maxConcurrency, {
            writable: true,
            value: void 0
        });
        Object.defineProperty(this, _runningCount, {
            writable: true,
            value: void 0
        });
        Object.defineProperty(this, _queue, {
            writable: true,
            value: void 0
        });
        _class_private_field_loose_base._(this, _maxConcurrency)[_maxConcurrency] = maxConcurrency;
        _class_private_field_loose_base._(this, _runningCount)[_runningCount] = 0;
        _class_private_field_loose_base._(this, _queue)[_queue] = [];
    }
}
function processNext(forced) {
    if (forced === void 0) forced = false;
    if ((_class_private_field_loose_base._(this, _runningCount)[_runningCount] < _class_private_field_loose_base._(this, _maxConcurrency)[_maxConcurrency] || forced) && _class_private_field_loose_base._(this, _queue)[_queue].length > 0) {
        var _class_private_field_loose_base__queue_shift;
        (_class_private_field_loose_base__queue_shift = _class_private_field_loose_base._(this, _queue)[_queue].shift()) == null ? void 0 : _class_private_field_loose_base__queue_shift.task();
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=promise-queue.js.map


/***/ }),

/***/ 59325:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    RedirectErrorBoundary: function() {
        return RedirectErrorBoundary;
    },
    RedirectBoundary: function() {
        return RedirectBoundary;
    }
});
const _interop_require_wildcard = __webpack_require__(45298);
const _react = /*#__PURE__*/ _interop_require_wildcard._(__webpack_require__(18038));
const _navigation = __webpack_require__(89674);
const _redirect = __webpack_require__(4975);
function HandleRedirect(param) {
    let { redirect, reset, redirectType } = param;
    const router = (0, _navigation.useRouter)();
    (0, _react.useEffect)(()=>{
        // @ts-ignore startTransition exists
        _react.default.startTransition(()=>{
            if (redirectType === _redirect.RedirectType.push) {
                router.push(redirect, {});
            } else {
                router.replace(redirect, {});
            }
            reset();
        });
    }, [
        redirect,
        redirectType,
        reset,
        router
    ]);
    return null;
}
class RedirectErrorBoundary extends _react.default.Component {
    static getDerivedStateFromError(error) {
        if ((0, _redirect.isRedirectError)(error)) {
            const url = (0, _redirect.getURLFromRedirectError)(error);
            const redirectType = (0, _redirect.getRedirectTypeFromError)(error);
            return {
                redirect: url,
                redirectType
            };
        }
        // Re-throw if error is not for redirect
        throw error;
    }
    render() {
        const { redirect, redirectType } = this.state;
        if (redirect !== null && redirectType !== null) {
            return /*#__PURE__*/ _react.default.createElement(HandleRedirect, {
                redirect: redirect,
                redirectType: redirectType,
                reset: ()=>this.setState({
                        redirect: null
                    })
            });
        }
        return this.props.children;
    }
    constructor(props){
        super(props);
        this.state = {
            redirect: null,
            redirectType: null
        };
    }
}
function RedirectBoundary(param) {
    let { children } = param;
    const router = (0, _navigation.useRouter)();
    return /*#__PURE__*/ _react.default.createElement(RedirectErrorBoundary, {
        router: router
    }, children);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=redirect-boundary.js.map


/***/ }),

/***/ 4975:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    RedirectType: function() {
        return RedirectType;
    },
    getRedirectError: function() {
        return getRedirectError;
    },
    redirect: function() {
        return redirect;
    },
    isRedirectError: function() {
        return isRedirectError;
    },
    getURLFromRedirectError: function() {
        return getURLFromRedirectError;
    },
    getRedirectTypeFromError: function() {
        return getRedirectTypeFromError;
    }
});
const _requestasyncstorage = __webpack_require__(32644);
const REDIRECT_ERROR_CODE = "NEXT_REDIRECT";
var RedirectType;
(function(RedirectType) {
    RedirectType["push"] = "push";
    RedirectType["replace"] = "replace";
})(RedirectType || (RedirectType = {}));
function getRedirectError(url, type) {
    const error = new Error(REDIRECT_ERROR_CODE);
    error.digest = REDIRECT_ERROR_CODE + ";" + type + ";" + url;
    const requestStore = _requestasyncstorage.requestAsyncStorage.getStore();
    if (requestStore) {
        error.mutableCookies = requestStore.mutableCookies;
    }
    return error;
}
function redirect(url, type) {
    if (type === void 0) type = "replace";
    throw getRedirectError(url, type);
}
function isRedirectError(error) {
    if (typeof (error == null ? void 0 : error.digest) !== "string") return false;
    const [errorCode, type, destination] = error.digest.split(";", 3);
    return errorCode === REDIRECT_ERROR_CODE && (type === "replace" || type === "push") && typeof destination === "string";
}
function getURLFromRedirectError(error) {
    if (!isRedirectError(error)) return null;
    // Slices off the beginning of the digest that contains the code and the
    // separating ';'.
    return error.digest.split(";", 3)[2];
}
function getRedirectTypeFromError(error) {
    if (!isRedirectError(error)) {
        throw new Error("Not a redirect error");
    }
    return error.digest.split(";", 3)[1];
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=redirect.js.map


/***/ }),

/***/ 81286:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "default", ({
    enumerable: true,
    get: function() {
        return RenderFromTemplateContext;
    }
}));
const _interop_require_wildcard = __webpack_require__(45298);
const _react = /*#__PURE__*/ _interop_require_wildcard._(__webpack_require__(18038));
const _approutercontext = __webpack_require__(57085);
function RenderFromTemplateContext() {
    const children = (0, _react.useContext)(_approutercontext.TemplateContext);
    return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, children);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=render-from-template-context.js.map


/***/ }),

/***/ 74170:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "applyFlightData", ({
    enumerable: true,
    get: function() {
        return applyFlightData;
    }
}));
const _approutercontext = __webpack_require__(57085);
const _filllazyitemstillleafwithhead = __webpack_require__(76798);
const _fillcachewithnewsubtreedata = __webpack_require__(50566);
function applyFlightData(existingCache, cache, flightDataPath, wasPrefetched) {
    if (wasPrefetched === void 0) wasPrefetched = false;
    // The one before last item is the router state tree patch
    const [treePatch, subTreeData, head] = flightDataPath.slice(-3);
    // Handles case where prefetch only returns the router tree patch without rendered components.
    if (subTreeData === null) {
        return false;
    }
    if (flightDataPath.length === 3) {
        cache.status = _approutercontext.CacheStates.READY;
        cache.subTreeData = subTreeData;
        (0, _filllazyitemstillleafwithhead.fillLazyItemsTillLeafWithHead)(cache, existingCache, treePatch, head, wasPrefetched);
    } else {
        // Copy subTreeData for the root node of the cache.
        cache.status = _approutercontext.CacheStates.READY;
        cache.subTreeData = existingCache.subTreeData;
        cache.parallelRoutes = new Map(existingCache.parallelRoutes);
        // Create a copy of the existing cache with the subTreeData applied.
        (0, _fillcachewithnewsubtreedata.fillCacheWithNewSubTreeData)(cache, existingCache, flightDataPath, wasPrefetched);
    }
    return true;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=apply-flight-data.js.map


/***/ }),

/***/ 63786:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "applyRouterStatePatchToTree", ({
    enumerable: true,
    get: function() {
        return applyRouterStatePatchToTree;
    }
}));
const _matchsegments = __webpack_require__(83395);
/**
 * Deep merge of the two router states. Parallel route keys are preserved if the patch doesn't have them.
 */ function applyPatch(initialTree, patchTree) {
    const [initialSegment, initialParallelRoutes] = initialTree;
    const [patchSegment, patchParallelRoutes] = patchTree;
    // if the applied patch segment is __DEFAULT__ then we can ignore it and return the initial tree
    // this is because the __DEFAULT__ segment is used as a placeholder on navigation
    if (patchSegment === "__DEFAULT__" && initialSegment !== "__DEFAULT__") {
        return initialTree;
    }
    if ((0, _matchsegments.matchSegment)(initialSegment, patchSegment)) {
        const newParallelRoutes = {};
        for(const key in initialParallelRoutes){
            const isInPatchTreeParallelRoutes = typeof patchParallelRoutes[key] !== "undefined";
            if (isInPatchTreeParallelRoutes) {
                newParallelRoutes[key] = applyPatch(initialParallelRoutes[key], patchParallelRoutes[key]);
            } else {
                newParallelRoutes[key] = initialParallelRoutes[key];
            }
        }
        for(const key in patchParallelRoutes){
            if (newParallelRoutes[key]) {
                continue;
            }
            newParallelRoutes[key] = patchParallelRoutes[key];
        }
        const tree = [
            initialSegment,
            newParallelRoutes
        ];
        if (initialTree[2]) {
            tree[2] = initialTree[2];
        }
        if (initialTree[3]) {
            tree[3] = initialTree[3];
        }
        if (initialTree[4]) {
            tree[4] = initialTree[4];
        }
        return tree;
    }
    return patchTree;
}
function applyRouterStatePatchToTree(flightSegmentPath, flightRouterState, treePatch) {
    const [segment, parallelRoutes, , , isRootLayout] = flightRouterState;
    // Root refresh
    if (flightSegmentPath.length === 1) {
        const tree = applyPatch(flightRouterState, treePatch);
        return tree;
    }
    const [currentSegment, parallelRouteKey] = flightSegmentPath;
    // Tree path returned from the server should always match up with the current tree in the browser
    if (!(0, _matchsegments.matchSegment)(currentSegment, segment)) {
        return null;
    }
    const lastSegment = flightSegmentPath.length === 2;
    let parallelRoutePatch;
    if (lastSegment) {
        parallelRoutePatch = applyPatch(parallelRoutes[parallelRouteKey], treePatch);
    } else {
        parallelRoutePatch = applyRouterStatePatchToTree(flightSegmentPath.slice(2), parallelRoutes[parallelRouteKey], treePatch);
        if (parallelRoutePatch === null) {
            return null;
        }
    }
    const tree = [
        flightSegmentPath[0],
        {
            ...parallelRoutes,
            [parallelRouteKey]: parallelRoutePatch
        }
    ];
    // Current segment is the root layout
    if (isRootLayout) {
        tree[4] = true;
    }
    return tree;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=apply-router-state-patch-to-tree.js.map


/***/ }),

/***/ 47847:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    extractPathFromFlightRouterState: function() {
        return extractPathFromFlightRouterState;
    },
    computeChangedPath: function() {
        return computeChangedPath;
    }
});
const _interceptionroutes = __webpack_require__(96624);
const _matchsegments = __webpack_require__(83395);
const segmentToPathname = (segment)=>{
    if (typeof segment === "string") {
        return segment;
    }
    return segment[1];
};
function normalizePathname(pathname) {
    return pathname.split("/").reduce((acc, segment)=>{
        if (segment === "" || segment.startsWith("(") && segment.endsWith(")")) {
            return acc;
        }
        return acc + "/" + segment;
    }, "") || "/";
}
function extractPathFromFlightRouterState(flightRouterState) {
    const segment = Array.isArray(flightRouterState[0]) ? flightRouterState[0][1] : flightRouterState[0];
    if (segment === "__DEFAULT__" || _interceptionroutes.INTERCEPTION_ROUTE_MARKERS.some((m)=>segment.startsWith(m))) return undefined;
    if (segment.startsWith("__PAGE__")) return "";
    const path = [
        segment
    ];
    var _flightRouterState_;
    const parallelRoutes = (_flightRouterState_ = flightRouterState[1]) != null ? _flightRouterState_ : {};
    const childrenPath = parallelRoutes.children ? extractPathFromFlightRouterState(parallelRoutes.children) : undefined;
    if (childrenPath !== undefined) {
        path.push(childrenPath);
    } else {
        for (const [key, value] of Object.entries(parallelRoutes)){
            if (key === "children") continue;
            const childPath = extractPathFromFlightRouterState(value);
            if (childPath !== undefined) {
                path.push(childPath);
            }
        }
    }
    // TODO-APP: optimise this, it's not ideal to join and split
    return normalizePathname(path.join("/"));
}
function computeChangedPathImpl(treeA, treeB) {
    const [segmentA, parallelRoutesA] = treeA;
    const [segmentB, parallelRoutesB] = treeB;
    const normalizedSegmentA = segmentToPathname(segmentA);
    const normalizedSegmentB = segmentToPathname(segmentB);
    if (_interceptionroutes.INTERCEPTION_ROUTE_MARKERS.some((m)=>normalizedSegmentA.startsWith(m) || normalizedSegmentB.startsWith(m))) {
        return "";
    }
    if (!(0, _matchsegments.matchSegment)(segmentA, segmentB)) {
        var _extractPathFromFlightRouterState;
        // once we find where the tree changed, we compute the rest of the path by traversing the tree
        return (_extractPathFromFlightRouterState = extractPathFromFlightRouterState(treeB)) != null ? _extractPathFromFlightRouterState : "";
    }
    for(const parallelRouterKey in parallelRoutesA){
        if (parallelRoutesB[parallelRouterKey]) {
            const changedPath = computeChangedPathImpl(parallelRoutesA[parallelRouterKey], parallelRoutesB[parallelRouterKey]);
            if (changedPath !== null) {
                return segmentToPathname(segmentB) + "/" + changedPath;
            }
        }
    }
    return null;
}
function computeChangedPath(treeA, treeB) {
    const changedPath = computeChangedPathImpl(treeA, treeB);
    if (changedPath == null || changedPath === "/") {
        return changedPath;
    }
    // lightweight normalization to remove route groups
    return normalizePathname(changedPath);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=compute-changed-path.js.map


/***/ }),

/***/ 37554:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createHrefFromUrl", ({
    enumerable: true,
    get: function() {
        return createHrefFromUrl;
    }
}));
function createHrefFromUrl(url, includeHash) {
    if (includeHash === void 0) includeHash = true;
    return url.pathname + url.search + (includeHash ? url.hash : "");
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=create-href-from-url.js.map


/***/ }),

/***/ 35436:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createInitialRouterState", ({
    enumerable: true,
    get: function() {
        return createInitialRouterState;
    }
}));
const _approutercontext = __webpack_require__(57085);
const _createhreffromurl = __webpack_require__(37554);
const _filllazyitemstillleafwithhead = __webpack_require__(76798);
const _computechangedpath = __webpack_require__(47847);
function createInitialRouterState(param) {
    let { buildId, initialTree, children, initialCanonicalUrl, initialParallelRoutes, isServer, location, initialHead } = param;
    const cache = {
        status: _approutercontext.CacheStates.READY,
        data: null,
        subTreeData: children,
        // The cache gets seeded during the first render. `initialParallelRoutes` ensures the cache from the first render is there during the second render.
        parallelRoutes: isServer ? new Map() : initialParallelRoutes
    };
    // When the cache hasn't been seeded yet we fill the cache with the head.
    if (initialParallelRoutes === null || initialParallelRoutes.size === 0) {
        (0, _filllazyitemstillleafwithhead.fillLazyItemsTillLeafWithHead)(cache, undefined, initialTree, initialHead);
    }
    var _ref;
    return {
        buildId,
        tree: initialTree,
        cache,
        prefetchCache: new Map(),
        pushRef: {
            pendingPush: false,
            mpaNavigation: false
        },
        focusAndScrollRef: {
            apply: false,
            onlyHashChange: false,
            hashFragment: null,
            segmentPaths: []
        },
        canonicalUrl: // This is safe to do as canonicalUrl can't be rendered, it's only used to control the history updates in the useEffect further down in this file.
        location ? (0, _createhreffromurl.createHrefFromUrl)(location) : initialCanonicalUrl,
        nextUrl: (_ref = (0, _computechangedpath.extractPathFromFlightRouterState)(initialTree) || (location == null ? void 0 : location.pathname)) != null ? _ref : null
    };
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=create-initial-router-state.js.map


/***/ }),

/***/ 86001:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createOptimisticTree", ({
    enumerable: true,
    get: function() {
        return createOptimisticTree;
    }
}));
const _matchsegments = __webpack_require__(83395);
function createOptimisticTree(segments, flightRouterState, parentRefetch) {
    const [existingSegment, existingParallelRoutes, url, refresh, isRootLayout] = flightRouterState || [
        null,
        {}
    ];
    const segment = segments[0];
    const isLastSegment = segments.length === 1;
    const segmentMatches = existingSegment !== null && (0, _matchsegments.matchSegment)(existingSegment, segment);
    // if there are multiple parallel routes at this level, we need to refetch here
    // to ensure we get the correct tree. This is because we don't know which
    // parallel route will match the next segment.
    const hasMultipleParallelRoutes = Object.keys(existingParallelRoutes).length > 1;
    const shouldRefetchThisLevel = !flightRouterState || !segmentMatches || hasMultipleParallelRoutes;
    let parallelRoutes = {};
    if (existingSegment !== null && segmentMatches) {
        parallelRoutes = existingParallelRoutes;
    }
    let childTree;
    // if there's multiple parallel routes at this level, we shouldn't create an
    // optimistic tree for the next level because we don't know which one will
    // match the next segment.
    if (!isLastSegment && !hasMultipleParallelRoutes) {
        const childItem = createOptimisticTree(segments.slice(1), parallelRoutes ? parallelRoutes.children : null, parentRefetch || shouldRefetchThisLevel);
        childTree = childItem;
    }
    const result = [
        segment,
        {
            ...parallelRoutes,
            ...childTree ? {
                children: childTree
            } : {}
        }
    ];
    if (url) {
        result[2] = url;
    }
    if (!parentRefetch && shouldRefetchThisLevel) {
        result[3] = "refetch";
    } else if (segmentMatches && refresh) {
        result[3] = refresh;
    }
    if (segmentMatches && isRootLayout) {
        result[4] = isRootLayout;
    }
    return result;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=create-optimistic-tree.js.map


/***/ }),

/***/ 35982:
/***/ ((module, exports) => {

"use strict";
/**
 * Create data fetching record for Promise.
 */ // TODO-APP: change `any` to type inference.

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createRecordFromThenable", ({
    enumerable: true,
    get: function() {
        return createRecordFromThenable;
    }
}));
function createRecordFromThenable(thenable) {
    thenable.status = "pending";
    thenable.then((value)=>{
        if (thenable.status === "pending") {
            thenable.status = "fulfilled";
            thenable.value = value;
        }
    }, (err)=>{
        if (thenable.status === "pending") {
            thenable.status = "rejected";
            thenable.value = err;
        }
    });
    return thenable;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=create-record-from-thenable.js.map


/***/ }),

/***/ 47046:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createRouterCacheKey", ({
    enumerable: true,
    get: function() {
        return createRouterCacheKey;
    }
}));
function createRouterCacheKey(segment, withoutSearchParameters) {
    if (withoutSearchParameters === void 0) withoutSearchParameters = false;
    return Array.isArray(segment) ? segment[0] + "|" + segment[1] + "|" + segment[2] : withoutSearchParameters && segment.startsWith("__PAGE__") ? "__PAGE__" : segment;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=create-router-cache-key.js.map


/***/ }),

/***/ 17926:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "fetchServerResponse", ({
    enumerable: true,
    get: function() {
        return fetchServerResponse;
    }
}));
const _client = __webpack_require__(97897);
const _approuterheaders = __webpack_require__(86739);
const _approuter = __webpack_require__(80131);
const _appcallserver = __webpack_require__(13518);
const _routerreducertypes = __webpack_require__(4574);
const _hash = __webpack_require__(20199);
function doMpaNavigation(url) {
    return [
        (0, _approuter.urlToUrlWithoutFlightMarker)(url).toString(),
        undefined
    ];
}
async function fetchServerResponse(url, flightRouterState, nextUrl, currentBuildId, prefetchKind) {
    const headers = {
        // Enable flight response
        [_approuterheaders.RSC]: "1",
        // Provide the current router state
        [_approuterheaders.NEXT_ROUTER_STATE_TREE]: encodeURIComponent(JSON.stringify(flightRouterState))
    };
    /**
   * Three cases:
   * - `prefetchKind` is `undefined`, it means it's a normal navigation, so we want to prefetch the page data fully
   * - `prefetchKind` is `full` - we want to prefetch the whole page so same as above
   * - `prefetchKind` is `auto` - if the page is dynamic, prefetch the page data partially, if static prefetch the page data fully
   */ if (prefetchKind === _routerreducertypes.PrefetchKind.AUTO) {
        headers[_approuterheaders.NEXT_ROUTER_PREFETCH] = "1";
    }
    if (nextUrl) {
        headers[_approuterheaders.NEXT_URL] = nextUrl;
    }
    const uniqueCacheQuery = (0, _hash.hexHash)([
        headers[_approuterheaders.NEXT_ROUTER_PREFETCH] || "0",
        headers[_approuterheaders.NEXT_ROUTER_STATE_TREE],
        headers[_approuterheaders.NEXT_URL]
    ].join(","));
    try {
        let fetchUrl = new URL(url);
        if (true) {
            if (false) {}
        }
        // Add unique cache query to avoid caching conflicts on CDN which don't respect to Vary header
        fetchUrl.searchParams.set(_approuterheaders.NEXT_RSC_UNION_QUERY, uniqueCacheQuery);
        const res = await fetch(fetchUrl, {
            // Backwards compat for older browsers. `same-origin` is the default in modern browsers.
            credentials: "same-origin",
            headers
        });
        const responseUrl = (0, _approuter.urlToUrlWithoutFlightMarker)(res.url);
        const canonicalUrl = res.redirected ? responseUrl : undefined;
        const contentType = res.headers.get("content-type") || "";
        let isFlightResponse = contentType === _approuterheaders.RSC_CONTENT_TYPE_HEADER;
        if (true) {
            if (false) {}
        }
        // If fetch returns something different than flight response handle it like a mpa navigation
        // If the fetch was not 200, we also handle it like a mpa navigation
        if (!isFlightResponse || !res.ok) {
            return doMpaNavigation(responseUrl.toString());
        }
        // Handle the `fetch` readable stream that can be unwrapped by `React.use`.
        const [buildId, flightData] = await (0, _client.createFromFetch)(Promise.resolve(res), {
            callServer: _appcallserver.callServer
        });
        if (currentBuildId !== buildId) {
            return doMpaNavigation(res.url);
        }
        return [
            flightData,
            canonicalUrl
        ];
    } catch (err) {
        console.error("Failed to fetch RSC payload. Falling back to browser navigation.", err);
        // If fetch fails handle it like a mpa navigation
        // TODO-APP: Add a test for the case where a CORS request fails, e.g. external url redirect coming from the response.
        // See https://github.com/vercel/next.js/issues/43605#issuecomment-1451617521 for a reproduction.
        return [
            url.toString(),
            undefined
        ];
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=fetch-server-response.js.map


/***/ }),

/***/ 81706:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "fillCacheWithDataProperty", ({
    enumerable: true,
    get: function() {
        return fillCacheWithDataProperty;
    }
}));
const _approutercontext = __webpack_require__(57085);
const _createroutercachekey = __webpack_require__(47046);
function fillCacheWithDataProperty(newCache, existingCache, flightSegmentPath, fetchResponse, bailOnParallelRoutes) {
    if (bailOnParallelRoutes === void 0) bailOnParallelRoutes = false;
    const isLastEntry = flightSegmentPath.length <= 2;
    const [parallelRouteKey, segment] = flightSegmentPath;
    const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(segment);
    const existingChildSegmentMap = existingCache.parallelRoutes.get(parallelRouteKey);
    if (!existingChildSegmentMap || bailOnParallelRoutes && existingCache.parallelRoutes.size > 1) {
        // Bailout because the existing cache does not have the path to the leaf node
        // or the existing cache has multiple parallel routes
        // Will trigger lazy fetch in layout-router because of missing segment
        return {
            bailOptimistic: true
        };
    }
    let childSegmentMap = newCache.parallelRoutes.get(parallelRouteKey);
    if (!childSegmentMap || childSegmentMap === existingChildSegmentMap) {
        childSegmentMap = new Map(existingChildSegmentMap);
        newCache.parallelRoutes.set(parallelRouteKey, childSegmentMap);
    }
    const existingChildCacheNode = existingChildSegmentMap.get(cacheKey);
    let childCacheNode = childSegmentMap.get(cacheKey);
    // In case of last segment start off the fetch at this level and don't copy further down.
    if (isLastEntry) {
        if (!childCacheNode || !childCacheNode.data || childCacheNode === existingChildCacheNode) {
            childSegmentMap.set(cacheKey, {
                status: _approutercontext.CacheStates.DATA_FETCH,
                data: fetchResponse(),
                subTreeData: null,
                parallelRoutes: new Map()
            });
        }
        return;
    }
    if (!childCacheNode || !existingChildCacheNode) {
        // Start fetch in the place where the existing cache doesn't have the data yet.
        if (!childCacheNode) {
            childSegmentMap.set(cacheKey, {
                status: _approutercontext.CacheStates.DATA_FETCH,
                data: fetchResponse(),
                subTreeData: null,
                parallelRoutes: new Map()
            });
        }
        return;
    }
    if (childCacheNode === existingChildCacheNode) {
        childCacheNode = {
            status: childCacheNode.status,
            data: childCacheNode.data,
            subTreeData: childCacheNode.subTreeData,
            parallelRoutes: new Map(childCacheNode.parallelRoutes)
        };
        childSegmentMap.set(cacheKey, childCacheNode);
    }
    return fillCacheWithDataProperty(childCacheNode, existingChildCacheNode, flightSegmentPath.slice(2), fetchResponse);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=fill-cache-with-data-property.js.map


/***/ }),

/***/ 50566:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "fillCacheWithNewSubTreeData", ({
    enumerable: true,
    get: function() {
        return fillCacheWithNewSubTreeData;
    }
}));
const _approutercontext = __webpack_require__(57085);
const _invalidatecachebyrouterstate = __webpack_require__(1956);
const _filllazyitemstillleafwithhead = __webpack_require__(76798);
const _createroutercachekey = __webpack_require__(47046);
function fillCacheWithNewSubTreeData(newCache, existingCache, flightDataPath, wasPrefetched) {
    const isLastEntry = flightDataPath.length <= 5;
    const [parallelRouteKey, segment] = flightDataPath;
    const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(segment);
    const existingChildSegmentMap = existingCache.parallelRoutes.get(parallelRouteKey);
    if (!existingChildSegmentMap) {
        // Bailout because the existing cache does not have the path to the leaf node
        // Will trigger lazy fetch in layout-router because of missing segment
        return;
    }
    let childSegmentMap = newCache.parallelRoutes.get(parallelRouteKey);
    if (!childSegmentMap || childSegmentMap === existingChildSegmentMap) {
        childSegmentMap = new Map(existingChildSegmentMap);
        newCache.parallelRoutes.set(parallelRouteKey, childSegmentMap);
    }
    const existingChildCacheNode = existingChildSegmentMap.get(cacheKey);
    let childCacheNode = childSegmentMap.get(cacheKey);
    if (isLastEntry) {
        if (!childCacheNode || !childCacheNode.data || childCacheNode === existingChildCacheNode) {
            childCacheNode = {
                status: _approutercontext.CacheStates.READY,
                data: null,
                subTreeData: flightDataPath[3],
                // Ensure segments other than the one we got data for are preserved.
                parallelRoutes: existingChildCacheNode ? new Map(existingChildCacheNode.parallelRoutes) : new Map()
            };
            if (existingChildCacheNode) {
                (0, _invalidatecachebyrouterstate.invalidateCacheByRouterState)(childCacheNode, existingChildCacheNode, flightDataPath[2]);
            }
            (0, _filllazyitemstillleafwithhead.fillLazyItemsTillLeafWithHead)(childCacheNode, existingChildCacheNode, flightDataPath[2], flightDataPath[4], wasPrefetched);
            childSegmentMap.set(cacheKey, childCacheNode);
        }
        return;
    }
    if (!childCacheNode || !existingChildCacheNode) {
        // Bailout because the existing cache does not have the path to the leaf node
        // Will trigger lazy fetch in layout-router because of missing segment
        return;
    }
    if (childCacheNode === existingChildCacheNode) {
        childCacheNode = {
            status: childCacheNode.status,
            data: childCacheNode.data,
            subTreeData: childCacheNode.subTreeData,
            parallelRoutes: new Map(childCacheNode.parallelRoutes)
        };
        childSegmentMap.set(cacheKey, childCacheNode);
    }
    fillCacheWithNewSubTreeData(childCacheNode, existingChildCacheNode, flightDataPath.slice(2), wasPrefetched);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=fill-cache-with-new-subtree-data.js.map


/***/ }),

/***/ 76798:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "fillLazyItemsTillLeafWithHead", ({
    enumerable: true,
    get: function() {
        return fillLazyItemsTillLeafWithHead;
    }
}));
const _approutercontext = __webpack_require__(57085);
const _createroutercachekey = __webpack_require__(47046);
function fillLazyItemsTillLeafWithHead(newCache, existingCache, routerState, head, wasPrefetched) {
    const isLastSegment = Object.keys(routerState[1]).length === 0;
    if (isLastSegment) {
        newCache.head = head;
        return;
    }
    // Remove segment that we got data for so that it is filled in during rendering of subTreeData.
    for(const key in routerState[1]){
        const parallelRouteState = routerState[1][key];
        const segmentForParallelRoute = parallelRouteState[0];
        const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(segmentForParallelRoute);
        if (existingCache) {
            const existingParallelRoutesCacheNode = existingCache.parallelRoutes.get(key);
            if (existingParallelRoutesCacheNode) {
                let parallelRouteCacheNode = new Map(existingParallelRoutesCacheNode);
                const existingCacheNode = parallelRouteCacheNode.get(cacheKey);
                const newCacheNode = wasPrefetched && existingCacheNode ? {
                    status: existingCacheNode.status,
                    data: existingCacheNode.data,
                    subTreeData: existingCacheNode.subTreeData,
                    parallelRoutes: new Map(existingCacheNode.parallelRoutes)
                } : {
                    status: _approutercontext.CacheStates.LAZY_INITIALIZED,
                    data: null,
                    subTreeData: null,
                    parallelRoutes: new Map(existingCacheNode == null ? void 0 : existingCacheNode.parallelRoutes)
                };
                // Overrides the cache key with the new cache node.
                parallelRouteCacheNode.set(cacheKey, newCacheNode);
                // Traverse deeper to apply the head / fill lazy items till the head.
                fillLazyItemsTillLeafWithHead(newCacheNode, existingCacheNode, parallelRouteState, head, wasPrefetched);
                newCache.parallelRoutes.set(key, parallelRouteCacheNode);
                continue;
            }
        }
        const newCacheNode = {
            status: _approutercontext.CacheStates.LAZY_INITIALIZED,
            data: null,
            subTreeData: null,
            parallelRoutes: new Map()
        };
        const existingParallelRoutes = newCache.parallelRoutes.get(key);
        if (existingParallelRoutes) {
            existingParallelRoutes.set(cacheKey, newCacheNode);
        } else {
            newCache.parallelRoutes.set(key, new Map([
                [
                    cacheKey,
                    newCacheNode
                ]
            ]));
        }
        fillLazyItemsTillLeafWithHead(newCacheNode, undefined, parallelRouteState, head, wasPrefetched);
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=fill-lazy-items-till-leaf-with-head.js.map


/***/ }),

/***/ 3154:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    PrefetchCacheEntryStatus: function() {
        return PrefetchCacheEntryStatus;
    },
    getPrefetchEntryCacheStatus: function() {
        return getPrefetchEntryCacheStatus;
    }
});
const FIVE_MINUTES = 5 * 60 * 1000;
const THIRTY_SECONDS = 30 * 1000;
var PrefetchCacheEntryStatus;
(function(PrefetchCacheEntryStatus) {
    PrefetchCacheEntryStatus["fresh"] = "fresh";
    PrefetchCacheEntryStatus["reusable"] = "reusable";
    PrefetchCacheEntryStatus["expired"] = "expired";
    PrefetchCacheEntryStatus["stale"] = "stale";
})(PrefetchCacheEntryStatus || (PrefetchCacheEntryStatus = {}));
function getPrefetchEntryCacheStatus(param) {
    let { kind, prefetchTime, lastUsedTime } = param;
    // if the cache entry was prefetched or read less than 30s ago, then we want to re-use it
    if (Date.now() < (lastUsedTime != null ? lastUsedTime : prefetchTime) + THIRTY_SECONDS) {
        return lastUsedTime ? "reusable" : "fresh";
    }
    // if the cache entry was prefetched less than 5 mins ago, then we want to re-use only the loading state
    if (kind === "auto") {
        if (Date.now() < prefetchTime + FIVE_MINUTES) {
            return "stale";
        }
    }
    // if the cache entry was prefetched less than 5 mins ago and was a "full" prefetch, then we want to re-use it "full
    if (kind === "full") {
        if (Date.now() < prefetchTime + FIVE_MINUTES) {
            return "reusable";
        }
    }
    return "expired";
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=get-prefetch-cache-entry-status.js.map


/***/ }),

/***/ 93729:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "handleMutable", ({
    enumerable: true,
    get: function() {
        return handleMutable;
    }
}));
const _computechangedpath = __webpack_require__(47847);
function handleMutable(state, mutable) {
    var _mutable_canonicalUrl;
    var _mutable_shouldScroll;
    // shouldScroll is true by default, can override to false.
    const shouldScroll = (_mutable_shouldScroll = mutable.shouldScroll) != null ? _mutable_shouldScroll : true;
    var _mutable_scrollableSegments, _computeChangedPath;
    return {
        buildId: state.buildId,
        // Set href.
        canonicalUrl: mutable.canonicalUrl != null ? mutable.canonicalUrl === state.canonicalUrl ? state.canonicalUrl : mutable.canonicalUrl : state.canonicalUrl,
        pushRef: {
            pendingPush: mutable.pendingPush != null ? mutable.pendingPush : state.pushRef.pendingPush,
            mpaNavigation: mutable.mpaNavigation != null ? mutable.mpaNavigation : state.pushRef.mpaNavigation
        },
        // All navigation requires scroll and focus management to trigger.
        focusAndScrollRef: {
            apply: shouldScroll ? (mutable == null ? void 0 : mutable.scrollableSegments) !== undefined ? true : state.focusAndScrollRef.apply : false,
            onlyHashChange: !!mutable.hashFragment && state.canonicalUrl.split("#")[0] === ((_mutable_canonicalUrl = mutable.canonicalUrl) == null ? void 0 : _mutable_canonicalUrl.split("#")[0]),
            hashFragment: shouldScroll ? mutable.hashFragment && mutable.hashFragment !== "" ? decodeURIComponent(mutable.hashFragment.slice(1)) : state.focusAndScrollRef.hashFragment : null,
            segmentPaths: shouldScroll ? (_mutable_scrollableSegments = mutable == null ? void 0 : mutable.scrollableSegments) != null ? _mutable_scrollableSegments : state.focusAndScrollRef.segmentPaths : []
        },
        // Apply cache.
        cache: mutable.cache ? mutable.cache : state.cache,
        prefetchCache: mutable.prefetchCache ? mutable.prefetchCache : state.prefetchCache,
        // Apply patched router state.
        tree: mutable.patchedTree !== undefined ? mutable.patchedTree : state.tree,
        nextUrl: mutable.patchedTree !== undefined ? (_computeChangedPath = (0, _computechangedpath.computeChangedPath)(state.tree, mutable.patchedTree)) != null ? _computeChangedPath : state.canonicalUrl : state.nextUrl
    };
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=handle-mutable.js.map


/***/ }),

/***/ 39857:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "invalidateCacheBelowFlightSegmentPath", ({
    enumerable: true,
    get: function() {
        return invalidateCacheBelowFlightSegmentPath;
    }
}));
const _createroutercachekey = __webpack_require__(47046);
function invalidateCacheBelowFlightSegmentPath(newCache, existingCache, flightSegmentPath) {
    const isLastEntry = flightSegmentPath.length <= 2;
    const [parallelRouteKey, segment] = flightSegmentPath;
    const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(segment);
    const existingChildSegmentMap = existingCache.parallelRoutes.get(parallelRouteKey);
    if (!existingChildSegmentMap) {
        // Bailout because the existing cache does not have the path to the leaf node
        // Will trigger lazy fetch in layout-router because of missing segment
        return;
    }
    let childSegmentMap = newCache.parallelRoutes.get(parallelRouteKey);
    if (!childSegmentMap || childSegmentMap === existingChildSegmentMap) {
        childSegmentMap = new Map(existingChildSegmentMap);
        newCache.parallelRoutes.set(parallelRouteKey, childSegmentMap);
    }
    // In case of last entry don't copy further down.
    if (isLastEntry) {
        childSegmentMap.delete(cacheKey);
        return;
    }
    const existingChildCacheNode = existingChildSegmentMap.get(cacheKey);
    let childCacheNode = childSegmentMap.get(cacheKey);
    if (!childCacheNode || !existingChildCacheNode) {
        // Bailout because the existing cache does not have the path to the leaf node
        // Will trigger lazy fetch in layout-router because of missing segment
        return;
    }
    if (childCacheNode === existingChildCacheNode) {
        childCacheNode = {
            status: childCacheNode.status,
            data: childCacheNode.data,
            subTreeData: childCacheNode.subTreeData,
            parallelRoutes: new Map(childCacheNode.parallelRoutes)
        };
        childSegmentMap.set(cacheKey, childCacheNode);
    }
    invalidateCacheBelowFlightSegmentPath(childCacheNode, existingChildCacheNode, flightSegmentPath.slice(2));
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=invalidate-cache-below-flight-segmentpath.js.map


/***/ }),

/***/ 1956:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "invalidateCacheByRouterState", ({
    enumerable: true,
    get: function() {
        return invalidateCacheByRouterState;
    }
}));
const _createroutercachekey = __webpack_require__(47046);
function invalidateCacheByRouterState(newCache, existingCache, routerState) {
    // Remove segment that we got data for so that it is filled in during rendering of subTreeData.
    for(const key in routerState[1]){
        const segmentForParallelRoute = routerState[1][key][0];
        const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(segmentForParallelRoute);
        const existingParallelRoutesCacheNode = existingCache.parallelRoutes.get(key);
        if (existingParallelRoutesCacheNode) {
            let parallelRouteCacheNode = new Map(existingParallelRoutesCacheNode);
            parallelRouteCacheNode.delete(cacheKey);
            newCache.parallelRoutes.set(key, parallelRouteCacheNode);
        }
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=invalidate-cache-by-router-state.js.map


/***/ }),

/***/ 11517:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "isNavigatingToNewRootLayout", ({
    enumerable: true,
    get: function() {
        return isNavigatingToNewRootLayout;
    }
}));
function isNavigatingToNewRootLayout(currentTree, nextTree) {
    // Compare segments
    const currentTreeSegment = currentTree[0];
    const nextTreeSegment = nextTree[0];
    // If any segment is different before we find the root layout, the root layout has changed.
    // E.g. /same/(group1)/layout.js -> /same/(group2)/layout.js
    // First segment is 'same' for both, keep looking. (group1) changed to (group2) before the root layout was found, it must have changed.
    if (Array.isArray(currentTreeSegment) && Array.isArray(nextTreeSegment)) {
        // Compare dynamic param name and type but ignore the value, different values would not affect the current root layout
        // /[name] - /slug1 and /slug2, both values (slug1 & slug2) still has the same layout /[name]/layout.js
        if (currentTreeSegment[0] !== nextTreeSegment[0] || currentTreeSegment[2] !== nextTreeSegment[2]) {
            return true;
        }
    } else if (currentTreeSegment !== nextTreeSegment) {
        return true;
    }
    // Current tree root layout found
    if (currentTree[4]) {
        // If the next tree doesn't have the root layout flag, it must have changed.
        return !nextTree[4];
    }
    // Current tree  didn't have its root layout here, must have changed.
    if (nextTree[4]) {
        return true;
    }
    // We can't assume it's `parallelRoutes.children` here in case the root layout is `app/@something/layout.js`
    // But it's not possible to be more than one parallelRoutes before the root layout is found
    // TODO-APP: change to traverse all parallel routes
    const currentTreeChild = Object.values(currentTree[1])[0];
    const nextTreeChild = Object.values(nextTree[1])[0];
    if (!currentTreeChild || !nextTreeChild) return true;
    return isNavigatingToNewRootLayout(currentTreeChild, nextTreeChild);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=is-navigating-to-new-root-layout.js.map


/***/ }),

/***/ 6224:
/***/ ((module, exports) => {

"use strict";
/**
 * Read record value or throw Promise if it's not resolved yet.
 */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "readRecordValue", ({
    enumerable: true,
    get: function() {
        return readRecordValue;
    }
}));
function readRecordValue(thenable) {
    // @ts-expect-error TODO: fix type
    if (thenable.status === "fulfilled") {
        // @ts-expect-error TODO: fix type
        return thenable.value;
    } else {
        throw thenable;
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=read-record-value.js.map


/***/ }),

/***/ 57852:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "fastRefreshReducer", ({
    enumerable: true,
    get: function() {
        return fastRefreshReducer;
    }
}));
const _fetchserverresponse = __webpack_require__(17926);
const _createrecordfromthenable = __webpack_require__(35982);
const _readrecordvalue = __webpack_require__(6224);
const _createhreffromurl = __webpack_require__(37554);
const _applyrouterstatepatchtotree = __webpack_require__(63786);
const _isnavigatingtonewrootlayout = __webpack_require__(11517);
const _navigatereducer = __webpack_require__(39111);
const _handlemutable = __webpack_require__(93729);
const _applyflightdata = __webpack_require__(74170);
// A version of refresh reducer that keeps the cache around instead of wiping all of it.
function fastRefreshReducerImpl(state, action) {
    const { cache, mutable, origin } = action;
    const href = state.canonicalUrl;
    const isForCurrentTree = JSON.stringify(mutable.previousTree) === JSON.stringify(state.tree);
    if (isForCurrentTree) {
        return (0, _handlemutable.handleMutable)(state, mutable);
    }
    if (!cache.data) {
        // TODO-APP: verify that `href` is not an external url.
        // Fetch data from the root of the tree.
        cache.data = (0, _createrecordfromthenable.createRecordFromThenable)((0, _fetchserverresponse.fetchServerResponse)(new URL(href, origin), [
            state.tree[0],
            state.tree[1],
            state.tree[2],
            "refetch"
        ], state.nextUrl, state.buildId));
    }
    const [flightData, canonicalUrlOverride] = (0, _readrecordvalue.readRecordValue)(cache.data);
    // Handle case when navigating to page in `pages` from `app`
    if (typeof flightData === "string") {
        return (0, _navigatereducer.handleExternalUrl)(state, mutable, flightData, state.pushRef.pendingPush);
    }
    // Remove cache.data as it has been resolved at this point.
    cache.data = null;
    let currentTree = state.tree;
    let currentCache = state.cache;
    for (const flightDataPath of flightData){
        // FlightDataPath with more than two items means unexpected Flight data was returned
        if (flightDataPath.length !== 3) {
            // TODO-APP: handle this case better
            console.log("REFRESH FAILED");
            return state;
        }
        // Given the path can only have two items the items are only the router state and subTreeData for the root.
        const [treePatch] = flightDataPath;
        const newTree = (0, _applyrouterstatepatchtotree.applyRouterStatePatchToTree)([
            ""
        ], currentTree, treePatch);
        if (newTree === null) {
            throw new Error("SEGMENT MISMATCH");
        }
        if ((0, _isnavigatingtonewrootlayout.isNavigatingToNewRootLayout)(currentTree, newTree)) {
            return (0, _navigatereducer.handleExternalUrl)(state, mutable, href, state.pushRef.pendingPush);
        }
        const canonicalUrlOverrideHref = canonicalUrlOverride ? (0, _createhreffromurl.createHrefFromUrl)(canonicalUrlOverride) : undefined;
        if (canonicalUrlOverride) {
            mutable.canonicalUrl = canonicalUrlOverrideHref;
        }
        const applied = (0, _applyflightdata.applyFlightData)(currentCache, cache, flightDataPath);
        if (applied) {
            mutable.cache = cache;
            currentCache = cache;
        }
        mutable.previousTree = currentTree;
        mutable.patchedTree = newTree;
        mutable.canonicalUrl = href;
        currentTree = newTree;
    }
    return (0, _handlemutable.handleMutable)(state, mutable);
}
function fastRefreshReducerNoop(state, _action) {
    return state;
}
const fastRefreshReducer =  true ? fastRefreshReducerNoop : 0;
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=fast-refresh-reducer.js.map


/***/ }),

/***/ 40097:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "findHeadInCache", ({
    enumerable: true,
    get: function() {
        return findHeadInCache;
    }
}));
const _createroutercachekey = __webpack_require__(47046);
function findHeadInCache(cache, parallelRoutes) {
    const isLastItem = Object.keys(parallelRoutes).length === 0;
    if (isLastItem) {
        return cache.head;
    }
    for(const key in parallelRoutes){
        const [segment, childParallelRoutes] = parallelRoutes[key];
        const childSegmentMap = cache.parallelRoutes.get(key);
        if (!childSegmentMap) {
            continue;
        }
        const cacheKey = (0, _createroutercachekey.createRouterCacheKey)(segment);
        const cacheNode = childSegmentMap.get(cacheKey);
        if (!cacheNode) {
            continue;
        }
        const item = findHeadInCache(cacheNode, childParallelRoutes);
        if (item) {
            return item;
        }
    }
    return undefined;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=find-head-in-cache.js.map


/***/ }),

/***/ 98904:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "getSegmentValue", ({
    enumerable: true,
    get: function() {
        return getSegmentValue;
    }
}));
function getSegmentValue(segment) {
    return Array.isArray(segment) ? segment[1] : segment;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=get-segment-value.js.map


/***/ }),

/***/ 39111:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    handleExternalUrl: function() {
        return handleExternalUrl;
    },
    navigateReducer: function() {
        return navigateReducer;
    }
});
const _approutercontext = __webpack_require__(57085);
const _fetchserverresponse = __webpack_require__(17926);
const _createrecordfromthenable = __webpack_require__(35982);
const _readrecordvalue = __webpack_require__(6224);
const _createhreffromurl = __webpack_require__(37554);
const _invalidatecachebelowflightsegmentpath = __webpack_require__(39857);
const _fillcachewithdataproperty = __webpack_require__(81706);
const _createoptimistictree = __webpack_require__(86001);
const _applyrouterstatepatchtotree = __webpack_require__(63786);
const _shouldhardnavigate = __webpack_require__(16947);
const _isnavigatingtonewrootlayout = __webpack_require__(11517);
const _routerreducertypes = __webpack_require__(4574);
const _handlemutable = __webpack_require__(93729);
const _applyflightdata = __webpack_require__(74170);
const _getprefetchcacheentrystatus = __webpack_require__(3154);
const _pruneprefetchcache = __webpack_require__(34757);
const _prefetchreducer = __webpack_require__(35290);
function handleExternalUrl(state, mutable, url, pendingPush) {
    mutable.previousTree = state.tree;
    mutable.mpaNavigation = true;
    mutable.canonicalUrl = url;
    mutable.pendingPush = pendingPush;
    mutable.scrollableSegments = undefined;
    return (0, _handlemutable.handleMutable)(state, mutable);
}
function generateSegmentsFromPatch(flightRouterPatch) {
    const segments = [];
    const [segment, parallelRoutes] = flightRouterPatch;
    if (Object.keys(parallelRoutes).length === 0) {
        return [
            [
                segment
            ]
        ];
    }
    for (const [parallelRouteKey, parallelRoute] of Object.entries(parallelRoutes)){
        for (const childSegment of generateSegmentsFromPatch(parallelRoute)){
            // If the segment is empty, it means we are at the root of the tree
            if (segment === "") {
                segments.push([
                    parallelRouteKey,
                    ...childSegment
                ]);
            } else {
                segments.push([
                    segment,
                    parallelRouteKey,
                    ...childSegment
                ]);
            }
        }
    }
    return segments;
}
function addRefetchToLeafSegments(newCache, currentCache, flightSegmentPath, treePatch, data) {
    let appliedPatch = false;
    newCache.status = _approutercontext.CacheStates.READY;
    newCache.subTreeData = currentCache.subTreeData;
    newCache.parallelRoutes = new Map(currentCache.parallelRoutes);
    const segmentPathsToFill = generateSegmentsFromPatch(treePatch).map((segment)=>[
            ...flightSegmentPath,
            ...segment
        ]);
    for (const segmentPaths of segmentPathsToFill){
        const res = (0, _fillcachewithdataproperty.fillCacheWithDataProperty)(newCache, currentCache, segmentPaths, data);
        if (!(res == null ? void 0 : res.bailOptimistic)) {
            appliedPatch = true;
        }
    }
    return appliedPatch;
}
function navigateReducer(state, action) {
    const { url, isExternalUrl, navigateType, cache, mutable, forceOptimisticNavigation, shouldScroll } = action;
    const { pathname, hash } = url;
    const href = (0, _createhreffromurl.createHrefFromUrl)(url);
    const pendingPush = navigateType === "push";
    // we want to prune the prefetch cache on every navigation to avoid it growing too large
    (0, _pruneprefetchcache.prunePrefetchCache)(state.prefetchCache);
    const isForCurrentTree = JSON.stringify(mutable.previousTree) === JSON.stringify(state.tree);
    if (isForCurrentTree) {
        return (0, _handlemutable.handleMutable)(state, mutable);
    }
    if (isExternalUrl) {
        return handleExternalUrl(state, mutable, url.toString(), pendingPush);
    }
    let prefetchValues = state.prefetchCache.get((0, _createhreffromurl.createHrefFromUrl)(url, false));
    if (forceOptimisticNavigation && (prefetchValues == null ? void 0 : prefetchValues.kind) !== _routerreducertypes.PrefetchKind.TEMPORARY) {
        const segments = pathname.split("/");
        // TODO-APP: figure out something better for index pages
        segments.push("__PAGE__");
        // Optimistic tree case.
        // If the optimistic tree is deeper than the current state leave that deeper part out of the fetch
        const optimisticTree = (0, _createoptimistictree.createOptimisticTree)(segments, state.tree, false);
        // we need a copy of the cache in case we need to revert to it
        const temporaryCacheNode = {
            ...cache
        };
        // Copy subTreeData for the root node of the cache.
        // Note: didn't do it above because typescript doesn't like it.
        temporaryCacheNode.status = _approutercontext.CacheStates.READY;
        temporaryCacheNode.subTreeData = state.cache.subTreeData;
        temporaryCacheNode.parallelRoutes = new Map(state.cache.parallelRoutes);
        let data;
        const fetchResponse = ()=>{
            if (!data) {
                data = (0, _createrecordfromthenable.createRecordFromThenable)((0, _fetchserverresponse.fetchServerResponse)(url, optimisticTree, state.nextUrl, state.buildId));
            }
            return data;
        };
        // TODO-APP: segments.slice(1) strips '', we can get rid of '' altogether.
        // TODO-APP: re-evaluate if we need to strip the last segment
        const optimisticFlightSegmentPath = segments.slice(1).map((segment)=>[
                "children",
                segment
            ]).flat();
        // Copy existing cache nodes as far as possible and fill in `data` property with the started data fetch.
        // The `data` property is used to suspend in layout-router during render if it hasn't resolved yet by the time it renders.
        const res = (0, _fillcachewithdataproperty.fillCacheWithDataProperty)(temporaryCacheNode, state.cache, optimisticFlightSegmentPath, fetchResponse, true);
        // If optimistic fetch couldn't happen it falls back to the non-optimistic case.
        if (!(res == null ? void 0 : res.bailOptimistic)) {
            mutable.previousTree = state.tree;
            mutable.patchedTree = optimisticTree;
            mutable.pendingPush = pendingPush;
            mutable.hashFragment = hash;
            mutable.shouldScroll = shouldScroll;
            mutable.scrollableSegments = [];
            mutable.cache = temporaryCacheNode;
            mutable.canonicalUrl = href;
            state.prefetchCache.set((0, _createhreffromurl.createHrefFromUrl)(url, false), {
                data: Promise.resolve(data),
                // this will make sure that the entry will be discarded after 30s
                kind: _routerreducertypes.PrefetchKind.TEMPORARY,
                prefetchTime: Date.now(),
                treeAtTimeOfPrefetch: state.tree,
                lastUsedTime: Date.now()
            });
            return (0, _handlemutable.handleMutable)(state, mutable);
        }
    }
    // If we don't have a prefetch value, we need to create one
    if (!prefetchValues) {
        const data = (0, _createrecordfromthenable.createRecordFromThenable)((0, _fetchserverresponse.fetchServerResponse)(url, state.tree, state.nextUrl, state.buildId, // in order to simulate the behavior of the prefetch cache
         false ? 0 : undefined));
        const newPrefetchValue = {
            data: Promise.resolve(data),
            // this will make sure that the entry will be discarded after 30s
            kind:  false ? 0 : _routerreducertypes.PrefetchKind.TEMPORARY,
            prefetchTime: Date.now(),
            treeAtTimeOfPrefetch: state.tree,
            lastUsedTime: null
        };
        state.prefetchCache.set((0, _createhreffromurl.createHrefFromUrl)(url, false), newPrefetchValue);
        prefetchValues = newPrefetchValue;
    }
    const prefetchEntryCacheStatus = (0, _getprefetchcacheentrystatus.getPrefetchEntryCacheStatus)(prefetchValues);
    // The one before last item is the router state tree patch
    const { treeAtTimeOfPrefetch, data } = prefetchValues;
    _prefetchreducer.prefetchQueue.bump(data);
    // Unwrap cache data with `use` to suspend here (in the reducer) until the fetch resolves.
    const [flightData, canonicalUrlOverride] = (0, _readrecordvalue.readRecordValue)(data);
    // important: we should only mark the cache node as dirty after we unsuspend from the call above
    prefetchValues.lastUsedTime = Date.now();
    // Handle case when navigating to page in `pages` from `app`
    if (typeof flightData === "string") {
        return handleExternalUrl(state, mutable, flightData, pendingPush);
    }
    let currentTree = state.tree;
    let currentCache = state.cache;
    let scrollableSegments = [];
    for (const flightDataPath of flightData){
        const flightSegmentPath = flightDataPath.slice(0, -4);
        // The one before last item is the router state tree patch
        const treePatch = flightDataPath.slice(-3)[0];
        // TODO-APP: remove ''
        const flightSegmentPathWithLeadingEmpty = [
            "",
            ...flightSegmentPath
        ];
        // Create new tree based on the flightSegmentPath and router state patch
        let newTree = (0, _applyrouterstatepatchtotree.applyRouterStatePatchToTree)(flightSegmentPathWithLeadingEmpty, currentTree, treePatch);
        // If the tree patch can't be applied to the current tree then we use the tree at time of prefetch
        // TODO-APP: This should instead fill in the missing pieces in `currentTree` with the data from `treeAtTimeOfPrefetch`, then apply the patch.
        if (newTree === null) {
            newTree = (0, _applyrouterstatepatchtotree.applyRouterStatePatchToTree)(flightSegmentPathWithLeadingEmpty, treeAtTimeOfPrefetch, treePatch);
        }
        if (newTree !== null) {
            if ((0, _isnavigatingtonewrootlayout.isNavigatingToNewRootLayout)(currentTree, newTree)) {
                return handleExternalUrl(state, mutable, href, pendingPush);
            }
            let applied = (0, _applyflightdata.applyFlightData)(currentCache, cache, flightDataPath, prefetchValues.kind === "auto" && prefetchEntryCacheStatus === _getprefetchcacheentrystatus.PrefetchCacheEntryStatus.reusable);
            if (!applied && prefetchEntryCacheStatus === _getprefetchcacheentrystatus.PrefetchCacheEntryStatus.stale) {
                applied = addRefetchToLeafSegments(cache, currentCache, flightSegmentPath, treePatch, ()=>(0, _fetchserverresponse.fetchServerResponse)(url, currentTree, state.nextUrl, state.buildId));
            }
            const hardNavigate = (0, _shouldhardnavigate.shouldHardNavigate)(flightSegmentPathWithLeadingEmpty, currentTree);
            if (hardNavigate) {
                cache.status = _approutercontext.CacheStates.READY;
                // Copy subTreeData for the root node of the cache.
                cache.subTreeData = currentCache.subTreeData;
                (0, _invalidatecachebelowflightsegmentpath.invalidateCacheBelowFlightSegmentPath)(cache, currentCache, flightSegmentPath);
                // Ensure the existing cache value is used when the cache was not invalidated.
                mutable.cache = cache;
            } else if (applied) {
                mutable.cache = cache;
            }
            currentCache = cache;
            currentTree = newTree;
            for (const subSegment of generateSegmentsFromPatch(treePatch)){
                const scrollableSegmentPath = [
                    ...flightSegmentPath,
                    ...subSegment
                ];
                // Filter out the __DEFAULT__ paths as they shouldn't be scrolled to in this case.
                if (scrollableSegmentPath[scrollableSegmentPath.length - 1] !== "__DEFAULT__") {
                    scrollableSegments.push(scrollableSegmentPath);
                }
            }
        }
    }
    mutable.previousTree = state.tree;
    mutable.patchedTree = currentTree;
    mutable.canonicalUrl = canonicalUrlOverride ? (0, _createhreffromurl.createHrefFromUrl)(canonicalUrlOverride) : href;
    mutable.pendingPush = pendingPush;
    mutable.scrollableSegments = scrollableSegments;
    mutable.hashFragment = hash;
    mutable.shouldScroll = shouldScroll;
    return (0, _handlemutable.handleMutable)(state, mutable);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=navigate-reducer.js.map


/***/ }),

/***/ 35290:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    prefetchQueue: function() {
        return prefetchQueue;
    },
    prefetchReducer: function() {
        return prefetchReducer;
    }
});
const _createhreffromurl = __webpack_require__(37554);
const _fetchserverresponse = __webpack_require__(17926);
const _routerreducertypes = __webpack_require__(4574);
const _createrecordfromthenable = __webpack_require__(35982);
const _pruneprefetchcache = __webpack_require__(34757);
const _approuterheaders = __webpack_require__(86739);
const _promisequeue = __webpack_require__(29970);
const prefetchQueue = new _promisequeue.PromiseQueue(5);
function prefetchReducer(state, action) {
    // let's prune the prefetch cache before we do anything else
    (0, _pruneprefetchcache.prunePrefetchCache)(state.prefetchCache);
    const { url } = action;
    url.searchParams.delete(_approuterheaders.NEXT_RSC_UNION_QUERY);
    const href = (0, _createhreffromurl.createHrefFromUrl)(url, false);
    const cacheEntry = state.prefetchCache.get(href);
    if (cacheEntry) {
        /**
     * If the cache entry present was marked as temporary, it means that we prefetched it from the navigate reducer,
     * where we didn't have the prefetch intent. We want to update it to the new, more accurate, kind here.
     */ if (cacheEntry.kind === _routerreducertypes.PrefetchKind.TEMPORARY) {
            state.prefetchCache.set(href, {
                ...cacheEntry,
                kind: action.kind
            });
        }
        /**
     * if the prefetch action was a full prefetch and that the current cache entry wasn't one, we want to re-prefetch,
     * otherwise we can re-use the current cache entry
     **/ if (!(cacheEntry.kind === _routerreducertypes.PrefetchKind.AUTO && action.kind === _routerreducertypes.PrefetchKind.FULL)) {
            return state;
        }
    }
    // fetchServerResponse is intentionally not awaited so that it can be unwrapped in the navigate-reducer
    const serverResponse = (0, _createrecordfromthenable.createRecordFromThenable)(prefetchQueue.enqueue(()=>(0, _fetchserverresponse.fetchServerResponse)(url, state.tree, state.nextUrl, state.buildId, action.kind)));
    // Create new tree based on the flightSegmentPath and router state patch
    state.prefetchCache.set(href, {
        // Create new tree based on the flightSegmentPath and router state patch
        treeAtTimeOfPrefetch: state.tree,
        data: serverResponse,
        kind: action.kind,
        prefetchTime: Date.now(),
        lastUsedTime: null
    });
    return state;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=prefetch-reducer.js.map


/***/ }),

/***/ 34757:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "prunePrefetchCache", ({
    enumerable: true,
    get: function() {
        return prunePrefetchCache;
    }
}));
const _getprefetchcacheentrystatus = __webpack_require__(3154);
function prunePrefetchCache(prefetchCache) {
    for (const [href, prefetchCacheEntry] of prefetchCache){
        if ((0, _getprefetchcacheentrystatus.getPrefetchEntryCacheStatus)(prefetchCacheEntry) === _getprefetchcacheentrystatus.PrefetchCacheEntryStatus.expired) {
            prefetchCache.delete(href);
        }
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=prune-prefetch-cache.js.map


/***/ }),

/***/ 86488:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "refreshReducer", ({
    enumerable: true,
    get: function() {
        return refreshReducer;
    }
}));
const _fetchserverresponse = __webpack_require__(17926);
const _createrecordfromthenable = __webpack_require__(35982);
const _readrecordvalue = __webpack_require__(6224);
const _createhreffromurl = __webpack_require__(37554);
const _applyrouterstatepatchtotree = __webpack_require__(63786);
const _isnavigatingtonewrootlayout = __webpack_require__(11517);
const _navigatereducer = __webpack_require__(39111);
const _handlemutable = __webpack_require__(93729);
const _approutercontext = __webpack_require__(57085);
const _filllazyitemstillleafwithhead = __webpack_require__(76798);
function refreshReducer(state, action) {
    const { cache, mutable, origin } = action;
    const href = state.canonicalUrl;
    let currentTree = state.tree;
    const isForCurrentTree = JSON.stringify(mutable.previousTree) === JSON.stringify(currentTree);
    if (isForCurrentTree) {
        return (0, _handlemutable.handleMutable)(state, mutable);
    }
    if (!cache.data) {
        // TODO-APP: verify that `href` is not an external url.
        // Fetch data from the root of the tree.
        cache.data = (0, _createrecordfromthenable.createRecordFromThenable)((0, _fetchserverresponse.fetchServerResponse)(new URL(href, origin), [
            currentTree[0],
            currentTree[1],
            currentTree[2],
            "refetch"
        ], state.nextUrl, state.buildId));
    }
    const [flightData, canonicalUrlOverride] = (0, _readrecordvalue.readRecordValue)(cache.data);
    // Handle case when navigating to page in `pages` from `app`
    if (typeof flightData === "string") {
        return (0, _navigatereducer.handleExternalUrl)(state, mutable, flightData, state.pushRef.pendingPush);
    }
    // Remove cache.data as it has been resolved at this point.
    cache.data = null;
    for (const flightDataPath of flightData){
        // FlightDataPath with more than two items means unexpected Flight data was returned
        if (flightDataPath.length !== 3) {
            // TODO-APP: handle this case better
            console.log("REFRESH FAILED");
            return state;
        }
        // Given the path can only have two items the items are only the router state and subTreeData for the root.
        const [treePatch] = flightDataPath;
        const newTree = (0, _applyrouterstatepatchtotree.applyRouterStatePatchToTree)([
            ""
        ], currentTree, treePatch);
        if (newTree === null) {
            throw new Error("SEGMENT MISMATCH");
        }
        if ((0, _isnavigatingtonewrootlayout.isNavigatingToNewRootLayout)(currentTree, newTree)) {
            return (0, _navigatereducer.handleExternalUrl)(state, mutable, href, state.pushRef.pendingPush);
        }
        const canonicalUrlOverrideHref = canonicalUrlOverride ? (0, _createhreffromurl.createHrefFromUrl)(canonicalUrlOverride) : undefined;
        if (canonicalUrlOverride) {
            mutable.canonicalUrl = canonicalUrlOverrideHref;
        }
        // The one before last item is the router state tree patch
        const [subTreeData, head] = flightDataPath.slice(-2);
        // Handles case where prefetch only returns the router tree patch without rendered components.
        if (subTreeData !== null) {
            cache.status = _approutercontext.CacheStates.READY;
            cache.subTreeData = subTreeData;
            (0, _filllazyitemstillleafwithhead.fillLazyItemsTillLeafWithHead)(cache, undefined, treePatch, head);
            mutable.cache = cache;
            mutable.prefetchCache = new Map();
        }
        mutable.previousTree = currentTree;
        mutable.patchedTree = newTree;
        mutable.canonicalUrl = href;
        currentTree = newTree;
    }
    return (0, _handlemutable.handleMutable)(state, mutable);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=refresh-reducer.js.map


/***/ }),

/***/ 72378:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "restoreReducer", ({
    enumerable: true,
    get: function() {
        return restoreReducer;
    }
}));
const _createhreffromurl = __webpack_require__(37554);
function restoreReducer(state, action) {
    const { url, tree } = action;
    const href = (0, _createhreffromurl.createHrefFromUrl)(url);
    return {
        buildId: state.buildId,
        // Set canonical url
        canonicalUrl: href,
        pushRef: state.pushRef,
        focusAndScrollRef: state.focusAndScrollRef,
        cache: state.cache,
        prefetchCache: state.prefetchCache,
        // Restore provided tree
        tree: tree,
        nextUrl: url.pathname
    };
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=restore-reducer.js.map


/***/ }),

/***/ 26869:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "serverActionReducer", ({
    enumerable: true,
    get: function() {
        return serverActionReducer;
    }
}));
const _appcallserver = __webpack_require__(13518);
const _approuterheaders = __webpack_require__(86739);
const _createrecordfromthenable = __webpack_require__(35982);
const _readrecordvalue = __webpack_require__(6224);
const _client = __webpack_require__(97897);
const _addbasepath = __webpack_require__(42374);
const _createhreffromurl = __webpack_require__(37554);
const _navigatereducer = __webpack_require__(39111);
const _applyrouterstatepatchtotree = __webpack_require__(63786);
const _isnavigatingtonewrootlayout = __webpack_require__(11517);
const _approutercontext = __webpack_require__(57085);
const _handlemutable = __webpack_require__(93729);
const _filllazyitemstillleafwithhead = __webpack_require__(76798);
async function fetchServerAction(state, param) {
    let { actionId, actionArgs } = param;
    const body = await (0, _client.encodeReply)(actionArgs);
    const res = await fetch("", {
        method: "POST",
        headers: {
            Accept: _approuterheaders.RSC_CONTENT_TYPE_HEADER,
            "Next-Action": actionId,
            [_approuterheaders.NEXT_ROUTER_STATE_TREE]: encodeURIComponent(JSON.stringify(state.tree)),
            ... false ? 0 : {},
            ...state.nextUrl ? {
                [_approuterheaders.NEXT_URL]: state.nextUrl
            } : {}
        },
        body
    });
    const location = res.headers.get("x-action-redirect");
    let revalidatedParts;
    try {
        const revalidatedHeader = JSON.parse(res.headers.get("x-action-revalidated") || "[[],0,0]");
        revalidatedParts = {
            paths: revalidatedHeader[0] || [],
            tag: !!revalidatedHeader[1],
            cookie: revalidatedHeader[2]
        };
    } catch (e) {
        revalidatedParts = {
            paths: [],
            tag: false,
            cookie: false
        };
    }
    const redirectLocation = location ? new URL((0, _addbasepath.addBasePath)(location), window.location.origin) : undefined;
    let isFlightResponse = res.headers.get("content-type") === _approuterheaders.RSC_CONTENT_TYPE_HEADER;
    if (isFlightResponse) {
        const response = await (0, _client.createFromFetch)(Promise.resolve(res), {
            callServer: _appcallserver.callServer
        });
        if (location) {
            // if it was a redirection, then result is just a regular RSC payload
            const [, actionFlightData] = response != null ? response : [];
            return {
                actionFlightData: actionFlightData,
                redirectLocation,
                revalidatedParts
            };
        }
        // otherwise it's a tuple of [actionResult, actionFlightData]
        const [actionResult, [, actionFlightData]] = response != null ? response : [];
        return {
            actionResult,
            actionFlightData,
            redirectLocation,
            revalidatedParts
        };
    }
    return {
        redirectLocation,
        revalidatedParts
    };
}
function serverActionReducer(state, action) {
    const { mutable, cache, resolve, reject } = action;
    const href = state.canonicalUrl;
    let currentTree = state.tree;
    const isForCurrentTree = JSON.stringify(mutable.previousTree) === JSON.stringify(currentTree);
    if (isForCurrentTree) {
        return (0, _handlemutable.handleMutable)(state, mutable);
    }
    if (!action.mutable.inFlightServerAction) {
        action.mutable.inFlightServerAction = (0, _createrecordfromthenable.createRecordFromThenable)(fetchServerAction(state, action));
    }
    // TODO-APP: Make try/catch wrap only readRecordValue so that other errors bubble up through the reducer instead.
    try {
        // suspends until the server action is resolved.
        const { actionResult, actionFlightData: flightData, redirectLocation } = (0, _readrecordvalue.readRecordValue)(action.mutable.inFlightServerAction);
        mutable.previousTree = state.tree;
        if (!flightData) {
            if (!mutable.actionResultResolved) {
                resolve(actionResult);
                mutable.actionResultResolved = true;
            }
            // If there is a redirect but no flight data we need to do a mpaNavigation.
            if (redirectLocation) {
                return (0, _navigatereducer.handleExternalUrl)(state, mutable, redirectLocation.href, state.pushRef.pendingPush);
            }
            return state;
        }
        if (typeof flightData === "string") {
            // Handle case when navigating to page in `pages` from `app`
            return (0, _navigatereducer.handleExternalUrl)(state, mutable, flightData, state.pushRef.pendingPush);
        }
        // Remove cache.data as it has been resolved at this point.
        mutable.inFlightServerAction = null;
        for (const flightDataPath of flightData){
            // FlightDataPath with more than two items means unexpected Flight data was returned
            if (flightDataPath.length !== 3) {
                // TODO-APP: handle this case better
                console.log("SERVER ACTION APPLY FAILED");
                return state;
            }
            // Given the path can only have two items the items are only the router state and subTreeData for the root.
            const [treePatch] = flightDataPath;
            const newTree = (0, _applyrouterstatepatchtotree.applyRouterStatePatchToTree)([
                ""
            ], currentTree, treePatch);
            if (newTree === null) {
                throw new Error("SEGMENT MISMATCH");
            }
            if ((0, _isnavigatingtonewrootlayout.isNavigatingToNewRootLayout)(currentTree, newTree)) {
                return (0, _navigatereducer.handleExternalUrl)(state, mutable, href, state.pushRef.pendingPush);
            }
            // The one before last item is the router state tree patch
            const [subTreeData, head] = flightDataPath.slice(-2);
            // Handles case where prefetch only returns the router tree patch without rendered components.
            if (subTreeData !== null) {
                cache.status = _approutercontext.CacheStates.READY;
                cache.subTreeData = subTreeData;
                (0, _filllazyitemstillleafwithhead.fillLazyItemsTillLeafWithHead)(cache, undefined, treePatch, head);
                mutable.cache = cache;
                mutable.prefetchCache = new Map();
            }
            mutable.previousTree = currentTree;
            mutable.patchedTree = newTree;
            mutable.canonicalUrl = href;
            currentTree = newTree;
        }
        if (redirectLocation) {
            const newHref = (0, _createhreffromurl.createHrefFromUrl)(redirectLocation, false);
            mutable.canonicalUrl = newHref;
        }
        if (!mutable.actionResultResolved) {
            resolve(actionResult);
            mutable.actionResultResolved = true;
        }
        return (0, _handlemutable.handleMutable)(state, mutable);
    } catch (e) {
        if (e.status === "rejected") {
            if (!mutable.actionResultResolved) {
                reject(e.value);
                mutable.actionResultResolved = true;
            }
            // When the server action is rejected we don't update the state and instead call the reject handler of the promise.
            return state;
        }
        throw e;
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=server-action-reducer.js.map


/***/ }),

/***/ 3552:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "serverPatchReducer", ({
    enumerable: true,
    get: function() {
        return serverPatchReducer;
    }
}));
const _createhreffromurl = __webpack_require__(37554);
const _applyrouterstatepatchtotree = __webpack_require__(63786);
const _isnavigatingtonewrootlayout = __webpack_require__(11517);
const _navigatereducer = __webpack_require__(39111);
const _applyflightdata = __webpack_require__(74170);
const _handlemutable = __webpack_require__(93729);
function serverPatchReducer(state, action) {
    const { flightData, previousTree, overrideCanonicalUrl, cache, mutable } = action;
    const isForCurrentTree = JSON.stringify(previousTree) === JSON.stringify(state.tree);
    // When a fetch is slow to resolve it could be that you navigated away while the request was happening or before the reducer runs.
    // In that case opt-out of applying the patch given that the data could be stale.
    if (!isForCurrentTree) {
        // TODO-APP: Handle tree mismatch
        console.log("TREE MISMATCH");
        // Keep everything as-is.
        return state;
    }
    if (mutable.previousTree) {
        return (0, _handlemutable.handleMutable)(state, mutable);
    }
    // Handle case when navigating to page in `pages` from `app`
    if (typeof flightData === "string") {
        return (0, _navigatereducer.handleExternalUrl)(state, mutable, flightData, state.pushRef.pendingPush);
    }
    let currentTree = state.tree;
    let currentCache = state.cache;
    for (const flightDataPath of flightData){
        // Slices off the last segment (which is at -4) as it doesn't exist in the tree yet
        const flightSegmentPath = flightDataPath.slice(0, -4);
        const [treePatch] = flightDataPath.slice(-3, -2);
        const newTree = (0, _applyrouterstatepatchtotree.applyRouterStatePatchToTree)([
            "",
            ...flightSegmentPath
        ], currentTree, treePatch);
        if (newTree === null) {
            throw new Error("SEGMENT MISMATCH");
        }
        if ((0, _isnavigatingtonewrootlayout.isNavigatingToNewRootLayout)(currentTree, newTree)) {
            return (0, _navigatereducer.handleExternalUrl)(state, mutable, state.canonicalUrl, state.pushRef.pendingPush);
        }
        const canonicalUrlOverrideHref = overrideCanonicalUrl ? (0, _createhreffromurl.createHrefFromUrl)(overrideCanonicalUrl) : undefined;
        if (canonicalUrlOverrideHref) {
            mutable.canonicalUrl = canonicalUrlOverrideHref;
        }
        (0, _applyflightdata.applyFlightData)(currentCache, cache, flightDataPath);
        mutable.previousTree = currentTree;
        mutable.patchedTree = newTree;
        mutable.cache = cache;
        currentCache = cache;
        currentTree = newTree;
    }
    return (0, _handlemutable.handleMutable)(state, mutable);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=server-patch-reducer.js.map


/***/ }),

/***/ 4574:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    PrefetchKind: function() {
        return PrefetchKind;
    },
    ACTION_REFRESH: function() {
        return ACTION_REFRESH;
    },
    ACTION_NAVIGATE: function() {
        return ACTION_NAVIGATE;
    },
    ACTION_RESTORE: function() {
        return ACTION_RESTORE;
    },
    ACTION_SERVER_PATCH: function() {
        return ACTION_SERVER_PATCH;
    },
    ACTION_PREFETCH: function() {
        return ACTION_PREFETCH;
    },
    ACTION_FAST_REFRESH: function() {
        return ACTION_FAST_REFRESH;
    },
    ACTION_SERVER_ACTION: function() {
        return ACTION_SERVER_ACTION;
    }
});
const ACTION_REFRESH = "refresh";
const ACTION_NAVIGATE = "navigate";
const ACTION_RESTORE = "restore";
const ACTION_SERVER_PATCH = "server-patch";
const ACTION_PREFETCH = "prefetch";
const ACTION_FAST_REFRESH = "fast-refresh";
const ACTION_SERVER_ACTION = "server-action";
var PrefetchKind;
(function(PrefetchKind) {
    PrefetchKind["AUTO"] = "auto";
    PrefetchKind["FULL"] = "full";
    PrefetchKind["TEMPORARY"] = "temporary";
})(PrefetchKind || (PrefetchKind = {}));
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=router-reducer-types.js.map


/***/ }),

/***/ 73078:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "reducer", ({
    enumerable: true,
    get: function() {
        return reducer;
    }
}));
const _routerreducertypes = __webpack_require__(4574);
const _navigatereducer = __webpack_require__(39111);
const _serverpatchreducer = __webpack_require__(3552);
const _restorereducer = __webpack_require__(72378);
const _refreshreducer = __webpack_require__(86488);
const _prefetchreducer = __webpack_require__(35290);
const _fastrefreshreducer = __webpack_require__(57852);
const _serveractionreducer = __webpack_require__(26869);
/**
 * Reducer that handles the app-router state updates.
 */ function clientReducer(state, action) {
    switch(action.type){
        case _routerreducertypes.ACTION_NAVIGATE:
            {
                return (0, _navigatereducer.navigateReducer)(state, action);
            }
        case _routerreducertypes.ACTION_SERVER_PATCH:
            {
                return (0, _serverpatchreducer.serverPatchReducer)(state, action);
            }
        case _routerreducertypes.ACTION_RESTORE:
            {
                return (0, _restorereducer.restoreReducer)(state, action);
            }
        case _routerreducertypes.ACTION_REFRESH:
            {
                return (0, _refreshreducer.refreshReducer)(state, action);
            }
        case _routerreducertypes.ACTION_FAST_REFRESH:
            {
                return (0, _fastrefreshreducer.fastRefreshReducer)(state, action);
            }
        case _routerreducertypes.ACTION_PREFETCH:
            {
                return (0, _prefetchreducer.prefetchReducer)(state, action);
            }
        case _routerreducertypes.ACTION_SERVER_ACTION:
            {
                return (0, _serveractionreducer.serverActionReducer)(state, action);
            }
        // This case should never be hit as dispatch is strongly typed.
        default:
            throw new Error("Unknown action");
    }
}
function serverReducer(state, _action) {
    return state;
}
const reducer =  true ? serverReducer : 0;
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=router-reducer.js.map


/***/ }),

/***/ 16947:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "shouldHardNavigate", ({
    enumerable: true,
    get: function() {
        return shouldHardNavigate;
    }
}));
const _matchsegments = __webpack_require__(83395);
function shouldHardNavigate(flightSegmentPath, flightRouterState) {
    const [segment, parallelRoutes] = flightRouterState;
    // TODO-APP: Check if `as` can be replaced.
    const [currentSegment, parallelRouteKey] = flightSegmentPath;
    // Check if current segment matches the existing segment.
    if (!(0, _matchsegments.matchSegment)(currentSegment, segment)) {
        // If dynamic parameter in tree doesn't match up with segment path a hard navigation is triggered.
        if (Array.isArray(currentSegment)) {
            return true;
        }
        // If the existing segment did not match soft navigation is triggered.
        return false;
    }
    const lastSegment = flightSegmentPath.length <= 2;
    if (lastSegment) {
        return false;
    }
    return shouldHardNavigate(flightSegmentPath.slice(2), parallelRoutes[parallelRouteKey]);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=should-hard-navigate.js.map


/***/ }),

/***/ 83399:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createSearchParamsBailoutProxy", ({
    enumerable: true,
    get: function() {
        return createSearchParamsBailoutProxy;
    }
}));
const _staticgenerationbailout = __webpack_require__(53364);
function createSearchParamsBailoutProxy() {
    return new Proxy({}, {
        get (_target, prop) {
            // React adds some properties on the object when serializing for client components
            if (typeof prop === "string") {
                (0, _staticgenerationbailout.staticGenerationBailout)("searchParams." + prop);
            }
        }
    });
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=searchparams-bailout-proxy.js.map


/***/ }),

/***/ 53364:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "staticGenerationBailout", ({
    enumerable: true,
    get: function() {
        return staticGenerationBailout;
    }
}));
const _hooksservercontext = __webpack_require__(63118);
const _staticgenerationasyncstorage = __webpack_require__(25589);
class StaticGenBailoutError extends Error {
    constructor(...args){
        super(...args);
        this.code = "NEXT_STATIC_GEN_BAILOUT";
    }
}
function formatErrorMessage(reason, opts) {
    const { dynamic, link } = opts || {};
    const suffix = link ? " See more info here: " + link : "";
    return "Page" + (dynamic ? ' with `dynamic = "' + dynamic + '"`' : "") + " couldn't be rendered statically because it used `" + reason + "`." + suffix;
}
const staticGenerationBailout = (reason, opts)=>{
    const staticGenerationStore = _staticgenerationasyncstorage.staticGenerationAsyncStorage.getStore();
    if (staticGenerationStore == null ? void 0 : staticGenerationStore.forceStatic) {
        return true;
    }
    if (staticGenerationStore == null ? void 0 : staticGenerationStore.dynamicShouldError) {
        var _opts_dynamic;
        throw new StaticGenBailoutError(formatErrorMessage(reason, {
            ...opts,
            dynamic: (_opts_dynamic = opts == null ? void 0 : opts.dynamic) != null ? _opts_dynamic : "error"
        }));
    }
    if (staticGenerationStore) {
        staticGenerationStore.revalidate = 0;
    }
    if (staticGenerationStore == null ? void 0 : staticGenerationStore.isStaticGeneration) {
        const err = new _hooksservercontext.DynamicServerError(formatErrorMessage(reason, {
            ...opts,
            // this error should be caught by Next to bail out of static generation
            // in case it's uncaught, this link provides some additional context as to why
            link: "https://nextjs.org/docs/messages/dynamic-server-error"
        }));
        staticGenerationStore.dynamicUsageDescription = reason;
        staticGenerationStore.dynamicUsageStack = err.stack;
        throw err;
    }
    return false;
};
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=static-generation-bailout.js.map


/***/ }),

/***/ 25916:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "default", ({
    enumerable: true,
    get: function() {
        return StaticGenerationSearchParamsBailoutProvider;
    }
}));
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _searchparamsbailoutproxy = __webpack_require__(83399);
function StaticGenerationSearchParamsBailoutProvider(param) {
    let { Component, propsForComponent } = param;
    const searchParams = (0, _searchparamsbailoutproxy.createSearchParamsBailoutProxy)();
    return /*#__PURE__*/ _react.default.createElement(Component, {
        searchParams: searchParams,
        ...propsForComponent
    });
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=static-generation-searchparams-bailout-provider.js.map


/***/ }),

/***/ 28539:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "useReducerWithReduxDevtools", ({
    enumerable: true,
    get: function() {
        return useReducerWithReduxDevtools;
    }
}));
const _react = __webpack_require__(18038);
function normalizeRouterState(val) {
    if (val instanceof Map) {
        const obj = {};
        for (const [key, value] of val.entries()){
            if (typeof value === "function") {
                obj[key] = "fn()";
                continue;
            }
            if (typeof value === "object" && value !== null) {
                if (value.$$typeof) {
                    obj[key] = value.$$typeof.toString();
                    continue;
                }
                if (value._bundlerConfig) {
                    obj[key] = "FlightData";
                    continue;
                }
            }
            obj[key] = normalizeRouterState(value);
        }
        return obj;
    }
    if (typeof val === "object" && val !== null) {
        const obj = {};
        for(const key in val){
            const value = val[key];
            if (typeof value === "function") {
                obj[key] = "fn()";
                continue;
            }
            if (typeof value === "object" && value !== null) {
                if (value.$$typeof) {
                    obj[key] = value.$$typeof.toString();
                    continue;
                }
                if (value.hasOwnProperty("_bundlerConfig")) {
                    obj[key] = "FlightData";
                    continue;
                }
            }
            obj[key] = normalizeRouterState(value);
        }
        return obj;
    }
    if (Array.isArray(val)) {
        return val.map(normalizeRouterState);
    }
    return val;
}
function devToolReducer(fn, ref) {
    return (state, action)=>{
        const res = fn(state, action);
        if (ref.current) {
            ref.current.send(action, normalizeRouterState(res));
        }
        return res;
    };
}
function useReducerWithReduxDevtoolsNoop(fn, initialState) {
    const [state, dispatch] = (0, _react.useReducer)(fn, initialState);
    return [
        state,
        dispatch,
        ()=>{}
    ];
}
function useReducerWithReduxDevtoolsImpl(fn, initialState) {
    const devtoolsConnectionRef = (0, _react.useRef)();
    const enabledRef = (0, _react.useRef)();
    (0, _react.useEffect)(()=>{
        if (devtoolsConnectionRef.current || enabledRef.current === false) {
            return;
        }
        if (enabledRef.current === undefined && typeof window.__REDUX_DEVTOOLS_EXTENSION__ === "undefined") {
            enabledRef.current = false;
            return;
        }
        devtoolsConnectionRef.current = window.__REDUX_DEVTOOLS_EXTENSION__.connect({
            instanceId: 8000,
            name: "next-router"
        });
        if (devtoolsConnectionRef.current) {
            devtoolsConnectionRef.current.init(normalizeRouterState(initialState));
        }
        return ()=>{
            devtoolsConnectionRef.current = undefined;
        };
    }, [
        initialState
    ]);
    const [state, dispatch] = (0, _react.useReducer)(devToolReducer(/* logReducer( */ fn /*)*/ , devtoolsConnectionRef), initialState);
    const sync = (0, _react.useCallback)(()=>{
        if (devtoolsConnectionRef.current) {
            devtoolsConnectionRef.current.send({
                type: "RENDER_SYNC"
            }, normalizeRouterState(state));
        }
    }, [
        state
    ]);
    return [
        state,
        dispatch,
        sync
    ];
}
const useReducerWithReduxDevtools =  false ? 0 : useReducerWithReduxDevtoolsNoop;
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=use-reducer-with-devtools.js.map


/***/ }),

/***/ 45968:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "detectDomainLocale", ({
    enumerable: true,
    get: function() {
        return detectDomainLocale;
    }
}));
const detectDomainLocale = function() {
    for(var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++){
        args[_key] = arguments[_key];
    }
    if (false) {}
};
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=detect-domain-locale.js.map


/***/ }),

/***/ 77897:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "getDomainLocale", ({
    enumerable: true,
    get: function() {
        return getDomainLocale;
    }
}));
const _normalizetrailingslash = __webpack_require__(40639);
const basePath = (/* unused pure expression or super */ null && ( false || ""));
function getDomainLocale(path, locale, locales, domainLocales) {
    if (false) {} else {
        return false;
    }
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=get-domain-locale.js.map


/***/ }),

/***/ 35753:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "hasBasePath", ({
    enumerable: true,
    get: function() {
        return hasBasePath;
    }
}));
const _pathhasprefix = __webpack_require__(54614);
const basePath =  false || "";
function hasBasePath(path) {
    return (0, _pathhasprefix.pathHasPrefix)(path, basePath);
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=has-base-path.js.map


/***/ }),

/***/ 89904:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    DOMAttributeNames: function() {
        return DOMAttributeNames;
    },
    isEqualNode: function() {
        return isEqualNode;
    },
    default: function() {
        return initHeadManager;
    }
});
const DOMAttributeNames = {
    acceptCharset: "accept-charset",
    className: "class",
    htmlFor: "for",
    httpEquiv: "http-equiv",
    noModule: "noModule"
};
function reactElementToDOM(param) {
    let { type, props } = param;
    const el = document.createElement(type);
    for(const p in props){
        if (!props.hasOwnProperty(p)) continue;
        if (p === "children" || p === "dangerouslySetInnerHTML") continue;
        // we don't render undefined props to the DOM
        if (props[p] === undefined) continue;
        const attr = DOMAttributeNames[p] || p.toLowerCase();
        if (type === "script" && (attr === "async" || attr === "defer" || attr === "noModule")) {
            el[attr] = !!props[p];
        } else {
            el.setAttribute(attr, props[p]);
        }
    }
    const { children, dangerouslySetInnerHTML } = props;
    if (dangerouslySetInnerHTML) {
        el.innerHTML = dangerouslySetInnerHTML.__html || "";
    } else if (children) {
        el.textContent = typeof children === "string" ? children : Array.isArray(children) ? children.join("") : "";
    }
    return el;
}
function isEqualNode(oldTag, newTag) {
    if (oldTag instanceof HTMLElement && newTag instanceof HTMLElement) {
        const nonce = newTag.getAttribute("nonce");
        // Only strip the nonce if `oldTag` has had it stripped. An element's nonce attribute will not
        // be stripped if there is no content security policy response header that includes a nonce.
        if (nonce && !oldTag.getAttribute("nonce")) {
            const cloneTag = newTag.cloneNode(true);
            cloneTag.setAttribute("nonce", "");
            cloneTag.nonce = nonce;
            return nonce === oldTag.nonce && oldTag.isEqualNode(cloneTag);
        }
    }
    return oldTag.isEqualNode(newTag);
}
let updateElements;
if (false) {} else {
    updateElements = (type, components)=>{
        const headEl = document.getElementsByTagName("head")[0];
        const headCountEl = headEl.querySelector("meta[name=next-head-count]");
        if (false) {}
        const headCount = Number(headCountEl.content);
        const oldTags = [];
        for(let i = 0, j = headCountEl.previousElementSibling; i < headCount; i++, j = (j == null ? void 0 : j.previousElementSibling) || null){
            var _j_tagName;
            if ((j == null ? void 0 : (_j_tagName = j.tagName) == null ? void 0 : _j_tagName.toLowerCase()) === type) {
                oldTags.push(j);
            }
        }
        const newTags = components.map(reactElementToDOM).filter((newTag)=>{
            for(let k = 0, len = oldTags.length; k < len; k++){
                const oldTag = oldTags[k];
                if (isEqualNode(oldTag, newTag)) {
                    oldTags.splice(k, 1);
                    return false;
                }
            }
            return true;
        });
        oldTags.forEach((t)=>{
            var _t_parentNode;
            return (_t_parentNode = t.parentNode) == null ? void 0 : _t_parentNode.removeChild(t);
        });
        newTags.forEach((t)=>headEl.insertBefore(t, headCountEl));
        headCountEl.content = (headCount - oldTags.length + newTags.length).toString();
    };
}
function initHeadManager() {
    return {
        mountedInstances: new Set(),
        updateHead: (head)=>{
            const tags = {};
            head.forEach((h)=>{
                if (// it won't be inlined. In this case revert to the original behavior
                h.type === "link" && h.props["data-optimized-fonts"]) {
                    if (document.querySelector('style[data-href="' + h.props["data-href"] + '"]')) {
                        return;
                    } else {
                        h.props.href = h.props["data-href"];
                        h.props["data-href"] = undefined;
                    }
                }
                const components = tags[h.type] || [];
                components.push(h);
                tags[h.type] = components;
            });
            const titleComponent = tags.title ? tags.title[0] : null;
            let title = "";
            if (titleComponent) {
                const { children } = titleComponent.props;
                title = typeof children === "string" ? children : Array.isArray(children) ? children.join("") : "";
            }
            if (title !== document.title) document.title = title;
            [
                "meta",
                "base",
                "link",
                "style",
                "script"
            ].forEach((type)=>{
                updateElements(type, tags[type] || []);
            });
        }
    };
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=head-manager.js.map


/***/ }),

/***/ 17202:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "default", ({
    enumerable: true,
    get: function() {
        return _default;
    }
}));
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _resolvehref = __webpack_require__(70982);
const _islocalurl = __webpack_require__(60120);
const _formaturl = __webpack_require__(12336);
const _utils = __webpack_require__(78423);
const _addlocale = __webpack_require__(92704);
const _routercontext = __webpack_require__(17160);
const _approutercontext = __webpack_require__(57085);
const _useintersection = __webpack_require__(90406);
const _getdomainlocale = __webpack_require__(77897);
const _addbasepath = __webpack_require__(42374);
const _routerreducertypes = __webpack_require__(4574);
const prefetched = new Set();
function prefetch(router, href, as, options, appOptions, isAppRouter) {
    if (true) {
        return;
    }
    // app-router supports external urls out of the box so it shouldn't short-circuit here as support for e.g. `replace` is added in the app-router.
    if (!isAppRouter && !(0, _islocalurl.isLocalURL)(href)) {
        return;
    }
    // We should only dedupe requests when experimental.optimisticClientCache is
    // disabled.
    if (!options.bypassPrefetchedCheck) {
        const locale = typeof options.locale !== "undefined" ? options.locale : "locale" in router ? router.locale : undefined;
        const prefetchedKey = href + "%" + as + "%" + locale;
        // If we've already fetched the key, then don't prefetch it again!
        if (prefetched.has(prefetchedKey)) {
            return;
        }
        // Mark this URL as prefetched.
        prefetched.add(prefetchedKey);
    }
    const prefetchPromise = isAppRouter ? router.prefetch(href, appOptions) : router.prefetch(href, as, options);
    // Prefetch the JSON page if asked (only in the client)
    // We need to handle a prefetch error here since we may be
    // loading with priority which can reject but we don't
    // want to force navigation since this is only a prefetch
    Promise.resolve(prefetchPromise).catch((err)=>{
        if (false) {}
    });
}
function isModifiedEvent(event) {
    const eventTarget = event.currentTarget;
    const target = eventTarget.getAttribute("target");
    return target && target !== "_self" || event.metaKey || event.ctrlKey || event.shiftKey || event.altKey || // triggers resource download
    event.nativeEvent && event.nativeEvent.which === 2;
}
function linkClicked(e, router, href, as, replace, shallow, scroll, locale, isAppRouter, prefetchEnabled) {
    const { nodeName } = e.currentTarget;
    // anchors inside an svg have a lowercase nodeName
    const isAnchorNodeName = nodeName.toUpperCase() === "A";
    if (isAnchorNodeName && (isModifiedEvent(e) || // app-router supports external urls out of the box so it shouldn't short-circuit here as support for e.g. `replace` is added in the app-router.
    !isAppRouter && !(0, _islocalurl.isLocalURL)(href))) {
        // ignore click for browser’s default behavior
        return;
    }
    e.preventDefault();
    const navigate = ()=>{
        // If the router is an NextRouter instance it will have `beforePopState`
        const routerScroll = scroll != null ? scroll : true;
        if ("beforePopState" in router) {
            router[replace ? "replace" : "push"](href, as, {
                shallow,
                locale,
                scroll: routerScroll
            });
        } else {
            router[replace ? "replace" : "push"](as || href, {
                forceOptimisticNavigation: !prefetchEnabled,
                scroll: routerScroll
            });
        }
    };
    if (isAppRouter) {
        _react.default.startTransition(navigate);
    } else {
        navigate();
    }
}
function formatStringOrUrl(urlObjOrString) {
    if (typeof urlObjOrString === "string") {
        return urlObjOrString;
    }
    return (0, _formaturl.formatUrl)(urlObjOrString);
}
/**
 * React Component that enables client-side transitions between routes.
 */ const Link = /*#__PURE__*/ _react.default.forwardRef(function LinkComponent(props, forwardedRef) {
    let children;
    const { href: hrefProp, as: asProp, children: childrenProp, prefetch: prefetchProp = null, passHref, replace, shallow, scroll, locale, onClick, onMouseEnter: onMouseEnterProp, onTouchStart: onTouchStartProp, legacyBehavior = true === false, ...restProps } = props;
    children = childrenProp;
    if (legacyBehavior && (typeof children === "string" || typeof children === "number")) {
        children = /*#__PURE__*/ _react.default.createElement("a", null, children);
    }
    const pagesRouter = _react.default.useContext(_routercontext.RouterContext);
    const appRouter = _react.default.useContext(_approutercontext.AppRouterContext);
    const router = pagesRouter != null ? pagesRouter : appRouter;
    // We're in the app directory if there is no pages router.
    const isAppRouter = !pagesRouter;
    const prefetchEnabled = prefetchProp !== false;
    /**
     * The possible states for prefetch are:
     * - null: this is the default "auto" mode, where we will prefetch partially if the link is in the viewport
     * - true: we will prefetch if the link is visible and prefetch the full page, not just partially
     * - false: we will not prefetch if in the viewport at all
     */ const appPrefetchKind = prefetchProp === null ? _routerreducertypes.PrefetchKind.AUTO : _routerreducertypes.PrefetchKind.FULL;
    if (false) {}
    if (false) {}
    const { href, as } = _react.default.useMemo(()=>{
        if (!pagesRouter) {
            const resolvedHref = formatStringOrUrl(hrefProp);
            return {
                href: resolvedHref,
                as: asProp ? formatStringOrUrl(asProp) : resolvedHref
            };
        }
        const [resolvedHref, resolvedAs] = (0, _resolvehref.resolveHref)(pagesRouter, hrefProp, true);
        return {
            href: resolvedHref,
            as: asProp ? (0, _resolvehref.resolveHref)(pagesRouter, asProp) : resolvedAs || resolvedHref
        };
    }, [
        pagesRouter,
        hrefProp,
        asProp
    ]);
    const previousHref = _react.default.useRef(href);
    const previousAs = _react.default.useRef(as);
    // This will return the first child, if multiple are provided it will throw an error
    let child;
    if (legacyBehavior) {
        if (false) {} else {
            child = _react.default.Children.only(children);
        }
    } else {
        if (false) {}
    }
    const childRef = legacyBehavior ? child && typeof child === "object" && child.ref : forwardedRef;
    const [setIntersectionRef, isVisible, resetVisible] = (0, _useintersection.useIntersection)({
        rootMargin: "200px"
    });
    const setRef = _react.default.useCallback((el)=>{
        // Before the link getting observed, check if visible state need to be reset
        if (previousAs.current !== as || previousHref.current !== href) {
            resetVisible();
            previousAs.current = as;
            previousHref.current = href;
        }
        setIntersectionRef(el);
        if (childRef) {
            if (typeof childRef === "function") childRef(el);
            else if (typeof childRef === "object") {
                childRef.current = el;
            }
        }
    }, [
        as,
        childRef,
        href,
        resetVisible,
        setIntersectionRef
    ]);
    // Prefetch the URL if we haven't already and it's visible.
    _react.default.useEffect(()=>{
        // in dev, we only prefetch on hover to avoid wasting resources as the prefetch will trigger compiling the page.
        if (false) {}
        if (!router) {
            return;
        }
        // If we don't need to prefetch the URL, don't do prefetch.
        if (!isVisible || !prefetchEnabled) {
            return;
        }
        // Prefetch the URL.
        prefetch(router, href, as, {
            locale
        }, {
            kind: appPrefetchKind
        }, isAppRouter);
    }, [
        as,
        href,
        isVisible,
        locale,
        prefetchEnabled,
        pagesRouter == null ? void 0 : pagesRouter.locale,
        router,
        isAppRouter,
        appPrefetchKind
    ]);
    const childProps = {
        ref: setRef,
        onClick (e) {
            if (false) {}
            if (!legacyBehavior && typeof onClick === "function") {
                onClick(e);
            }
            if (legacyBehavior && child.props && typeof child.props.onClick === "function") {
                child.props.onClick(e);
            }
            if (!router) {
                return;
            }
            if (e.defaultPrevented) {
                return;
            }
            linkClicked(e, router, href, as, replace, shallow, scroll, locale, isAppRouter, prefetchEnabled);
        },
        onMouseEnter (e) {
            if (!legacyBehavior && typeof onMouseEnterProp === "function") {
                onMouseEnterProp(e);
            }
            if (legacyBehavior && child.props && typeof child.props.onMouseEnter === "function") {
                child.props.onMouseEnter(e);
            }
            if (!router) {
                return;
            }
            if ((!prefetchEnabled || "production" === "development") && isAppRouter) {
                return;
            }
            prefetch(router, href, as, {
                locale,
                priority: true,
                // @see {https://github.com/vercel/next.js/discussions/40268?sort=top#discussioncomment-3572642}
                bypassPrefetchedCheck: true
            }, {
                kind: appPrefetchKind
            }, isAppRouter);
        },
        onTouchStart (e) {
            if (!legacyBehavior && typeof onTouchStartProp === "function") {
                onTouchStartProp(e);
            }
            if (legacyBehavior && child.props && typeof child.props.onTouchStart === "function") {
                child.props.onTouchStart(e);
            }
            if (!router) {
                return;
            }
            if (!prefetchEnabled && isAppRouter) {
                return;
            }
            prefetch(router, href, as, {
                locale,
                priority: true,
                // @see {https://github.com/vercel/next.js/discussions/40268?sort=top#discussioncomment-3572642}
                bypassPrefetchedCheck: true
            }, {
                kind: appPrefetchKind
            }, isAppRouter);
        }
    };
    // If child is an <a> tag and doesn't have a href attribute, or if the 'passHref' property is
    // defined, we specify the current 'href', so that repetition is not needed by the user.
    // If the url is absolute, we can bypass the logic to prepend the domain and locale.
    if ((0, _utils.isAbsoluteUrl)(as)) {
        childProps.href = as;
    } else if (!legacyBehavior || passHref || child.type === "a" && !("href" in child.props)) {
        const curLocale = typeof locale !== "undefined" ? locale : pagesRouter == null ? void 0 : pagesRouter.locale;
        // we only render domain locales if we are currently on a domain locale
        // so that locale links are still visitable in development/preview envs
        const localeDomain = (pagesRouter == null ? void 0 : pagesRouter.isLocaleDomain) && (0, _getdomainlocale.getDomainLocale)(as, curLocale, pagesRouter == null ? void 0 : pagesRouter.locales, pagesRouter == null ? void 0 : pagesRouter.domainLocales);
        childProps.href = localeDomain || (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)(as, curLocale, pagesRouter == null ? void 0 : pagesRouter.defaultLocale));
    }
    return legacyBehavior ? /*#__PURE__*/ _react.default.cloneElement(child, childProps) : /*#__PURE__*/ _react.default.createElement("a", {
        ...restProps,
        ...childProps
    }, children);
});
const _default = Link;
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=link.js.map


/***/ }),

/***/ 40639:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "normalizePathTrailingSlash", ({
    enumerable: true,
    get: function() {
        return normalizePathTrailingSlash;
    }
}));
const _removetrailingslash = __webpack_require__(53750);
const _parsepath = __webpack_require__(68231);
const normalizePathTrailingSlash = (path)=>{
    if (!path.startsWith("/") || undefined) {
        return path;
    }
    const { pathname, query, hash } = (0, _parsepath.parsePath)(path);
    if (false) {}
    return "" + (0, _removetrailingslash.removeTrailingSlash)(pathname) + query + hash;
};
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=normalize-trailing-slash.js.map


/***/ }),

/***/ 37277:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "removeBasePath", ({
    enumerable: true,
    get: function() {
        return removeBasePath;
    }
}));
const _hasbasepath = __webpack_require__(35753);
const basePath =  false || "";
function removeBasePath(path) {
    if (false) {}
    // Can't trim the basePath if it has zero length!
    if (basePath.length === 0) return path;
    path = path.slice(basePath.length);
    if (!path.startsWith("/")) path = "/" + path;
    return path;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=remove-base-path.js.map


/***/ }),

/***/ 33841:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "removeLocale", ({
    enumerable: true,
    get: function() {
        return removeLocale;
    }
}));
const _parsepath = __webpack_require__(68231);
function removeLocale(path, locale) {
    if (false) {}
    return path;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=remove-locale.js.map


/***/ }),

/***/ 21145:
/***/ ((module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    requestIdleCallback: function() {
        return requestIdleCallback;
    },
    cancelIdleCallback: function() {
        return cancelIdleCallback;
    }
});
const requestIdleCallback = typeof self !== "undefined" && self.requestIdleCallback && self.requestIdleCallback.bind(window) || function(cb) {
    let start = Date.now();
    return self.setTimeout(function() {
        cb({
            didTimeout: false,
            timeRemaining: function() {
                return Math.max(0, 50 - (Date.now() - start));
            }
        });
    }, 1);
};
const cancelIdleCallback = typeof self !== "undefined" && self.cancelIdleCallback && self.cancelIdleCallback.bind(window) || function(id) {
    return clearTimeout(id);
};
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=request-idle-callback.js.map


/***/ }),

/***/ 15426:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    markAssetError: function() {
        return markAssetError;
    },
    isAssetError: function() {
        return isAssetError;
    },
    getClientBuildManifest: function() {
        return getClientBuildManifest;
    },
    createRouteLoader: function() {
        return createRouteLoader;
    }
});
const _interop_require_default = __webpack_require__(84813);
const _getassetpathfromroute = /*#__PURE__*/ _interop_require_default._(__webpack_require__(26971));
const _trustedtypes = __webpack_require__(49271);
const _requestidlecallback = __webpack_require__(21145);
// 3.8s was arbitrarily chosen as it's what https://web.dev/interactive
// considers as "Good" time-to-interactive. We must assume something went
// wrong beyond this point, and then fall-back to a full page transition to
// show the user something of value.
const MS_MAX_IDLE_DELAY = 3800;
function withFuture(key, map, generator) {
    let entry = map.get(key);
    if (entry) {
        if ("future" in entry) {
            return entry.future;
        }
        return Promise.resolve(entry);
    }
    let resolver;
    const prom = new Promise((resolve)=>{
        resolver = resolve;
    });
    map.set(key, entry = {
        resolve: resolver,
        future: prom
    });
    return generator ? generator() // eslint-disable-next-line no-sequences
    .then((value)=>(resolver(value), value)).catch((err)=>{
        map.delete(key);
        throw err;
    }) : prom;
}
const ASSET_LOAD_ERROR = Symbol("ASSET_LOAD_ERROR");
function markAssetError(err) {
    return Object.defineProperty(err, ASSET_LOAD_ERROR, {});
}
function isAssetError(err) {
    return err && ASSET_LOAD_ERROR in err;
}
function hasPrefetch(link) {
    try {
        link = document.createElement("link");
        return(// with relList.support
        !!window.MSInputMethodContext && !!document.documentMode || link.relList.supports("prefetch"));
    } catch (e) {
        return false;
    }
}
const canPrefetch = hasPrefetch();
const getAssetQueryString = ()=>{
    return  false ? 0 : "";
};
function prefetchViaDom(href, as, link) {
    return new Promise((resolve, reject)=>{
        const selector = '\n      link[rel="prefetch"][href^="' + href + '"],\n      link[rel="preload"][href^="' + href + '"],\n      script[src^="' + href + '"]';
        if (document.querySelector(selector)) {
            return resolve();
        }
        link = document.createElement("link");
        // The order of property assignment here is intentional:
        if (as) link.as = as;
        link.rel = "prefetch";
        link.crossOrigin = undefined;
        link.onload = resolve;
        link.onerror = ()=>reject(markAssetError(new Error("Failed to prefetch: " + href)));
        // `href` should always be last:
        link.href = href;
        document.head.appendChild(link);
    });
}
function appendScript(src, script) {
    return new Promise((resolve, reject)=>{
        script = document.createElement("script");
        // The order of property assignment here is intentional.
        // 1. Setup success/failure hooks in case the browser synchronously
        //    executes when `src` is set.
        script.onload = resolve;
        script.onerror = ()=>reject(markAssetError(new Error("Failed to load script: " + src)));
        // 2. Configure the cross-origin attribute before setting `src` in case the
        //    browser begins to fetch.
        script.crossOrigin = undefined;
        // 3. Finally, set the source and inject into the DOM in case the child
        //    must be appended for fetching to start.
        script.src = src;
        document.body.appendChild(script);
    });
}
// We wait for pages to be built in dev before we start the route transition
// timeout to prevent an un-necessary hard navigation in development.
let devBuildPromise;
// Resolve a promise that times out after given amount of milliseconds.
function resolvePromiseWithTimeout(p, ms, err) {
    return new Promise((resolve, reject)=>{
        let cancelled = false;
        p.then((r)=>{
            // Resolved, cancel the timeout
            cancelled = true;
            resolve(r);
        }).catch(reject);
        // We wrap these checks separately for better dead-code elimination in
        // production bundles.
        if (false) {}
        if (true) {
            (0, _requestidlecallback.requestIdleCallback)(()=>setTimeout(()=>{
                    if (!cancelled) {
                        reject(err);
                    }
                }, ms));
        }
    });
}
function getClientBuildManifest() {
    if (self.__BUILD_MANIFEST) {
        return Promise.resolve(self.__BUILD_MANIFEST);
    }
    const onBuildManifest = new Promise((resolve)=>{
        // Mandatory because this is not concurrent safe:
        const cb = self.__BUILD_MANIFEST_CB;
        self.__BUILD_MANIFEST_CB = ()=>{
            resolve(self.__BUILD_MANIFEST);
            cb && cb();
        };
    });
    return resolvePromiseWithTimeout(onBuildManifest, MS_MAX_IDLE_DELAY, markAssetError(new Error("Failed to load client build manifest")));
}
function getFilesForRoute(assetPrefix, route) {
    if (false) {}
    return getClientBuildManifest().then((manifest)=>{
        if (!(route in manifest)) {
            throw markAssetError(new Error("Failed to lookup route: " + route));
        }
        const allFiles = manifest[route].map((entry)=>assetPrefix + "/_next/" + encodeURI(entry));
        return {
            scripts: allFiles.filter((v)=>v.endsWith(".js")).map((v)=>(0, _trustedtypes.__unsafeCreateTrustedScriptURL)(v) + getAssetQueryString()),
            css: allFiles.filter((v)=>v.endsWith(".css")).map((v)=>v + getAssetQueryString())
        };
    });
}
function createRouteLoader(assetPrefix) {
    const entrypoints = new Map();
    const loadedScripts = new Map();
    const styleSheets = new Map();
    const routes = new Map();
    function maybeExecuteScript(src) {
        // With HMR we might need to "reload" scripts when they are
        // disposed and readded. Executing scripts twice has no functional
        // differences
        if (true) {
            let prom = loadedScripts.get(src.toString());
            if (prom) {
                return prom;
            }
            // Skip executing script if it's already in the DOM:
            if (document.querySelector('script[src^="' + src + '"]')) {
                return Promise.resolve();
            }
            loadedScripts.set(src.toString(), prom = appendScript(src));
            return prom;
        } else {}
    }
    function fetchStyleSheet(href) {
        let prom = styleSheets.get(href);
        if (prom) {
            return prom;
        }
        styleSheets.set(href, prom = fetch(href).then((res)=>{
            if (!res.ok) {
                throw new Error("Failed to load stylesheet: " + href);
            }
            return res.text().then((text)=>({
                    href: href,
                    content: text
                }));
        }).catch((err)=>{
            throw markAssetError(err);
        }));
        return prom;
    }
    return {
        whenEntrypoint (route) {
            return withFuture(route, entrypoints);
        },
        onEntrypoint (route, execute) {
            (execute ? Promise.resolve().then(()=>execute()).then((exports1)=>({
                    component: exports1 && exports1.default || exports1,
                    exports: exports1
                }), (err)=>({
                    error: err
                })) : Promise.resolve(undefined)).then((input)=>{
                const old = entrypoints.get(route);
                if (old && "resolve" in old) {
                    if (input) {
                        entrypoints.set(route, input);
                        old.resolve(input);
                    }
                } else {
                    if (input) {
                        entrypoints.set(route, input);
                    } else {
                        entrypoints.delete(route);
                    }
                    // when this entrypoint has been resolved before
                    // the route is outdated and we want to invalidate
                    // this cache entry
                    routes.delete(route);
                }
            });
        },
        loadRoute (route, prefetch) {
            return withFuture(route, routes, ()=>{
                let devBuildPromiseResolve;
                if (false) {}
                return resolvePromiseWithTimeout(getFilesForRoute(assetPrefix, route).then((param)=>{
                    let { scripts, css } = param;
                    return Promise.all([
                        entrypoints.has(route) ? [] : Promise.all(scripts.map(maybeExecuteScript)),
                        Promise.all(css.map(fetchStyleSheet))
                    ]);
                }).then((res)=>{
                    return this.whenEntrypoint(route).then((entrypoint)=>({
                            entrypoint,
                            styles: res[1]
                        }));
                }), MS_MAX_IDLE_DELAY, markAssetError(new Error("Route did not complete loading: " + route))).then((param)=>{
                    let { entrypoint, styles } = param;
                    const res = Object.assign({
                        styles: styles
                    }, entrypoint);
                    return "error" in entrypoint ? entrypoint : res;
                }).catch((err)=>{
                    if (prefetch) {
                        // we don't want to cache errors during prefetch
                        throw err;
                    }
                    return {
                        error: err
                    };
                }).finally(()=>{
                    return devBuildPromiseResolve == null ? void 0 : devBuildPromiseResolve();
                });
            });
        },
        prefetch (route) {
            // https://github.com/GoogleChromeLabs/quicklink/blob/453a661fa1fa940e2d2e044452398e38c67a98fb/src/index.mjs#L115-L118
            // License: Apache 2.0
            let cn;
            if (cn = navigator.connection) {
                // Don't prefetch if using 2G or if Save-Data is enabled.
                if (cn.saveData || /2g/.test(cn.effectiveType)) return Promise.resolve();
            }
            return getFilesForRoute(assetPrefix, route).then((output)=>Promise.all(canPrefetch ? output.scripts.map((script)=>prefetchViaDom(script.toString(), "script")) : [])).then(()=>{
                (0, _requestidlecallback.requestIdleCallback)(()=>this.loadRoute(route, true).catch(()=>{}));
            }).catch(()=>{});
        }
    };
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=route-loader.js.map


/***/ }),

/***/ 76972:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* global window */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    Router: function() {
        return _router.default;
    },
    // Export the singletonRouter and this is the public API.
    default: function() {
        return _default;
    },
    withRouter: function() {
        return _withrouter.default;
    },
    useRouter: function() {
        return useRouter;
    },
    createRouter: function() {
        return createRouter;
    },
    makePublicRouterInstance: function() {
        return makePublicRouterInstance;
    }
});
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _router = /*#__PURE__*/ _interop_require_default._(__webpack_require__(32791));
const _routercontext = __webpack_require__(17160);
const _iserror = /*#__PURE__*/ _interop_require_default._(__webpack_require__(20379));
const _withrouter = /*#__PURE__*/ _interop_require_default._(__webpack_require__(76983));
const singletonRouter = {
    router: null,
    readyCallbacks: [],
    ready (cb) {
        if (this.router) return cb();
        if (false) {}
    }
};
// Create public properties and methods of the router in the singletonRouter
const urlPropertyFields = [
    "pathname",
    "route",
    "query",
    "asPath",
    "components",
    "isFallback",
    "basePath",
    "locale",
    "locales",
    "defaultLocale",
    "isReady",
    "isPreview",
    "isLocaleDomain",
    "domainLocales"
];
const routerEvents = [
    "routeChangeStart",
    "beforeHistoryChange",
    "routeChangeComplete",
    "routeChangeError",
    "hashChangeStart",
    "hashChangeComplete"
];
const coreMethodFields = [
    "push",
    "replace",
    "reload",
    "back",
    "prefetch",
    "beforePopState"
];
// Events is a static property on the router, the router doesn't have to be initialized to use it
Object.defineProperty(singletonRouter, "events", {
    get () {
        return _router.default.events;
    }
});
function getRouter() {
    if (!singletonRouter.router) {
        const message = "No router instance found.\n" + 'You should only use "next/router" on the client side of your app.\n';
        throw new Error(message);
    }
    return singletonRouter.router;
}
urlPropertyFields.forEach((field)=>{
    // Here we need to use Object.defineProperty because we need to return
    // the property assigned to the actual router
    // The value might get changed as we change routes and this is the
    // proper way to access it
    Object.defineProperty(singletonRouter, field, {
        get () {
            const router = getRouter();
            return router[field];
        }
    });
});
coreMethodFields.forEach((field)=>{
    singletonRouter[field] = function() {
        for(var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++){
            args[_key] = arguments[_key];
        }
        const router = getRouter();
        return router[field](...args);
    };
});
routerEvents.forEach((event)=>{
    singletonRouter.ready(()=>{
        _router.default.events.on(event, function() {
            for(var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++){
                args[_key] = arguments[_key];
            }
            const eventField = "on" + event.charAt(0).toUpperCase() + event.substring(1);
            const _singletonRouter = singletonRouter;
            if (_singletonRouter[eventField]) {
                try {
                    _singletonRouter[eventField](...args);
                } catch (err) {
                    console.error("Error when running the Router event: " + eventField);
                    console.error((0, _iserror.default)(err) ? err.message + "\n" + err.stack : err + "");
                }
            }
        });
    });
});
const _default = singletonRouter;
function useRouter() {
    const router = _react.default.useContext(_routercontext.RouterContext);
    if (!router) {
        throw new Error("NextRouter was not mounted. https://nextjs.org/docs/messages/next-router-not-mounted");
    }
    return router;
}
function createRouter() {
    for(var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++){
        args[_key] = arguments[_key];
    }
    singletonRouter.router = new _router.default(...args);
    singletonRouter.readyCallbacks.forEach((cb)=>cb());
    singletonRouter.readyCallbacks = [];
    return singletonRouter.router;
}
function makePublicRouterInstance(router) {
    const scopedRouter = router;
    const instance = {};
    for (const property of urlPropertyFields){
        if (typeof scopedRouter[property] === "object") {
            instance[property] = Object.assign(Array.isArray(scopedRouter[property]) ? [] : {}, scopedRouter[property]) // makes sure query is not stateful
            ;
            continue;
        }
        instance[property] = scopedRouter[property];
    }
    // Events is a static property on the router, the router doesn't have to be initialized to use it
    instance.events = _router.default.events;
    coreMethodFields.forEach((field)=>{
        instance[field] = function() {
            for(var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++){
                args[_key] = arguments[_key];
            }
            return scopedRouter[field](...args);
        };
    });
    return instance;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=router.js.map


/***/ }),

/***/ 28970:
/***/ ((module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    handleClientScriptLoad: function() {
        return handleClientScriptLoad;
    },
    initScriptLoader: function() {
        return initScriptLoader;
    },
    default: function() {
        return _default;
    }
});
const _interop_require_default = __webpack_require__(84813);
const _interop_require_wildcard = __webpack_require__(45298);
const _reactdom = /*#__PURE__*/ _interop_require_default._(__webpack_require__(98704));
const _react = /*#__PURE__*/ _interop_require_wildcard._(__webpack_require__(18038));
const _headmanagercontext = __webpack_require__(86819);
const _headmanager = __webpack_require__(89904);
const _requestidlecallback = __webpack_require__(21145);
const ScriptCache = new Map();
const LoadCache = new Set();
const ignoreProps = [
    "onLoad",
    "onReady",
    "dangerouslySetInnerHTML",
    "children",
    "onError",
    "strategy",
    "stylesheets"
];
const insertStylesheets = (stylesheets)=>{
    // Case 1: Styles for afterInteractive/lazyOnload with appDir injected via handleClientScriptLoad
    //
    // Using ReactDOM.preinit to feature detect appDir and inject styles
    // Stylesheets might have already been loaded if initialized with Script component
    // Re-inject styles here to handle scripts loaded via handleClientScriptLoad
    // ReactDOM.preinit handles dedup and ensures the styles are loaded only once
    if (_reactdom.default.preinit) {
        stylesheets.forEach((stylesheet)=>{
            _reactdom.default.preinit(stylesheet, {
                as: "style"
            });
        });
        return;
    }
    // Case 2: Styles for afterInteractive/lazyOnload with pages injected via handleClientScriptLoad
    //
    // We use this function to load styles when appdir is not detected
    // TODO: Use React float APIs to load styles once available for pages dir
    if (false) {}
};
const loadScript = (props)=>{
    const { src, id, onLoad = ()=>{}, onReady = null, dangerouslySetInnerHTML, children = "", strategy = "afterInteractive", onError, stylesheets } = props;
    const cacheKey = id || src;
    // Script has already loaded
    if (cacheKey && LoadCache.has(cacheKey)) {
        return;
    }
    // Contents of this script are already loading/loaded
    if (ScriptCache.has(src)) {
        LoadCache.add(cacheKey);
        // It is possible that multiple `next/script` components all have same "src", but has different "onLoad"
        // This is to make sure the same remote script will only load once, but "onLoad" are executed in order
        ScriptCache.get(src).then(onLoad, onError);
        return;
    }
    /** Execute after the script first loaded */ const afterLoad = ()=>{
        // Run onReady for the first time after load event
        if (onReady) {
            onReady();
        }
        // add cacheKey to LoadCache when load successfully
        LoadCache.add(cacheKey);
    };
    const el = document.createElement("script");
    const loadPromise = new Promise((resolve, reject)=>{
        el.addEventListener("load", function(e) {
            resolve();
            if (onLoad) {
                onLoad.call(this, e);
            }
            afterLoad();
        });
        el.addEventListener("error", function(e) {
            reject(e);
        });
    }).catch(function(e) {
        if (onError) {
            onError(e);
        }
    });
    if (dangerouslySetInnerHTML) {
        // Casting since lib.dom.d.ts doesn't have TrustedHTML yet.
        el.innerHTML = dangerouslySetInnerHTML.__html || "";
        afterLoad();
    } else if (children) {
        el.textContent = typeof children === "string" ? children : Array.isArray(children) ? children.join("") : "";
        afterLoad();
    } else if (src) {
        el.src = src;
        // do not add cacheKey into LoadCache for remote script here
        // cacheKey will be added to LoadCache when it is actually loaded (see loadPromise above)
        ScriptCache.set(src, loadPromise);
    }
    for (const [k, value] of Object.entries(props)){
        if (value === undefined || ignoreProps.includes(k)) {
            continue;
        }
        const attr = _headmanager.DOMAttributeNames[k] || k.toLowerCase();
        el.setAttribute(attr, value);
    }
    if (strategy === "worker") {
        el.setAttribute("type", "text/partytown");
    }
    el.setAttribute("data-nscript", strategy);
    // Load styles associated with this script
    if (stylesheets) {
        insertStylesheets(stylesheets);
    }
    document.body.appendChild(el);
};
function handleClientScriptLoad(props) {
    const { strategy = "afterInteractive" } = props;
    if (strategy === "lazyOnload") {
        window.addEventListener("load", ()=>{
            (0, _requestidlecallback.requestIdleCallback)(()=>loadScript(props));
        });
    } else {
        loadScript(props);
    }
}
function loadLazyScript(props) {
    if (document.readyState === "complete") {
        (0, _requestidlecallback.requestIdleCallback)(()=>loadScript(props));
    } else {
        window.addEventListener("load", ()=>{
            (0, _requestidlecallback.requestIdleCallback)(()=>loadScript(props));
        });
    }
}
function addBeforeInteractiveToCache() {
    const scripts = [
        ...document.querySelectorAll('[data-nscript="beforeInteractive"]'),
        ...document.querySelectorAll('[data-nscript="beforePageRender"]')
    ];
    scripts.forEach((script)=>{
        const cacheKey = script.id || script.getAttribute("src");
        LoadCache.add(cacheKey);
    });
}
function initScriptLoader(scriptLoaderItems) {
    scriptLoaderItems.forEach(handleClientScriptLoad);
    addBeforeInteractiveToCache();
}
function Script(props) {
    const { id, src = "", onLoad = ()=>{}, onReady = null, strategy = "afterInteractive", onError, stylesheets, ...restProps } = props;
    // Context is available only during SSR
    const { updateScripts, scripts, getIsSsr, appDir, nonce } = (0, _react.useContext)(_headmanagercontext.HeadManagerContext);
    /**
   * - First mount:
   *   1. The useEffect for onReady executes
   *   2. hasOnReadyEffectCalled.current is false, but the script hasn't loaded yet (not in LoadCache)
   *      onReady is skipped, set hasOnReadyEffectCalled.current to true
   *   3. The useEffect for loadScript executes
   *   4. hasLoadScriptEffectCalled.current is false, loadScript executes
   *      Once the script is loaded, the onLoad and onReady will be called by then
   *   [If strict mode is enabled / is wrapped in <OffScreen /> component]
   *   5. The useEffect for onReady executes again
   *   6. hasOnReadyEffectCalled.current is true, so entire effect is skipped
   *   7. The useEffect for loadScript executes again
   *   8. hasLoadScriptEffectCalled.current is true, so entire effect is skipped
   *
   * - Second mount:
   *   1. The useEffect for onReady executes
   *   2. hasOnReadyEffectCalled.current is false, but the script has already loaded (found in LoadCache)
   *      onReady is called, set hasOnReadyEffectCalled.current to true
   *   3. The useEffect for loadScript executes
   *   4. The script is already loaded, loadScript bails out
   *   [If strict mode is enabled / is wrapped in <OffScreen /> component]
   *   5. The useEffect for onReady executes again
   *   6. hasOnReadyEffectCalled.current is true, so entire effect is skipped
   *   7. The useEffect for loadScript executes again
   *   8. hasLoadScriptEffectCalled.current is true, so entire effect is skipped
   */ const hasOnReadyEffectCalled = (0, _react.useRef)(false);
    (0, _react.useEffect)(()=>{
        const cacheKey = id || src;
        if (!hasOnReadyEffectCalled.current) {
            // Run onReady if script has loaded before but component is re-mounted
            if (onReady && cacheKey && LoadCache.has(cacheKey)) {
                onReady();
            }
            hasOnReadyEffectCalled.current = true;
        }
    }, [
        onReady,
        id,
        src
    ]);
    const hasLoadScriptEffectCalled = (0, _react.useRef)(false);
    (0, _react.useEffect)(()=>{
        if (!hasLoadScriptEffectCalled.current) {
            if (strategy === "afterInteractive") {
                loadScript(props);
            } else if (strategy === "lazyOnload") {
                loadLazyScript(props);
            }
            hasLoadScriptEffectCalled.current = true;
        }
    }, [
        props,
        strategy
    ]);
    if (strategy === "beforeInteractive" || strategy === "worker") {
        if (updateScripts) {
            scripts[strategy] = (scripts[strategy] || []).concat([
                {
                    id,
                    src,
                    onLoad,
                    onReady,
                    onError,
                    ...restProps
                }
            ]);
            updateScripts(scripts);
        } else if (getIsSsr && getIsSsr()) {
            // Script has already loaded during SSR
            LoadCache.add(id || src);
        } else if (getIsSsr && !getIsSsr()) {
            loadScript(props);
        }
    }
    // For the app directory, we need React Float to preload these scripts.
    if (appDir) {
        // Injecting stylesheets here handles beforeInteractive and worker scripts correctly
        // For other strategies injecting here ensures correct stylesheet order
        // ReactDOM.preinit handles loading the styles in the correct order,
        // also ensures the stylesheet is loaded only once and in a consistent manner
        //
        // Case 1: Styles for beforeInteractive/worker with appDir - handled here
        // Case 2: Styles for beforeInteractive/worker with pages dir - Not handled yet
        // Case 3: Styles for afterInteractive/lazyOnload with appDir - handled here
        // Case 4: Styles for afterInteractive/lazyOnload with pages dir - handled in insertStylesheets function
        if (stylesheets) {
            stylesheets.forEach((styleSrc)=>{
                _reactdom.default.preinit(styleSrc, {
                    as: "style"
                });
            });
        }
        // Before interactive scripts need to be loaded by Next.js' runtime instead
        // of native <script> tags, because they no longer have `defer`.
        if (strategy === "beforeInteractive") {
            if (!src) {
                // For inlined scripts, we put the content in `children`.
                if (restProps.dangerouslySetInnerHTML) {
                    // Casting since lib.dom.d.ts doesn't have TrustedHTML yet.
                    restProps.children = restProps.dangerouslySetInnerHTML.__html;
                    delete restProps.dangerouslySetInnerHTML;
                }
                return /*#__PURE__*/ _react.default.createElement("script", {
                    nonce: nonce,
                    dangerouslySetInnerHTML: {
                        __html: "(self.__next_s=self.__next_s||[]).push(" + JSON.stringify([
                            0,
                            {
                                ...restProps
                            }
                        ]) + ")"
                    }
                });
            } else {
                // @ts-ignore
                _reactdom.default.preload(src, restProps.integrity ? {
                    as: "script",
                    integrity: restProps.integrity
                } : {
                    as: "script"
                });
                return /*#__PURE__*/ _react.default.createElement("script", {
                    nonce: nonce,
                    dangerouslySetInnerHTML: {
                        __html: "(self.__next_s=self.__next_s||[]).push(" + JSON.stringify([
                            src
                        ]) + ")"
                    }
                });
            }
        } else if (strategy === "afterInteractive") {
            if (src) {
                // @ts-ignore
                _reactdom.default.preload(src, restProps.integrity ? {
                    as: "script",
                    integrity: restProps.integrity
                } : {
                    as: "script"
                });
            }
        }
    }
    return null;
}
Object.defineProperty(Script, "__nextScript", {
    value: true
});
const _default = Script;
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=script.js.map


/***/ }),

/***/ 49271:
/***/ ((module, exports) => {

"use strict";
/**
 * Stores the Trusted Types Policy. Starts as undefined and can be set to null
 * if Trusted Types is not supported in the browser.
 */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "__unsafeCreateTrustedScriptURL", ({
    enumerable: true,
    get: function() {
        return __unsafeCreateTrustedScriptURL;
    }
}));
let policy;
/**
 * Getter for the Trusted Types Policy. If it is undefined, it is instantiated
 * here or set to null if Trusted Types is not supported in the browser.
 */ function getPolicy() {
    if (typeof policy === "undefined" && "undefined" !== "undefined") { var _window_trustedTypes; }
    return policy;
}
function __unsafeCreateTrustedScriptURL(url) {
    var _getPolicy;
    return ((_getPolicy = getPolicy()) == null ? void 0 : _getPolicy.createScriptURL(url)) || url;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=trusted-types.js.map


/***/ }),

/***/ 90406:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "useIntersection", ({
    enumerable: true,
    get: function() {
        return useIntersection;
    }
}));
const _react = __webpack_require__(18038);
const _requestidlecallback = __webpack_require__(21145);
const hasIntersectionObserver = typeof IntersectionObserver === "function";
const observers = new Map();
const idList = [];
function createObserver(options) {
    const id = {
        root: options.root || null,
        margin: options.rootMargin || ""
    };
    const existing = idList.find((obj)=>obj.root === id.root && obj.margin === id.margin);
    let instance;
    if (existing) {
        instance = observers.get(existing);
        if (instance) {
            return instance;
        }
    }
    const elements = new Map();
    const observer = new IntersectionObserver((entries)=>{
        entries.forEach((entry)=>{
            const callback = elements.get(entry.target);
            const isVisible = entry.isIntersecting || entry.intersectionRatio > 0;
            if (callback && isVisible) {
                callback(isVisible);
            }
        });
    }, options);
    instance = {
        id,
        observer,
        elements
    };
    idList.push(id);
    observers.set(id, instance);
    return instance;
}
function observe(element, callback, options) {
    const { id, observer, elements } = createObserver(options);
    elements.set(element, callback);
    observer.observe(element);
    return function unobserve() {
        elements.delete(element);
        observer.unobserve(element);
        // Destroy observer when there's nothing left to watch:
        if (elements.size === 0) {
            observer.disconnect();
            observers.delete(id);
            const index = idList.findIndex((obj)=>obj.root === id.root && obj.margin === id.margin);
            if (index > -1) {
                idList.splice(index, 1);
            }
        }
    };
}
function useIntersection(param) {
    let { rootRef, rootMargin, disabled } = param;
    const isDisabled = disabled || !hasIntersectionObserver;
    const [visible, setVisible] = (0, _react.useState)(false);
    const elementRef = (0, _react.useRef)(null);
    const setElement = (0, _react.useCallback)((element)=>{
        elementRef.current = element;
    }, []);
    (0, _react.useEffect)(()=>{
        if (hasIntersectionObserver) {
            if (isDisabled || visible) return;
            const element = elementRef.current;
            if (element && element.tagName) {
                const unobserve = observe(element, (isVisible)=>isVisible && setVisible(isVisible), {
                    root: rootRef == null ? void 0 : rootRef.current,
                    rootMargin
                });
                return unobserve;
            }
        } else {
            if (!visible) {
                const idleCallback = (0, _requestidlecallback.requestIdleCallback)(()=>setVisible(true));
                return ()=>(0, _requestidlecallback.cancelIdleCallback)(idleCallback);
            }
        }
    // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [
        isDisabled,
        rootMargin,
        rootRef,
        visible,
        elementRef.current
    ]);
    const resetVisible = (0, _react.useCallback)(()=>{
        setVisible(false);
    }, []);
    return [
        setElement,
        visible,
        resetVisible
    ];
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=use-intersection.js.map


/***/ }),

/***/ 76983:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "default", ({
    enumerable: true,
    get: function() {
        return withRouter;
    }
}));
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _router = __webpack_require__(76972);
function withRouter(ComposedComponent) {
    function WithRouterWrapper(props) {
        return /*#__PURE__*/ _react.default.createElement(ComposedComponent, {
            router: (0, _router.useRouter)(),
            ...props
        });
    }
    WithRouterWrapper.getInitialProps = ComposedComponent.getInitialProps;
    WithRouterWrapper.origGetInitialProps = ComposedComponent.origGetInitialProps;
    if (false) {}
    return WithRouterWrapper;
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=with-router.js.map


/***/ }),

/***/ 47431:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    suspense: function() {
        return suspense;
    },
    NoSSR: function() {
        return NoSSR;
    }
});
const _interop_require_default = __webpack_require__(84813);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(18038));
const _nossrerror = __webpack_require__(85895);
function suspense() {
    const error = new Error(_nossrerror.NEXT_DYNAMIC_NO_SSR_CODE);
    error.digest = _nossrerror.NEXT_DYNAMIC_NO_SSR_CODE;
    throw error;
}
function NoSSR(param) {
    let { children } = param;
    if (true) {
        suspense();
    }
    return children;
} //# sourceMappingURL=dynamic-no-ssr.js.map


/***/ }),

/***/ 85895:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
// This has to be a shared module which is shared between client component error boundary and dynamic component

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "NEXT_DYNAMIC_NO_SSR_CODE", ({
    enumerable: true,
    get: function() {
        return NEXT_DYNAMIC_NO_SSR_CODE;
    }
}));
const NEXT_DYNAMIC_NO_SSR_CODE = "NEXT_DYNAMIC_NO_SSR_CODE"; //# sourceMappingURL=no-ssr-error.js.map


/***/ }),

/***/ 32791:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";
// tslint:disable:no-console

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    default: function() {
        return Router;
    },
    matchesMiddleware: function() {
        return matchesMiddleware;
    },
    createKey: function() {
        return createKey;
    }
});
const _interop_require_default = __webpack_require__(84813);
const _interop_require_wildcard = __webpack_require__(45298);
const _removetrailingslash = __webpack_require__(53750);
const _routeloader = __webpack_require__(15426);
const _script = __webpack_require__(28970);
const _iserror = /*#__PURE__*/ _interop_require_wildcard._(__webpack_require__(20379));
const _denormalizepagepath = __webpack_require__(61188);
const _normalizelocalepath = __webpack_require__(82169);
const _mitt = /*#__PURE__*/ _interop_require_default._(__webpack_require__(88240));
const _utils = __webpack_require__(78423);
const _isdynamic = __webpack_require__(3681);
const _parserelativeurl = __webpack_require__(1856);
const _resolverewrites = /*#__PURE__*/ _interop_require_default._(__webpack_require__(24648));
const _routematcher = __webpack_require__(79966);
const _routeregex = __webpack_require__(93869);
const _formaturl = __webpack_require__(12336);
const _detectdomainlocale = __webpack_require__(45968);
const _parsepath = __webpack_require__(68231);
const _addlocale = __webpack_require__(92704);
const _removelocale = __webpack_require__(33841);
const _removebasepath = __webpack_require__(37277);
const _addbasepath = __webpack_require__(42374);
const _hasbasepath = __webpack_require__(35753);
const _isapiroute = __webpack_require__(35130);
const _getnextpathnameinfo = __webpack_require__(50069);
const _formatnextpathnameinfo = __webpack_require__(76773);
const _comparestates = __webpack_require__(30442);
const _islocalurl = __webpack_require__(60120);
const _isbot = __webpack_require__(98735);
const _omit = __webpack_require__(61959);
const _resolvehref = __webpack_require__(70982);
const _interpolateas = __webpack_require__(36438);
const _handlesmoothscroll = __webpack_require__(17887);
function buildCancellationError() {
    return Object.assign(new Error("Route Cancelled"), {
        cancelled: true
    });
}
async function matchesMiddleware(options) {
    const matchers = await Promise.resolve(options.router.pageLoader.getMiddleware());
    if (!matchers) return false;
    const { pathname: asPathname } = (0, _parsepath.parsePath)(options.asPath);
    // remove basePath first since path prefix has to be in the order of `/${basePath}/${locale}`
    const cleanedAs = (0, _hasbasepath.hasBasePath)(asPathname) ? (0, _removebasepath.removeBasePath)(asPathname) : asPathname;
    const asWithBasePathAndLocale = (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)(cleanedAs, options.locale));
    // Check only path match on client. Matching "has" should be done on server
    // where we can access more info such as headers, HttpOnly cookie, etc.
    return matchers.some((m)=>new RegExp(m.regexp).test(asWithBasePathAndLocale));
}
function stripOrigin(url) {
    const origin = (0, _utils.getLocationOrigin)();
    return url.startsWith(origin) ? url.substring(origin.length) : url;
}
function prepareUrlAs(router, url, as) {
    // If url and as provided as an object representation,
    // we'll format them into the string version here.
    let [resolvedHref, resolvedAs] = (0, _resolvehref.resolveHref)(router, url, true);
    const origin = (0, _utils.getLocationOrigin)();
    const hrefWasAbsolute = resolvedHref.startsWith(origin);
    const asWasAbsolute = resolvedAs && resolvedAs.startsWith(origin);
    resolvedHref = stripOrigin(resolvedHref);
    resolvedAs = resolvedAs ? stripOrigin(resolvedAs) : resolvedAs;
    const preparedUrl = hrefWasAbsolute ? resolvedHref : (0, _addbasepath.addBasePath)(resolvedHref);
    const preparedAs = as ? stripOrigin((0, _resolvehref.resolveHref)(router, as)) : resolvedAs || resolvedHref;
    return {
        url: preparedUrl,
        as: asWasAbsolute ? preparedAs : (0, _addbasepath.addBasePath)(preparedAs)
    };
}
function resolveDynamicRoute(pathname, pages) {
    const cleanPathname = (0, _removetrailingslash.removeTrailingSlash)((0, _denormalizepagepath.denormalizePagePath)(pathname));
    if (cleanPathname === "/404" || cleanPathname === "/_error") {
        return pathname;
    }
    // handle resolving href for dynamic routes
    if (!pages.includes(cleanPathname)) {
        // eslint-disable-next-line array-callback-return
        pages.some((page)=>{
            if ((0, _isdynamic.isDynamicRoute)(page) && (0, _routeregex.getRouteRegex)(page).re.test(cleanPathname)) {
                pathname = page;
                return true;
            }
        });
    }
    return (0, _removetrailingslash.removeTrailingSlash)(pathname);
}
function getMiddlewareData(source, response, options) {
    const nextConfig = {
        basePath: options.router.basePath,
        i18n: {
            locales: options.router.locales
        },
        trailingSlash: Boolean(false)
    };
    const rewriteHeader = response.headers.get("x-nextjs-rewrite");
    let rewriteTarget = rewriteHeader || response.headers.get("x-nextjs-matched-path");
    const matchedPath = response.headers.get("x-matched-path");
    if (matchedPath && !rewriteTarget && !matchedPath.includes("__next_data_catchall") && !matchedPath.includes("/_error") && !matchedPath.includes("/404")) {
        // leverage x-matched-path to detect next.config.js rewrites
        rewriteTarget = matchedPath;
    }
    if (rewriteTarget) {
        if (rewriteTarget.startsWith("/") || undefined) {
            const parsedRewriteTarget = (0, _parserelativeurl.parseRelativeUrl)(rewriteTarget);
            const pathnameInfo = (0, _getnextpathnameinfo.getNextPathnameInfo)(parsedRewriteTarget.pathname, {
                nextConfig,
                parseData: true
            });
            let fsPathname = (0, _removetrailingslash.removeTrailingSlash)(pathnameInfo.pathname);
            return Promise.all([
                options.router.pageLoader.getPageList(),
                (0, _routeloader.getClientBuildManifest)()
            ]).then((param)=>{
                let [pages, { __rewrites: rewrites }] = param;
                let as = (0, _addlocale.addLocale)(pathnameInfo.pathname, pathnameInfo.locale);
                if ((0, _isdynamic.isDynamicRoute)(as) || !rewriteHeader && pages.includes((0, _normalizelocalepath.normalizeLocalePath)((0, _removebasepath.removeBasePath)(as), options.router.locales).pathname)) {
                    const parsedSource = (0, _getnextpathnameinfo.getNextPathnameInfo)((0, _parserelativeurl.parseRelativeUrl)(source).pathname, {
                        nextConfig:  false ? 0 : nextConfig,
                        parseData: true
                    });
                    as = (0, _addbasepath.addBasePath)(parsedSource.pathname);
                    parsedRewriteTarget.pathname = as;
                }
                if (false) {} else if (!pages.includes(fsPathname)) {
                    const resolvedPathname = resolveDynamicRoute(fsPathname, pages);
                    if (resolvedPathname !== fsPathname) {
                        fsPathname = resolvedPathname;
                    }
                }
                const resolvedHref = !pages.includes(fsPathname) ? resolveDynamicRoute((0, _normalizelocalepath.normalizeLocalePath)((0, _removebasepath.removeBasePath)(parsedRewriteTarget.pathname), options.router.locales).pathname, pages) : fsPathname;
                if ((0, _isdynamic.isDynamicRoute)(resolvedHref)) {
                    const matches = (0, _routematcher.getRouteMatcher)((0, _routeregex.getRouteRegex)(resolvedHref))(as);
                    Object.assign(parsedRewriteTarget.query, matches || {});
                }
                return {
                    type: "rewrite",
                    parsedAs: parsedRewriteTarget,
                    resolvedHref
                };
            });
        }
        const src = (0, _parsepath.parsePath)(source);
        const pathname = (0, _formatnextpathnameinfo.formatNextPathnameInfo)({
            ...(0, _getnextpathnameinfo.getNextPathnameInfo)(src.pathname, {
                nextConfig,
                parseData: true
            }),
            defaultLocale: options.router.defaultLocale,
            buildId: ""
        });
        return Promise.resolve({
            type: "redirect-external",
            destination: "" + pathname + src.query + src.hash
        });
    }
    const redirectTarget = response.headers.get("x-nextjs-redirect");
    if (redirectTarget) {
        if (redirectTarget.startsWith("/")) {
            const src = (0, _parsepath.parsePath)(redirectTarget);
            const pathname = (0, _formatnextpathnameinfo.formatNextPathnameInfo)({
                ...(0, _getnextpathnameinfo.getNextPathnameInfo)(src.pathname, {
                    nextConfig,
                    parseData: true
                }),
                defaultLocale: options.router.defaultLocale,
                buildId: ""
            });
            return Promise.resolve({
                type: "redirect-internal",
                newAs: "" + pathname + src.query + src.hash,
                newUrl: "" + pathname + src.query + src.hash
            });
        }
        return Promise.resolve({
            type: "redirect-external",
            destination: redirectTarget
        });
    }
    return Promise.resolve({
        type: "next"
    });
}
async function withMiddlewareEffects(options) {
    const matches = await matchesMiddleware(options);
    if (!matches || !options.fetchData) {
        return null;
    }
    try {
        const data = await options.fetchData();
        const effect = await getMiddlewareData(data.dataHref, data.response, options);
        return {
            dataHref: data.dataHref,
            json: data.json,
            response: data.response,
            text: data.text,
            cacheKey: data.cacheKey,
            effect
        };
    } catch (e) {
        /**
     * TODO: Revisit this in the future.
     * For now we will not consider middleware data errors to be fatal.
     * maybe we should revisit in the future.
     */ return null;
    }
}
const manualScrollRestoration =  false && 0;
const SSG_DATA_NOT_FOUND = Symbol("SSG_DATA_NOT_FOUND");
function fetchRetry(url, attempts, options) {
    return fetch(url, {
        // Cookies are required to be present for Next.js' SSG "Preview Mode".
        // Cookies may also be required for `getServerSideProps`.
        //
        // > `fetch` won’t send cookies, unless you set the credentials init
        // > option.
        // https://developer.mozilla.org/en-US/docs/Web/API/Fetch_API/Using_Fetch
        //
        // > For maximum browser compatibility when it comes to sending &
        // > receiving cookies, always supply the `credentials: 'same-origin'`
        // > option instead of relying on the default.
        // https://github.com/github/fetch#caveats
        credentials: "same-origin",
        method: options.method || "GET",
        headers: Object.assign({}, options.headers, {
            "x-nextjs-data": "1"
        })
    }).then((response)=>{
        return !response.ok && attempts > 1 && response.status >= 500 ? fetchRetry(url, attempts - 1, options) : response;
    });
}
function tryToParseAsJSON(text) {
    try {
        return JSON.parse(text);
    } catch (error) {
        return null;
    }
}
function fetchNextData(param) {
    let { dataHref, inflightCache, isPrefetch, hasMiddleware, isServerRender, parseJSON, persistCache, isBackground, unstable_skipClientCache } = param;
    const { href: cacheKey } = new URL(dataHref, window.location.href);
    var _params_method;
    const getData = (params)=>{
        return fetchRetry(dataHref, isServerRender ? 3 : 1, {
            headers: Object.assign({}, isPrefetch ? {
                purpose: "prefetch"
            } : {}, isPrefetch && hasMiddleware ? {
                "x-middleware-prefetch": "1"
            } : {}),
            method: (_params_method = params == null ? void 0 : params.method) != null ? _params_method : "GET"
        }).then((response)=>{
            if (response.ok && (params == null ? void 0 : params.method) === "HEAD") {
                return {
                    dataHref,
                    response,
                    text: "",
                    json: {},
                    cacheKey
                };
            }
            return response.text().then((text)=>{
                if (!response.ok) {
                    /**
             * When the data response is a redirect because of a middleware
             * we do not consider it an error. The headers must bring the
             * mapped location.
             * TODO: Change the status code in the handler.
             */ if (hasMiddleware && [
                        301,
                        302,
                        307,
                        308
                    ].includes(response.status)) {
                        return {
                            dataHref,
                            response,
                            text,
                            json: {},
                            cacheKey
                        };
                    }
                    if (response.status === 404) {
                        var _tryToParseAsJSON;
                        if ((_tryToParseAsJSON = tryToParseAsJSON(text)) == null ? void 0 : _tryToParseAsJSON.notFound) {
                            return {
                                dataHref,
                                json: {
                                    notFound: SSG_DATA_NOT_FOUND
                                },
                                response,
                                text,
                                cacheKey
                            };
                        }
                    }
                    const error = new Error("Failed to load static props");
                    /**
             * We should only trigger a server-side transition if this was
             * caused on a client-side transition. Otherwise, we'd get into
             * an infinite loop.
             */ if (!isServerRender) {
                        (0, _routeloader.markAssetError)(error);
                    }
                    throw error;
                }
                return {
                    dataHref,
                    json: parseJSON ? tryToParseAsJSON(text) : null,
                    response,
                    text,
                    cacheKey
                };
            });
        }).then((data)=>{
            if (!persistCache || "production" !== "production" || data.response.headers.get("x-middleware-cache") === "no-cache") {
                delete inflightCache[cacheKey];
            }
            return data;
        }).catch((err)=>{
            if (!unstable_skipClientCache) {
                delete inflightCache[cacheKey];
            }
            if (err.message === "Failed to fetch" || // firefox
            err.message === "NetworkError when attempting to fetch resource." || // safari
            err.message === "Load failed") {
                (0, _routeloader.markAssetError)(err);
            }
            throw err;
        });
    };
    // when skipping client cache we wait to update
    // inflight cache until successful data response
    // this allows racing click event with fetching newer data
    // without blocking navigation when stale data is available
    if (unstable_skipClientCache && persistCache) {
        return getData({}).then((data)=>{
            inflightCache[cacheKey] = Promise.resolve(data);
            return data;
        });
    }
    if (inflightCache[cacheKey] !== undefined) {
        return inflightCache[cacheKey];
    }
    return inflightCache[cacheKey] = getData(isBackground ? {
        method: "HEAD"
    } : {});
}
function createKey() {
    return Math.random().toString(36).slice(2, 10);
}
function handleHardNavigation(param) {
    let { url, router } = param;
    // ensure we don't trigger a hard navigation to the same
    // URL as this can end up with an infinite refresh
    if (url === (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)(router.asPath, router.locale))) {
        throw new Error("Invariant: attempted to hard navigate to the same URL " + url + " " + location.href);
    }
    window.location.href = url;
}
const getCancelledHandler = (param)=>{
    let { route, router } = param;
    let cancelled = false;
    const cancel = router.clc = ()=>{
        cancelled = true;
    };
    const handleCancelled = ()=>{
        if (cancelled) {
            const error = new Error('Abort fetching component for route: "' + route + '"');
            error.cancelled = true;
            throw error;
        }
        if (cancel === router.clc) {
            router.clc = null;
        }
    };
    return handleCancelled;
};
class Router {
    reload() {
        window.location.reload();
    }
    /**
   * Go back in history
   */ back() {
        window.history.back();
    }
    /**
   * Go forward in history
   */ forward() {
        window.history.forward();
    }
    /**
   * Performs a `pushState` with arguments
   * @param url of the route
   * @param as masks `url` for the browser
   * @param options object you can define `shallow` and other options
   */ push(url, as, options) {
        if (options === void 0) options = {};
        if (false) {}
        ({ url, as } = prepareUrlAs(this, url, as));
        return this.change("pushState", url, as, options);
    }
    /**
   * Performs a `replaceState` with arguments
   * @param url of the route
   * @param as masks `url` for the browser
   * @param options object you can define `shallow` and other options
   */ replace(url, as, options) {
        if (options === void 0) options = {};
        ({ url, as } = prepareUrlAs(this, url, as));
        return this.change("replaceState", url, as, options);
    }
    async _bfl(as, resolvedAs, locale, skipNavigate) {
        if (true) {
            let matchesBflStatic = false;
            let matchesBflDynamic = false;
            for (const curAs of [
                as,
                resolvedAs
            ]){
                if (curAs) {
                    const asNoSlash = (0, _removetrailingslash.removeTrailingSlash)(new URL(curAs, "http://n").pathname);
                    const asNoSlashLocale = (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)(asNoSlash, locale || this.locale));
                    if (asNoSlash !== (0, _removetrailingslash.removeTrailingSlash)(new URL(this.asPath, "http://n").pathname)) {
                        var _this__bfl_s, _this__bfl_s1;
                        matchesBflStatic = matchesBflStatic || !!((_this__bfl_s = this._bfl_s) == null ? void 0 : _this__bfl_s.contains(asNoSlash)) || !!((_this__bfl_s1 = this._bfl_s) == null ? void 0 : _this__bfl_s1.contains(asNoSlashLocale));
                        for (const normalizedAS of [
                            asNoSlash,
                            asNoSlashLocale
                        ]){
                            // if any sub-path of as matches a dynamic filter path
                            // it should be hard navigated
                            const curAsParts = normalizedAS.split("/");
                            for(let i = 0; !matchesBflDynamic && i < curAsParts.length + 1; i++){
                                var _this__bfl_d;
                                const currentPart = curAsParts.slice(0, i).join("/");
                                if (currentPart && ((_this__bfl_d = this._bfl_d) == null ? void 0 : _this__bfl_d.contains(currentPart))) {
                                    matchesBflDynamic = true;
                                    break;
                                }
                            }
                        }
                        // if the client router filter is matched then we trigger
                        // a hard navigation
                        if (matchesBflStatic || matchesBflDynamic) {
                            if (skipNavigate) {
                                return true;
                            }
                            handleHardNavigation({
                                url: (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)(as, locale || this.locale, this.defaultLocale)),
                                router: this
                            });
                            return new Promise(()=>{});
                        }
                    }
                }
            }
        }
        return false;
    }
    async change(method, url, as, options, forcedScroll) {
        var _this_components_pathname;
        if (!(0, _islocalurl.isLocalURL)(url)) {
            handleHardNavigation({
                url,
                router: this
            });
            return false;
        }
        // WARNING: `_h` is an internal option for handing Next.js client-side
        // hydration. Your app should _never_ use this property. It may change at
        // any time without notice.
        const isQueryUpdating = options._h === 1;
        if (!isQueryUpdating && !options.shallow) {
            await this._bfl(as, undefined, options.locale);
        }
        let shouldResolveHref = isQueryUpdating || options._shouldResolveHref || (0, _parsepath.parsePath)(url).pathname === (0, _parsepath.parsePath)(as).pathname;
        const nextState = {
            ...this.state
        };
        // for static pages with query params in the URL we delay
        // marking the router ready until after the query is updated
        // or a navigation has occurred
        const readyStateChange = this.isReady !== true;
        this.isReady = true;
        const isSsr = this.isSsr;
        if (!isQueryUpdating) {
            this.isSsr = false;
        }
        // if a route transition is already in progress before
        // the query updating is triggered ignore query updating
        if (isQueryUpdating && this.clc) {
            return false;
        }
        const prevLocale = nextState.locale;
        if (false) { var _this_locales; }
        // marking route changes as a navigation start entry
        if (_utils.ST) {
            performance.mark("routeChange");
        }
        const { shallow = false, scroll = true } = options;
        const routeProps = {
            shallow
        };
        if (this._inFlightRoute && this.clc) {
            if (!isSsr) {
                Router.events.emit("routeChangeError", buildCancellationError(), this._inFlightRoute, routeProps);
            }
            this.clc();
            this.clc = null;
        }
        as = (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)((0, _hasbasepath.hasBasePath)(as) ? (0, _removebasepath.removeBasePath)(as) : as, options.locale, this.defaultLocale));
        const cleanedAs = (0, _removelocale.removeLocale)((0, _hasbasepath.hasBasePath)(as) ? (0, _removebasepath.removeBasePath)(as) : as, nextState.locale);
        this._inFlightRoute = as;
        const localeChange = prevLocale !== nextState.locale;
        // If the url change is only related to a hash change
        // We should not proceed. We should only change the state.
        if (!isQueryUpdating && this.onlyAHashChange(cleanedAs) && !localeChange) {
            nextState.asPath = cleanedAs;
            Router.events.emit("hashChangeStart", as, routeProps);
            // TODO: do we need the resolved href when only a hash change?
            this.changeState(method, url, as, {
                ...options,
                scroll: false
            });
            if (scroll) {
                this.scrollToHash(cleanedAs);
            }
            try {
                await this.set(nextState, this.components[nextState.route], null);
            } catch (err) {
                if ((0, _iserror.default)(err) && err.cancelled) {
                    Router.events.emit("routeChangeError", err, cleanedAs, routeProps);
                }
                throw err;
            }
            Router.events.emit("hashChangeComplete", as, routeProps);
            return true;
        }
        let parsed = (0, _parserelativeurl.parseRelativeUrl)(url);
        let { pathname, query } = parsed;
        // if we detected the path as app route during prefetching
        // trigger hard navigation
        if ((_this_components_pathname = this.components[pathname]) == null ? void 0 : _this_components_pathname.__appRouter) {
            handleHardNavigation({
                url: as,
                router: this
            });
            return new Promise(()=>{});
        }
        // The build manifest needs to be loaded before auto-static dynamic pages
        // get their query parameters to allow ensuring they can be parsed properly
        // when rewritten to
        let pages, rewrites;
        try {
            [pages, { __rewrites: rewrites }] = await Promise.all([
                this.pageLoader.getPageList(),
                (0, _routeloader.getClientBuildManifest)(),
                this.pageLoader.getMiddleware()
            ]);
        } catch (err) {
            // If we fail to resolve the page list or client-build manifest, we must
            // do a server-side transition:
            handleHardNavigation({
                url: as,
                router: this
            });
            return false;
        }
        // If asked to change the current URL we should reload the current page
        // (not location.reload() but reload getInitialProps and other Next.js stuffs)
        // We also need to set the method = replaceState always
        // as this should not go into the history (That's how browsers work)
        // We should compare the new asPath to the current asPath, not the url
        if (!this.urlIsNew(cleanedAs) && !localeChange) {
            method = "replaceState";
        }
        // we need to resolve the as value using rewrites for dynamic SSG
        // pages to allow building the data URL correctly
        let resolvedAs = as;
        // url and as should always be prefixed with basePath by this
        // point by either next/link or router.push/replace so strip the
        // basePath from the pathname to match the pages dir 1-to-1
        pathname = pathname ? (0, _removetrailingslash.removeTrailingSlash)((0, _removebasepath.removeBasePath)(pathname)) : pathname;
        let route = (0, _removetrailingslash.removeTrailingSlash)(pathname);
        const parsedAsPathname = as.startsWith("/") && (0, _parserelativeurl.parseRelativeUrl)(as).pathname;
        const isMiddlewareRewrite = !!(parsedAsPathname && route !== parsedAsPathname && (!(0, _isdynamic.isDynamicRoute)(route) || !(0, _routematcher.getRouteMatcher)((0, _routeregex.getRouteRegex)(route))(parsedAsPathname)));
        // we don't attempt resolve asPath when we need to execute
        // middleware as the resolving will occur server-side
        const isMiddlewareMatch = !options.shallow && await matchesMiddleware({
            asPath: as,
            locale: nextState.locale,
            router: this
        });
        if (isQueryUpdating && isMiddlewareMatch) {
            shouldResolveHref = false;
        }
        if (shouldResolveHref && pathname !== "/_error") {
            options._shouldResolveHref = true;
            if (false) {} else {
                parsed.pathname = resolveDynamicRoute(pathname, pages);
                if (parsed.pathname !== pathname) {
                    pathname = parsed.pathname;
                    parsed.pathname = (0, _addbasepath.addBasePath)(pathname);
                    if (!isMiddlewareMatch) {
                        url = (0, _formaturl.formatWithValidation)(parsed);
                    }
                }
            }
        }
        if (!(0, _islocalurl.isLocalURL)(as)) {
            if (false) {}
            handleHardNavigation({
                url: as,
                router: this
            });
            return false;
        }
        resolvedAs = (0, _removelocale.removeLocale)((0, _removebasepath.removeBasePath)(resolvedAs), nextState.locale);
        route = (0, _removetrailingslash.removeTrailingSlash)(pathname);
        let routeMatch = false;
        if ((0, _isdynamic.isDynamicRoute)(route)) {
            const parsedAs = (0, _parserelativeurl.parseRelativeUrl)(resolvedAs);
            const asPathname = parsedAs.pathname;
            const routeRegex = (0, _routeregex.getRouteRegex)(route);
            routeMatch = (0, _routematcher.getRouteMatcher)(routeRegex)(asPathname);
            const shouldInterpolate = route === asPathname;
            const interpolatedAs = shouldInterpolate ? (0, _interpolateas.interpolateAs)(route, asPathname, query) : {};
            if (!routeMatch || shouldInterpolate && !interpolatedAs.result) {
                const missingParams = Object.keys(routeRegex.groups).filter((param)=>!query[param] && !routeRegex.groups[param].optional);
                if (missingParams.length > 0 && !isMiddlewareMatch) {
                    if (false) {}
                    throw new Error((shouldInterpolate ? "The provided `href` (" + url + ") value is missing query values (" + missingParams.join(", ") + ") to be interpolated properly. " : "The provided `as` value (" + asPathname + ") is incompatible with the `href` value (" + route + "). ") + ("Read more: https://nextjs.org/docs/messages/" + (shouldInterpolate ? "href-interpolation-failed" : "incompatible-href-as")));
                }
            } else if (shouldInterpolate) {
                as = (0, _formaturl.formatWithValidation)(Object.assign({}, parsedAs, {
                    pathname: interpolatedAs.result,
                    query: (0, _omit.omit)(query, interpolatedAs.params)
                }));
            } else {
                // Merge params into `query`, overwriting any specified in search
                Object.assign(query, routeMatch);
            }
        }
        if (!isQueryUpdating) {
            Router.events.emit("routeChangeStart", as, routeProps);
        }
        const isErrorRoute = this.pathname === "/404" || this.pathname === "/_error";
        try {
            var _self___NEXT_DATA___props, _self___NEXT_DATA___props_pageProps, _routeInfo_props;
            let routeInfo = await this.getRouteInfo({
                route,
                pathname,
                query,
                as,
                resolvedAs,
                routeProps,
                locale: nextState.locale,
                isPreview: nextState.isPreview,
                hasMiddleware: isMiddlewareMatch,
                unstable_skipClientCache: options.unstable_skipClientCache,
                isQueryUpdating: isQueryUpdating && !this.isFallback,
                isMiddlewareRewrite
            });
            if (!isQueryUpdating && !options.shallow) {
                await this._bfl(as, "resolvedAs" in routeInfo ? routeInfo.resolvedAs : undefined, nextState.locale);
            }
            if ("route" in routeInfo && isMiddlewareMatch) {
                pathname = routeInfo.route || route;
                route = pathname;
                if (!routeProps.shallow) {
                    query = Object.assign({}, routeInfo.query || {}, query);
                }
                const cleanedParsedPathname = (0, _hasbasepath.hasBasePath)(parsed.pathname) ? (0, _removebasepath.removeBasePath)(parsed.pathname) : parsed.pathname;
                if (routeMatch && pathname !== cleanedParsedPathname) {
                    Object.keys(routeMatch).forEach((key)=>{
                        if (routeMatch && query[key] === routeMatch[key]) {
                            delete query[key];
                        }
                    });
                }
                if ((0, _isdynamic.isDynamicRoute)(pathname)) {
                    const prefixedAs = !routeProps.shallow && routeInfo.resolvedAs ? routeInfo.resolvedAs : (0, _addbasepath.addBasePath)((0, _addlocale.addLocale)(new URL(as, location.href).pathname, nextState.locale), true);
                    let rewriteAs = prefixedAs;
                    if ((0, _hasbasepath.hasBasePath)(rewriteAs)) {
                        rewriteAs = (0, _removebasepath.removeBasePath)(rewriteAs);
                    }
                    if (false) {}
                    const routeRegex = (0, _routeregex.getRouteRegex)(pathname);
                    const curRouteMatch = (0, _routematcher.getRouteMatcher)(routeRegex)(new URL(rewriteAs, location.href).pathname);
                    if (curRouteMatch) {
                        Object.assign(query, curRouteMatch);
                    }
                }
            }
            // If the routeInfo brings a redirect we simply apply it.
            if ("type" in routeInfo) {
                if (routeInfo.type === "redirect-internal") {
                    return this.change(method, routeInfo.newUrl, routeInfo.newAs, options);
                } else {
                    handleHardNavigation({
                        url: routeInfo.destination,
                        router: this
                    });
                    return new Promise(()=>{});
                }
            }
            const component = routeInfo.Component;
            if (component && component.unstable_scriptLoader) {
                const scripts = [].concat(component.unstable_scriptLoader());
                scripts.forEach((script)=>{
                    (0, _script.handleClientScriptLoad)(script.props);
                });
            }
            // handle redirect on client-transition
            if ((routeInfo.__N_SSG || routeInfo.__N_SSP) && routeInfo.props) {
                if (routeInfo.props.pageProps && routeInfo.props.pageProps.__N_REDIRECT) {
                    // Use the destination from redirect without adding locale
                    options.locale = false;
                    const destination = routeInfo.props.pageProps.__N_REDIRECT;
                    // check if destination is internal (resolves to a page) and attempt
                    // client-navigation if it is falling back to hard navigation if
                    // it's not
                    if (destination.startsWith("/") && routeInfo.props.pageProps.__N_REDIRECT_BASE_PATH !== false) {
                        const parsedHref = (0, _parserelativeurl.parseRelativeUrl)(destination);
                        parsedHref.pathname = resolveDynamicRoute(parsedHref.pathname, pages);
                        const { url: newUrl, as: newAs } = prepareUrlAs(this, destination, destination);
                        return this.change(method, newUrl, newAs, options);
                    }
                    handleHardNavigation({
                        url: destination,
                        router: this
                    });
                    return new Promise(()=>{});
                }
                nextState.isPreview = !!routeInfo.props.__N_PREVIEW;
                // handle SSG data 404
                if (routeInfo.props.notFound === SSG_DATA_NOT_FOUND) {
                    let notFoundRoute;
                    try {
                        await this.fetchComponent("/404");
                        notFoundRoute = "/404";
                    } catch (_) {
                        notFoundRoute = "/_error";
                    }
                    routeInfo = await this.getRouteInfo({
                        route: notFoundRoute,
                        pathname: notFoundRoute,
                        query,
                        as,
                        resolvedAs,
                        routeProps: {
                            shallow: false
                        },
                        locale: nextState.locale,
                        isPreview: nextState.isPreview,
                        isNotFound: true
                    });
                    if ("type" in routeInfo) {
                        throw new Error("Unexpected middleware effect on /404");
                    }
                }
            }
            if (isQueryUpdating && this.pathname === "/_error" && ((_self___NEXT_DATA___props = self.__NEXT_DATA__.props) == null ? void 0 : (_self___NEXT_DATA___props_pageProps = _self___NEXT_DATA___props.pageProps) == null ? void 0 : _self___NEXT_DATA___props_pageProps.statusCode) === 500 && ((_routeInfo_props = routeInfo.props) == null ? void 0 : _routeInfo_props.pageProps)) {
                // ensure statusCode is still correct for static 500 page
                // when updating query information
                routeInfo.props.pageProps.statusCode = 500;
            }
            var _routeInfo_route;
            // shallow routing is only allowed for same page URL changes.
            const isValidShallowRoute = options.shallow && nextState.route === ((_routeInfo_route = routeInfo.route) != null ? _routeInfo_route : route);
            var _options_scroll;
            const shouldScroll = (_options_scroll = options.scroll) != null ? _options_scroll : !isQueryUpdating && !isValidShallowRoute;
            const resetScroll = shouldScroll ? {
                x: 0,
                y: 0
            } : null;
            const upcomingScrollState = forcedScroll != null ? forcedScroll : resetScroll;
            // the new state that the router gonna set
            const upcomingRouterState = {
                ...nextState,
                route,
                pathname,
                query,
                asPath: cleanedAs,
                isFallback: false
            };
            // When the page being rendered is the 404 page, we should only update the
            // query parameters. Route changes here might add the basePath when it
            // wasn't originally present. This is also why this block is before the
            // below `changeState` call which updates the browser's history (changing
            // the URL).
            if (isQueryUpdating && isErrorRoute) {
                var _self___NEXT_DATA___props1, _self___NEXT_DATA___props_pageProps1, _routeInfo_props1;
                routeInfo = await this.getRouteInfo({
                    route: this.pathname,
                    pathname: this.pathname,
                    query,
                    as,
                    resolvedAs,
                    routeProps: {
                        shallow: false
                    },
                    locale: nextState.locale,
                    isPreview: nextState.isPreview,
                    isQueryUpdating: isQueryUpdating && !this.isFallback
                });
                if ("type" in routeInfo) {
                    throw new Error("Unexpected middleware effect on " + this.pathname);
                }
                if (this.pathname === "/_error" && ((_self___NEXT_DATA___props1 = self.__NEXT_DATA__.props) == null ? void 0 : (_self___NEXT_DATA___props_pageProps1 = _self___NEXT_DATA___props1.pageProps) == null ? void 0 : _self___NEXT_DATA___props_pageProps1.statusCode) === 500 && ((_routeInfo_props1 = routeInfo.props) == null ? void 0 : _routeInfo_props1.pageProps)) {
                    // ensure statusCode is still correct for static 500 page
                    // when updating query information
                    routeInfo.props.pageProps.statusCode = 500;
                }
                try {
                    await this.set(upcomingRouterState, routeInfo, upcomingScrollState);
                } catch (err) {
                    if ((0, _iserror.default)(err) && err.cancelled) {
                        Router.events.emit("routeChangeError", err, cleanedAs, routeProps);
                    }
                    throw err;
                }
                return true;
            }
            Router.events.emit("beforeHistoryChange", as, routeProps);
            this.changeState(method, url, as, options);
            // for query updates we can skip it if the state is unchanged and we don't
            // need to scroll
            // https://github.com/vercel/next.js/issues/37139
            const canSkipUpdating = isQueryUpdating && !upcomingScrollState && !readyStateChange && !localeChange && (0, _comparestates.compareRouterStates)(upcomingRouterState, this.state);
            if (!canSkipUpdating) {
                try {
                    await this.set(upcomingRouterState, routeInfo, upcomingScrollState);
                } catch (e) {
                    if (e.cancelled) routeInfo.error = routeInfo.error || e;
                    else throw e;
                }
                if (routeInfo.error) {
                    if (!isQueryUpdating) {
                        Router.events.emit("routeChangeError", routeInfo.error, cleanedAs, routeProps);
                    }
                    throw routeInfo.error;
                }
                if (false) {}
                if (!isQueryUpdating) {
                    Router.events.emit("routeChangeComplete", as, routeProps);
                }
                // A hash mark # is the optional last part of a URL
                const hashRegex = /#.+$/;
                if (shouldScroll && hashRegex.test(as)) {
                    this.scrollToHash(as);
                }
            }
            return true;
        } catch (err) {
            if ((0, _iserror.default)(err) && err.cancelled) {
                return false;
            }
            throw err;
        }
    }
    changeState(method, url, as, options) {
        if (options === void 0) options = {};
        if (false) {}
        if (method !== "pushState" || (0, _utils.getURL)() !== as) {
            this._shallow = options.shallow;
            window.history[method]({
                url,
                as,
                options,
                __N: true,
                key: this._key = method !== "pushState" ? this._key : createKey()
            }, // Passing the empty string here should be safe against future changes to the method.
            // https://developer.mozilla.org/en-US/docs/Web/API/History/replaceState
            "", as);
        }
    }
    async handleRouteInfoError(err, pathname, query, as, routeProps, loadErrorFail) {
        console.error(err);
        if (err.cancelled) {
            // bubble up cancellation errors
            throw err;
        }
        if ((0, _routeloader.isAssetError)(err) || loadErrorFail) {
            Router.events.emit("routeChangeError", err, as, routeProps);
            // If we can't load the page it could be one of following reasons
            //  1. Page doesn't exists
            //  2. Page does exist in a different zone
            //  3. Internal error while loading the page
            // So, doing a hard reload is the proper way to deal with this.
            handleHardNavigation({
                url: as,
                router: this
            });
            // Changing the URL doesn't block executing the current code path.
            // So let's throw a cancellation error stop the routing logic.
            throw buildCancellationError();
        }
        try {
            let props;
            const { page: Component, styleSheets } = await this.fetchComponent("/_error");
            const routeInfo = {
                props,
                Component,
                styleSheets,
                err,
                error: err
            };
            if (!routeInfo.props) {
                try {
                    routeInfo.props = await this.getInitialProps(Component, {
                        err,
                        pathname,
                        query
                    });
                } catch (gipErr) {
                    console.error("Error in error page `getInitialProps`: ", gipErr);
                    routeInfo.props = {};
                }
            }
            return routeInfo;
        } catch (routeInfoErr) {
            return this.handleRouteInfoError((0, _iserror.default)(routeInfoErr) ? routeInfoErr : new Error(routeInfoErr + ""), pathname, query, as, routeProps, true);
        }
    }
    async getRouteInfo(param) {
        let { route: requestedRoute, pathname, query, as, resolvedAs, routeProps, locale, hasMiddleware, isPreview, unstable_skipClientCache, isQueryUpdating, isMiddlewareRewrite, isNotFound } = param;
        /**
     * This `route` binding can change if there's a rewrite
     * so we keep a reference to the original requested route
     * so we can store the cache for it and avoid re-requesting every time
     * for shallow routing purposes.
     */ let route = requestedRoute;
        try {
            var _data_effect, _data_effect1, _data_effect2, _data_response;
            const handleCancelled = getCancelledHandler({
                route,
                router: this
            });
            let existingInfo = this.components[route];
            if (routeProps.shallow && existingInfo && this.route === route) {
                return existingInfo;
            }
            if (hasMiddleware) {
                existingInfo = undefined;
            }
            let cachedRouteInfo = existingInfo && !("initial" in existingInfo) && "production" !== "development" ? existingInfo : undefined;
            const isBackground = isQueryUpdating;
            const fetchNextDataParams = {
                dataHref: this.pageLoader.getDataHref({
                    href: (0, _formaturl.formatWithValidation)({
                        pathname,
                        query
                    }),
                    skipInterpolation: true,
                    asPath: isNotFound ? "/404" : resolvedAs,
                    locale
                }),
                hasMiddleware: true,
                isServerRender: this.isSsr,
                parseJSON: true,
                inflightCache: isBackground ? this.sbc : this.sdc,
                persistCache: !isPreview,
                isPrefetch: false,
                unstable_skipClientCache,
                isBackground
            };
            let data = isQueryUpdating && !isMiddlewareRewrite ? null : await withMiddlewareEffects({
                fetchData: ()=>fetchNextData(fetchNextDataParams),
                asPath: isNotFound ? "/404" : resolvedAs,
                locale: locale,
                router: this
            }).catch((err)=>{
                // we don't hard error during query updating
                // as it's un-necessary and doesn't need to be fatal
                // unless it is a fallback route and the props can't
                // be loaded
                if (isQueryUpdating) {
                    return null;
                }
                throw err;
            });
            // when rendering error routes we don't apply middleware
            // effects
            if (data && (pathname === "/_error" || pathname === "/404")) {
                data.effect = undefined;
            }
            if (isQueryUpdating) {
                if (!data) {
                    data = {
                        json: self.__NEXT_DATA__.props
                    };
                } else {
                    data.json = self.__NEXT_DATA__.props;
                }
            }
            handleCancelled();
            if ((data == null ? void 0 : (_data_effect = data.effect) == null ? void 0 : _data_effect.type) === "redirect-internal" || (data == null ? void 0 : (_data_effect1 = data.effect) == null ? void 0 : _data_effect1.type) === "redirect-external") {
                return data.effect;
            }
            if ((data == null ? void 0 : (_data_effect2 = data.effect) == null ? void 0 : _data_effect2.type) === "rewrite") {
                const resolvedRoute = (0, _removetrailingslash.removeTrailingSlash)(data.effect.resolvedHref);
                const pages = await this.pageLoader.getPageList();
                // during query updating the page must match although during
                // client-transition a redirect that doesn't match a page
                // can be returned and this should trigger a hard navigation
                // which is valid for incremental migration
                if (!isQueryUpdating || pages.includes(resolvedRoute)) {
                    route = resolvedRoute;
                    pathname = data.effect.resolvedHref;
                    query = {
                        ...query,
                        ...data.effect.parsedAs.query
                    };
                    resolvedAs = (0, _removebasepath.removeBasePath)((0, _normalizelocalepath.normalizeLocalePath)(data.effect.parsedAs.pathname, this.locales).pathname);
                    // Check again the cache with the new destination.
                    existingInfo = this.components[route];
                    if (routeProps.shallow && existingInfo && this.route === route && !hasMiddleware) {
                        // If we have a match with the current route due to rewrite,
                        // we can copy the existing information to the rewritten one.
                        // Then, we return the information along with the matched route.
                        return {
                            ...existingInfo,
                            route
                        };
                    }
                }
            }
            if ((0, _isapiroute.isAPIRoute)(route)) {
                handleHardNavigation({
                    url: as,
                    router: this
                });
                return new Promise(()=>{});
            }
            const routeInfo = cachedRouteInfo || await this.fetchComponent(route).then((res)=>({
                    Component: res.page,
                    styleSheets: res.styleSheets,
                    __N_SSG: res.mod.__N_SSG,
                    __N_SSP: res.mod.__N_SSP
                }));
            if (false) {}
            const wasBailedPrefetch = data == null ? void 0 : (_data_response = data.response) == null ? void 0 : _data_response.headers.get("x-middleware-skip");
            const shouldFetchData = routeInfo.__N_SSG || routeInfo.__N_SSP;
            // For non-SSG prefetches that bailed before sending data
            // we clear the cache to fetch full response
            if (wasBailedPrefetch && (data == null ? void 0 : data.dataHref)) {
                delete this.sdc[data.dataHref];
            }
            const { props, cacheKey } = await this._getData(async ()=>{
                if (shouldFetchData) {
                    if ((data == null ? void 0 : data.json) && !wasBailedPrefetch) {
                        return {
                            cacheKey: data.cacheKey,
                            props: data.json
                        };
                    }
                    const dataHref = (data == null ? void 0 : data.dataHref) ? data.dataHref : this.pageLoader.getDataHref({
                        href: (0, _formaturl.formatWithValidation)({
                            pathname,
                            query
                        }),
                        asPath: resolvedAs,
                        locale
                    });
                    const fetched = await fetchNextData({
                        dataHref,
                        isServerRender: this.isSsr,
                        parseJSON: true,
                        inflightCache: wasBailedPrefetch ? {} : this.sdc,
                        persistCache: !isPreview,
                        isPrefetch: false,
                        unstable_skipClientCache
                    });
                    return {
                        cacheKey: fetched.cacheKey,
                        props: fetched.json || {}
                    };
                }
                return {
                    headers: {},
                    props: await this.getInitialProps(routeInfo.Component, {
                        pathname,
                        query,
                        asPath: as,
                        locale,
                        locales: this.locales,
                        defaultLocale: this.defaultLocale
                    })
                };
            });
            // Only bust the data cache for SSP routes although
            // middleware can skip cache per request with
            // x-middleware-cache: no-cache as well
            if (routeInfo.__N_SSP && fetchNextDataParams.dataHref && cacheKey) {
                delete this.sdc[cacheKey];
            }
            // we kick off a HEAD request in the background
            // when a non-prefetch request is made to signal revalidation
            if (!this.isPreview && routeInfo.__N_SSG && "production" !== "development" && !isQueryUpdating) {
                fetchNextData(Object.assign({}, fetchNextDataParams, {
                    isBackground: true,
                    persistCache: false,
                    inflightCache: this.sbc
                })).catch(()=>{});
            }
            props.pageProps = Object.assign({}, props.pageProps);
            routeInfo.props = props;
            routeInfo.route = route;
            routeInfo.query = query;
            routeInfo.resolvedAs = resolvedAs;
            this.components[route] = routeInfo;
            return routeInfo;
        } catch (err) {
            return this.handleRouteInfoError((0, _iserror.getProperError)(err), pathname, query, as, routeProps);
        }
    }
    set(state, data, resetScroll) {
        this.state = state;
        return this.sub(data, this.components["/_app"].Component, resetScroll);
    }
    /**
   * Callback to execute before replacing router state
   * @param cb callback to be executed
   */ beforePopState(cb) {
        this._bps = cb;
    }
    onlyAHashChange(as) {
        if (!this.asPath) return false;
        const [oldUrlNoHash, oldHash] = this.asPath.split("#");
        const [newUrlNoHash, newHash] = as.split("#");
        // Makes sure we scroll to the provided hash if the url/hash are the same
        if (newHash && oldUrlNoHash === newUrlNoHash && oldHash === newHash) {
            return true;
        }
        // If the urls are change, there's more than a hash change
        if (oldUrlNoHash !== newUrlNoHash) {
            return false;
        }
        // If the hash has changed, then it's a hash only change.
        // This check is necessary to handle both the enter and
        // leave hash === '' cases. The identity case falls through
        // and is treated as a next reload.
        return oldHash !== newHash;
    }
    scrollToHash(as) {
        const [, hash = ""] = as.split("#");
        (0, _handlesmoothscroll.handleSmoothScroll)(()=>{
            // Scroll to top if the hash is just `#` with no value or `#top`
            // To mirror browsers
            if (hash === "" || hash === "top") {
                window.scrollTo(0, 0);
                return;
            }
            // Decode hash to make non-latin anchor works.
            const rawHash = decodeURIComponent(hash);
            // First we check if the element by id is found
            const idEl = document.getElementById(rawHash);
            if (idEl) {
                idEl.scrollIntoView();
                return;
            }
            // If there's no element with the id, we check the `name` property
            // To mirror browsers
            const nameEl = document.getElementsByName(rawHash)[0];
            if (nameEl) {
                nameEl.scrollIntoView();
            }
        }, {
            onlyHashChange: this.onlyAHashChange(as)
        });
    }
    urlIsNew(asPath) {
        return this.asPath !== asPath;
    }
    /**
   * Prefetch page code, you may wait for the data during page rendering.
   * This feature only works in production!
   * @param url the href of prefetched page
   * @param asPath the as path of the prefetched page
   */ async prefetch(url, asPath, options) {
        if (asPath === void 0) asPath = url;
        if (options === void 0) options = {};
        // Prefetch is not supported in development mode because it would trigger on-demand-entries
        if (false) {}
        if (false) {}
        let parsed = (0, _parserelativeurl.parseRelativeUrl)(url);
        const urlPathname = parsed.pathname;
        let { pathname, query } = parsed;
        const originalPathname = pathname;
        if (false) {}
        const pages = await this.pageLoader.getPageList();
        let resolvedAs = asPath;
        const locale = typeof options.locale !== "undefined" ? options.locale || undefined : this.locale;
        const isMiddlewareMatch = await matchesMiddleware({
            asPath: asPath,
            locale: locale,
            router: this
        });
        if (false) {}
        parsed.pathname = resolveDynamicRoute(parsed.pathname, pages);
        if ((0, _isdynamic.isDynamicRoute)(parsed.pathname)) {
            pathname = parsed.pathname;
            parsed.pathname = pathname;
            Object.assign(query, (0, _routematcher.getRouteMatcher)((0, _routeregex.getRouteRegex)(parsed.pathname))((0, _parsepath.parsePath)(asPath).pathname) || {});
            if (!isMiddlewareMatch) {
                url = (0, _formaturl.formatWithValidation)(parsed);
            }
        }
        const data =  false ? 0 : await withMiddlewareEffects({
            fetchData: ()=>fetchNextData({
                    dataHref: this.pageLoader.getDataHref({
                        href: (0, _formaturl.formatWithValidation)({
                            pathname: originalPathname,
                            query
                        }),
                        skipInterpolation: true,
                        asPath: resolvedAs,
                        locale
                    }),
                    hasMiddleware: true,
                    isServerRender: this.isSsr,
                    parseJSON: true,
                    inflightCache: this.sdc,
                    persistCache: !this.isPreview,
                    isPrefetch: true
                }),
            asPath: asPath,
            locale: locale,
            router: this
        });
        /**
     * If there was a rewrite we apply the effects of the rewrite on the
     * current parameters for the prefetch.
     */ if ((data == null ? void 0 : data.effect.type) === "rewrite") {
            parsed.pathname = data.effect.resolvedHref;
            pathname = data.effect.resolvedHref;
            query = {
                ...query,
                ...data.effect.parsedAs.query
            };
            resolvedAs = data.effect.parsedAs.pathname;
            url = (0, _formaturl.formatWithValidation)(parsed);
        }
        /**
     * If there is a redirect to an external destination then we don't have
     * to prefetch content as it will be unused.
     */ if ((data == null ? void 0 : data.effect.type) === "redirect-external") {
            return;
        }
        const route = (0, _removetrailingslash.removeTrailingSlash)(pathname);
        if (await this._bfl(asPath, resolvedAs, options.locale, true)) {
            this.components[urlPathname] = {
                __appRouter: true
            };
        }
        await Promise.all([
            this.pageLoader._isSsg(route).then((isSsg)=>{
                return isSsg ? fetchNextData({
                    dataHref: (data == null ? void 0 : data.json) ? data == null ? void 0 : data.dataHref : this.pageLoader.getDataHref({
                        href: url,
                        asPath: resolvedAs,
                        locale: locale
                    }),
                    isServerRender: false,
                    parseJSON: true,
                    inflightCache: this.sdc,
                    persistCache: !this.isPreview,
                    isPrefetch: true,
                    unstable_skipClientCache: options.unstable_skipClientCache || options.priority && !!true
                }).then(()=>false).catch(()=>false) : false;
            }),
            this.pageLoader[options.priority ? "loadPage" : "prefetch"](route)
        ]);
    }
    async fetchComponent(route) {
        const handleCancelled = getCancelledHandler({
            route,
            router: this
        });
        try {
            const componentResult = await this.pageLoader.loadPage(route);
            handleCancelled();
            return componentResult;
        } catch (err) {
            handleCancelled();
            throw err;
        }
    }
    _getData(fn) {
        let cancelled = false;
        const cancel = ()=>{
            cancelled = true;
        };
        this.clc = cancel;
        return fn().then((data)=>{
            if (cancel === this.clc) {
                this.clc = null;
            }
            if (cancelled) {
                const err = new Error("Loading initial props cancelled");
                err.cancelled = true;
                throw err;
            }
            return data;
        });
    }
    _getFlightData(dataHref) {
        // Do not cache RSC flight response since it's not a static resource
        return fetchNextData({
            dataHref,
            isServerRender: true,
            parseJSON: false,
            inflightCache: this.sdc,
            persistCache: false,
            isPrefetch: false
        }).then((param)=>{
            let { text } = param;
            return {
                data: text
            };
        });
    }
    getInitialProps(Component, ctx) {
        const { Component: App } = this.components["/_app"];
        const AppTree = this._wrapApp(App);
        ctx.AppTree = AppTree;
        return (0, _utils.loadGetInitialProps)(App, {
            AppTree,
            Component,
            router: this,
            ctx
        });
    }
    get route() {
        return this.state.route;
    }
    get pathname() {
        return this.state.pathname;
    }
    get query() {
        return this.state.query;
    }
    get asPath() {
        return this.state.asPath;
    }
    get locale() {
        return this.state.locale;
    }
    get isFallback() {
        return this.state.isFallback;
    }
    get isPreview() {
        return this.state.isPreview;
    }
    constructor(pathname, query, as, { initialProps, pageLoader, App, wrapApp, Component, err, subscription, isFallback, locale, locales, defaultLocale, domainLocales, isPreview }){
        // Server Data Cache (full data requests)
        this.sdc = {};
        // Server Background Cache (HEAD requests)
        this.sbc = {};
        this.isFirstPopStateEvent = true;
        this._key = createKey();
        this.onPopState = (e)=>{
            const { isFirstPopStateEvent } = this;
            this.isFirstPopStateEvent = false;
            const state = e.state;
            if (!state) {
                // We get state as undefined for two reasons.
                //  1. With older safari (< 8) and older chrome (< 34)
                //  2. When the URL changed with #
                //
                // In the both cases, we don't need to proceed and change the route.
                // (as it's already changed)
                // But we can simply replace the state with the new changes.
                // Actually, for (1) we don't need to nothing. But it's hard to detect that event.
                // So, doing the following for (1) does no harm.
                const { pathname, query } = this;
                this.changeState("replaceState", (0, _formaturl.formatWithValidation)({
                    pathname: (0, _addbasepath.addBasePath)(pathname),
                    query
                }), (0, _utils.getURL)());
                return;
            }
            // __NA is used to identify if the history entry can be handled by the app-router.
            if (state.__NA) {
                window.location.reload();
                return;
            }
            if (!state.__N) {
                return;
            }
            // Safari fires popstateevent when reopening the browser.
            if (isFirstPopStateEvent && this.locale === state.options.locale && state.as === this.asPath) {
                return;
            }
            let forcedScroll;
            const { url, as, options, key } = state;
            if (false) {}
            this._key = key;
            const { pathname } = (0, _parserelativeurl.parseRelativeUrl)(url);
            // Make sure we don't re-render on initial load,
            // can be caused by navigating back from an external site
            if (this.isSsr && as === (0, _addbasepath.addBasePath)(this.asPath) && pathname === (0, _addbasepath.addBasePath)(this.pathname)) {
                return;
            }
            // If the downstream application returns falsy, return.
            // They will then be responsible for handling the event.
            if (this._bps && !this._bps(state)) {
                return;
            }
            this.change("replaceState", url, as, Object.assign({}, options, {
                shallow: options.shallow && this._shallow,
                locale: options.locale || this.defaultLocale,
                // @ts-ignore internal value not exposed on types
                _h: 0
            }), forcedScroll);
        };
        // represents the current component key
        const route = (0, _removetrailingslash.removeTrailingSlash)(pathname);
        // set up the component cache (by route keys)
        this.components = {};
        // We should not keep the cache, if there's an error
        // Otherwise, this cause issues when when going back and
        // come again to the errored page.
        if (pathname !== "/_error") {
            this.components[route] = {
                Component,
                initial: true,
                props: initialProps,
                err,
                __N_SSG: initialProps && initialProps.__N_SSG,
                __N_SSP: initialProps && initialProps.__N_SSP
            };
        }
        this.components["/_app"] = {
            Component: App,
            styleSheets: []
        };
        if (true) {
            const { BloomFilter } = __webpack_require__(85353);
            const staticFilterData = {"numItems":9,"errorRate":0.01,"numBits":87,"numHashes":7,"bitArray":[1,1,1,0,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,1,1,0,0,1,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,1,0,0,0,1,0,0,1,0,1,0,0,1,0,1,1,1,1,0,0,1,0,1,1,1,1,0,1,0,1,0,0,1,1,0,0,0,0,0,1,0,0,0]};
            const dynamicFilterData = {"numItems":3,"errorRate":0.01,"numBits":29,"numHashes":7,"bitArray":[1,0,1,0,0,0,1,0,1,0,0,0,1,1,0,0,0,1,1,1,0,0,0,1,1,1,0,1,1]};
            if (staticFilterData == null ? void 0 : staticFilterData.numHashes) {
                this._bfl_s = new BloomFilter(staticFilterData.numItems, staticFilterData.errorRate);
                this._bfl_s.import(staticFilterData);
            }
            if (dynamicFilterData == null ? void 0 : dynamicFilterData.numHashes) {
                this._bfl_d = new BloomFilter(dynamicFilterData.numItems, dynamicFilterData.errorRate);
                this._bfl_d.import(dynamicFilterData);
            }
        }
        // Backwards compat for Router.router.events
        // TODO: Should be remove the following major version as it was never documented
        this.events = Router.events;
        this.pageLoader = pageLoader;
        // if auto prerendered and dynamic route wait to update asPath
        // until after mount to prevent hydration mismatch
        const autoExportDynamic = (0, _isdynamic.isDynamicRoute)(pathname) && self.__NEXT_DATA__.autoExport;
        this.basePath =  false || "";
        this.sub = subscription;
        this.clc = null;
        this._wrapApp = wrapApp;
        // make sure to ignore extra popState in safari on navigating
        // back from external site
        this.isSsr = true;
        this.isLocaleDomain = false;
        this.isReady = !!(self.__NEXT_DATA__.gssp || self.__NEXT_DATA__.gip || self.__NEXT_DATA__.appGip && !self.__NEXT_DATA__.gsp || !autoExportDynamic && !self.location.search && !false);
        if (false) {}
        this.state = {
            route,
            pathname,
            query,
            asPath: autoExportDynamic ? pathname : as,
            isPreview: !!isPreview,
            locale:  false ? 0 : undefined,
            isFallback
        };
        this._initialMatchesMiddlewarePromise = Promise.resolve(false);
        if (false) {}
    }
}
(()=>{
    Router.events = (0, _mitt.default)();
})(); //# sourceMappingURL=router.js.map


/***/ }),

/***/ 54698:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ // Modified from https://github.com/facebook/react/blob/main/packages/react-server-dom-webpack/src/ReactFlightWebpackNodeRegister.js

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createProxy", ({
    enumerable: true,
    get: function() {
        return createProxy;
    }
}));
const CLIENT_REFERENCE = Symbol.for("react.client.reference");
const PROMISE_PROTOTYPE = Promise.prototype;
const deepProxyHandlers = {
    get: function(target, name, _receiver) {
        switch(name){
            // These names are read by the Flight runtime if you end up using the exports object.
            case "$$typeof":
                // These names are a little too common. We should probably have a way to
                // have the Flight runtime extract the inner target instead.
                return target.$$typeof;
            case "$$id":
                return target.$$id;
            case "$$async":
                return target.$$async;
            case "name":
                return target.name;
            case "displayName":
                return undefined;
            // We need to special case this because createElement reads it if we pass this
            // reference.
            case "defaultProps":
                return undefined;
            // Avoid this attempting to be serialized.
            case "toJSON":
                return undefined;
            case Symbol.toPrimitive.toString():
                // @ts-ignore
                return Object.prototype[Symbol.toPrimitive];
            case "Provider":
                throw new Error(`Cannot render a Client Context Provider on the Server. ` + `Instead, you can export a Client Component wrapper ` + `that itself renders a Client Context Provider.`);
            default:
                break;
        }
        const expression = String(target.name) + "." + String(name);
        throw new Error(`Cannot access ${expression} on the server. ` + "You cannot dot into a client module from a server component. " + "You can only pass the imported name through.");
    },
    set: function() {
        throw new Error("Cannot assign to a client module from a server module.");
    }
};
const proxyHandlers = {
    get: function(target, name, _receiver) {
        switch(name){
            // These names are read by the Flight runtime if you end up using the exports object.
            case "$$typeof":
                return target.$$typeof;
            case "$$id":
                return target.$$id;
            case "$$async":
                return target.$$async;
            case "name":
                return target.name;
            // We need to special case this because createElement reads it if we pass this
            // reference.
            case "defaultProps":
                return undefined;
            // Avoid this attempting to be serialized.
            case "toJSON":
                return undefined;
            case Symbol.toPrimitive.toString():
                // @ts-ignore
                return Object.prototype[Symbol.toPrimitive];
            case "__esModule":
                // Something is conditionally checking which export to use. We'll pretend to be
                // an ESM compat module but then we'll check again on the client.
                const moduleId = target.$$id;
                target.default = Object.defineProperties(function() {
                    throw new Error(`Attempted to call the default export of ${moduleId} from the server ` + `but it's on the client. It's not possible to invoke a client function from ` + `the server, it can only be rendered as a Component or passed to props of a ` + `Client Component.`);
                }, {
                    $$typeof: {
                        value: CLIENT_REFERENCE
                    },
                    // This a placeholder value that tells the client to conditionally use the
                    // whole object or just the default export.
                    $$id: {
                        value: target.$$id + "#"
                    },
                    $$async: {
                        value: target.$$async
                    }
                });
                return true;
            case "then":
                if (target.then) {
                    // Use a cached value
                    return target.then;
                }
                if (!target.$$async) {
                    // If this module is expected to return a Promise (such as an AsyncModule) then
                    // we should resolve that with a client reference that unwraps the Promise on
                    // the client.
                    const clientReference = Object.defineProperties({}, {
                        $$typeof: {
                            value: CLIENT_REFERENCE
                        },
                        $$id: {
                            value: target.$$id
                        },
                        $$async: {
                            value: true
                        }
                    });
                    const proxy = new Proxy(clientReference, proxyHandlers);
                    // Treat this as a resolved Promise for React's use()
                    target.status = "fulfilled";
                    target.value = proxy;
                    const then = target.then = Object.defineProperties(function then(resolve, _reject) {
                        // Expose to React.
                        return Promise.resolve(resolve(proxy));
                    }, // export then we should treat it as a reference to that name.
                    {
                        $$typeof: {
                            value: CLIENT_REFERENCE
                        },
                        $$id: {
                            value: target.$$id
                        },
                        $$async: {
                            value: false
                        }
                    });
                    return then;
                } else {
                    // Since typeof .then === 'function' is a feature test we'd continue recursing
                    // indefinitely if we return a function. Instead, we return an object reference
                    // if we check further.
                    return undefined;
                }
            default:
                break;
        }
        let cachedReference = target[name];
        if (!cachedReference) {
            const reference = Object.defineProperties(function() {
                throw new Error(`Attempted to call ${String(name)}() from the server but ${String(name)} is on the client. ` + `It's not possible to invoke a client function from the server, it can ` + `only be rendered as a Component or passed to props of a Client Component.`);
            }, {
                $$typeof: {
                    value: CLIENT_REFERENCE
                },
                $$id: {
                    value: target.$$id + "#" + name
                },
                $$async: {
                    value: target.$$async
                }
            });
            cachedReference = target[name] = new Proxy(reference, deepProxyHandlers);
        }
        return cachedReference;
    },
    getPrototypeOf (_target) {
        // Pretend to be a Promise in case anyone asks.
        return PROMISE_PROTOTYPE;
    },
    set: function() {
        throw new Error("Cannot assign to a client module from a server module.");
    }
};
function createProxy(moduleId) {
    const clientReference = Object.defineProperties({}, {
        $$typeof: {
            value: CLIENT_REFERENCE
        },
        // Represents the whole Module object instead of a particular import.
        $$id: {
            value: moduleId
        },
        $$async: {
            value: false
        }
    });
    return new Proxy(clientReference, proxyHandlers);
} //# sourceMappingURL=module-proxy.js.map


/***/ }),

/***/ 10139:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
const { createProxy } = __webpack_require__(54698);
module.exports = createProxy("/Users/viandwi24/projects/learn/hatofit/node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/dist/client/components/app-router.js");
 //# sourceMappingURL=app-router.js.map


/***/ }),

/***/ 59505:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
const { createProxy } = __webpack_require__(54698);
module.exports = createProxy("/Users/viandwi24/projects/learn/hatofit/node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/dist/client/components/error-boundary.js");
 //# sourceMappingURL=error-boundary.js.map


/***/ }),

/***/ 49445:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
const { createProxy } = __webpack_require__(54698);
module.exports = createProxy("/Users/viandwi24/projects/learn/hatofit/node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/dist/client/components/layout-router.js");
 //# sourceMappingURL=layout-router.js.map


/***/ }),

/***/ 77951:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
const { createProxy } = __webpack_require__(54698);
module.exports = createProxy("/Users/viandwi24/projects/learn/hatofit/node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/dist/client/components/not-found-boundary.js");
 //# sourceMappingURL=not-found-boundary.js.map


/***/ }),

/***/ 760:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "default", ({
    enumerable: true,
    get: function() {
        return NotFound;
    }
}));
const _interop_require_default = __webpack_require__(34088);
const _react = /*#__PURE__*/ _interop_require_default._(__webpack_require__(42477));
const styles = {
    error: {
        // https://github.com/sindresorhus/modern-normalize/blob/main/modern-normalize.css#L38-L52
        fontFamily: 'system-ui,"Segoe UI",Roboto,Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji"',
        height: "100vh",
        textAlign: "center",
        display: "flex",
        flexDirection: "column",
        alignItems: "center",
        justifyContent: "center"
    },
    desc: {
        display: "inline-block"
    },
    h1: {
        display: "inline-block",
        margin: "0 20px 0 0",
        padding: "0 23px 0 0",
        fontSize: 24,
        fontWeight: 500,
        verticalAlign: "top",
        lineHeight: "49px"
    },
    h2: {
        fontSize: 14,
        fontWeight: 400,
        lineHeight: "49px",
        margin: 0
    }
};
function NotFound() {
    return /*#__PURE__*/ _react.default.createElement(_react.default.Fragment, null, /*#__PURE__*/ _react.default.createElement("title", null, "404: This page could not be found."), /*#__PURE__*/ _react.default.createElement("div", {
        style: styles.error
    }, /*#__PURE__*/ _react.default.createElement("div", null, /*#__PURE__*/ _react.default.createElement("style", {
        dangerouslySetInnerHTML: {
            /* Minified CSS from
                body { margin: 0; color: #000; background: #fff; }
                .next-error-h1 {
                  border-right: 1px solid rgba(0, 0, 0, .3);
                }

                @media (prefers-color-scheme: dark) {
                  body { color: #fff; background: #000; }
                  .next-error-h1 {
                    border-right: 1px solid rgba(255, 255, 255, .3);
                  }
                }
              */ __html: "body{color:#000;background:#fff;margin:0}.next-error-h1{border-right:1px solid rgba(0,0,0,.3)}@media (prefers-color-scheme:dark){body{color:#fff;background:#000}.next-error-h1{border-right:1px solid rgba(255,255,255,.3)}}"
        }
    }), /*#__PURE__*/ _react.default.createElement("h1", {
        className: "next-error-h1",
        style: styles.h1
    }, "404"), /*#__PURE__*/ _react.default.createElement("div", {
        style: styles.desc
    }, /*#__PURE__*/ _react.default.createElement("h2", {
        style: styles.h2
    }, "This page could not be found.")))));
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=not-found-error.js.map


/***/ }),

/***/ 35353:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
const { createProxy } = __webpack_require__(54698);
module.exports = createProxy("/Users/viandwi24/projects/learn/hatofit/node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/dist/client/components/render-from-template-context.js");
 //# sourceMappingURL=render-from-template-context.js.map


/***/ }),

/***/ 52963:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "createSearchParamsBailoutProxy", ({
    enumerable: true,
    get: function() {
        return createSearchParamsBailoutProxy;
    }
}));
const _staticgenerationbailout = __webpack_require__(88650);
function createSearchParamsBailoutProxy() {
    return new Proxy({}, {
        get (_target, prop) {
            // React adds some properties on the object when serializing for client components
            if (typeof prop === "string") {
                (0, _staticgenerationbailout.staticGenerationBailout)("searchParams." + prop);
            }
        }
    });
}
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=searchparams-bailout-proxy.js.map


/***/ }),

/***/ 96003:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/* __next_internal_client_entry_do_not_use__  cjs */ 
const { createProxy } = __webpack_require__(54698);
module.exports = createProxy("/Users/viandwi24/projects/learn/hatofit/node_modules/.pnpm/next@13.4.17_react-dom@18.2.0_react@18.2.0_sass@1.66.0/node_modules/next/dist/client/components/static-generation-searchparams-bailout-provider.js");
 //# sourceMappingURL=static-generation-searchparams-bailout-provider.js.map


/***/ }),

/***/ 75682:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
/**
 * Tokenize input string.
 */ function lexer(str) {
    var tokens = [];
    var i = 0;
    while(i < str.length){
        var char = str[i];
        if (char === "*" || char === "+" || char === "?") {
            tokens.push({
                type: "MODIFIER",
                index: i,
                value: str[i++]
            });
            continue;
        }
        if (char === "\\") {
            tokens.push({
                type: "ESCAPED_CHAR",
                index: i++,
                value: str[i++]
            });
            continue;
        }
        if (char === "{") {
            tokens.push({
                type: "OPEN",
                index: i,
                value: str[i++]
            });
            continue;
        }
        if (char === "}") {
            tokens.push({
                type: "CLOSE",
                index: i,
                value: str[i++]
            });
            continue;
        }
        if (char === ":") {
            var name = "";
            var j = i + 1;
            while(j < str.length){
                var code = str.charCodeAt(j);
                if (// `0-9`
                code >= 48 && code <= 57 || // `A-Z`
                code >= 65 && code <= 90 || // `a-z`
                code >= 97 && code <= 122 || // `_`
                code === 95) {
                    name += str[j++];
                    continue;
                }
                break;
            }
            if (!name) throw new TypeError("Missing parameter name at " + i);
            tokens.push({
                type: "NAME",
                index: i,
                value: name
            });
            i = j;
            continue;
        }
        if (char === "(") {
            var count = 1;
            var pattern = "";
            var j = i + 1;
            if (str[j] === "?") {
                throw new TypeError('Pattern cannot start with "?" at ' + j);
            }
            while(j < str.length){
                if (str[j] === "\\") {
                    pattern += str[j++] + str[j++];
                    continue;
                }
                if (str[j] === ")") {
                    count--;
                    if (count === 0) {
                        j++;
                        break;
                    }
                } else if (str[j] === "(") {
                    count++;
                    if (str[j + 1] !== "?") {
                        throw new TypeError("Capturing groups are not allowed at " + j);
                    }
                }
                pattern += str[j++];
            }
            if (count) throw new TypeError("Unbalanced pattern at " + i);
            if (!pattern) throw new TypeError("Missing pattern at " + i);
            tokens.push({
                type: "PATTERN",
                index: i,
                value: pattern
            });
            i = j;
            continue;
        }
        tokens.push({
            type: "CHAR",
            index: i,
            value: str[i++]
        });
    }
    tokens.push({
        type: "END",
        index: i,
        value: ""
    });
    return tokens;
}
/**
 * Parse a string for the raw tokens.
 */ function parse(str, options) {
    if (options === void 0) {
        options = {};
    }
    var tokens = lexer(str);
    var _a = options.prefixes, prefixes = _a === void 0 ? "./" : _a;
    var defaultPattern = "[^" + escapeString(options.delimiter || "/#?") + "]+?";
    var result = [];
    var key = 0;
    var i = 0;
    var path = "";
    var tryConsume = function(type) {
        if (i < tokens.length && tokens[i].type === type) return tokens[i++].value;
    };
    var mustConsume = function(type) {
        var value = tryConsume(type);
        if (value !== undefined) return value;
        var _a = tokens[i], nextType = _a.type, index = _a.index;
        throw new TypeError("Unexpected " + nextType + " at " + index + ", expected " + type);
    };
    var consumeText = function() {
        var result = "";
        var value;
        // tslint:disable-next-line
        while(value = tryConsume("CHAR") || tryConsume("ESCAPED_CHAR")){
            result += value;
        }
        return result;
    };
    while(i < tokens.length){
        var char = tryConsume("CHAR");
        var name = tryConsume("NAME");
        var pattern = tryConsume("PATTERN");
        if (name || pattern) {
            var prefix = char || "";
            if (prefixes.indexOf(prefix) === -1) {
                path += prefix;
                prefix = "";
            }
            if (path) {
                result.push(path);
                path = "";
            }
            result.push({
                name: name || key++,
                prefix: prefix,
                suffix: "",
                pattern: pattern || defaultPattern,
                modifier: tryConsume("MODIFIER") || ""
            });
            continue;
        }
        var value = char || tryConsume("ESCAPED_CHAR");
        if (value) {
            path += value;
            continue;
        }
        if (path) {
            result.push(path);
            path = "";
        }
        var open = tryConsume("OPEN");
        if (open) {
            var prefix = consumeText();
            var name_1 = tryConsume("NAME") || "";
            var pattern_1 = tryConsume("PATTERN") || "";
            var suffix = consumeText();
            mustConsume("CLOSE");
            result.push({
                name: name_1 || (pattern_1 ? key++ : ""),
                pattern: name_1 && !pattern_1 ? defaultPattern : pattern_1,
                prefix: prefix,
                suffix: suffix,
                modifier: tryConsume("MODIFIER") || ""
            });
            continue;
        }
        mustConsume("END");
    }
    return result;
}
exports.parse = parse;
/**
 * Compile a string to a template function for the path.
 */ function compile(str, options) {
    return tokensToFunction(parse(str, options), options);
}
exports.compile = compile;
/**
 * Expose a method for transforming tokens into the path function.
 */ function tokensToFunction(tokens, options) {
    if (options === void 0) {
        options = {};
    }
    var reFlags = flags(options);
    var _a = options.encode, encode = _a === void 0 ? function(x) {
        return x;
    } : _a, _b = options.validate, validate = _b === void 0 ? true : _b;
    // Compile all the tokens into regexps.
    var matches = tokens.map(function(token) {
        if (typeof token === "object") {
            return new RegExp("^(?:" + token.pattern + ")$", reFlags);
        }
    });
    return function(data) {
        var path = "";
        for(var i = 0; i < tokens.length; i++){
            var token = tokens[i];
            if (typeof token === "string") {
                path += token;
                continue;
            }
            var value = data ? data[token.name] : undefined;
            var optional = token.modifier === "?" || token.modifier === "*";
            var repeat = token.modifier === "*" || token.modifier === "+";
            if (Array.isArray(value)) {
                if (!repeat) {
                    throw new TypeError('Expected "' + token.name + '" to not repeat, but got an array');
                }
                if (value.length === 0) {
                    if (optional) continue;
                    throw new TypeError('Expected "' + token.name + '" to not be empty');
                }
                for(var j = 0; j < value.length; j++){
                    var segment = encode(value[j], token);
                    if (validate && !matches[i].test(segment)) {
                        throw new TypeError('Expected all "' + token.name + '" to match "' + token.pattern + '", but got "' + segment + '"');
                    }
                    path += token.prefix + segment + token.suffix;
                }
                continue;
            }
            if (typeof value === "string" || typeof value === "number") {
                var segment = encode(String(value), token);
                if (validate && !matches[i].test(segment)) {
                    throw new TypeError('Expected "' + token.name + '" to match "' + token.pattern + '", but got "' + segment + '"');
                }
                path += token.prefix + segment + token.suffix;
                continue;
            }
            if (optional) continue;
            var typeOfMessage = repeat ? "an array" : "a string";
            throw new TypeError('Expected "' + token.name + '" to be ' + typeOfMessage);
        }
        return path;
    };
}
exports.tokensToFunction = tokensToFunction;
/**
 * Create path match function from `path-to-regexp` spec.
 */ function match(str, options) {
    var keys = [];
    var re = pathToRegexp(str, keys, options);
    return regexpToFunction(re, keys, options);
}
exports.match = match;
/**
 * Create a path match function from `path-to-regexp` output.
 */ function regexpToFunction(re, keys, options) {
    if (options === void 0) {
        options = {};
    }
    var _a = options.decode, decode = _a === void 0 ? function(x) {
        return x;
    } : _a;
    return function(pathname) {
        var m = re.exec(pathname);
        if (!m) return false;
        var path = m[0], index = m.index;
        var params = Object.create(null);
        var _loop_1 = function(i) {
            // tslint:disable-next-line
            if (m[i] === undefined) return "continue";
            var key = keys[i - 1];
            if (key.modifier === "*" || key.modifier === "+") {
                params[key.name] = m[i].split(key.prefix + key.suffix).map(function(value) {
                    return decode(value, key);
                });
            } else {
                params[key.name] = decode(m[i], key);
            }
        };
        for(var i = 1; i < m.length; i++){
            _loop_1(i);
        }
        return {
            path: path,
            index: index,
            params: params
        };
    };
}
exports.regexpToFunction = regexpToFunction;
/**
 * Escape a regular expression string.
 */ function escapeString(str) {
    return str.replace(/([.+*?=^!:${}()[\]|/\\])/g, "\\$1");
}
/**
 * Get the flags for a regexp from the options.
 */ function flags(options) {
    return options && options.sensitive ? "" : "i";
}
/**
 * Pull out keys from a regexp.
 */ function regexpToRegexp(path, keys) {
    if (!keys) return path;
    // Use a negative lookahead to match only capturing groups.
    var groups = path.source.match(/\((?!\?)/g);
    if (groups) {
        for(var i = 0; i < groups.length; i++){
            keys.push({
                name: i,
                prefix: "",
                suffix: "",
                modifier: "",
                pattern: ""
            });
        }
    }
    return path;
}
/**
 * Transform an array into a regexp.
 */ function arrayToRegexp(paths, keys, options) {
    var parts = paths.map(function(path) {
        return pathToRegexp(path, keys, options).source;
    });
    return new RegExp("(?:" + parts.join("|") + ")", flags(options));
}
/**
 * Create a path regexp from string input.
 */ function stringToRegexp(path, keys, options) {
    return tokensToRegexp(parse(path, options), keys, options);
}
/**
 * Expose a function for taking tokens and returning a RegExp.
 */ function tokensToRegexp(tokens, keys, options) {
    if (options === void 0) {
        options = {};
    }
    var _a = options.strict, strict = _a === void 0 ? false : _a, _b = options.start, start = _b === void 0 ? true : _b, _c = options.end, end = _c === void 0 ? true : _c, _d = options.encode, encode = _d === void 0 ? function(x) {
        return x;
    } : _d;
    var endsWith = "[" + escapeString(options.endsWith || "") + "]|$";
    var delimiter = "[" + escapeString(options.delimiter || "/#?") + "]";
    var route = start ? "^" : "";
    // Iterate over the tokens and create our regexp string.
    for(var _i = 0, tokens_1 = tokens; _i < tokens_1.length; _i++){
        var token = tokens_1[_i];
        if (typeof token === "string") {
            route += escapeString(encode(token));
        } else {
            var prefix = escapeString(encode(token.prefix));
            var suffix = escapeString(encode(token.suffix));
            if (token.pattern) {
                if (keys) keys.push(token);
                if (prefix || suffix) {
                    if (token.modifier === "+" || token.modifier === "*") {
                        var mod = token.modifier === "*" ? "?" : "";
                        route += "(?:" + prefix + "((?:" + token.pattern + ")(?:" + suffix + prefix + "(?:" + token.pattern + "))*)" + suffix + ")" + mod;
                    } else {
                        route += "(?:" + prefix + "(" + token.pattern + ")" + suffix + ")" + token.modifier;
                    }
                } else {
                    route += "(" + token.pattern + ")" + token.modifier;
                }
            } else {
                route += "(?:" + prefix + suffix + ")" + token.modifier;
            }
        }
    }
    if (end) {
        if (!strict) route += delimiter + "?";
        route += !options.endsWith ? "$" : "(?=" + endsWith + ")";
    } else {
        var endToken = tokens[tokens.length - 1];
        var isEndDelimited = typeof endToken === "string" ? delimiter.indexOf(endToken[endToken.length - 1]) > -1 : endToken === undefined;
        if (!strict) {
            route += "(?:" + delimiter + "(?=" + endsWith + "))?";
        }
        if (!isEndDelimited) {
            route += "(?=" + delimiter + "|" + endsWith + ")";
        }
    }
    return new RegExp(route, flags(options));
}
exports.tokensToRegexp = tokensToRegexp;
/**
 * Normalize the given path string, returning a regular expression.
 *
 * An empty array can be passed in for the keys, which will hold the
 * placeholder key descriptions. For example, using `/user/:id`, `keys` will
 * contain `[{ name: 'id', delimiter: '/', optional: false, repeat: false }]`.
 */ function pathToRegexp(path, keys, options) {
    if (path instanceof RegExp) return regexpToRegexp(path, keys);
    if (Array.isArray(path)) return arrayToRegexp(path, keys, options);
    return stringToRegexp(path, keys, options);
}
exports.pathToRegexp = pathToRegexp; //# sourceMappingURL=index.js.map


/***/ }),

/***/ 67012:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
/**
 * @license React
 * react-dom-server-rendering-stub.production.min.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ 
var d = {
    usingClientEntryPoint: !1,
    Events: null,
    Dispatcher: {
        current: null
    }
};
function e(b) {
    for(var a = "https://reactjs.org/docs/error-decoder.html?invariant=" + b, c = 1; c < arguments.length; c++)a += "&args[]=" + encodeURIComponent(arguments[c]);
    return "Minified React error #" + b + "; visit " + a + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings.";
}
var f = d.Dispatcher;
exports.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = d;
exports.createPortal = function() {
    throw Error(e(448));
};
exports.experimental_useFormStatus = function() {
    throw Error(e(248));
};
exports.flushSync = function() {
    throw Error(e(449));
};
exports.preconnect = function(b, a) {
    var c = f.current;
    c && c.preconnect(b, a);
};
exports.prefetchDNS = function(b) {
    var a = f.current;
    a && a.prefetchDNS(b);
};
exports.preinit = function(b, a) {
    var c = f.current;
    c && c.preinit(b, a);
};
exports.preload = function(b, a) {
    var c = f.current;
    c && c.preload(b, a);
};
exports.unstable_batchedUpdates = function(b, a) {
    return b(a);
};
exports.version = "18.3.0-canary-1a001dac6-20230812";


/***/ }),

/***/ 27596:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";

if (true) {
    module.exports = __webpack_require__(67012);
} else {}


/***/ }),

/***/ 26655:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";
/**
 * @license React
 * react-server-dom-webpack-server.edge.production.min.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ 
var aa = __webpack_require__(42477), ba = __webpack_require__(27596), l = null, m = 0;
function n(a, b) {
    if (0 !== b.byteLength) if (512 < b.byteLength) 0 < m && (a.enqueue(new Uint8Array(l.buffer, 0, m)), l = new Uint8Array(512), m = 0), a.enqueue(b);
    else {
        var d = l.length - m;
        d < b.byteLength && (0 === d ? a.enqueue(l) : (l.set(b.subarray(0, d), m), a.enqueue(l), b = b.subarray(d)), l = new Uint8Array(512), m = 0);
        l.set(b, m);
        m += b.byteLength;
    }
    return !0;
}
var p = new TextEncoder;
function ca(a, b) {
    "function" === typeof a.error ? a.error(b) : a.close();
}
var q = Symbol.for("react.client.reference"), t = Symbol.for("react.server.reference");
function u(a, b, d) {
    return Object.defineProperties(a, {
        $$typeof: {
            value: q
        },
        $$id: {
            value: b
        },
        $$async: {
            value: d
        }
    });
}
var da = Function.prototype.bind, ea = Array.prototype.slice;
function fa() {
    var a = da.apply(this, arguments);
    if (this.$$typeof === t) {
        var b = ea.call(arguments, 1);
        a.$$typeof = t;
        a.$$id = this.$$id;
        a.$$bound = this.$$bound ? this.$$bound.concat(b) : b;
    }
    return a;
}
var ha = Promise.prototype, ia = {
    get: function(a, b) {
        switch(b){
            case "$$typeof":
                return a.$$typeof;
            case "$$id":
                return a.$$id;
            case "$$async":
                return a.$$async;
            case "name":
                return a.name;
            case "displayName":
                return;
            case "defaultProps":
                return;
            case "toJSON":
                return;
            case Symbol.toPrimitive:
                return Object.prototype[Symbol.toPrimitive];
            case "Provider":
                throw Error("Cannot render a Client Context Provider on the Server. Instead, you can export a Client Component wrapper that itself renders a Client Context Provider.");
        }
        throw Error("Cannot access " + (String(a.name) + "." + String(b)) + " on the server. You cannot dot into a client module from a server component. You can only pass the imported name through.");
    },
    set: function() {
        throw Error("Cannot assign to a client module from a server module.");
    }
}, ja = {
    get: function(a, b) {
        switch(b){
            case "$$typeof":
                return a.$$typeof;
            case "$$id":
                return a.$$id;
            case "$$async":
                return a.$$async;
            case "name":
                return a.name;
            case "defaultProps":
                return;
            case "toJSON":
                return;
            case Symbol.toPrimitive:
                return Object.prototype[Symbol.toPrimitive];
            case "__esModule":
                var d = a.$$id;
                a.default = u(function() {
                    throw Error("Attempted to call the default export of " + d + " from the server but it's on the client. It's not possible to invoke a client function from the server, it can only be rendered as a Component or passed to props of a Client Component.");
                }, a.$$id + "#", a.$$async);
                return !0;
            case "then":
                if (a.then) return a.then;
                if (a.$$async) return;
                var c = u({}, a.$$id, !0), e = new Proxy(c, ja);
                a.status = "fulfilled";
                a.value = e;
                return a.then = u(function(f) {
                    return Promise.resolve(f(e));
                }, a.$$id + "#then", !1);
        }
        c = a[b];
        c || (c = u(function() {
            throw Error("Attempted to call " + String(b) + "() from the server but " + String(b) + " is on the client. It's not possible to invoke a client function from the server, it can only be rendered as a Component or passed to props of a Client Component.");
        }, a.$$id + "#" + b, a.$$async), Object.defineProperty(c, "name", {
            value: b
        }), c = a[b] = new Proxy(c, ia));
        return c;
    },
    getPrototypeOf: function() {
        return ha;
    },
    set: function() {
        throw Error("Cannot assign to a client module from a server module.");
    }
}, pa = {
    prefetchDNS: ka,
    preconnect: la,
    preload: ma,
    preinit: na
};
function ka(a, b) {
    if ("string" === typeof a) {
        var d = v();
        if (d) {
            var c = d.hints, e = "D" + a;
            c.has(e) || (c.add(e), b ? w(d, "D", [
                a,
                b
            ]) : w(d, "D", a), x(d));
        }
    }
}
function la(a, b) {
    if ("string" === typeof a) {
        var d = v();
        if (d) {
            var c = d.hints, e = null == b || "string" !== typeof b.crossOrigin ? null : "use-credentials" === b.crossOrigin ? "use-credentials" : "";
            e = "C" + (null === e ? "null" : e) + "|" + a;
            c.has(e) || (c.add(e), b ? w(d, "C", [
                a,
                b
            ]) : w(d, "C", a), x(d));
        }
    }
}
function ma(a, b) {
    if ("string" === typeof a) {
        var d = v();
        if (d) {
            var c = d.hints, e = "L" + a;
            c.has(e) || (c.add(e), w(d, "L", [
                a,
                b
            ]), x(d));
        }
    }
}
function na(a, b) {
    if ("string" === typeof a) {
        var d = v();
        if (d) {
            var c = d.hints, e = "I" + a;
            c.has(e) || (c.add(e), w(d, "I", [
                a,
                b
            ]), x(d));
        }
    }
}
var qa = ba.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED.Dispatcher, ra = "function" === typeof AsyncLocalStorage, sa = ra ? new AsyncLocalStorage : null, C = Symbol.for("react.element"), ta = Symbol.for("react.fragment"), ua = Symbol.for("react.provider"), va = Symbol.for("react.server_context"), wa = Symbol.for("react.forward_ref"), xa = Symbol.for("react.suspense"), ya = Symbol.for("react.suspense_list"), za = Symbol.for("react.memo"), D = Symbol.for("react.lazy"), Aa = Symbol.for("react.default_value"), Ba = Symbol.for("react.memo_cache_sentinel"), Ca = Symbol.iterator, E = null;
function F(a, b) {
    if (a !== b) {
        a.context._currentValue = a.parentValue;
        a = a.parent;
        var d = b.parent;
        if (null === a) {
            if (null !== d) throw Error("The stacks must reach the root at the same time. This is a bug in React.");
        } else {
            if (null === d) throw Error("The stacks must reach the root at the same time. This is a bug in React.");
            F(a, d);
            b.context._currentValue = b.value;
        }
    }
}
function Da(a) {
    a.context._currentValue = a.parentValue;
    a = a.parent;
    null !== a && Da(a);
}
function Ea(a) {
    var b = a.parent;
    null !== b && Ea(b);
    a.context._currentValue = a.value;
}
function Fa(a, b) {
    a.context._currentValue = a.parentValue;
    a = a.parent;
    if (null === a) throw Error("The depth must equal at least at zero before reaching the root. This is a bug in React.");
    a.depth === b.depth ? F(a, b) : Fa(a, b);
}
function Ga(a, b) {
    var d = b.parent;
    if (null === d) throw Error("The depth must equal at least at zero before reaching the root. This is a bug in React.");
    a.depth === d.depth ? F(a, d) : Ga(a, d);
    b.context._currentValue = b.value;
}
function Ha(a) {
    var b = E;
    b !== a && (null === b ? Ea(a) : null === a ? Da(b) : b.depth === a.depth ? F(b, a) : b.depth > a.depth ? Fa(b, a) : Ga(b, a), E = a);
}
function Ia(a, b) {
    var d = a._currentValue;
    a._currentValue = b;
    var c = E;
    return E = a = {
        parent: c,
        depth: null === c ? 0 : c.depth + 1,
        context: a,
        parentValue: d,
        value: b
    };
}
var Ja = Error("Suspense Exception: This is not a real error! It's an implementation detail of `use` to interrupt the current render. You must either rethrow it immediately, or move the `use` call outside of the `try/catch` block. Capturing without rethrowing will lead to unexpected behavior.\n\nTo handle async errors, wrap your component in an error boundary, or call the promise's `.catch` method and pass the result to `use`");
function Ka() {}
function La(a, b, d) {
    d = a[d];
    void 0 === d ? a.push(b) : d !== b && (b.then(Ka, Ka), b = d);
    switch(b.status){
        case "fulfilled":
            return b.value;
        case "rejected":
            throw b.reason;
        default:
            if ("string" !== typeof b.status) switch(a = b, a.status = "pending", a.then(function(c) {
                if ("pending" === b.status) {
                    var e = b;
                    e.status = "fulfilled";
                    e.value = c;
                }
            }, function(c) {
                if ("pending" === b.status) {
                    var e = b;
                    e.status = "rejected";
                    e.reason = c;
                }
            }), b.status){
                case "fulfilled":
                    return b.value;
                case "rejected":
                    throw b.reason;
            }
            G = b;
            throw Ja;
    }
}
var G = null;
function Ma() {
    if (null === G) throw Error("Expected a suspended thenable. This is a bug in React. Please file an issue.");
    var a = G;
    G = null;
    return a;
}
var H = null, I = 0, J = null;
function Na() {
    var a = J;
    J = null;
    return a;
}
function Oa(a) {
    return a._currentValue;
}
var Sa = {
    useMemo: function(a) {
        return a();
    },
    useCallback: function(a) {
        return a;
    },
    useDebugValue: function() {},
    useDeferredValue: K,
    useTransition: K,
    readContext: Oa,
    useContext: Oa,
    useReducer: K,
    useRef: K,
    useState: K,
    useInsertionEffect: K,
    useLayoutEffect: K,
    useImperativeHandle: K,
    useEffect: K,
    useId: Pa,
    useSyncExternalStore: K,
    useCacheRefresh: function() {
        return Qa;
    },
    useMemoCache: function(a) {
        for(var b = Array(a), d = 0; d < a; d++)b[d] = Ba;
        return b;
    },
    use: Ra
};
function K() {
    throw Error("This Hook is not supported in Server Components.");
}
function Qa() {
    throw Error("Refreshing the cache is not supported in Server Components.");
}
function Pa() {
    if (null === H) throw Error("useId can only be used while React is rendering");
    var a = H.identifierCount++;
    return ":" + H.identifierPrefix + "S" + a.toString(32) + ":";
}
function Ra(a) {
    if (null !== a && "object" === typeof a || "function" === typeof a) {
        if ("function" === typeof a.then) {
            var b = I;
            I += 1;
            null === J && (J = []);
            return La(J, a, b);
        }
        if (a.$$typeof === va) return a._currentValue;
    }
    throw Error("An unsupported type was passed to use(): " + String(a));
}
function Ta() {
    return (new AbortController).signal;
}
function Ua() {
    var a = v();
    return a ? a.cache : new Map;
}
var Va = {
    getCacheSignal: function() {
        var a = Ua(), b = a.get(Ta);
        void 0 === b && (b = Ta(), a.set(Ta, b));
        return b;
    },
    getCacheForType: function(a) {
        var b = Ua(), d = b.get(a);
        void 0 === d && (d = a(), b.set(a, d));
        return d;
    }
}, Wa = Array.isArray;
function Xa(a) {
    return Object.prototype.toString.call(a).replace(/^\[object (.*)\]$/, function(b, d) {
        return d;
    });
}
function Ya(a) {
    switch(typeof a){
        case "string":
            return JSON.stringify(10 >= a.length ? a : a.slice(0, 10) + "...");
        case "object":
            if (Wa(a)) return "[...]";
            a = Xa(a);
            return "Object" === a ? "{...}" : a;
        case "function":
            return "function";
        default:
            return String(a);
    }
}
function L(a) {
    if ("string" === typeof a) return a;
    switch(a){
        case xa:
            return "Suspense";
        case ya:
            return "SuspenseList";
    }
    if ("object" === typeof a) switch(a.$$typeof){
        case wa:
            return L(a.render);
        case za:
            return L(a.type);
        case D:
            var b = a._payload;
            a = a._init;
            try {
                return L(a(b));
            } catch (d) {}
    }
    return "";
}
function M(a, b) {
    var d = Xa(a);
    if ("Object" !== d && "Array" !== d) return d;
    d = -1;
    var c = 0;
    if (Wa(a)) {
        var e = "[";
        for(var f = 0; f < a.length; f++){
            0 < f && (e += ", ");
            var g = a[f];
            g = "object" === typeof g && null !== g ? M(g) : Ya(g);
            "" + f === b ? (d = e.length, c = g.length, e += g) : e = 10 > g.length && 40 > e.length + g.length ? e + g : e + "...";
        }
        e += "]";
    } else if (a.$$typeof === C) e = "<" + L(a.type) + "/>";
    else {
        e = "{";
        f = Object.keys(a);
        for(g = 0; g < f.length; g++){
            0 < g && (e += ", ");
            var k = f[g], h = JSON.stringify(k);
            e += ('"' + k + '"' === h ? k : h) + ": ";
            h = a[k];
            h = "object" === typeof h && null !== h ? M(h) : Ya(h);
            k === b ? (d = e.length, c = h.length, e += h) : e = 10 > h.length && 40 > e.length + h.length ? e + h : e + "...";
        }
        e += "}";
    }
    return void 0 === b ? e : -1 < d && 0 < c ? (a = " ".repeat(d) + "^".repeat(c), "\n  " + e + "\n  " + a) : "\n  " + e;
}
var Za = aa.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED, $a = Za.ContextRegistry, N = JSON.stringify, ab = Za.ReactCurrentDispatcher, bb = Za.ReactCurrentCache;
function cb(a) {
    console.error(a);
}
function db(a, b, d, c, e) {
    if (null !== bb.current && bb.current !== Va) throw Error("Currently React only supports one RSC renderer at a time.");
    qa.current = pa;
    bb.current = Va;
    var f = new Set, g = [], k = new Set, h = {
        status: 0,
        flushScheduled: !1,
        fatalError: null,
        destination: null,
        bundlerConfig: b,
        cache: new Map,
        nextChunkId: 0,
        pendingChunks: 0,
        hints: k,
        abortableTasks: f,
        pingedTasks: g,
        completedImportChunks: [],
        completedHintChunks: [],
        completedRegularChunks: [],
        completedErrorChunks: [],
        writtenSymbols: new Map,
        writtenClientReferences: new Map,
        writtenServerReferences: new Map,
        writtenProviders: new Map,
        identifierPrefix: e || "",
        identifierCount: 1,
        onError: void 0 === d ? cb : d,
        toJSON: function(r, y) {
            return eb(h, this, r, y);
        }
    };
    h.pendingChunks++;
    b = fb(c);
    a = gb(h, a, b, f);
    g.push(a);
    return h;
}
var O = null;
function v() {
    if (O) return O;
    if (ra) {
        var a = sa.getStore();
        if (a) return a;
    }
    return null;
}
var hb = {};
function ib(a, b) {
    a.pendingChunks++;
    var d = gb(a, null, E, a.abortableTasks);
    switch(b.status){
        case "fulfilled":
            return d.model = b.value, jb(a, d), d.id;
        case "rejected":
            var c = P(a, b.reason);
            Q(a, d.id, c);
            return d.id;
        default:
            "string" !== typeof b.status && (b.status = "pending", b.then(function(e) {
                "pending" === b.status && (b.status = "fulfilled", b.value = e);
            }, function(e) {
                "pending" === b.status && (b.status = "rejected", b.reason = e);
            }));
    }
    b.then(function(e) {
        d.model = e;
        jb(a, d);
    }, function(e) {
        d.status = 4;
        e = P(a, e);
        Q(a, d.id, e);
        null !== a.destination && R(a, a.destination);
    });
    return d.id;
}
function kb(a) {
    if ("fulfilled" === a.status) return a.value;
    if ("rejected" === a.status) throw a.reason;
    throw a;
}
function lb(a) {
    switch(a.status){
        case "fulfilled":
        case "rejected":
            break;
        default:
            "string" !== typeof a.status && (a.status = "pending", a.then(function(b) {
                "pending" === a.status && (a.status = "fulfilled", a.value = b);
            }, function(b) {
                "pending" === a.status && (a.status = "rejected", a.reason = b);
            }));
    }
    return {
        $$typeof: D,
        _payload: a,
        _init: kb
    };
}
function S(a, b, d, c, e, f) {
    if (null !== c && void 0 !== c) throw Error("Refs cannot be used in Server Components, nor passed to Client Components.");
    if ("function" === typeof b) {
        if (b.$$typeof === q) return [
            C,
            b,
            d,
            e
        ];
        I = 0;
        J = f;
        e = b(e);
        return "object" === typeof e && null !== e && "function" === typeof e.then ? "fulfilled" === e.status ? e.value : lb(e) : e;
    }
    if ("string" === typeof b) return [
        C,
        b,
        d,
        e
    ];
    if ("symbol" === typeof b) return b === ta ? e.children : [
        C,
        b,
        d,
        e
    ];
    if (null != b && "object" === typeof b) {
        if (b.$$typeof === q) return [
            C,
            b,
            d,
            e
        ];
        switch(b.$$typeof){
            case D:
                var g = b._init;
                b = g(b._payload);
                return S(a, b, d, c, e, f);
            case wa:
                return a = b.render, I = 0, J = f, a(e, void 0);
            case za:
                return S(a, b.type, d, c, e, f);
            case ua:
                return Ia(b._context, e.value), [
                    C,
                    b,
                    d,
                    {
                        value: e.value,
                        children: e.children,
                        __pop: hb
                    }
                ];
        }
    }
    throw Error("Unsupported Server Component type: " + Ya(b));
}
function jb(a, b) {
    var d = a.pingedTasks;
    d.push(b);
    1 === d.length && (a.flushScheduled = null !== a.destination, setTimeout(function() {
        return mb(a);
    }, 0));
}
function gb(a, b, d, c) {
    var e = {
        id: a.nextChunkId++,
        status: 0,
        model: b,
        context: d,
        ping: function() {
            return jb(a, e);
        },
        thenableState: null
    };
    c.add(e);
    return e;
}
function T(a) {
    return "$" + a.toString(16);
}
function nb(a, b, d, c) {
    var e = c.$$async ? c.$$id + "#async" : c.$$id, f = a.writtenClientReferences, g = f.get(e);
    if (void 0 !== g) return b[0] === C && "1" === d ? "$L" + g.toString(16) : T(g);
    try {
        var k = a.bundlerConfig, h = c.$$id;
        g = "";
        var r = k[h];
        if (r) g = r.name;
        else {
            var y = h.lastIndexOf("#");
            -1 !== y && (g = h.slice(y + 1), r = k[h.slice(0, y)]);
            if (!r) throw Error('Could not find the module "' + h + '" in the React Client Manifest. This is probably a bug in the React Server Components bundler.');
        }
        var z = {
            id: r.id,
            chunks: r.chunks,
            name: g,
            async: !!c.$$async
        };
        a.pendingChunks++;
        var A = a.nextChunkId++, oa = N(z), B = A.toString(16) + ":I" + oa + "\n";
        var Fb = p.encode(B);
        a.completedImportChunks.push(Fb);
        f.set(e, A);
        return b[0] === C && "1" === d ? "$L" + A.toString(16) : T(A);
    } catch (Gb) {
        return a.pendingChunks++, b = a.nextChunkId++, d = P(a, Gb), Q(a, b, d), T(b);
    }
}
function ob(a, b) {
    a.pendingChunks++;
    var d = a.nextChunkId++;
    b = pb(a, d, b);
    a.completedRegularChunks.push(b);
    return d;
}
function eb(a, b, d, c) {
    switch(c){
        case C:
            return "$";
    }
    for(; "object" === typeof c && null !== c && (c.$$typeof === C || c.$$typeof === D);)try {
        switch(c.$$typeof){
            case C:
                var e = c;
                c = S(a, e.type, e.key, e.ref, e.props, null);
                break;
            case D:
                var f = c._init;
                c = f(c._payload);
        }
    } catch (g) {
        d = g === Ja ? Ma() : g;
        if ("object" === typeof d && null !== d && "function" === typeof d.then) return a.pendingChunks++, a = gb(a, c, E, a.abortableTasks), c = a.ping, d.then(c, c), a.thenableState = Na(), "$L" + a.id.toString(16);
        a.pendingChunks++;
        c = a.nextChunkId++;
        d = P(a, d);
        Q(a, c, d);
        return "$L" + c.toString(16);
    }
    if (null === c) return null;
    if ("object" === typeof c) {
        if (c.$$typeof === q) return nb(a, b, d, c);
        if ("function" === typeof c.then) return "$@" + ib(a, c).toString(16);
        if (c.$$typeof === ua) return c = c._context._globalName, b = a.writtenProviders, d = b.get(d), void 0 === d && (a.pendingChunks++, d = a.nextChunkId++, b.set(c, d), c = qb(a, d, "$P" + c), a.completedRegularChunks.push(c)), T(d);
        if (c === hb) {
            a = E;
            if (null === a) throw Error("Tried to pop a Context at the root of the app. This is a bug in React.");
            c = a.parentValue;
            a.context._currentValue = c === Aa ? a.context._defaultValue : c;
            E = a.parent;
            return;
        }
        return c instanceof Map ? "$Q" + ob(a, Array.from(c)).toString(16) : c instanceof Set ? "$W" + ob(a, Array.from(c)).toString(16) : !Wa(c) && (null === c || "object" !== typeof c ? a = null : (a = Ca && c[Ca] || c["@@iterator"], a = "function" === typeof a ? a : null), a) ? Array.from(c) : c;
    }
    if ("string" === typeof c) {
        if ("Z" === c[c.length - 1] && b[d] instanceof Date) return "$D" + c;
        if (1024 <= c.length) return a.pendingChunks += 2, d = a.nextChunkId++, c = p.encode(c), b = c.byteLength, b = d.toString(16) + ":T" + b.toString(16) + ",", b = p.encode(b), a.completedRegularChunks.push(b, c), T(d);
        a = "$" === c[0] ? "$" + c : c;
        return a;
    }
    if ("boolean" === typeof c) return c;
    if ("number" === typeof c) return a = c, Number.isFinite(a) ? 0 === a && -Infinity === 1 / a ? "$-0" : a : Infinity === a ? "$Infinity" : -Infinity === a ? "$-Infinity" : "$NaN";
    if ("undefined" === typeof c) return "$undefined";
    if ("function" === typeof c) {
        if (c.$$typeof === q) return nb(a, b, d, c);
        if (c.$$typeof === t) return d = a.writtenServerReferences, b = d.get(c), void 0 !== b ? a = "$F" + b.toString(16) : (b = c.$$bound, b = {
            id: c.$$id,
            bound: b ? Promise.resolve(b) : null
        }, a = ob(a, b), d.set(c, a), a = "$F" + a.toString(16)), a;
        if (/^on[A-Z]/.test(d)) throw Error("Event handlers cannot be passed to Client Component props." + M(b, d) + "\nIf you need interactivity, consider converting part of this to a Client Component.");
        throw Error('Functions cannot be passed directly to Client Components unless you explicitly expose it by marking it with "use server".' + M(b, d));
    }
    if ("symbol" === typeof c) {
        e = a.writtenSymbols;
        f = e.get(c);
        if (void 0 !== f) return T(f);
        f = c.description;
        if (Symbol.for(f) !== c) throw Error("Only global symbols received from Symbol.for(...) can be passed to Client Components. The symbol Symbol.for(" + (c.description + ") cannot be found among global symbols.") + M(b, d));
        a.pendingChunks++;
        d = a.nextChunkId++;
        b = qb(a, d, "$S" + f);
        a.completedImportChunks.push(b);
        e.set(c, d);
        return T(d);
    }
    if ("bigint" === typeof c) return "$n" + c.toString(10);
    throw Error("Type " + typeof c + " is not supported in Client Component props." + M(b, d));
}
function P(a, b) {
    a = a.onError;
    b = a(b);
    if (null != b && "string" !== typeof b) throw Error('onError returned something with a type other than "string". onError should return a string and may return null or undefined but must not return anything else. It received something of type "' + typeof b + '" instead');
    return b || "";
}
function rb(a, b) {
    null !== a.destination ? (a.status = 2, ca(a.destination, b)) : (a.status = 1, a.fatalError = b);
}
function Q(a, b, d) {
    d = {
        digest: d
    };
    b = b.toString(16) + ":E" + N(d) + "\n";
    b = p.encode(b);
    a.completedErrorChunks.push(b);
}
function w(a, b, d) {
    var c = a.nextChunkId++;
    d = N(d);
    b = "H" + b;
    c = c.toString(16) + ":" + b;
    c = p.encode(c + d + "\n");
    a.completedHintChunks.push(c);
}
function mb(a) {
    var b = ab.current;
    ab.current = Sa;
    var d = O;
    H = O = a;
    try {
        var c = a.pingedTasks;
        a.pingedTasks = [];
        for(var e = 0; e < c.length; e++){
            var f = c[e];
            var g = a;
            if (0 === f.status) {
                Ha(f.context);
                try {
                    var k = f.model;
                    if ("object" === typeof k && null !== k && k.$$typeof === C) {
                        var h = k, r = f.thenableState;
                        f.model = k;
                        k = S(g, h.type, h.key, h.ref, h.props, r);
                        for(f.thenableState = null; "object" === typeof k && null !== k && k.$$typeof === C;)h = k, f.model = k, k = S(g, h.type, h.key, h.ref, h.props, null);
                    }
                    var y = pb(g, f.id, k);
                    g.completedRegularChunks.push(y);
                    g.abortableTasks.delete(f);
                    f.status = 1;
                } catch (B) {
                    var z = B === Ja ? Ma() : B;
                    if ("object" === typeof z && null !== z && "function" === typeof z.then) {
                        var A = f.ping;
                        z.then(A, A);
                        f.thenableState = Na();
                    } else {
                        g.abortableTasks.delete(f);
                        f.status = 4;
                        var oa = P(g, z);
                        Q(g, f.id, oa);
                    }
                }
            }
        }
        null !== a.destination && R(a, a.destination);
    } catch (B) {
        P(a, B), rb(a, B);
    } finally{
        ab.current = b, H = null, O = d;
    }
}
function R(a, b) {
    l = new Uint8Array(512);
    m = 0;
    try {
        for(var d = a.completedImportChunks, c = 0; c < d.length; c++)a.pendingChunks--, n(b, d[c]);
        d.splice(0, c);
        var e = a.completedHintChunks;
        for(c = 0; c < e.length; c++)n(b, e[c]);
        e.splice(0, c);
        var f = a.completedRegularChunks;
        for(c = 0; c < f.length; c++)a.pendingChunks--, n(b, f[c]);
        f.splice(0, c);
        var g = a.completedErrorChunks;
        for(c = 0; c < g.length; c++)a.pendingChunks--, n(b, g[c]);
        g.splice(0, c);
    } finally{
        a.flushScheduled = !1, l && 0 < m && (b.enqueue(new Uint8Array(l.buffer, 0, m)), l = null, m = 0);
    }
    0 === a.pendingChunks && b.close();
}
function sb(a) {
    a.flushScheduled = null !== a.destination;
    ra ? setTimeout(function() {
        return sa.run(a, mb, a);
    }, 0) : setTimeout(function() {
        return mb(a);
    }, 0);
}
function x(a) {
    if (!1 === a.flushScheduled && 0 === a.pingedTasks.length && null !== a.destination) {
        var b = a.destination;
        a.flushScheduled = !0;
        setTimeout(function() {
            return R(a, b);
        }, 0);
    }
}
function tb(a, b) {
    try {
        var d = a.abortableTasks;
        if (0 < d.size) {
            var c = P(a, void 0 === b ? Error("The render was aborted by the server without a reason.") : b);
            a.pendingChunks++;
            var e = a.nextChunkId++;
            Q(a, e, c);
            d.forEach(function(f) {
                f.status = 3;
                var g = T(e);
                f = qb(a, f.id, g);
                a.completedErrorChunks.push(f);
            });
            d.clear();
        }
        null !== a.destination && R(a, a.destination);
    } catch (f) {
        P(a, f), rb(a, f);
    }
}
function fb(a) {
    if (a) {
        var b = E;
        Ha(null);
        for(var d = 0; d < a.length; d++){
            var c = a[d], e = c[0];
            c = c[1];
            $a[e] || ($a[e] = aa.createServerContext(e, Aa));
            Ia($a[e], c);
        }
        a = E;
        Ha(b);
        return a;
    }
    return null;
}
function pb(a, b, d) {
    a = N(d, a.toJSON);
    b = b.toString(16) + ":" + a + "\n";
    return p.encode(b);
}
function qb(a, b, d) {
    a = N(d);
    b = b.toString(16) + ":" + a + "\n";
    return p.encode(b);
}
function ub(a, b) {
    var d = "", c = a[b];
    if (c) d = c.name;
    else {
        var e = b.lastIndexOf("#");
        -1 !== e && (d = b.slice(e + 1), c = a[b.slice(0, e)]);
        if (!c) throw Error('Could not find the module "' + b + '" in the React Server Manifest. This is probably a bug in the React Server Components bundler.');
    }
    return {
        id: c.id,
        chunks: c.chunks,
        name: d,
        async: !1
    };
}
var U = new Map;
function vb(a) {
    var b = globalThis.__next_require__(a);
    if ("function" !== typeof b.then || "fulfilled" === b.status) return null;
    b.then(function(d) {
        b.status = "fulfilled";
        b.value = d;
    }, function(d) {
        b.status = "rejected";
        b.reason = d;
    });
    return b;
}
function wb() {}
function xb(a) {
    for(var b = a.chunks, d = [], c = 0; c < b.length; c++){
        var e = b[c], f = U.get(e);
        if (void 0 === f) {
            f = globalThis.__next_chunk_load__(e);
            d.push(f);
            var g = U.set.bind(U, e, null);
            f.then(g, wb);
            U.set(e, f);
        } else null !== f && d.push(f);
    }
    return a.async ? 0 === d.length ? vb(a.id) : Promise.all(d).then(function() {
        return vb(a.id);
    }) : 0 < d.length ? Promise.all(d) : null;
}
function V(a) {
    var b = globalThis.__next_require__(a.id);
    if (a.async && "function" === typeof b.then) if ("fulfilled" === b.status) b = b.value;
    else throw b.reason;
    return "*" === a.name ? b : "" === a.name ? b.__esModule ? b.default : b : b[a.name];
}
function W(a, b, d, c) {
    this.status = a;
    this.value = b;
    this.reason = d;
    this._response = c;
}
W.prototype = Object.create(Promise.prototype);
W.prototype.then = function(a, b) {
    switch(this.status){
        case "resolved_model":
            yb(this);
    }
    switch(this.status){
        case "fulfilled":
            a(this.value);
            break;
        case "pending":
        case "blocked":
            a && (null === this.value && (this.value = []), this.value.push(a));
            b && (null === this.reason && (this.reason = []), this.reason.push(b));
            break;
        default:
            b(this.reason);
    }
};
function zb(a, b) {
    for(var d = 0; d < a.length; d++)(0, a[d])(b);
}
function Ab(a, b) {
    if ("pending" === a.status || "blocked" === a.status) {
        var d = a.reason;
        a.status = "rejected";
        a.reason = b;
        null !== d && zb(d, b);
    }
}
function Bb(a, b, d, c, e, f) {
    var g = ub(a._bundlerConfig, b);
    a = xb(g);
    if (d) d = Promise.all([
        d,
        a
    ]).then(function(k) {
        k = k[0];
        var h = V(g);
        return h.bind.apply(h, [
            null
        ].concat(k));
    });
    else if (a) d = Promise.resolve(a).then(function() {
        return V(g);
    });
    else return V(g);
    d.then(Cb(c, e, f), Db(c));
    return null;
}
var X = null, Y = null;
function yb(a) {
    var b = X, d = Y;
    X = a;
    Y = null;
    try {
        var c = JSON.parse(a.value, a._response._fromJSON);
        null !== Y && 0 < Y.deps ? (Y.value = c, a.status = "blocked", a.value = null, a.reason = null) : (a.status = "fulfilled", a.value = c);
    } catch (e) {
        a.status = "rejected", a.reason = e;
    } finally{
        X = b, Y = d;
    }
}
function Eb(a, b) {
    a._chunks.forEach(function(d) {
        "pending" === d.status && Ab(d, b);
    });
}
function Z(a, b) {
    var d = a._chunks, c = d.get(b);
    c || (c = a._formData.get(a._prefix + b), c = null != c ? new W("resolved_model", c, null, a) : new W("pending", null, null, a), d.set(b, c));
    return c;
}
function Cb(a, b, d) {
    if (Y) {
        var c = Y;
        c.deps++;
    } else c = Y = {
        deps: 1,
        value: null
    };
    return function(e) {
        b[d] = e;
        c.deps--;
        0 === c.deps && "blocked" === a.status && (e = a.value, a.status = "fulfilled", a.value = c.value, null !== e && zb(e, c.value));
    };
}
function Db(a) {
    return function(b) {
        return Ab(a, b);
    };
}
function Hb(a, b) {
    a = Z(a, b);
    "resolved_model" === a.status && yb(a);
    if ("fulfilled" !== a.status) throw a.reason;
    return a.value;
}
function Ib(a, b, d, c) {
    if ("$" === c[0]) switch(c[1]){
        case "$":
            return c.slice(1);
        case "@":
            return b = parseInt(c.slice(2), 16), Z(a, b);
        case "S":
            return Symbol.for(c.slice(2));
        case "F":
            return c = parseInt(c.slice(2), 16), c = Hb(a, c), Bb(a, c.id, c.bound, X, b, d);
        case "Q":
            return b = parseInt(c.slice(2), 16), a = Hb(a, b), new Map(a);
        case "W":
            return b = parseInt(c.slice(2), 16), a = Hb(a, b), new Set(a);
        case "K":
            b = c.slice(2);
            var e = a._prefix + b + "_", f = new FormData;
            a._formData.forEach(function(g, k) {
                k.startsWith(e) && f.append(k.slice(e.length), g);
            });
            return f;
        case "I":
            return Infinity;
        case "-":
            return "$-0" === c ? -0 : -Infinity;
        case "N":
            return NaN;
        case "u":
            return;
        case "D":
            return new Date(Date.parse(c.slice(2)));
        case "n":
            return BigInt(c.slice(2));
        default:
            c = parseInt(c.slice(1), 16);
            a = Z(a, c);
            switch(a.status){
                case "resolved_model":
                    yb(a);
            }
            switch(a.status){
                case "fulfilled":
                    return a.value;
                case "pending":
                case "blocked":
                    return c = X, a.then(Cb(c, b, d), Db(c)), null;
                default:
                    throw a.reason;
            }
    }
    return c;
}
function Jb(a, b) {
    var d = 2 < arguments.length && void 0 !== arguments[2] ? arguments[2] : new FormData, c = new Map, e = {
        _bundlerConfig: a,
        _prefix: b,
        _formData: d,
        _chunks: c,
        _fromJSON: function(f, g) {
            return "string" === typeof g ? Ib(e, this, f, g) : g;
        }
    };
    return e;
}
function Kb(a) {
    Eb(a, Error("Connection closed."));
}
function Lb(a, b, d) {
    var c = ub(a, b);
    a = xb(c);
    return d ? Promise.all([
        d,
        a
    ]).then(function(e) {
        e = e[0];
        var f = V(c);
        return f.bind.apply(f, [
            null
        ].concat(e));
    }) : a ? Promise.resolve(a).then(function() {
        return V(c);
    }) : Promise.resolve(V(c));
}
exports.createClientModuleProxy = function(a) {
    a = u({}, a, !1);
    return new Proxy(a, ja);
};
exports.decodeAction = function(a, b) {
    var d = new FormData, c = null;
    a.forEach(function(e, f) {
        if (f.startsWith("$ACTION_")) if (f.startsWith("$ACTION_REF_")) {
            e = "$ACTION_" + f.slice(12) + ":";
            e = Jb(b, e, a);
            Kb(e);
            e = Z(e, 0);
            e.then(function() {});
            if ("fulfilled" !== e.status) throw e.reason;
            e = e.value;
            c = Lb(b, e.id, e.bound);
        } else f.startsWith("$ACTION_ID_") && (e = f.slice(11), c = Lb(b, e, null));
        else d.append(f, e);
    });
    return null === c ? null : c.then(function(e) {
        return e.bind(null, d);
    });
};
exports.decodeReply = function(a, b) {
    if ("string" === typeof a) {
        var d = new FormData;
        d.append("0", a);
        a = d;
    }
    a = Jb(b, "", a);
    Kb(a);
    return Z(a, 0);
};
exports.registerClientReference = function(a, b, d) {
    return u(a, b + "#" + d, !1);
};
exports.registerServerReference = function(a, b, d) {
    return Object.defineProperties(a, {
        $$typeof: {
            value: t
        },
        $$id: {
            value: null === d ? b : b + "#" + d
        },
        $$bound: {
            value: null
        },
        bind: {
            value: fa
        }
    });
};
exports.renderToReadableStream = function(a, b, d) {
    var c = db(a, b, d ? d.onError : void 0, d ? d.context : void 0, d ? d.identifierPrefix : void 0);
    if (d && d.signal) {
        var e = d.signal;
        if (e.aborted) tb(c, e.reason);
        else {
            var f = function() {
                tb(c, e.reason);
                e.removeEventListener("abort", f);
            };
            e.addEventListener("abort", f);
        }
    }
    return new ReadableStream({
        type: "bytes",
        start: function() {
            sb(c);
        },
        pull: function(g) {
            if (1 === c.status) c.status = 2, ca(g, c.fatalError);
            else if (2 !== c.status && null === c.destination) {
                c.destination = g;
                try {
                    R(c, g);
                } catch (k) {
                    P(c, k), rb(c, k);
                }
            }
        },
        cancel: function() {}
    }, {
        highWaterMark: 0
    });
};


/***/ }),

/***/ 30518:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";

if (true) {
    module.exports = __webpack_require__(26655);
} else {}


/***/ }),

/***/ 69813:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
/**
 * @license React
 * react.shared-subset.production.min.js
 *
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */ 
var m = Object.assign, n = {
    current: null
};
function p() {
    return new Map;
}
if ("function" === typeof fetch) {
    var q = fetch, r = function(a, b) {
        var d = n.current;
        if (!d || b && b.signal && b.signal !== d.getCacheSignal()) return q(a, b);
        if ("string" !== typeof a || b) {
            var c = "string" === typeof a || a instanceof URL ? new Request(a, b) : a;
            if ("GET" !== c.method && "HEAD" !== c.method || c.keepalive) return q(a, b);
            var e = JSON.stringify([
                c.method,
                Array.from(c.headers.entries()),
                c.mode,
                c.redirect,
                c.credentials,
                c.referrer,
                c.referrerPolicy,
                c.integrity
            ]);
            c = c.url;
        } else e = '["GET",[],null,"follow",null,null,null,null]', c = a;
        var f = d.getCacheForType(p);
        d = f.get(c);
        if (void 0 === d) a = q(a, b), f.set(c, [
            e,
            a
        ]);
        else {
            c = 0;
            for(f = d.length; c < f; c += 2){
                var h = d[c + 1];
                if (d[c] === e) return a = h, a.then(function(g) {
                    return g.clone();
                });
            }
            a = q(a, b);
            d.push(e, a);
        }
        return a.then(function(g) {
            return g.clone();
        });
    };
    m(r, q);
    try {
        fetch = r;
    } catch (a) {
        try {
            globalThis.fetch = r;
        } catch (b) {
            console.warn("React was unable to patch the fetch() function in this environment. Suspensey APIs might not work correctly as a result.");
        }
    }
}
var t = Symbol.for("react.element"), u = Symbol.for("react.portal"), v = Symbol.for("react.fragment"), w = Symbol.for("react.strict_mode"), x = Symbol.for("react.profiler"), y = Symbol.for("react.provider"), z = Symbol.for("react.server_context"), A = Symbol.for("react.forward_ref"), B = Symbol.for("react.suspense"), C = Symbol.for("react.memo"), aa = Symbol.for("react.lazy"), D = Symbol.for("react.default_value"), E = Symbol.iterator;
function ba(a) {
    if (null === a || "object" !== typeof a) return null;
    a = E && a[E] || a["@@iterator"];
    return "function" === typeof a ? a : null;
}
function F(a) {
    for(var b = "https://reactjs.org/docs/error-decoder.html?invariant=" + a, d = 1; d < arguments.length; d++)b += "&args[]=" + encodeURIComponent(arguments[d]);
    return "Minified React error #" + a + "; visit " + b + " for the full message or use the non-minified dev environment for full errors and additional helpful warnings.";
}
var G = {
    isMounted: function() {
        return !1;
    },
    enqueueForceUpdate: function() {},
    enqueueReplaceState: function() {},
    enqueueSetState: function() {}
}, H = {};
function I(a, b, d) {
    this.props = a;
    this.context = b;
    this.refs = H;
    this.updater = d || G;
}
I.prototype.isReactComponent = {};
I.prototype.setState = function(a, b) {
    if ("object" !== typeof a && "function" !== typeof a && null != a) throw Error(F(85));
    this.updater.enqueueSetState(this, a, b, "setState");
};
I.prototype.forceUpdate = function(a) {
    this.updater.enqueueForceUpdate(this, a, "forceUpdate");
};
function J() {}
J.prototype = I.prototype;
function K(a, b, d) {
    this.props = a;
    this.context = b;
    this.refs = H;
    this.updater = d || G;
}
var L = K.prototype = new J;
L.constructor = K;
m(L, I.prototype);
L.isPureReactComponent = !0;
var M = Array.isArray, N = Object.prototype.hasOwnProperty, O = {
    current: null
}, P = {
    key: !0,
    ref: !0,
    __self: !0,
    __source: !0
};
function ca(a, b) {
    return {
        $$typeof: t,
        type: a.type,
        key: b,
        ref: a.ref,
        props: a.props,
        _owner: a._owner
    };
}
function Q(a) {
    return "object" === typeof a && null !== a && a.$$typeof === t;
}
function escape(a) {
    var b = {
        "=": "=0",
        ":": "=2"
    };
    return "$" + a.replace(/[=:]/g, function(d) {
        return b[d];
    });
}
var R = /\/+/g;
function S(a, b) {
    return "object" === typeof a && null !== a && null != a.key ? escape("" + a.key) : b.toString(36);
}
function T(a, b, d, c, e) {
    var f = typeof a;
    if ("undefined" === f || "boolean" === f) a = null;
    var h = !1;
    if (null === a) h = !0;
    else switch(f){
        case "string":
        case "number":
            h = !0;
            break;
        case "object":
            switch(a.$$typeof){
                case t:
                case u:
                    h = !0;
            }
    }
    if (h) return h = a, e = e(h), a = "" === c ? "." + S(h, 0) : c, M(e) ? (d = "", null != a && (d = a.replace(R, "$&/") + "/"), T(e, b, d, "", function(l) {
        return l;
    })) : null != e && (Q(e) && (e = ca(e, d + (!e.key || h && h.key === e.key ? "" : ("" + e.key).replace(R, "$&/") + "/") + a)), b.push(e)), 1;
    h = 0;
    c = "" === c ? "." : c + ":";
    if (M(a)) for(var g = 0; g < a.length; g++){
        f = a[g];
        var k = c + S(f, g);
        h += T(f, b, d, k, e);
    }
    else if (k = ba(a), "function" === typeof k) for(a = k.call(a), g = 0; !(f = a.next()).done;)f = f.value, k = c + S(f, g++), h += T(f, b, d, k, e);
    else if ("object" === f) throw b = String(a), Error(F(31, "[object Object]" === b ? "object with keys {" + Object.keys(a).join(", ") + "}" : b));
    return h;
}
function U(a, b, d) {
    if (null == a) return a;
    var c = [], e = 0;
    T(a, c, "", "", function(f) {
        return b.call(d, f, e++);
    });
    return c;
}
function da(a) {
    if (-1 === a._status) {
        var b = a._result;
        b = b();
        b.then(function(d) {
            if (0 === a._status || -1 === a._status) a._status = 1, a._result = d;
        }, function(d) {
            if (0 === a._status || -1 === a._status) a._status = 2, a._result = d;
        });
        -1 === a._status && (a._status = 0, a._result = b);
    }
    if (1 === a._status) return a._result.default;
    throw a._result;
}
function ea() {
    return new WeakMap;
}
function V() {
    return {
        s: 0,
        v: void 0,
        o: null,
        p: null
    };
}
var W = {
    current: null
}, X = {
    transition: null
}, Y = {
    ReactCurrentDispatcher: W,
    ReactCurrentCache: n,
    ReactCurrentBatchConfig: X,
    ReactCurrentOwner: O,
    ContextRegistry: {}
}, Z = Y.ContextRegistry;
exports.Children = {
    map: U,
    forEach: function(a, b, d) {
        U(a, function() {
            b.apply(this, arguments);
        }, d);
    },
    count: function(a) {
        var b = 0;
        U(a, function() {
            b++;
        });
        return b;
    },
    toArray: function(a) {
        return U(a, function(b) {
            return b;
        }) || [];
    },
    only: function(a) {
        if (!Q(a)) throw Error(F(143));
        return a;
    }
};
exports.Fragment = v;
exports.Profiler = x;
exports.StrictMode = w;
exports.Suspense = B;
exports.__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = Y;
exports.cache = function(a) {
    return function() {
        var b = n.current;
        if (!b) return a.apply(null, arguments);
        var d = b.getCacheForType(ea);
        b = d.get(a);
        void 0 === b && (b = V(), d.set(a, b));
        d = 0;
        for(var c = arguments.length; d < c; d++){
            var e = arguments[d];
            if ("function" === typeof e || "object" === typeof e && null !== e) {
                var f = b.o;
                null === f && (b.o = f = new WeakMap);
                b = f.get(e);
                void 0 === b && (b = V(), f.set(e, b));
            } else f = b.p, null === f && (b.p = f = new Map), b = f.get(e), void 0 === b && (b = V(), f.set(e, b));
        }
        if (1 === b.s) return b.v;
        if (2 === b.s) throw b.v;
        try {
            var h = a.apply(null, arguments);
            d = b;
            d.s = 1;
            return d.v = h;
        } catch (g) {
            throw h = b, h.s = 2, h.v = g, g;
        }
    };
};
exports.cloneElement = function(a, b, d) {
    if (null === a || void 0 === a) throw Error(F(267, a));
    var c = m({}, a.props), e = a.key, f = a.ref, h = a._owner;
    if (null != b) {
        void 0 !== b.ref && (f = b.ref, h = O.current);
        void 0 !== b.key && (e = "" + b.key);
        if (a.type && a.type.defaultProps) var g = a.type.defaultProps;
        for(k in b)N.call(b, k) && !P.hasOwnProperty(k) && (c[k] = void 0 === b[k] && void 0 !== g ? g[k] : b[k]);
    }
    var k = arguments.length - 2;
    if (1 === k) c.children = d;
    else if (1 < k) {
        g = Array(k);
        for(var l = 0; l < k; l++)g[l] = arguments[l + 2];
        c.children = g;
    }
    return {
        $$typeof: t,
        type: a.type,
        key: e,
        ref: f,
        props: c,
        _owner: h
    };
};
exports.createElement = function(a, b, d) {
    var c, e = {}, f = null, h = null;
    if (null != b) for(c in void 0 !== b.ref && (h = b.ref), void 0 !== b.key && (f = "" + b.key), b)N.call(b, c) && !P.hasOwnProperty(c) && (e[c] = b[c]);
    var g = arguments.length - 2;
    if (1 === g) e.children = d;
    else if (1 < g) {
        for(var k = Array(g), l = 0; l < g; l++)k[l] = arguments[l + 2];
        e.children = k;
    }
    if (a && a.defaultProps) for(c in g = a.defaultProps, g)void 0 === e[c] && (e[c] = g[c]);
    return {
        $$typeof: t,
        type: a,
        key: f,
        ref: h,
        props: e,
        _owner: O.current
    };
};
exports.createRef = function() {
    return {
        current: null
    };
};
exports.createServerContext = function(a, b) {
    var d = !0;
    if (!Z[a]) {
        d = !1;
        var c = {
            $$typeof: z,
            _currentValue: b,
            _currentValue2: b,
            _defaultValue: b,
            _threadCount: 0,
            Provider: null,
            Consumer: null,
            _globalName: a
        };
        c.Provider = {
            $$typeof: y,
            _context: c
        };
        Z[a] = c;
    }
    c = Z[a];
    if (c._defaultValue === D) c._defaultValue = b, c._currentValue === D && (c._currentValue = b), c._currentValue2 === D && (c._currentValue2 = b);
    else if (d) throw Error(F(429, a));
    return c;
};
exports.forwardRef = function(a) {
    return {
        $$typeof: A,
        render: a
    };
};
exports.isValidElement = Q;
exports.lazy = function(a) {
    return {
        $$typeof: aa,
        _payload: {
            _status: -1,
            _result: a
        },
        _init: da
    };
};
exports.memo = function(a, b) {
    return {
        $$typeof: C,
        type: a,
        compare: void 0 === b ? null : b
    };
};
exports.startTransition = function(a) {
    var b = X.transition;
    X.transition = {};
    try {
        a();
    } finally{
        X.transition = b;
    }
};
exports.use = function(a) {
    return W.current.use(a);
};
exports.useCallback = function(a, b) {
    return W.current.useCallback(a, b);
};
exports.useContext = function(a) {
    return W.current.useContext(a);
};
exports.useDebugValue = function() {};
exports.useId = function() {
    return W.current.useId();
};
exports.useMemo = function(a, b) {
    return W.current.useMemo(a, b);
};
exports.version = "18.3.0-canary-1a001dac6-20230812";


/***/ }),

/***/ 42477:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";

if (true) {
    module.exports = __webpack_require__(69813);
} else {}


/***/ }),

/***/ 25909:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    fillMetadataSegment: function() {
        return fillMetadataSegment;
    },
    normalizeMetadataRoute: function() {
        return normalizeMetadataRoute;
    }
});
const _ismetadataroute = __webpack_require__(61982);
const _path = /*#__PURE__*/ _interop_require_default(__webpack_require__(58317));
const _serverutils = __webpack_require__(63066);
const _routeregex = __webpack_require__(22251);
const _hash = __webpack_require__(69341);
const _apppaths = __webpack_require__(63587);
const _normalizepathsep = __webpack_require__(35888);
function _interop_require_default(obj) {
    return obj && obj.__esModule ? obj : {
        default: obj
    };
}
/*
 * If there's special convention like (...) or @ in the page path,
 * Give it a unique hash suffix to avoid conflicts
 *
 * e.g.
 * /app/open-graph.tsx -> /open-graph/route
 * /app/(post)/open-graph.tsx -> /open-graph/route-[0-9a-z]{6}
 */ function getMetadataRouteSuffix(page) {
    let suffix = "";
    if (page.includes("(") && page.includes(")") || page.includes("@")) {
        suffix = (0, _hash.djb2Hash)(page).toString(36).slice(0, 6);
    }
    return suffix;
}
function fillMetadataSegment(segment, params, imageSegment) {
    const pathname = (0, _apppaths.normalizeAppPath)(segment);
    const routeRegex = (0, _routeregex.getNamedRouteRegex)(pathname, false);
    const route = (0, _serverutils.interpolateDynamicPath)(pathname, params, routeRegex);
    const suffix = getMetadataRouteSuffix(segment);
    const routeSuffix = suffix ? `-${suffix}` : "";
    const { name, ext } = _path.default.parse(imageSegment);
    return (0, _normalizepathsep.normalizePathSep)(_path.default.join(route, `${name}${routeSuffix}${ext}`));
}
function normalizeMetadataRoute(page) {
    if (!(0, _ismetadataroute.isMetadataRoute)(page)) {
        return page;
    }
    let route = page;
    let suffix = "";
    if (route === "/robots") {
        route += ".txt";
    } else if (route === "/manifest") {
        route += ".webmanifest";
    } else if (route.endsWith("/sitemap")) {
        route += ".xml";
    } else {
        // Remove the file extension, e.g. /route-path/robots.txt -> /route-path
        const pathnamePrefix = page.slice(0, -(_path.default.basename(page).length + 1));
        suffix = getMetadataRouteSuffix(pathnamePrefix);
    }
    // Support both /<metadata-route.ext> and custom routes /<metadata-route>/route.ts.
    // If it's a metadata file route, we need to append /[id]/route to the page.
    if (!route.endsWith("/route")) {
        const isStaticMetadataFile = (0, _ismetadataroute.isStaticMetadataRouteFile)(page);
        const { dir, name: baseName, ext } = _path.default.parse(route);
        const isStaticRoute = page.startsWith("/robots") || page.startsWith("/manifest") || isStaticMetadataFile;
        route = _path.default.posix.join(dir, `${baseName}${suffix ? `-${suffix}` : ""}${ext}`, isStaticRoute ? "" : "[[...__metadata_id__]]", "route");
    }
    return route;
} //# sourceMappingURL=get-metadata-route.js.map


/***/ }),

/***/ 61982:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    STATIC_METADATA_IMAGES: function() {
        return STATIC_METADATA_IMAGES;
    },
    isMetadataRouteFile: function() {
        return isMetadataRouteFile;
    },
    isStaticMetadataRouteFile: function() {
        return isStaticMetadataRouteFile;
    },
    isMetadataRoute: function() {
        return isMetadataRoute;
    }
});
const _normalizepathsep = __webpack_require__(35888);
const STATIC_METADATA_IMAGES = {
    icon: {
        filename: "icon",
        extensions: [
            "ico",
            "jpg",
            "jpeg",
            "png",
            "svg"
        ]
    },
    apple: {
        filename: "apple-icon",
        extensions: [
            "jpg",
            "jpeg",
            "png"
        ]
    },
    favicon: {
        filename: "favicon",
        extensions: [
            "ico"
        ]
    },
    openGraph: {
        filename: "opengraph-image",
        extensions: [
            "jpg",
            "jpeg",
            "png",
            "gif"
        ]
    },
    twitter: {
        filename: "twitter-image",
        extensions: [
            "jpg",
            "jpeg",
            "png",
            "gif"
        ]
    }
};
// Match routes that are metadata routes, e.g. /sitemap.xml, /favicon.<ext>, /<icon>.<ext>, etc.
// TODO-METADATA: support more metadata routes with more extensions
const defaultExtensions = [
    "js",
    "jsx",
    "ts",
    "tsx"
];
const getExtensionRegexString = (extensions)=>`(?:${extensions.join("|")})`;
function isMetadataRouteFile(appDirRelativePath, pageExtensions, withExtension) {
    const metadataRouteFilesRegex = [
        new RegExp(`^[\\\\/]robots${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat("txt"))}$` : ""}`),
        new RegExp(`^[\\\\/]manifest${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat("webmanifest", "json"))}$` : ""}`),
        new RegExp(`^[\\\\/]favicon\\.ico$`),
        new RegExp(`[\\\\/]sitemap${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat("xml"))}$` : ""}`),
        new RegExp(`[\\\\/]${STATIC_METADATA_IMAGES.icon.filename}\\d?${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat(STATIC_METADATA_IMAGES.icon.extensions))}$` : ""}`),
        new RegExp(`[\\\\/]${STATIC_METADATA_IMAGES.apple.filename}\\d?${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat(STATIC_METADATA_IMAGES.apple.extensions))}$` : ""}`),
        new RegExp(`[\\\\/]${STATIC_METADATA_IMAGES.openGraph.filename}\\d?${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat(STATIC_METADATA_IMAGES.openGraph.extensions))}$` : ""}`),
        new RegExp(`[\\\\/]${STATIC_METADATA_IMAGES.twitter.filename}\\d?${withExtension ? `\\.${getExtensionRegexString(pageExtensions.concat(STATIC_METADATA_IMAGES.twitter.extensions))}$` : ""}`)
    ];
    const normalizedAppDirRelativePath = (0, _normalizepathsep.normalizePathSep)(appDirRelativePath);
    return metadataRouteFilesRegex.some((r)=>r.test(normalizedAppDirRelativePath));
}
function isStaticMetadataRouteFile(appDirRelativePath) {
    return isMetadataRouteFile(appDirRelativePath, [], true);
}
function isMetadataRoute(route) {
    let page = route.replace(/^\/?app\//, "").replace(/\/route$/, "");
    if (page[0] !== "/") page = "/" + page;
    return !page.endsWith("/page") && isMetadataRouteFile(page, defaultExtensions, false);
} //# sourceMappingURL=is-metadata-route.js.map


/***/ }),

/***/ 89773:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "acceptLanguage", ({
    enumerable: true,
    get: function() {
        return acceptLanguage;
    }
}));
function parse(raw, preferences, options) {
    const lowers = new Map();
    const header = raw.replace(/[ \t]/g, "");
    if (preferences) {
        let pos = 0;
        for (const preference of preferences){
            const lower = preference.toLowerCase();
            lowers.set(lower, {
                orig: preference,
                pos: pos++
            });
            if (options.prefixMatch) {
                const parts = lower.split("-");
                while(parts.pop(), parts.length > 0){
                    const joined = parts.join("-");
                    if (!lowers.has(joined)) {
                        lowers.set(joined, {
                            orig: preference,
                            pos: pos++
                        });
                    }
                }
            }
        }
    }
    const parts = header.split(",");
    const selections = [];
    const map = new Set();
    for(let i = 0; i < parts.length; ++i){
        const part = parts[i];
        if (!part) {
            continue;
        }
        const params = part.split(";");
        if (params.length > 2) {
            throw new Error(`Invalid ${options.type} header`);
        }
        let token = params[0].toLowerCase();
        if (!token) {
            throw new Error(`Invalid ${options.type} header`);
        }
        const selection = {
            token,
            pos: i,
            q: 1
        };
        if (preferences && lowers.has(token)) {
            selection.pref = lowers.get(token).pos;
        }
        map.add(selection.token);
        if (params.length === 2) {
            const q = params[1];
            const [key, value] = q.split("=");
            if (!value || key !== "q" && key !== "Q") {
                throw new Error(`Invalid ${options.type} header`);
            }
            const score = parseFloat(value);
            if (score === 0) {
                continue;
            }
            if (Number.isFinite(score) && score <= 1 && score >= 0.001) {
                selection.q = score;
            }
        }
        selections.push(selection);
    }
    selections.sort((a, b)=>{
        if (b.q !== a.q) {
            return b.q - a.q;
        }
        if (b.pref !== a.pref) {
            if (a.pref === undefined) {
                return 1;
            }
            if (b.pref === undefined) {
                return -1;
            }
            return a.pref - b.pref;
        }
        return a.pos - b.pos;
    });
    const values = selections.map((selection)=>selection.token);
    if (!preferences || !preferences.length) {
        return values;
    }
    const preferred = [];
    for (const selection of values){
        if (selection === "*") {
            for (const [preference, value] of lowers){
                if (!map.has(preference)) {
                    preferred.push(value.orig);
                }
            }
        } else {
            const lower = selection.toLowerCase();
            if (lowers.has(lower)) {
                preferred.push(lowers.get(lower).orig);
            }
        }
    }
    return preferred;
}
function acceptLanguage(header = "", preferences) {
    return parse(header, preferences, {
        type: "accept-language",
        prefixMatch: true
    })[0] || "";
} //# sourceMappingURL=accept-header.js.map


/***/ }),

/***/ 95271:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    AppRouter: function() {
        return AppRouter;
    },
    LayoutRouter: function() {
        return LayoutRouter;
    },
    RenderFromTemplateContext: function() {
        return RenderFromTemplateContext;
    },
    staticGenerationAsyncStorage: function() {
        return staticGenerationAsyncStorage;
    },
    requestAsyncStorage: function() {
        return requestAsyncStorage;
    },
    actionAsyncStorage: function() {
        return actionAsyncStorage;
    },
    staticGenerationBailout: function() {
        return staticGenerationBailout;
    },
    createSearchParamsBailoutProxy: function() {
        return createSearchParamsBailoutProxy;
    },
    serverHooks: function() {
        return serverHooks;
    },
    renderToReadableStream: function() {
        return renderToReadableStream;
    },
    decodeReply: function() {
        return decodeReply;
    },
    decodeAction: function() {
        return decodeAction;
    },
    preloadStyle: function() {
        return preloadStyle;
    },
    preloadFont: function() {
        return preloadFont;
    },
    preconnect: function() {
        return preconnect;
    },
    StaticGenerationSearchParamsBailoutProvider: function() {
        return StaticGenerationSearchParamsBailoutProvider;
    },
    NotFoundBoundary: function() {
        return NotFoundBoundary;
    }
});
const { default: AppRouter } = __webpack_require__(10139);
const { default: LayoutRouter } = __webpack_require__(49445);
const { default: RenderFromTemplateContext } = __webpack_require__(35353);
const { staticGenerationAsyncStorage } = __webpack_require__(25589);
const { requestAsyncStorage } = __webpack_require__(32644);
const { actionAsyncStorage } = __webpack_require__(57430);
const { staticGenerationBailout } = __webpack_require__(88650);
const { default: StaticGenerationSearchParamsBailoutProvider } = __webpack_require__(96003);
const { createSearchParamsBailoutProxy } = __webpack_require__(52963);
const serverHooks = __webpack_require__(97372);
const { renderToReadableStream, decodeReply, decodeAction } = __webpack_require__(30518);
const { preloadStyle, preloadFont, preconnect } = __webpack_require__(61227);
const { NotFoundBoundary } = __webpack_require__(77951); //# sourceMappingURL=entry-base.js.map


/***/ }),

/***/ 61227:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";
/*

Files in the rsc directory are meant to be packaged as part of the RSC graph using next-app-loader.

*/ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    preloadStyle: function() {
        return preloadStyle;
    },
    preloadFont: function() {
        return preloadFont;
    },
    preconnect: function() {
        return preconnect;
    }
});
const _reactdom = /*#__PURE__*/ _interop_require_default(__webpack_require__(27596));
function _interop_require_default(obj) {
    return obj && obj.__esModule ? obj : {
        default: obj
    };
}
function preloadStyle(href) {
    _reactdom.default.preload(href, {
        as: "style"
    });
}
function preloadFont(href, type) {
    _reactdom.default.preload(href, {
        as: "font",
        type
    });
}
function preconnect(href, crossOrigin) {
    if (typeof crossOrigin === "string") {
        _reactdom.default.preconnect(href, {
            crossOrigin
        });
    } else {
        _reactdom.default.preconnect(href);
    }
} //# sourceMappingURL=preloads.js.map


/***/ }),

/***/ 66729:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    INTERCEPTION_ROUTE_MARKERS: function() {
        return INTERCEPTION_ROUTE_MARKERS;
    },
    isInterceptionRouteAppPath: function() {
        return isInterceptionRouteAppPath;
    },
    extractInterceptionRouteInformation: function() {
        return extractInterceptionRouteInformation;
    }
});
const _apppaths = __webpack_require__(63587);
const INTERCEPTION_ROUTE_MARKERS = [
    "(..)(..)",
    "(.)",
    "(..)",
    "(...)"
];
function isInterceptionRouteAppPath(path) {
    // TODO-APP: add more serious validation
    return path.split("/").find((segment)=>INTERCEPTION_ROUTE_MARKERS.find((m)=>segment.startsWith(m))) !== undefined;
}
function extractInterceptionRouteInformation(path) {
    let interceptingRoute, marker, interceptedRoute;
    for (const segment of path.split("/")){
        marker = INTERCEPTION_ROUTE_MARKERS.find((m)=>segment.startsWith(m));
        if (marker) {
            [interceptingRoute, interceptedRoute] = path.split(marker, 2);
            break;
        }
    }
    if (!interceptingRoute || !marker || !interceptedRoute) {
        throw new Error(`Invalid interception route: ${path}. Must be in the format /<intercepting route>/(..|...|..)(..)/<intercepted route>`);
    }
    interceptingRoute = (0, _apppaths.normalizeAppPath)(interceptingRoute) // normalize the path, e.g. /(blog)/feed -> /feed
    ;
    switch(marker){
        case "(.)":
            // (.) indicates that we should match with sibling routes, so we just need to append the intercepted route to the intercepting route
            if (interceptingRoute === "/") {
                interceptedRoute = `/${interceptedRoute}`;
            } else {
                interceptedRoute = interceptingRoute + "/" + interceptedRoute;
            }
            break;
        case "(..)":
            // (..) indicates that we should match at one level up, so we need to remove the last segment of the intercepting route
            if (interceptingRoute === "/") {
                throw new Error(`Invalid interception route: ${path}. Cannot use (..) marker at the root level, use (.) instead.`);
            }
            interceptedRoute = interceptingRoute.split("/").slice(0, -1).concat(interceptedRoute).join("/");
            break;
        case "(...)":
            // (...) will match the route segment in the root directory, so we need to use the root directory to prepend the intercepted route
            interceptedRoute = "/" + interceptedRoute;
            break;
        case "(..)(..)":
            // (..)(..) indicates that we should match at two levels up, so we need to remove the last two segments of the intercepting route
            const splitInterceptingRoute = interceptingRoute.split("/");
            if (splitInterceptingRoute.length <= 2) {
                throw new Error(`Invalid interception route: ${path}. Cannot use (..)(..) marker at the root level or one level up.`);
            }
            interceptedRoute = splitInterceptingRoute.slice(0, -2).concat(interceptedRoute).join("/");
            break;
        default:
            throw new Error("Invariant: unexpected marker");
    }
    return {
        interceptingRoute,
        interceptedRoute
    };
} //# sourceMappingURL=interception-routes.js.map


/***/ }),

/***/ 54424:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    AppPageRouteModule: function() {
        return AppPageRouteModule;
    },
    default: function() {
        return _default;
    }
});
const _apprender = __webpack_require__(5868);
const _routemodule = __webpack_require__(75281);
class AppPageRouteModule extends _routemodule.RouteModule {
    render(req, res, context) {
        return (0, _apprender.renderToHTMLOrFlight)(req, res, context.page, context.query, context.renderOpts);
    }
}
const _default = AppPageRouteModule; //# sourceMappingURL=module.js.map


/***/ }),

/***/ 58269:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
/* eslint-disable no-redeclare */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    NEXT_REQUEST_META: function() {
        return NEXT_REQUEST_META;
    },
    getRequestMeta: function() {
        return getRequestMeta;
    },
    setRequestMeta: function() {
        return setRequestMeta;
    },
    addRequestMeta: function() {
        return addRequestMeta;
    },
    removeRequestMeta: function() {
        return removeRequestMeta;
    },
    getNextInternalQuery: function() {
        return getNextInternalQuery;
    }
});
const NEXT_REQUEST_META = Symbol.for("NextInternalRequestMeta");
function getRequestMeta(req, key) {
    const meta = req[NEXT_REQUEST_META] || {};
    return typeof key === "string" ? meta[key] : meta;
}
function setRequestMeta(req, meta) {
    req[NEXT_REQUEST_META] = meta;
    return meta;
}
function addRequestMeta(request, key, value) {
    const meta = getRequestMeta(request);
    meta[key] = value;
    return setRequestMeta(request, meta);
}
function removeRequestMeta(request, key) {
    const meta = getRequestMeta(request);
    delete meta[key];
    return setRequestMeta(request, meta);
}
function getNextInternalQuery(query) {
    const keysToInclude = [
        "__nextDefaultLocale",
        "__nextFallback",
        "__nextLocale",
        "__nextSsgPath",
        "_nextBubbleNoFallback",
        "__nextDataReq",
        "__nextInferredLocaleFromDefault"
    ];
    const nextInternalQuery = {};
    for (const key of keysToInclude){
        if (key in query) {
            // @ts-ignore this can't be typed correctly
            nextInternalQuery[key] = query[key];
        }
    }
    return nextInternalQuery;
} //# sourceMappingURL=request-meta.js.map


/***/ }),

/***/ 63066:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    normalizeVercelUrl: function() {
        return normalizeVercelUrl;
    },
    interpolateDynamicPath: function() {
        return interpolateDynamicPath;
    },
    getUtils: function() {
        return getUtils;
    }
});
const _url = __webpack_require__(57310);
const _normalizelocalepath = __webpack_require__(55461);
const _pathmatch = __webpack_require__(76338);
const _routeregex = __webpack_require__(22251);
const _routematcher = __webpack_require__(15665);
const _preparedestination = __webpack_require__(74862);
const _acceptheader = __webpack_require__(89773);
const _detectlocalecookie = __webpack_require__(69396);
const _detectdomainlocale = __webpack_require__(13932);
const _denormalizepagepath = __webpack_require__(76579);
const _cookie = /*#__PURE__*/ _interop_require_default(__webpack_require__(32812));
const _constants = __webpack_require__(91441);
const _requestmeta = __webpack_require__(58269);
const _removetrailingslash = __webpack_require__(25331);
const _apppaths = __webpack_require__(63587);
const _constants1 = __webpack_require__(21973);
function _interop_require_default(obj) {
    return obj && obj.__esModule ? obj : {
        default: obj
    };
}
function normalizeVercelUrl(req, trustQuery, paramKeys, pageIsDynamic, defaultRouteRegex) {
    // make sure to normalize req.url on Vercel to strip dynamic params
    // from the query which are added during routing
    if (pageIsDynamic && trustQuery && defaultRouteRegex) {
        const _parsedUrl = (0, _url.parse)(req.url, true);
        delete _parsedUrl.search;
        for (const key of Object.keys(_parsedUrl.query)){
            if (key !== _constants1.NEXT_QUERY_PARAM_PREFIX && key.startsWith(_constants1.NEXT_QUERY_PARAM_PREFIX) || (paramKeys || Object.keys(defaultRouteRegex.groups)).includes(key)) {
                delete _parsedUrl.query[key];
            }
        }
        req.url = (0, _url.format)(_parsedUrl);
    }
}
function interpolateDynamicPath(pathname, params, defaultRouteRegex) {
    if (!defaultRouteRegex) return pathname;
    for (const param of Object.keys(defaultRouteRegex.groups)){
        const { optional, repeat } = defaultRouteRegex.groups[param];
        let builtParam = `[${repeat ? "..." : ""}${param}]`;
        if (optional) {
            builtParam = `[${builtParam}]`;
        }
        const paramIdx = pathname.indexOf(builtParam);
        if (paramIdx > -1) {
            let paramValue;
            const value = params[param];
            if (Array.isArray(value)) {
                paramValue = value.map((v)=>v && encodeURIComponent(v)).join("/");
            } else if (value) {
                paramValue = encodeURIComponent(value);
            } else {
                paramValue = "";
            }
            pathname = pathname.slice(0, paramIdx) + paramValue + pathname.slice(paramIdx + builtParam.length);
        }
    }
    return pathname;
}
function getUtils({ page, i18n, basePath, rewrites, pageIsDynamic, trailingSlash, caseSensitive }) {
    let defaultRouteRegex;
    let dynamicRouteMatcher;
    let defaultRouteMatches;
    if (pageIsDynamic) {
        defaultRouteRegex = (0, _routeregex.getNamedRouteRegex)(page, false);
        dynamicRouteMatcher = (0, _routematcher.getRouteMatcher)(defaultRouteRegex);
        defaultRouteMatches = dynamicRouteMatcher(page);
    }
    function handleRewrites(req, parsedUrl) {
        const rewriteParams = {};
        let fsPathname = parsedUrl.pathname;
        const matchesPage = ()=>{
            const fsPathnameNoSlash = (0, _removetrailingslash.removeTrailingSlash)(fsPathname || "");
            return fsPathnameNoSlash === (0, _removetrailingslash.removeTrailingSlash)(page) || (dynamicRouteMatcher == null ? void 0 : dynamicRouteMatcher(fsPathnameNoSlash));
        };
        const checkRewrite = (rewrite)=>{
            const matcher = (0, _pathmatch.getPathMatch)(rewrite.source + (trailingSlash ? "(/)?" : ""), {
                removeUnnamedParams: true,
                strict: true,
                sensitive: !!caseSensitive
            });
            let params = matcher(parsedUrl.pathname);
            if ((rewrite.has || rewrite.missing) && params) {
                const hasParams = (0, _preparedestination.matchHas)(req, parsedUrl.query, rewrite.has, rewrite.missing);
                if (hasParams) {
                    Object.assign(params, hasParams);
                } else {
                    params = false;
                }
            }
            if (params) {
                const { parsedDestination, destQuery } = (0, _preparedestination.prepareDestination)({
                    appendParamsToQuery: true,
                    destination: rewrite.destination,
                    params: params,
                    query: parsedUrl.query
                });
                // if the rewrite destination is external break rewrite chain
                if (parsedDestination.protocol) {
                    return true;
                }
                Object.assign(rewriteParams, destQuery, params);
                Object.assign(parsedUrl.query, parsedDestination.query);
                delete parsedDestination.query;
                Object.assign(parsedUrl, parsedDestination);
                fsPathname = parsedUrl.pathname;
                if (basePath) {
                    fsPathname = fsPathname.replace(new RegExp(`^${basePath}`), "") || "/";
                }
                if (i18n) {
                    const destLocalePathResult = (0, _normalizelocalepath.normalizeLocalePath)(fsPathname, i18n.locales);
                    fsPathname = destLocalePathResult.pathname;
                    parsedUrl.query.nextInternalLocale = destLocalePathResult.detectedLocale || params.nextInternalLocale;
                }
                if (fsPathname === page) {
                    return true;
                }
                if (pageIsDynamic && dynamicRouteMatcher) {
                    const dynamicParams = dynamicRouteMatcher(fsPathname);
                    if (dynamicParams) {
                        parsedUrl.query = {
                            ...parsedUrl.query,
                            ...dynamicParams
                        };
                        return true;
                    }
                }
            }
            return false;
        };
        for (const rewrite of rewrites.beforeFiles || []){
            checkRewrite(rewrite);
        }
        if (fsPathname !== page) {
            let finished = false;
            for (const rewrite of rewrites.afterFiles || []){
                finished = checkRewrite(rewrite);
                if (finished) break;
            }
            if (!finished && !matchesPage()) {
                for (const rewrite of rewrites.fallback || []){
                    finished = checkRewrite(rewrite);
                    if (finished) break;
                }
            }
        }
        return rewriteParams;
    }
    function handleBasePath(req, parsedUrl) {
        // always strip the basePath if configured since it is required
        req.url = req.url.replace(new RegExp(`^${basePath}`), "") || "/";
        parsedUrl.pathname = parsedUrl.pathname.replace(new RegExp(`^${basePath}`), "") || "/";
    }
    function getParamsFromRouteMatches(req, renderOpts, detectedLocale) {
        return (0, _routematcher.getRouteMatcher)(function() {
            const { groups, routeKeys } = defaultRouteRegex;
            return {
                re: {
                    // Simulate a RegExp match from the \`req.url\` input
                    exec: (str)=>{
                        const obj = Object.fromEntries(new URLSearchParams(str));
                        const matchesHasLocale = i18n && detectedLocale && obj["1"] === detectedLocale;
                        for (const key of Object.keys(obj)){
                            const value = obj[key];
                            if (key !== _constants1.NEXT_QUERY_PARAM_PREFIX && key.startsWith(_constants1.NEXT_QUERY_PARAM_PREFIX)) {
                                const normalizedKey = key.substring(_constants1.NEXT_QUERY_PARAM_PREFIX.length);
                                obj[normalizedKey] = value;
                                delete obj[key];
                            }
                        }
                        // favor named matches if available
                        const routeKeyNames = Object.keys(routeKeys || {});
                        const filterLocaleItem = (val)=>{
                            if (i18n) {
                                // locale items can be included in route-matches
                                // for fallback SSG pages so ensure they are
                                // filtered
                                const isCatchAll = Array.isArray(val);
                                const _val = isCatchAll ? val[0] : val;
                                if (typeof _val === "string" && i18n.locales.some((item)=>{
                                    if (item.toLowerCase() === _val.toLowerCase()) {
                                        detectedLocale = item;
                                        renderOpts.locale = detectedLocale;
                                        return true;
                                    }
                                    return false;
                                })) {
                                    // remove the locale item from the match
                                    if (isCatchAll) {
                                        val.splice(0, 1);
                                    }
                                    // the value is only a locale item and
                                    // shouldn't be added
                                    return isCatchAll ? val.length === 0 : true;
                                }
                            }
                            return false;
                        };
                        if (routeKeyNames.every((name)=>obj[name])) {
                            return routeKeyNames.reduce((prev, keyName)=>{
                                const paramName = routeKeys == null ? void 0 : routeKeys[keyName];
                                if (paramName && !filterLocaleItem(obj[keyName])) {
                                    prev[groups[paramName].pos] = obj[keyName];
                                }
                                return prev;
                            }, {});
                        }
                        return Object.keys(obj).reduce((prev, key)=>{
                            if (!filterLocaleItem(obj[key])) {
                                let normalizedKey = key;
                                if (matchesHasLocale) {
                                    normalizedKey = parseInt(key, 10) - 1 + "";
                                }
                                return Object.assign(prev, {
                                    [normalizedKey]: obj[key]
                                });
                            }
                            return prev;
                        }, {});
                    }
                },
                groups
            };
        }())(req.headers["x-now-route-matches"]);
    }
    function normalizeDynamicRouteParams(params, ignoreOptional) {
        let hasValidParams = true;
        if (!defaultRouteRegex) return {
            params,
            hasValidParams: false
        };
        params = Object.keys(defaultRouteRegex.groups).reduce((prev, key)=>{
            let value = params[key];
            if (typeof value === "string") {
                value = (0, _apppaths.normalizeRscPath)(value, true);
            }
            if (Array.isArray(value)) {
                value = value.map((val)=>{
                    if (typeof val === "string") {
                        val = (0, _apppaths.normalizeRscPath)(val, true);
                    }
                    return val;
                });
            }
            // if the value matches the default value we can't rely
            // on the parsed params, this is used to signal if we need
            // to parse x-now-route-matches or not
            const defaultValue = defaultRouteMatches[key];
            const isOptional = defaultRouteRegex.groups[key].optional;
            const isDefaultValue = Array.isArray(defaultValue) ? defaultValue.some((defaultVal)=>{
                return Array.isArray(value) ? value.some((val)=>val.includes(defaultVal)) : value == null ? void 0 : value.includes(defaultVal);
            }) : value == null ? void 0 : value.includes(defaultValue);
            if (isDefaultValue || typeof value === "undefined" && !(isOptional && ignoreOptional)) {
                hasValidParams = false;
            }
            // non-provided optional values should be undefined so normalize
            // them to undefined
            if (isOptional && (!value || Array.isArray(value) && value.length === 1 && // fallback optional catch-all SSG pages have
            // [[...paramName]] for the root path on Vercel
            (value[0] === "index" || value[0] === `[[...${key}]]`))) {
                value = undefined;
                delete params[key];
            }
            // query values from the proxy aren't already split into arrays
            // so make sure to normalize catch-all values
            if (value && typeof value === "string" && defaultRouteRegex.groups[key].repeat) {
                value = value.split("/");
            }
            if (value) {
                prev[key] = value;
            }
            return prev;
        }, {});
        return {
            params,
            hasValidParams
        };
    }
    function handleLocale(req, res, parsedUrl, routeNoAssetPath, shouldNotRedirect) {
        if (!i18n) return;
        const pathname = parsedUrl.pathname || "/";
        let defaultLocale = i18n.defaultLocale;
        let detectedLocale = (0, _detectlocalecookie.detectLocaleCookie)(req, i18n.locales);
        let acceptPreferredLocale;
        try {
            acceptPreferredLocale = i18n.localeDetection !== false ? (0, _acceptheader.acceptLanguage)(req.headers["accept-language"], i18n.locales) : detectedLocale;
        } catch (_) {
            acceptPreferredLocale = detectedLocale;
        }
        const { host } = req.headers || {};
        // remove port from host and remove port if present
        const hostname = host && host.split(":")[0].toLowerCase();
        const detectedDomain = (0, _detectdomainlocale.detectDomainLocale)(i18n.domains, hostname);
        if (detectedDomain) {
            defaultLocale = detectedDomain.defaultLocale;
            detectedLocale = defaultLocale;
            (0, _requestmeta.addRequestMeta)(req, "__nextIsLocaleDomain", true);
        }
        // if not domain specific locale use accept-language preferred
        detectedLocale = detectedLocale || acceptPreferredLocale;
        let localeDomainRedirect;
        const localePathResult = (0, _normalizelocalepath.normalizeLocalePath)(pathname, i18n.locales);
        routeNoAssetPath = (0, _normalizelocalepath.normalizeLocalePath)(routeNoAssetPath, i18n.locales).pathname;
        if (localePathResult.detectedLocale) {
            detectedLocale = localePathResult.detectedLocale;
            req.url = (0, _url.format)({
                ...parsedUrl,
                pathname: localePathResult.pathname
            });
            (0, _requestmeta.addRequestMeta)(req, "__nextStrippedLocale", true);
            parsedUrl.pathname = localePathResult.pathname;
        }
        // If a detected locale is a domain specific locale and we aren't already
        // on that domain and path prefix redirect to it to prevent duplicate
        // content from multiple domains
        if (detectedDomain) {
            const localeToCheck = localePathResult.detectedLocale ? detectedLocale : acceptPreferredLocale;
            const matchedDomain = (0, _detectdomainlocale.detectDomainLocale)(i18n.domains, undefined, localeToCheck);
            if (matchedDomain && matchedDomain.domain !== detectedDomain.domain) {
                localeDomainRedirect = `http${matchedDomain.http ? "" : "s"}://${matchedDomain.domain}/${localeToCheck === matchedDomain.defaultLocale ? "" : localeToCheck}`;
            }
        }
        const denormalizedPagePath = (0, _denormalizepagepath.denormalizePagePath)(pathname);
        const detectedDefaultLocale = !detectedLocale || detectedLocale.toLowerCase() === defaultLocale.toLowerCase();
        const shouldStripDefaultLocale = false;
        // detectedDefaultLocale &&
        // denormalizedPagePath.toLowerCase() === \`/\${i18n.defaultLocale.toLowerCase()}\`
        const shouldAddLocalePrefix = !detectedDefaultLocale && denormalizedPagePath === "/";
        detectedLocale = detectedLocale || i18n.defaultLocale;
        if (!shouldNotRedirect && !req.headers["x-vercel-id"] && i18n.localeDetection !== false && (localeDomainRedirect || shouldAddLocalePrefix || shouldStripDefaultLocale)) {
            // set the NEXT_LOCALE cookie when a user visits the default locale
            // with the locale prefix so that they aren't redirected back to
            // their accept-language preferred locale
            if (shouldStripDefaultLocale && acceptPreferredLocale !== defaultLocale) {
                const previous = res.getHeader("set-cookie");
                res.setHeader("set-cookie", [
                    ...typeof previous === "string" ? [
                        previous
                    ] : Array.isArray(previous) ? previous : [],
                    _cookie.default.serialize("NEXT_LOCALE", defaultLocale, {
                        httpOnly: true,
                        path: "/"
                    })
                ]);
            }
            res.setHeader("Location", (0, _url.format)({
                // make sure to include any query values when redirecting
                ...parsedUrl,
                pathname: localeDomainRedirect ? localeDomainRedirect : shouldStripDefaultLocale ? basePath || "/" : `${basePath}/${detectedLocale}`
            }));
            res.statusCode = _constants.TEMPORARY_REDIRECT_STATUS;
            res.end();
            return;
        }
        detectedLocale = localePathResult.detectedLocale || detectedDomain && detectedDomain.defaultLocale || defaultLocale;
        return {
            defaultLocale,
            detectedLocale,
            routeNoAssetPath
        };
    }
    return {
        handleLocale,
        handleRewrites,
        handleBasePath,
        defaultRouteRegex,
        dynamicRouteMatcher,
        defaultRouteMatches,
        getParamsFromRouteMatches,
        normalizeDynamicRouteParams,
        normalizeVercelUrl: (req, trustQuery, paramKeys)=>normalizeVercelUrl(req, trustQuery, paramKeys, pageIsDynamic, defaultRouteRegex),
        interpolateDynamicPath: (pathname, params)=>interpolateDynamicPath(pathname, params, defaultRouteRegex)
    };
} //# sourceMappingURL=server-utils.js.map


/***/ }),

/***/ 91441:
/***/ ((module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    MODERN_BROWSERSLIST_TARGET: function() {
        return _modernbrowserslisttarget.default;
    },
    COMPILER_NAMES: function() {
        return COMPILER_NAMES;
    },
    COMPILER_INDEXES: function() {
        return COMPILER_INDEXES;
    },
    PHASE_EXPORT: function() {
        return PHASE_EXPORT;
    },
    PHASE_PRODUCTION_BUILD: function() {
        return PHASE_PRODUCTION_BUILD;
    },
    PHASE_PRODUCTION_SERVER: function() {
        return PHASE_PRODUCTION_SERVER;
    },
    PHASE_DEVELOPMENT_SERVER: function() {
        return PHASE_DEVELOPMENT_SERVER;
    },
    PHASE_TEST: function() {
        return PHASE_TEST;
    },
    PHASE_INFO: function() {
        return PHASE_INFO;
    },
    PAGES_MANIFEST: function() {
        return PAGES_MANIFEST;
    },
    APP_PATHS_MANIFEST: function() {
        return APP_PATHS_MANIFEST;
    },
    APP_PATH_ROUTES_MANIFEST: function() {
        return APP_PATH_ROUTES_MANIFEST;
    },
    BUILD_MANIFEST: function() {
        return BUILD_MANIFEST;
    },
    APP_BUILD_MANIFEST: function() {
        return APP_BUILD_MANIFEST;
    },
    FUNCTIONS_CONFIG_MANIFEST: function() {
        return FUNCTIONS_CONFIG_MANIFEST;
    },
    SUBRESOURCE_INTEGRITY_MANIFEST: function() {
        return SUBRESOURCE_INTEGRITY_MANIFEST;
    },
    NEXT_FONT_MANIFEST: function() {
        return NEXT_FONT_MANIFEST;
    },
    EXPORT_MARKER: function() {
        return EXPORT_MARKER;
    },
    EXPORT_DETAIL: function() {
        return EXPORT_DETAIL;
    },
    PRERENDER_MANIFEST: function() {
        return PRERENDER_MANIFEST;
    },
    ROUTES_MANIFEST: function() {
        return ROUTES_MANIFEST;
    },
    IMAGES_MANIFEST: function() {
        return IMAGES_MANIFEST;
    },
    SERVER_FILES_MANIFEST: function() {
        return SERVER_FILES_MANIFEST;
    },
    DEV_CLIENT_PAGES_MANIFEST: function() {
        return DEV_CLIENT_PAGES_MANIFEST;
    },
    MIDDLEWARE_MANIFEST: function() {
        return MIDDLEWARE_MANIFEST;
    },
    DEV_MIDDLEWARE_MANIFEST: function() {
        return DEV_MIDDLEWARE_MANIFEST;
    },
    REACT_LOADABLE_MANIFEST: function() {
        return REACT_LOADABLE_MANIFEST;
    },
    FONT_MANIFEST: function() {
        return FONT_MANIFEST;
    },
    SERVER_DIRECTORY: function() {
        return SERVER_DIRECTORY;
    },
    CONFIG_FILES: function() {
        return CONFIG_FILES;
    },
    BUILD_ID_FILE: function() {
        return BUILD_ID_FILE;
    },
    BLOCKED_PAGES: function() {
        return BLOCKED_PAGES;
    },
    CLIENT_PUBLIC_FILES_PATH: function() {
        return CLIENT_PUBLIC_FILES_PATH;
    },
    CLIENT_STATIC_FILES_PATH: function() {
        return CLIENT_STATIC_FILES_PATH;
    },
    CLIENT_STATIC_FILES_RUNTIME: function() {
        return CLIENT_STATIC_FILES_RUNTIME;
    },
    STRING_LITERAL_DROP_BUNDLE: function() {
        return STRING_LITERAL_DROP_BUNDLE;
    },
    NEXT_BUILTIN_DOCUMENT: function() {
        return NEXT_BUILTIN_DOCUMENT;
    },
    NEXT_CLIENT_SSR_ENTRY_SUFFIX: function() {
        return NEXT_CLIENT_SSR_ENTRY_SUFFIX;
    },
    CLIENT_REFERENCE_MANIFEST: function() {
        return CLIENT_REFERENCE_MANIFEST;
    },
    SERVER_REFERENCE_MANIFEST: function() {
        return SERVER_REFERENCE_MANIFEST;
    },
    MIDDLEWARE_BUILD_MANIFEST: function() {
        return MIDDLEWARE_BUILD_MANIFEST;
    },
    MIDDLEWARE_REACT_LOADABLE_MANIFEST: function() {
        return MIDDLEWARE_REACT_LOADABLE_MANIFEST;
    },
    CLIENT_STATIC_FILES_RUNTIME_MAIN: function() {
        return CLIENT_STATIC_FILES_RUNTIME_MAIN;
    },
    CLIENT_STATIC_FILES_RUNTIME_MAIN_APP: function() {
        return CLIENT_STATIC_FILES_RUNTIME_MAIN_APP;
    },
    APP_CLIENT_INTERNALS: function() {
        return APP_CLIENT_INTERNALS;
    },
    CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH: function() {
        return CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH;
    },
    CLIENT_STATIC_FILES_RUNTIME_AMP: function() {
        return CLIENT_STATIC_FILES_RUNTIME_AMP;
    },
    CLIENT_STATIC_FILES_RUNTIME_WEBPACK: function() {
        return CLIENT_STATIC_FILES_RUNTIME_WEBPACK;
    },
    CLIENT_STATIC_FILES_RUNTIME_POLYFILLS: function() {
        return CLIENT_STATIC_FILES_RUNTIME_POLYFILLS;
    },
    CLIENT_STATIC_FILES_RUNTIME_POLYFILLS_SYMBOL: function() {
        return CLIENT_STATIC_FILES_RUNTIME_POLYFILLS_SYMBOL;
    },
    EDGE_RUNTIME_WEBPACK: function() {
        return EDGE_RUNTIME_WEBPACK;
    },
    TEMPORARY_REDIRECT_STATUS: function() {
        return TEMPORARY_REDIRECT_STATUS;
    },
    PERMANENT_REDIRECT_STATUS: function() {
        return PERMANENT_REDIRECT_STATUS;
    },
    STATIC_PROPS_ID: function() {
        return STATIC_PROPS_ID;
    },
    SERVER_PROPS_ID: function() {
        return SERVER_PROPS_ID;
    },
    PAGE_SEGMENT_KEY: function() {
        return PAGE_SEGMENT_KEY;
    },
    GOOGLE_FONT_PROVIDER: function() {
        return GOOGLE_FONT_PROVIDER;
    },
    OPTIMIZED_FONT_PROVIDERS: function() {
        return OPTIMIZED_FONT_PROVIDERS;
    },
    DEFAULT_SERIF_FONT: function() {
        return DEFAULT_SERIF_FONT;
    },
    DEFAULT_SANS_SERIF_FONT: function() {
        return DEFAULT_SANS_SERIF_FONT;
    },
    STATIC_STATUS_PAGES: function() {
        return STATIC_STATUS_PAGES;
    },
    TRACE_OUTPUT_VERSION: function() {
        return TRACE_OUTPUT_VERSION;
    },
    TURBO_TRACE_DEFAULT_MEMORY_LIMIT: function() {
        return TURBO_TRACE_DEFAULT_MEMORY_LIMIT;
    },
    RSC_MODULE_TYPES: function() {
        return RSC_MODULE_TYPES;
    },
    EDGE_UNSUPPORTED_NODE_APIS: function() {
        return EDGE_UNSUPPORTED_NODE_APIS;
    },
    SYSTEM_ENTRYPOINTS: function() {
        return SYSTEM_ENTRYPOINTS;
    }
});
const _interop_require_default = __webpack_require__(34088);
const _modernbrowserslisttarget = /*#__PURE__*/ _interop_require_default._(__webpack_require__(66990));
const COMPILER_NAMES = {
    client: "client",
    server: "server",
    edgeServer: "edge-server"
};
const COMPILER_INDEXES = {
    [COMPILER_NAMES.client]: 0,
    [COMPILER_NAMES.server]: 1,
    [COMPILER_NAMES.edgeServer]: 2
};
const PHASE_EXPORT = "phase-export";
const PHASE_PRODUCTION_BUILD = "phase-production-build";
const PHASE_PRODUCTION_SERVER = "phase-production-server";
const PHASE_DEVELOPMENT_SERVER = "phase-development-server";
const PHASE_TEST = "phase-test";
const PHASE_INFO = "phase-info";
const PAGES_MANIFEST = "pages-manifest.json";
const APP_PATHS_MANIFEST = "app-paths-manifest.json";
const APP_PATH_ROUTES_MANIFEST = "app-path-routes-manifest.json";
const BUILD_MANIFEST = "build-manifest.json";
const APP_BUILD_MANIFEST = "app-build-manifest.json";
const FUNCTIONS_CONFIG_MANIFEST = "functions-config-manifest.json";
const SUBRESOURCE_INTEGRITY_MANIFEST = "subresource-integrity-manifest";
const NEXT_FONT_MANIFEST = "next-font-manifest";
const EXPORT_MARKER = "export-marker.json";
const EXPORT_DETAIL = "export-detail.json";
const PRERENDER_MANIFEST = "prerender-manifest.json";
const ROUTES_MANIFEST = "routes-manifest.json";
const IMAGES_MANIFEST = "images-manifest.json";
const SERVER_FILES_MANIFEST = "required-server-files.json";
const DEV_CLIENT_PAGES_MANIFEST = "_devPagesManifest.json";
const MIDDLEWARE_MANIFEST = "middleware-manifest.json";
const DEV_MIDDLEWARE_MANIFEST = "_devMiddlewareManifest.json";
const REACT_LOADABLE_MANIFEST = "react-loadable-manifest.json";
const FONT_MANIFEST = "font-manifest.json";
const SERVER_DIRECTORY = "server";
const CONFIG_FILES = [
    "next.config.js",
    "next.config.mjs"
];
const BUILD_ID_FILE = "BUILD_ID";
const BLOCKED_PAGES = [
    "/_document",
    "/_app",
    "/_error"
];
const CLIENT_PUBLIC_FILES_PATH = "public";
const CLIENT_STATIC_FILES_PATH = "static";
const CLIENT_STATIC_FILES_RUNTIME = "runtime";
const STRING_LITERAL_DROP_BUNDLE = "__NEXT_DROP_CLIENT_FILE__";
const NEXT_BUILTIN_DOCUMENT = "__NEXT_BUILTIN_DOCUMENT__";
const NEXT_CLIENT_SSR_ENTRY_SUFFIX = ".__ssr__";
const CLIENT_REFERENCE_MANIFEST = "client-reference-manifest";
const SERVER_REFERENCE_MANIFEST = "server-reference-manifest";
const MIDDLEWARE_BUILD_MANIFEST = "middleware-build-manifest";
const MIDDLEWARE_REACT_LOADABLE_MANIFEST = "middleware-react-loadable-manifest";
const CLIENT_STATIC_FILES_RUNTIME_MAIN = "main";
const CLIENT_STATIC_FILES_RUNTIME_MAIN_APP = "" + CLIENT_STATIC_FILES_RUNTIME_MAIN + "-app";
const APP_CLIENT_INTERNALS = "app-pages-internals";
const CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH = "react-refresh";
const CLIENT_STATIC_FILES_RUNTIME_AMP = "amp";
const CLIENT_STATIC_FILES_RUNTIME_WEBPACK = "webpack";
const CLIENT_STATIC_FILES_RUNTIME_POLYFILLS = "polyfills";
const CLIENT_STATIC_FILES_RUNTIME_POLYFILLS_SYMBOL = Symbol(CLIENT_STATIC_FILES_RUNTIME_POLYFILLS);
const EDGE_RUNTIME_WEBPACK = "edge-runtime-webpack";
const TEMPORARY_REDIRECT_STATUS = 307;
const PERMANENT_REDIRECT_STATUS = 308;
const STATIC_PROPS_ID = "__N_SSG";
const SERVER_PROPS_ID = "__N_SSP";
const PAGE_SEGMENT_KEY = "__PAGE__";
const GOOGLE_FONT_PROVIDER = "https://fonts.googleapis.com/";
const OPTIMIZED_FONT_PROVIDERS = [
    {
        url: GOOGLE_FONT_PROVIDER,
        preconnect: "https://fonts.gstatic.com"
    },
    {
        url: "https://use.typekit.net",
        preconnect: "https://use.typekit.net"
    }
];
const DEFAULT_SERIF_FONT = {
    name: "Times New Roman",
    xAvgCharWidth: 821,
    azAvgWidth: 854.3953488372093,
    unitsPerEm: 2048
};
const DEFAULT_SANS_SERIF_FONT = {
    name: "Arial",
    xAvgCharWidth: 904,
    azAvgWidth: 934.5116279069767,
    unitsPerEm: 2048
};
const STATIC_STATUS_PAGES = [
    "/500"
];
const TRACE_OUTPUT_VERSION = 1;
const TURBO_TRACE_DEFAULT_MEMORY_LIMIT = 6000;
const RSC_MODULE_TYPES = {
    client: "client",
    server: "server"
};
const EDGE_UNSUPPORTED_NODE_APIS = [
    "clearImmediate",
    "setImmediate",
    "BroadcastChannel",
    "ByteLengthQueuingStrategy",
    "CompressionStream",
    "CountQueuingStrategy",
    "DecompressionStream",
    "DomException",
    "MessageChannel",
    "MessageEvent",
    "MessagePort",
    "ReadableByteStreamController",
    "ReadableStreamBYOBRequest",
    "ReadableStreamDefaultController",
    "TransformStreamDefaultController",
    "WritableStreamDefaultController"
];
const SYSTEM_ENTRYPOINTS = new Set([
    CLIENT_STATIC_FILES_RUNTIME_MAIN,
    CLIENT_STATIC_FILES_RUNTIME_REACT_REFRESH,
    CLIENT_STATIC_FILES_RUNTIME_AMP,
    CLIENT_STATIC_FILES_RUNTIME_MAIN_APP
]);
if ((typeof exports.default === "function" || typeof exports.default === "object" && exports.default !== null) && typeof exports.default.__esModule === "undefined") {
    Object.defineProperty(exports.default, "__esModule", {
        value: true
    });
    Object.assign(exports.default, exports);
    module.exports = exports.default;
} //# sourceMappingURL=constants.js.map


/***/ }),

/***/ 6479:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
// regexp is based on https://github.com/sindresorhus/escape-string-regexp

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "escapeStringRegexp", ({
    enumerable: true,
    get: function() {
        return escapeStringRegexp;
    }
}));
const reHasRegExp = /[|\\{}()[\]^$+*?.-]/;
const reReplaceRegExp = /[|\\{}()[\]^$+*?.-]/g;
function escapeStringRegexp(str) {
    // see also: https://github.com/lodash/lodash/blob/2da024c3b4f9947a48517639de7560457cd4ec6c/escapeRegExp.js#L23
    if (reHasRegExp.test(str)) {
        return str.replace(reReplaceRegExp, "\\$&");
    }
    return str;
} //# sourceMappingURL=escape-regexp.js.map


/***/ }),

/***/ 69341:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
// http://www.cse.yorku.ca/~oz/hash.html

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    djb2Hash: function() {
        return djb2Hash;
    },
    hexHash: function() {
        return hexHash;
    }
});
function djb2Hash(str) {
    let hash = 5381;
    for(let i = 0; i < str.length; i++){
        const char = str.charCodeAt(i);
        hash = (hash << 5) + hash + char;
    }
    return Math.abs(hash);
}
function hexHash(str) {
    return djb2Hash(str).toString(36).slice(0, 5);
} //# sourceMappingURL=hash.js.map


/***/ }),

/***/ 69396:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "detectLocaleCookie", ({
    enumerable: true,
    get: function() {
        return detectLocaleCookie;
    }
}));
function detectLocaleCookie(req, locales) {
    const { NEXT_LOCALE } = req.cookies || {};
    return NEXT_LOCALE ? locales.find((locale)=>NEXT_LOCALE.toLowerCase() === locale.toLowerCase()) : undefined;
} //# sourceMappingURL=detect-locale-cookie.js.map


/***/ }),

/***/ 58317:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/**
 * This module is for next.js server internal usage of path module.
 * It will use native path module for nodejs runtime.
 * It will use path-browserify polyfill for edge runtime.
 */ 
let path;
if (false) {} else {
    path = __webpack_require__(71017);
}
module.exports = path; //# sourceMappingURL=path.js.map


/***/ }),

/***/ 66990:
/***/ ((module) => {

"use strict";
// Note: This file is JS because it's used by the taskfile-swc.js file, which is JS.
// Keep file changes in sync with the corresponding `.d.ts` files.
/**
 * These are the browser versions that support all of the following:
 * static import: https://caniuse.com/es6-module
 * dynamic import: https://caniuse.com/es6-module-dynamic-import
 * import.meta: https://caniuse.com/mdn-javascript_operators_import_meta
 */ 
const MODERN_BROWSERSLIST_TARGET = [
    "chrome 64",
    "edge 79",
    "firefox 67",
    "opera 51",
    "safari 12"
];
module.exports = MODERN_BROWSERSLIST_TARGET; //# sourceMappingURL=modern-browserslist-target.js.map


/***/ }),

/***/ 76579:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "denormalizePagePath", ({
    enumerable: true,
    get: function() {
        return denormalizePagePath;
    }
}));
const _utils = __webpack_require__(98250);
const _normalizepathsep = __webpack_require__(35888);
function denormalizePagePath(page) {
    let _page = (0, _normalizepathsep.normalizePathSep)(page);
    return _page.startsWith("/index/") && !(0, _utils.isDynamicRoute)(_page) ? _page.slice(6) : _page !== "/index" ? _page : "/";
} //# sourceMappingURL=denormalize-page-path.js.map


/***/ }),

/***/ 59486:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
/**
 * For a given page path, this function ensures that there is a leading slash.
 * If there is not a leading slash, one is added, otherwise it is noop.
 */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "ensureLeadingSlash", ({
    enumerable: true,
    get: function() {
        return ensureLeadingSlash;
    }
}));
function ensureLeadingSlash(path) {
    return path.startsWith("/") ? path : "/" + path;
} //# sourceMappingURL=ensure-leading-slash.js.map


/***/ }),

/***/ 35888:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
/**
 * For a given page path, this function ensures that there is no backslash
 * escaping slashes in the path. Example:
 *  - `foo\/bar\/baz` -> `foo/bar/baz`
 */ 
Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "normalizePathSep", ({
    enumerable: true,
    get: function() {
        return normalizePathSep;
    }
}));
function normalizePathSep(path) {
    return path.replace(/\\/g, "/");
} //# sourceMappingURL=normalize-path-sep.js.map


/***/ }),

/***/ 63587:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    normalizeAppPath: function() {
        return normalizeAppPath;
    },
    normalizeRscPath: function() {
        return normalizeRscPath;
    }
});
const _ensureleadingslash = __webpack_require__(59486);
function normalizeAppPath(route) {
    return (0, _ensureleadingslash.ensureLeadingSlash)(route.split("/").reduce((pathname, segment, index, segments)=>{
        // Empty segments are ignored.
        if (!segment) {
            return pathname;
        }
        // Groups are ignored.
        if (segment[0] === "(" && segment.endsWith(")")) {
            return pathname;
        }
        // Parallel segments are ignored.
        if (segment[0] === "@") {
            return pathname;
        }
        // The last segment (if it's a leaf) should be ignored.
        if ((segment === "page" || segment === "route") && index === segments.length - 1) {
            return pathname;
        }
        return pathname + "/" + segment;
    }, ""));
}
function normalizeRscPath(pathname, enabled) {
    return enabled ? pathname.replace(/\.rsc($|\?)/, "$1") : pathname;
} //# sourceMappingURL=app-paths.js.map


/***/ }),

/***/ 98250:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    getSortedRoutes: function() {
        return _sortedroutes.getSortedRoutes;
    },
    isDynamicRoute: function() {
        return _isdynamic.isDynamicRoute;
    }
});
const _sortedroutes = __webpack_require__(45559);
const _isdynamic = __webpack_require__(49940); //# sourceMappingURL=index.js.map


/***/ }),

/***/ 49940:
/***/ ((__unused_webpack_module, exports) => {

"use strict";
// Identify /[param]/ in route string

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "isDynamicRoute", ({
    enumerable: true,
    get: function() {
        return isDynamicRoute;
    }
}));
const TEST_ROUTE = /\/\[[^/]+?\](?=\/|$)/;
function isDynamicRoute(route) {
    return TEST_ROUTE.test(route);
} //# sourceMappingURL=is-dynamic.js.map


/***/ }),

/***/ 70961:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "parseRelativeUrl", ({
    enumerable: true,
    get: function() {
        return parseRelativeUrl;
    }
}));
const _utils = __webpack_require__(24585);
const _querystring = __webpack_require__(16463);
function parseRelativeUrl(url, base) {
    const globalBase = new URL( true ? "http://n" : 0);
    const resolvedBase = base ? new URL(base, globalBase) : url.startsWith(".") ? new URL( true ? "http://n" : 0) : globalBase;
    const { pathname, searchParams, search, hash, href, origin } = new URL(url, resolvedBase);
    if (origin !== globalBase.origin) {
        throw new Error("invariant: invalid relative URL, router received " + url);
    }
    return {
        pathname,
        query: (0, _querystring.searchParamsToUrlQuery)(searchParams),
        search,
        hash,
        href: href.slice(globalBase.origin.length)
    };
} //# sourceMappingURL=parse-relative-url.js.map


/***/ }),

/***/ 92011:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "parseUrl", ({
    enumerable: true,
    get: function() {
        return parseUrl;
    }
}));
const _querystring = __webpack_require__(16463);
const _parserelativeurl = __webpack_require__(70961);
function parseUrl(url) {
    if (url.startsWith("/")) {
        return (0, _parserelativeurl.parseRelativeUrl)(url);
    }
    const parsedURL = new URL(url);
    return {
        hash: parsedURL.hash,
        hostname: parsedURL.hostname,
        href: parsedURL.href,
        pathname: parsedURL.pathname,
        port: parsedURL.port,
        protocol: parsedURL.protocol,
        query: (0, _querystring.searchParamsToUrlQuery)(parsedURL.searchParams),
        search: parsedURL.search
    };
} //# sourceMappingURL=parse-url.js.map


/***/ }),

/***/ 76338:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "getPathMatch", ({
    enumerable: true,
    get: function() {
        return getPathMatch;
    }
}));
const _pathtoregexp = __webpack_require__(75682);
function getPathMatch(path, options) {
    const keys = [];
    const regexp = (0, _pathtoregexp.pathToRegexp)(path, keys, {
        delimiter: "/",
        sensitive: typeof (options == null ? void 0 : options.sensitive) === "boolean" ? options.sensitive : false,
        strict: options == null ? void 0 : options.strict
    });
    const matcher = (0, _pathtoregexp.regexpToFunction)((options == null ? void 0 : options.regexModifier) ? new RegExp(options.regexModifier(regexp.source), regexp.flags) : regexp, keys);
    /**
   * A matcher function that will check if a given pathname matches the path
   * given in the builder function. When the path does not match it will return
   * `false` but if it does it will return an object with the matched params
   * merged with the params provided in the second argument.
   */ return (pathname, params)=>{
        const res = pathname == null ? false : matcher(pathname);
        if (!res) {
            return false;
        }
        /**
     * If unnamed params are not allowed they must be removed from
     * the matched parameters. path-to-regexp uses "string" for named and
     * "number" for unnamed parameters.
     */ if (options == null ? void 0 : options.removeUnnamedParams) {
            for (const key of keys){
                if (typeof key.name === "number") {
                    delete res.params[key.name];
                }
            }
        }
        return {
            ...params,
            ...res.params
        };
    };
} //# sourceMappingURL=path-match.js.map


/***/ }),

/***/ 74862:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    matchHas: function() {
        return matchHas;
    },
    compileNonPath: function() {
        return compileNonPath;
    },
    prepareDestination: function() {
        return prepareDestination;
    }
});
const _pathtoregexp = __webpack_require__(75682);
const _escaperegexp = __webpack_require__(6479);
const _parseurl = __webpack_require__(92011);
const _interceptionroutes = __webpack_require__(66729);
const _approuterheaders = __webpack_require__(54837);
/**
 * Ensure only a-zA-Z are used for param names for proper interpolating
 * with path-to-regexp
 */ function getSafeParamName(paramName) {
    let newParamName = "";
    for(let i = 0; i < paramName.length; i++){
        const charCode = paramName.charCodeAt(i);
        if (charCode > 64 && charCode < 91 || // A-Z
        charCode > 96 && charCode < 123 // a-z
        ) {
            newParamName += paramName[i];
        }
    }
    return newParamName;
}
function escapeSegment(str, segmentName) {
    return str.replace(new RegExp(":" + (0, _escaperegexp.escapeStringRegexp)(segmentName), "g"), "__ESC_COLON_" + segmentName);
}
function unescapeSegments(str) {
    return str.replace(/__ESC_COLON_/gi, ":");
}
function matchHas(req, query, has, missing) {
    if (has === void 0) has = [];
    if (missing === void 0) missing = [];
    const params = {};
    const hasMatch = (hasItem)=>{
        let value;
        let key = hasItem.key;
        switch(hasItem.type){
            case "header":
                {
                    key = key.toLowerCase();
                    value = req.headers[key];
                    break;
                }
            case "cookie":
                {
                    value = req.cookies[hasItem.key];
                    break;
                }
            case "query":
                {
                    value = query[key];
                    break;
                }
            case "host":
                {
                    const { host } = (req == null ? void 0 : req.headers) || {};
                    // remove port from host if present
                    const hostname = host == null ? void 0 : host.split(":")[0].toLowerCase();
                    value = hostname;
                    break;
                }
            default:
                {
                    break;
                }
        }
        if (!hasItem.value && value) {
            params[getSafeParamName(key)] = value;
            return true;
        } else if (value) {
            const matcher = new RegExp("^" + hasItem.value + "$");
            const matches = Array.isArray(value) ? value.slice(-1)[0].match(matcher) : value.match(matcher);
            if (matches) {
                if (Array.isArray(matches)) {
                    if (matches.groups) {
                        Object.keys(matches.groups).forEach((groupKey)=>{
                            params[groupKey] = matches.groups[groupKey];
                        });
                    } else if (hasItem.type === "host" && matches[0]) {
                        params.host = matches[0];
                    }
                }
                return true;
            }
        }
        return false;
    };
    const allMatch = has.every((item)=>hasMatch(item)) && !missing.some((item)=>hasMatch(item));
    if (allMatch) {
        return params;
    }
    return false;
}
function compileNonPath(value, params) {
    if (!value.includes(":")) {
        return value;
    }
    for (const key of Object.keys(params)){
        if (value.includes(":" + key)) {
            value = value.replace(new RegExp(":" + key + "\\*", "g"), ":" + key + "--ESCAPED_PARAM_ASTERISKS").replace(new RegExp(":" + key + "\\?", "g"), ":" + key + "--ESCAPED_PARAM_QUESTION").replace(new RegExp(":" + key + "\\+", "g"), ":" + key + "--ESCAPED_PARAM_PLUS").replace(new RegExp(":" + key + "(?!\\w)", "g"), "--ESCAPED_PARAM_COLON" + key);
        }
    }
    value = value.replace(/(:|\*|\?|\+|\(|\)|\{|\})/g, "\\$1").replace(/--ESCAPED_PARAM_PLUS/g, "+").replace(/--ESCAPED_PARAM_COLON/g, ":").replace(/--ESCAPED_PARAM_QUESTION/g, "?").replace(/--ESCAPED_PARAM_ASTERISKS/g, "*");
    // the value needs to start with a forward-slash to be compiled
    // correctly
    return (0, _pathtoregexp.compile)("/" + value, {
        validate: false
    })(params).slice(1);
}
function prepareDestination(args) {
    const query = Object.assign({}, args.query);
    delete query.__nextLocale;
    delete query.__nextDefaultLocale;
    delete query.__nextDataReq;
    delete query.__nextInferredLocaleFromDefault;
    delete query[_approuterheaders.NEXT_RSC_UNION_QUERY];
    let escapedDestination = args.destination;
    for (const param of Object.keys({
        ...args.params,
        ...query
    })){
        escapedDestination = escapeSegment(escapedDestination, param);
    }
    const parsedDestination = (0, _parseurl.parseUrl)(escapedDestination);
    const destQuery = parsedDestination.query;
    const destPath = unescapeSegments("" + parsedDestination.pathname + (parsedDestination.hash || ""));
    const destHostname = unescapeSegments(parsedDestination.hostname || "");
    const destPathParamKeys = [];
    const destHostnameParamKeys = [];
    (0, _pathtoregexp.pathToRegexp)(destPath, destPathParamKeys);
    (0, _pathtoregexp.pathToRegexp)(destHostname, destHostnameParamKeys);
    const destParams = [];
    destPathParamKeys.forEach((key)=>destParams.push(key.name));
    destHostnameParamKeys.forEach((key)=>destParams.push(key.name));
    const destPathCompiler = (0, _pathtoregexp.compile)(destPath, // have already validated before we got to this point and validating
    // breaks compiling destinations with named pattern params from the source
    // e.g. /something:hello(.*) -> /another/:hello is broken with validation
    // since compile validation is meant for reversing and not for inserting
    // params from a separate path-regex into another
    {
        validate: false
    });
    const destHostnameCompiler = (0, _pathtoregexp.compile)(destHostname, {
        validate: false
    });
    // update any params in query values
    for (const [key, strOrArray] of Object.entries(destQuery)){
        // the value needs to start with a forward-slash to be compiled
        // correctly
        if (Array.isArray(strOrArray)) {
            destQuery[key] = strOrArray.map((value)=>compileNonPath(unescapeSegments(value), args.params));
        } else if (typeof strOrArray === "string") {
            destQuery[key] = compileNonPath(unescapeSegments(strOrArray), args.params);
        }
    }
    // add path params to query if it's not a redirect and not
    // already defined in destination query or path
    let paramKeys = Object.keys(args.params).filter((name)=>name !== "nextInternalLocale");
    if (args.appendParamsToQuery && !paramKeys.some((key)=>destParams.includes(key))) {
        for (const key of paramKeys){
            if (!(key in destQuery)) {
                destQuery[key] = args.params[key];
            }
        }
    }
    let newUrl;
    // The compiler also that the interception route marker is an unnamed param, hence '0',
    // so we need to add it to the params object.
    if ((0, _interceptionroutes.isInterceptionRouteAppPath)(destPath)) {
        for (const segment of destPath.split("/")){
            const marker = _interceptionroutes.INTERCEPTION_ROUTE_MARKERS.find((m)=>segment.startsWith(m));
            if (marker) {
                args.params["0"] = marker;
                break;
            }
        }
    }
    try {
        newUrl = destPathCompiler(args.params);
        const [pathname, hash] = newUrl.split("#");
        parsedDestination.hostname = destHostnameCompiler(args.params);
        parsedDestination.pathname = pathname;
        parsedDestination.hash = "" + (hash ? "#" : "") + (hash || "");
        delete parsedDestination.search;
    } catch (err) {
        if (err.message.match(/Expected .*? to not repeat, but got an array/)) {
            throw new Error("To use a multi-match in the destination you must add `*` at the end of the param name to signify it should repeat. https://nextjs.org/docs/messages/invalid-multi-match");
        }
        throw err;
    }
    // Query merge order lowest priority to highest
    // 1. initial URL query values
    // 2. path segment values
    // 3. destination specified query values
    parsedDestination.query = {
        ...query,
        ...parsedDestination.query
    };
    return {
        newUrl,
        destQuery,
        parsedDestination
    };
} //# sourceMappingURL=prepare-destination.js.map


/***/ }),

/***/ 16463:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    searchParamsToUrlQuery: function() {
        return searchParamsToUrlQuery;
    },
    urlQueryToSearchParams: function() {
        return urlQueryToSearchParams;
    },
    assign: function() {
        return assign;
    }
});
function searchParamsToUrlQuery(searchParams) {
    const query = {};
    searchParams.forEach((value, key)=>{
        if (typeof query[key] === "undefined") {
            query[key] = value;
        } else if (Array.isArray(query[key])) {
            query[key].push(value);
        } else {
            query[key] = [
                query[key],
                value
            ];
        }
    });
    return query;
}
function stringifyUrlQueryParam(param) {
    if (typeof param === "string" || typeof param === "number" && !isNaN(param) || typeof param === "boolean") {
        return String(param);
    } else {
        return "";
    }
}
function urlQueryToSearchParams(urlQuery) {
    const result = new URLSearchParams();
    Object.entries(urlQuery).forEach((param)=>{
        let [key, value] = param;
        if (Array.isArray(value)) {
            value.forEach((item)=>result.append(key, stringifyUrlQueryParam(item)));
        } else {
            result.set(key, stringifyUrlQueryParam(value));
        }
    });
    return result;
}
function assign(target) {
    for(var _len = arguments.length, searchParamsList = new Array(_len > 1 ? _len - 1 : 0), _key = 1; _key < _len; _key++){
        searchParamsList[_key - 1] = arguments[_key];
    }
    searchParamsList.forEach((searchParams)=>{
        Array.from(searchParams.keys()).forEach((key)=>target.delete(key));
        searchParams.forEach((value, key)=>target.append(key, value));
    });
    return target;
} //# sourceMappingURL=querystring.js.map


/***/ }),

/***/ 15665:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "getRouteMatcher", ({
    enumerable: true,
    get: function() {
        return getRouteMatcher;
    }
}));
const _utils = __webpack_require__(24585);
function getRouteMatcher(param) {
    let { re, groups } = param;
    return (pathname)=>{
        const routeMatch = re.exec(pathname);
        if (!routeMatch) {
            return false;
        }
        const decode = (param)=>{
            try {
                return decodeURIComponent(param);
            } catch (_) {
                throw new _utils.DecodeError("failed to decode param");
            }
        };
        const params = {};
        Object.keys(groups).forEach((slugName)=>{
            const g = groups[slugName];
            const m = routeMatch[g.pos];
            if (m !== undefined) {
                params[slugName] = ~m.indexOf("/") ? m.split("/").map((entry)=>decode(entry)) : g.repeat ? [
                    decode(m)
                ] : decode(m);
            }
        });
        return params;
    };
} //# sourceMappingURL=route-matcher.js.map


/***/ }),

/***/ 22251:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    getRouteRegex: function() {
        return getRouteRegex;
    },
    getNamedRouteRegex: function() {
        return getNamedRouteRegex;
    },
    getNamedMiddlewareRegex: function() {
        return getNamedMiddlewareRegex;
    }
});
const _interceptionroutes = __webpack_require__(66729);
const _escaperegexp = __webpack_require__(6479);
const _removetrailingslash = __webpack_require__(25331);
const NEXT_QUERY_PARAM_PREFIX = "nxtP";
const NEXT_INTERCEPTION_MARKER_PREFIX = "nxtI";
/**
 * Parses a given parameter from a route to a data structure that can be used
 * to generate the parametrized route. Examples:
 *   - `[...slug]` -> `{ key: 'slug', repeat: true, optional: true }`
 *   - `...slug` -> `{ key: 'slug', repeat: true, optional: false }`
 *   - `[foo]` -> `{ key: 'foo', repeat: false, optional: true }`
 *   - `bar` -> `{ key: 'bar', repeat: false, optional: false }`
 */ function parseParameter(param) {
    const optional = param.startsWith("[") && param.endsWith("]");
    if (optional) {
        param = param.slice(1, -1);
    }
    const repeat = param.startsWith("...");
    if (repeat) {
        param = param.slice(3);
    }
    return {
        key: param,
        repeat,
        optional
    };
}
function getParametrizedRoute(route) {
    const segments = (0, _removetrailingslash.removeTrailingSlash)(route).slice(1).split("/");
    const groups = {};
    let groupIndex = 1;
    return {
        parameterizedRoute: segments.map((segment)=>{
            const markerMatch = _interceptionroutes.INTERCEPTION_ROUTE_MARKERS.find((m)=>segment.startsWith(m));
            const paramMatches = segment.match(/\[((?:\[.*\])|.+)\]/) // Check for parameters
            ;
            if (markerMatch && paramMatches) {
                const { key, optional, repeat } = parseParameter(paramMatches[1]);
                groups[key] = {
                    pos: groupIndex++,
                    repeat,
                    optional
                };
                return "/" + (0, _escaperegexp.escapeStringRegexp)(markerMatch) + "([^/]+?)";
            } else if (paramMatches) {
                const { key, repeat, optional } = parseParameter(paramMatches[1]);
                groups[key] = {
                    pos: groupIndex++,
                    repeat,
                    optional
                };
                return repeat ? optional ? "(?:/(.+?))?" : "/(.+?)" : "/([^/]+?)";
            } else {
                return "/" + (0, _escaperegexp.escapeStringRegexp)(segment);
            }
        }).join(""),
        groups
    };
}
function getRouteRegex(normalizedRoute) {
    const { parameterizedRoute, groups } = getParametrizedRoute(normalizedRoute);
    return {
        re: new RegExp("^" + parameterizedRoute + "(?:/)?$"),
        groups: groups
    };
}
/**
 * Builds a function to generate a minimal routeKey using only a-z and minimal
 * number of characters.
 */ function buildGetSafeRouteKey() {
    let i = 0;
    return ()=>{
        let routeKey = "";
        let j = ++i;
        while(j > 0){
            routeKey += String.fromCharCode(97 + (j - 1) % 26);
            j = Math.floor((j - 1) / 26);
        }
        return routeKey;
    };
}
function getSafeKeyFromSegment(param) {
    let { getSafeRouteKey, segment, routeKeys, keyPrefix } = param;
    const { key, optional, repeat } = parseParameter(segment);
    // replace any non-word characters since they can break
    // the named regex
    let cleanedKey = key.replace(/\W/g, "");
    if (keyPrefix) {
        cleanedKey = "" + keyPrefix + cleanedKey;
    }
    let invalidKey = false;
    // check if the key is still invalid and fallback to using a known
    // safe key
    if (cleanedKey.length === 0 || cleanedKey.length > 30) {
        invalidKey = true;
    }
    if (!isNaN(parseInt(cleanedKey.slice(0, 1)))) {
        invalidKey = true;
    }
    if (invalidKey) {
        cleanedKey = getSafeRouteKey();
    }
    if (keyPrefix) {
        routeKeys[cleanedKey] = "" + keyPrefix + key;
    } else {
        routeKeys[cleanedKey] = "" + key;
    }
    return repeat ? optional ? "(?:/(?<" + cleanedKey + ">.+?))?" : "/(?<" + cleanedKey + ">.+?)" : "/(?<" + cleanedKey + ">[^/]+?)";
}
function getNamedParametrizedRoute(route, prefixRouteKeys) {
    const segments = (0, _removetrailingslash.removeTrailingSlash)(route).slice(1).split("/");
    const getSafeRouteKey = buildGetSafeRouteKey();
    const routeKeys = {};
    return {
        namedParameterizedRoute: segments.map((segment)=>{
            const hasInterceptionMarker = _interceptionroutes.INTERCEPTION_ROUTE_MARKERS.some((m)=>segment.startsWith(m));
            const paramMatches = segment.match(/\[((?:\[.*\])|.+)\]/) // Check for parameters
            ;
            if (hasInterceptionMarker && paramMatches) {
                return getSafeKeyFromSegment({
                    getSafeRouteKey,
                    segment: paramMatches[1],
                    routeKeys,
                    keyPrefix: prefixRouteKeys ? NEXT_INTERCEPTION_MARKER_PREFIX : undefined
                });
            } else if (paramMatches) {
                return getSafeKeyFromSegment({
                    getSafeRouteKey,
                    segment: paramMatches[1],
                    routeKeys,
                    keyPrefix: prefixRouteKeys ? NEXT_QUERY_PARAM_PREFIX : undefined
                });
            } else {
                return "/" + (0, _escaperegexp.escapeStringRegexp)(segment);
            }
        }).join(""),
        routeKeys
    };
}
function getNamedRouteRegex(normalizedRoute, prefixRouteKey) {
    const result = getNamedParametrizedRoute(normalizedRoute, prefixRouteKey);
    return {
        ...getRouteRegex(normalizedRoute),
        namedRegex: "^" + result.namedParameterizedRoute + "(?:/)?$",
        routeKeys: result.routeKeys
    };
}
function getNamedMiddlewareRegex(normalizedRoute, options) {
    const { parameterizedRoute } = getParametrizedRoute(normalizedRoute);
    const { catchAll = true } = options;
    if (parameterizedRoute === "/") {
        let catchAllRegex = catchAll ? ".*" : "";
        return {
            namedRegex: "^/" + catchAllRegex + "$"
        };
    }
    const { namedParameterizedRoute } = getNamedParametrizedRoute(normalizedRoute, false);
    let catchAllGroupedRegex = catchAll ? "(?:(/.*)?)" : "";
    return {
        namedRegex: "^" + namedParameterizedRoute + catchAllGroupedRegex + "$"
    };
} //# sourceMappingURL=route-regex.js.map


/***/ }),

/***/ 45559:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "getSortedRoutes", ({
    enumerable: true,
    get: function() {
        return getSortedRoutes;
    }
}));
class UrlNode {
    insert(urlPath) {
        this._insert(urlPath.split("/").filter(Boolean), [], false);
    }
    smoosh() {
        return this._smoosh();
    }
    _smoosh(prefix) {
        if (prefix === void 0) prefix = "/";
        const childrenPaths = [
            ...this.children.keys()
        ].sort();
        if (this.slugName !== null) {
            childrenPaths.splice(childrenPaths.indexOf("[]"), 1);
        }
        if (this.restSlugName !== null) {
            childrenPaths.splice(childrenPaths.indexOf("[...]"), 1);
        }
        if (this.optionalRestSlugName !== null) {
            childrenPaths.splice(childrenPaths.indexOf("[[...]]"), 1);
        }
        const routes = childrenPaths.map((c)=>this.children.get(c)._smoosh("" + prefix + c + "/")).reduce((prev, curr)=>[
                ...prev,
                ...curr
            ], []);
        if (this.slugName !== null) {
            routes.push(...this.children.get("[]")._smoosh(prefix + "[" + this.slugName + "]/"));
        }
        if (!this.placeholder) {
            const r = prefix === "/" ? "/" : prefix.slice(0, -1);
            if (this.optionalRestSlugName != null) {
                throw new Error('You cannot define a route with the same specificity as a optional catch-all route ("' + r + '" and "' + r + "[[..." + this.optionalRestSlugName + ']]").');
            }
            routes.unshift(r);
        }
        if (this.restSlugName !== null) {
            routes.push(...this.children.get("[...]")._smoosh(prefix + "[..." + this.restSlugName + "]/"));
        }
        if (this.optionalRestSlugName !== null) {
            routes.push(...this.children.get("[[...]]")._smoosh(prefix + "[[..." + this.optionalRestSlugName + "]]/"));
        }
        return routes;
    }
    _insert(urlPaths, slugNames, isCatchAll) {
        if (urlPaths.length === 0) {
            this.placeholder = false;
            return;
        }
        if (isCatchAll) {
            throw new Error("Catch-all must be the last part of the URL.");
        }
        // The next segment in the urlPaths list
        let nextSegment = urlPaths[0];
        // Check if the segment matches `[something]`
        if (nextSegment.startsWith("[") && nextSegment.endsWith("]")) {
            // Strip `[` and `]`, leaving only `something`
            let segmentName = nextSegment.slice(1, -1);
            let isOptional = false;
            if (segmentName.startsWith("[") && segmentName.endsWith("]")) {
                // Strip optional `[` and `]`, leaving only `something`
                segmentName = segmentName.slice(1, -1);
                isOptional = true;
            }
            if (segmentName.startsWith("...")) {
                // Strip `...`, leaving only `something`
                segmentName = segmentName.substring(3);
                isCatchAll = true;
            }
            if (segmentName.startsWith("[") || segmentName.endsWith("]")) {
                throw new Error("Segment names may not start or end with extra brackets ('" + segmentName + "').");
            }
            if (segmentName.startsWith(".")) {
                throw new Error("Segment names may not start with erroneous periods ('" + segmentName + "').");
            }
            function handleSlug(previousSlug, nextSlug) {
                if (previousSlug !== null) {
                    // If the specific segment already has a slug but the slug is not `something`
                    // This prevents collisions like:
                    // pages/[post]/index.js
                    // pages/[id]/index.js
                    // Because currently multiple dynamic params on the same segment level are not supported
                    if (previousSlug !== nextSlug) {
                        // TODO: This error seems to be confusing for users, needs an error link, the description can be based on above comment.
                        throw new Error("You cannot use different slug names for the same dynamic path ('" + previousSlug + "' !== '" + nextSlug + "').");
                    }
                }
                slugNames.forEach((slug)=>{
                    if (slug === nextSlug) {
                        throw new Error('You cannot have the same slug name "' + nextSlug + '" repeat within a single dynamic path');
                    }
                    if (slug.replace(/\W/g, "") === nextSegment.replace(/\W/g, "")) {
                        throw new Error('You cannot have the slug names "' + slug + '" and "' + nextSlug + '" differ only by non-word symbols within a single dynamic path');
                    }
                });
                slugNames.push(nextSlug);
            }
            if (isCatchAll) {
                if (isOptional) {
                    if (this.restSlugName != null) {
                        throw new Error('You cannot use both an required and optional catch-all route at the same level ("[...' + this.restSlugName + ']" and "' + urlPaths[0] + '" ).');
                    }
                    handleSlug(this.optionalRestSlugName, segmentName);
                    // slugName is kept as it can only be one particular slugName
                    this.optionalRestSlugName = segmentName;
                    // nextSegment is overwritten to [[...]] so that it can later be sorted specifically
                    nextSegment = "[[...]]";
                } else {
                    if (this.optionalRestSlugName != null) {
                        throw new Error('You cannot use both an optional and required catch-all route at the same level ("[[...' + this.optionalRestSlugName + ']]" and "' + urlPaths[0] + '").');
                    }
                    handleSlug(this.restSlugName, segmentName);
                    // slugName is kept as it can only be one particular slugName
                    this.restSlugName = segmentName;
                    // nextSegment is overwritten to [...] so that it can later be sorted specifically
                    nextSegment = "[...]";
                }
            } else {
                if (isOptional) {
                    throw new Error('Optional route parameters are not yet supported ("' + urlPaths[0] + '").');
                }
                handleSlug(this.slugName, segmentName);
                // slugName is kept as it can only be one particular slugName
                this.slugName = segmentName;
                // nextSegment is overwritten to [] so that it can later be sorted specifically
                nextSegment = "[]";
            }
        }
        // If this UrlNode doesn't have the nextSegment yet we create a new child UrlNode
        if (!this.children.has(nextSegment)) {
            this.children.set(nextSegment, new UrlNode());
        }
        this.children.get(nextSegment)._insert(urlPaths.slice(1), slugNames, isCatchAll);
    }
    constructor(){
        this.placeholder = true;
        this.children = new Map();
        this.slugName = null;
        this.restSlugName = null;
        this.optionalRestSlugName = null;
    }
}
function getSortedRoutes(normalizedPages) {
    // First the UrlNode is created, and every UrlNode can have only 1 dynamic segment
    // Eg you can't have pages/[post]/abc.js and pages/[hello]/something-else.js
    // Only 1 dynamic segment per nesting level
    // So in the case that is test/integration/dynamic-routing it'll be this:
    // pages/[post]/comments.js
    // pages/blog/[post]/comment/[id].js
    // Both are fine because `pages/[post]` and `pages/blog` are on the same level
    // So in this case `UrlNode` created here has `this.slugName === 'post'`
    // And since your PR passed through `slugName` as an array basically it'd including it in too many possibilities
    // Instead what has to be passed through is the upwards path's dynamic names
    const root = new UrlNode();
    // Here the `root` gets injected multiple paths, and insert will break them up into sublevels
    normalizedPages.forEach((pagePath)=>root.insert(pagePath));
    // Smoosh will then sort those sublevels up to the point where you get the correct route definition priority
    return root.smoosh();
} //# sourceMappingURL=sorted-routes.js.map


/***/ }),

/***/ 24585:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    WEB_VITALS: function() {
        return WEB_VITALS;
    },
    execOnce: function() {
        return execOnce;
    },
    isAbsoluteUrl: function() {
        return isAbsoluteUrl;
    },
    getLocationOrigin: function() {
        return getLocationOrigin;
    },
    getURL: function() {
        return getURL;
    },
    getDisplayName: function() {
        return getDisplayName;
    },
    isResSent: function() {
        return isResSent;
    },
    normalizeRepeatedSlashes: function() {
        return normalizeRepeatedSlashes;
    },
    loadGetInitialProps: function() {
        return loadGetInitialProps;
    },
    SP: function() {
        return SP;
    },
    ST: function() {
        return ST;
    },
    DecodeError: function() {
        return DecodeError;
    },
    NormalizeError: function() {
        return NormalizeError;
    },
    PageNotFoundError: function() {
        return PageNotFoundError;
    },
    MissingStaticPage: function() {
        return MissingStaticPage;
    },
    MiddlewareNotFoundError: function() {
        return MiddlewareNotFoundError;
    },
    stringifyError: function() {
        return stringifyError;
    }
});
const WEB_VITALS = [
    "CLS",
    "FCP",
    "FID",
    "INP",
    "LCP",
    "TTFB"
];
function execOnce(fn) {
    let used = false;
    let result;
    return function() {
        for(var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++){
            args[_key] = arguments[_key];
        }
        if (!used) {
            used = true;
            result = fn(...args);
        }
        return result;
    };
}
// Scheme: https://tools.ietf.org/html/rfc3986#section-3.1
// Absolute URL: https://tools.ietf.org/html/rfc3986#section-4.3
const ABSOLUTE_URL_REGEX = /^[a-zA-Z][a-zA-Z\d+\-.]*?:/;
const isAbsoluteUrl = (url)=>ABSOLUTE_URL_REGEX.test(url);
function getLocationOrigin() {
    const { protocol, hostname, port } = window.location;
    return protocol + "//" + hostname + (port ? ":" + port : "");
}
function getURL() {
    const { href } = window.location;
    const origin = getLocationOrigin();
    return href.substring(origin.length);
}
function getDisplayName(Component) {
    return typeof Component === "string" ? Component : Component.displayName || Component.name || "Unknown";
}
function isResSent(res) {
    return res.finished || res.headersSent;
}
function normalizeRepeatedSlashes(url) {
    const urlParts = url.split("?");
    const urlNoQuery = urlParts[0];
    return urlNoQuery // first we replace any non-encoded backslashes with forward
    // then normalize repeated forward slashes
    .replace(/\\/g, "/").replace(/\/\/+/g, "/") + (urlParts[1] ? "?" + urlParts.slice(1).join("?") : "");
}
async function loadGetInitialProps(App, ctx) {
    if (false) { var _App_prototype; }
    // when called from _app `ctx` is nested in `ctx`
    const res = ctx.res || ctx.ctx && ctx.ctx.res;
    if (!App.getInitialProps) {
        if (ctx.ctx && ctx.Component) {
            // @ts-ignore pageProps default
            return {
                pageProps: await loadGetInitialProps(ctx.Component, ctx.ctx)
            };
        }
        return {};
    }
    const props = await App.getInitialProps(ctx);
    if (res && isResSent(res)) {
        return props;
    }
    if (!props) {
        const message = '"' + getDisplayName(App) + '.getInitialProps()" should resolve to an object. But found "' + props + '" instead.';
        throw new Error(message);
    }
    if (false) {}
    return props;
}
const SP = typeof performance !== "undefined";
const ST = SP && [
    "mark",
    "measure",
    "getEntriesByName"
].every((method)=>typeof performance[method] === "function");
class DecodeError extends Error {
}
class NormalizeError extends Error {
}
class PageNotFoundError extends Error {
    constructor(page){
        super();
        this.code = "ENOENT";
        this.name = "PageNotFoundError";
        this.message = "Cannot find module for page: " + page;
    }
}
class MissingStaticPage extends Error {
    constructor(page, message){
        super();
        this.message = "Failed to load static file for page: " + page + " " + message;
    }
}
class MiddlewareNotFoundError extends Error {
    constructor(){
        super();
        this.code = "ENOENT";
        this.message = "Cannot find the middleware module";
    }
}
function stringifyError(error) {
    return JSON.stringify({
        message: error.message,
        stack: error.stack
    });
} //# sourceMappingURL=utils.js.map


/***/ }),

/***/ 35130:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
Object.defineProperty(exports, "isAPIRoute", ({
    enumerable: true,
    get: function() {
        return isAPIRoute;
    }
}));
function isAPIRoute(value) {
    return value === "/api" || Boolean(value == null ? void 0 : value.startsWith("/api/"));
}

//# sourceMappingURL=is-api-route.js.map

/***/ }),

/***/ 20379:
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {

"use strict";

Object.defineProperty(exports, "__esModule", ({
    value: true
}));
0 && (0);
function _export(target, all) {
    for(var name in all)Object.defineProperty(target, name, {
        enumerable: true,
        get: all[name]
    });
}
_export(exports, {
    default: function() {
        return isError;
    },
    getProperError: function() {
        return getProperError;
    }
});
const _isplainobject = __webpack_require__(35705);
function isError(err) {
    return typeof err === "object" && err !== null && "name" in err && "message" in err;
}
function getProperError(err) {
    if (isError(err)) {
        return err;
    }
    if (false) {}
    return new Error((0, _isplainobject.isPlainObject)(err) ? JSON.stringify(err) : err + "");
}

//# sourceMappingURL=is-error.js.map

/***/ }),

/***/ 21945:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = __webpack_require__(17202)


/***/ }),

/***/ 86986:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

module.exports = __webpack_require__(76972)


/***/ }),

/***/ 9991:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var k=Object.create;var m=Object.defineProperty;var v=Object.getOwnPropertyDescriptor;var S=Object.getOwnPropertyNames;var E=Object.getPrototypeOf,$=Object.prototype.hasOwnProperty;var P=e=>m(e,"__esModule",{value:!0}),a=(e,r)=>m(e,"name",{value:r,configurable:!0});var R=(e,r)=>{for(var t in r)m(e,t,{get:r[t],enumerable:!0})},y=(e,r,t,l)=>{if(r&&typeof r=="object"||typeof r=="function")for(let s of S(r))!$.call(e,s)&&(t||s!=="default")&&m(e,s,{get:()=>r[s],enumerable:!(l=v(r,s))||l.enumerable});return e},u=(e,r)=>y(P(m(e!=null?k(E(e)):{},"default",!r&&e&&e.__esModule?{get:()=>e.default,enumerable:!0}:{value:e,enumerable:!0})),e),_=(e=>(r,t)=>e&&e.get(r)||(t=y(P({}),r,1),e&&e.set(r,t),t))(typeof WeakMap!="undefined"?new WeakMap:0);var D={};R(D,{default:()=>z});var p=u(__webpack_require__(86986)),n=u(__webpack_require__(95288)),o=u(__webpack_require__(18091)),g=u(__webpack_require__(18038)),N=a(({color:e="#29D",startPosition:r=.3,stopDelayMs:t=200,height:l=3,showOnShallow:s=!0,options:b,nonce:T,transformCSS:w=a(i=>g.createElement("style",{nonce:T},i),"transformCSS")})=>{let i=null;g.useEffect(()=>(b&&n.configure(b),p.default.events.on("routeChangeStart",d),p.default.events.on("routeChangeComplete",h),p.default.events.on("routeChangeError",x),()=>{p.default.events.off("routeChangeStart",d),p.default.events.off("routeChangeComplete",h),p.default.events.off("routeChangeError",x)}),[]);let d=a((c,{shallow:f})=>{(!f||s)&&(n.set(r),n.start())},"routeChangeStart"),h=a((c,{shallow:f})=>{(!f||s)&&(i&&clearTimeout(i),i=setTimeout(()=>{n.done(!0)},t))},"routeChangeEnd"),x=a((c,f,{shallow:C})=>{(!C||s)&&(i&&clearTimeout(i),i=setTimeout(()=>{n.done(!0)},t))},"routeChangeError");return w(`
    #nprogress {
      pointer-events: none;
    }
    #nprogress .bar {
      background: ${e};
      position: fixed;
      z-index: 9999;
      top: 0;
      left: 0;
      width: 100%;
      height: ${l}px;
    }
    #nprogress .peg {
      display: block;
      position: absolute;
      right: 0px;
      width: 100px;
      height: 100%;
      box-shadow: 0 0 10px ${e}, 0 0 5px ${e};
      opacity: 1;
      -webkit-transform: rotate(3deg) translate(0px, -4px);
      -ms-transform: rotate(3deg) translate(0px, -4px);
      transform: rotate(3deg) translate(0px, -4px);
    }
    #nprogress .spinner {
      display: block;
      position: fixed;
      z-index: 1031;
      top: 15px;
      right: 15px;
    }
    #nprogress .spinner-icon {
      width: 18px;
      height: 18px;
      box-sizing: border-box;
      border: solid 2px transparent;
      border-top-color: ${e};
      border-left-color: ${e};
      border-radius: 50%;
      -webkit-animation: nprogresss-spinner 400ms linear infinite;
      animation: nprogress-spinner 400ms linear infinite;
    }
    .nprogress-custom-parent {
      overflow: hidden;
      position: relative;
    }
    .nprogress-custom-parent #nprogress .spinner,
    .nprogress-custom-parent #nprogress .bar {
      position: absolute;
    }
    @-webkit-keyframes nprogress-spinner {
      0% {
        -webkit-transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
      }
    }
    @keyframes nprogress-spinner {
      0% {
        transform: rotate(0deg);
      }
      100% {
        transform: rotate(360deg);
      }
    }
  `)},"NextNProgress");N.propTypes={color:o.string,startPosition:o.number,stopDelayMs:o.number,height:o.number,showOnShallow:o.bool,options:o.object,nonce:o.string,transformCSS:o.func};var z=g.memo(N);module.exports=_(D);0&&(0);
//# sourceMappingURL=index.js.map

/***/ }),

/***/ 95288:
/***/ (function(module, exports, __webpack_require__) {

var __WEBPACK_AMD_DEFINE_FACTORY__, __WEBPACK_AMD_DEFINE_RESULT__;/* NProgress, (c) 2013, 2014 Rico Sta. Cruz - http://ricostacruz.com/nprogress
 * @license MIT */

;(function(root, factory) {

  if (true) {
    !(__WEBPACK_AMD_DEFINE_FACTORY__ = (factory),
		__WEBPACK_AMD_DEFINE_RESULT__ = (typeof __WEBPACK_AMD_DEFINE_FACTORY__ === 'function' ?
		(__WEBPACK_AMD_DEFINE_FACTORY__.call(exports, __webpack_require__, exports, module)) :
		__WEBPACK_AMD_DEFINE_FACTORY__),
		__WEBPACK_AMD_DEFINE_RESULT__ !== undefined && (module.exports = __WEBPACK_AMD_DEFINE_RESULT__));
  } else {}

})(this, function() {
  var NProgress = {};

  NProgress.version = '0.2.0';

  var Settings = NProgress.settings = {
    minimum: 0.08,
    easing: 'ease',
    positionUsing: '',
    speed: 200,
    trickle: true,
    trickleRate: 0.02,
    trickleSpeed: 800,
    showSpinner: true,
    barSelector: '[role="bar"]',
    spinnerSelector: '[role="spinner"]',
    parent: 'body',
    template: '<div class="bar" role="bar"><div class="peg"></div></div><div class="spinner" role="spinner"><div class="spinner-icon"></div></div>'
  };

  /**
   * Updates configuration.
   *
   *     NProgress.configure({
   *       minimum: 0.1
   *     });
   */
  NProgress.configure = function(options) {
    var key, value;
    for (key in options) {
      value = options[key];
      if (value !== undefined && options.hasOwnProperty(key)) Settings[key] = value;
    }

    return this;
  };

  /**
   * Last number.
   */

  NProgress.status = null;

  /**
   * Sets the progress bar status, where `n` is a number from `0.0` to `1.0`.
   *
   *     NProgress.set(0.4);
   *     NProgress.set(1.0);
   */

  NProgress.set = function(n) {
    var started = NProgress.isStarted();

    n = clamp(n, Settings.minimum, 1);
    NProgress.status = (n === 1 ? null : n);

    var progress = NProgress.render(!started),
        bar      = progress.querySelector(Settings.barSelector),
        speed    = Settings.speed,
        ease     = Settings.easing;

    progress.offsetWidth; /* Repaint */

    queue(function(next) {
      // Set positionUsing if it hasn't already been set
      if (Settings.positionUsing === '') Settings.positionUsing = NProgress.getPositioningCSS();

      // Add transition
      css(bar, barPositionCSS(n, speed, ease));

      if (n === 1) {
        // Fade out
        css(progress, { 
          transition: 'none', 
          opacity: 1 
        });
        progress.offsetWidth; /* Repaint */

        setTimeout(function() {
          css(progress, { 
            transition: 'all ' + speed + 'ms linear', 
            opacity: 0 
          });
          setTimeout(function() {
            NProgress.remove();
            next();
          }, speed);
        }, speed);
      } else {
        setTimeout(next, speed);
      }
    });

    return this;
  };

  NProgress.isStarted = function() {
    return typeof NProgress.status === 'number';
  };

  /**
   * Shows the progress bar.
   * This is the same as setting the status to 0%, except that it doesn't go backwards.
   *
   *     NProgress.start();
   *
   */
  NProgress.start = function() {
    if (!NProgress.status) NProgress.set(0);

    var work = function() {
      setTimeout(function() {
        if (!NProgress.status) return;
        NProgress.trickle();
        work();
      }, Settings.trickleSpeed);
    };

    if (Settings.trickle) work();

    return this;
  };

  /**
   * Hides the progress bar.
   * This is the *sort of* the same as setting the status to 100%, with the
   * difference being `done()` makes some placebo effect of some realistic motion.
   *
   *     NProgress.done();
   *
   * If `true` is passed, it will show the progress bar even if its hidden.
   *
   *     NProgress.done(true);
   */

  NProgress.done = function(force) {
    if (!force && !NProgress.status) return this;

    return NProgress.inc(0.3 + 0.5 * Math.random()).set(1);
  };

  /**
   * Increments by a random amount.
   */

  NProgress.inc = function(amount) {
    var n = NProgress.status;

    if (!n) {
      return NProgress.start();
    } else {
      if (typeof amount !== 'number') {
        amount = (1 - n) * clamp(Math.random() * n, 0.1, 0.95);
      }

      n = clamp(n + amount, 0, 0.994);
      return NProgress.set(n);
    }
  };

  NProgress.trickle = function() {
    return NProgress.inc(Math.random() * Settings.trickleRate);
  };

  /**
   * Waits for all supplied jQuery promises and
   * increases the progress as the promises resolve.
   *
   * @param $promise jQUery Promise
   */
  (function() {
    var initial = 0, current = 0;

    NProgress.promise = function($promise) {
      if (!$promise || $promise.state() === "resolved") {
        return this;
      }

      if (current === 0) {
        NProgress.start();
      }

      initial++;
      current++;

      $promise.always(function() {
        current--;
        if (current === 0) {
            initial = 0;
            NProgress.done();
        } else {
            NProgress.set((initial - current) / initial);
        }
      });

      return this;
    };

  })();

  /**
   * (Internal) renders the progress bar markup based on the `template`
   * setting.
   */

  NProgress.render = function(fromStart) {
    if (NProgress.isRendered()) return document.getElementById('nprogress');

    addClass(document.documentElement, 'nprogress-busy');
    
    var progress = document.createElement('div');
    progress.id = 'nprogress';
    progress.innerHTML = Settings.template;

    var bar      = progress.querySelector(Settings.barSelector),
        perc     = fromStart ? '-100' : toBarPerc(NProgress.status || 0),
        parent   = document.querySelector(Settings.parent),
        spinner;
    
    css(bar, {
      transition: 'all 0 linear',
      transform: 'translate3d(' + perc + '%,0,0)'
    });

    if (!Settings.showSpinner) {
      spinner = progress.querySelector(Settings.spinnerSelector);
      spinner && removeElement(spinner);
    }

    if (parent != document.body) {
      addClass(parent, 'nprogress-custom-parent');
    }

    parent.appendChild(progress);
    return progress;
  };

  /**
   * Removes the element. Opposite of render().
   */

  NProgress.remove = function() {
    removeClass(document.documentElement, 'nprogress-busy');
    removeClass(document.querySelector(Settings.parent), 'nprogress-custom-parent');
    var progress = document.getElementById('nprogress');
    progress && removeElement(progress);
  };

  /**
   * Checks if the progress bar is rendered.
   */

  NProgress.isRendered = function() {
    return !!document.getElementById('nprogress');
  };

  /**
   * Determine which positioning CSS rule to use.
   */

  NProgress.getPositioningCSS = function() {
    // Sniff on document.body.style
    var bodyStyle = document.body.style;

    // Sniff prefixes
    var vendorPrefix = ('WebkitTransform' in bodyStyle) ? 'Webkit' :
                       ('MozTransform' in bodyStyle) ? 'Moz' :
                       ('msTransform' in bodyStyle) ? 'ms' :
                       ('OTransform' in bodyStyle) ? 'O' : '';

    if (vendorPrefix + 'Perspective' in bodyStyle) {
      // Modern browsers with 3D support, e.g. Webkit, IE10
      return 'translate3d';
    } else if (vendorPrefix + 'Transform' in bodyStyle) {
      // Browsers without 3D support, e.g. IE9
      return 'translate';
    } else {
      // Browsers without translate() support, e.g. IE7-8
      return 'margin';
    }
  };

  /**
   * Helpers
   */

  function clamp(n, min, max) {
    if (n < min) return min;
    if (n > max) return max;
    return n;
  }

  /**
   * (Internal) converts a percentage (`0..1`) to a bar translateX
   * percentage (`-100%..0%`).
   */

  function toBarPerc(n) {
    return (-1 + n) * 100;
  }


  /**
   * (Internal) returns the correct CSS for changing the bar's
   * position given an n percentage, and speed and ease from Settings
   */

  function barPositionCSS(n, speed, ease) {
    var barCSS;

    if (Settings.positionUsing === 'translate3d') {
      barCSS = { transform: 'translate3d('+toBarPerc(n)+'%,0,0)' };
    } else if (Settings.positionUsing === 'translate') {
      barCSS = { transform: 'translate('+toBarPerc(n)+'%,0)' };
    } else {
      barCSS = { 'margin-left': toBarPerc(n)+'%' };
    }

    barCSS.transition = 'all '+speed+'ms '+ease;

    return barCSS;
  }

  /**
   * (Internal) Queues a function to be executed.
   */

  var queue = (function() {
    var pending = [];
    
    function next() {
      var fn = pending.shift();
      if (fn) {
        fn(next);
      }
    }

    return function(fn) {
      pending.push(fn);
      if (pending.length == 1) next();
    };
  })();

  /**
   * (Internal) Applies css properties to an element, similar to the jQuery 
   * css method.
   *
   * While this helper does assist with vendor prefixed property names, it 
   * does not perform any manipulation of values prior to setting styles.
   */

  var css = (function() {
    var cssPrefixes = [ 'Webkit', 'O', 'Moz', 'ms' ],
        cssProps    = {};

    function camelCase(string) {
      return string.replace(/^-ms-/, 'ms-').replace(/-([\da-z])/gi, function(match, letter) {
        return letter.toUpperCase();
      });
    }

    function getVendorProp(name) {
      var style = document.body.style;
      if (name in style) return name;

      var i = cssPrefixes.length,
          capName = name.charAt(0).toUpperCase() + name.slice(1),
          vendorName;
      while (i--) {
        vendorName = cssPrefixes[i] + capName;
        if (vendorName in style) return vendorName;
      }

      return name;
    }

    function getStyleProp(name) {
      name = camelCase(name);
      return cssProps[name] || (cssProps[name] = getVendorProp(name));
    }

    function applyCss(element, prop, value) {
      prop = getStyleProp(prop);
      element.style[prop] = value;
    }

    return function(element, properties) {
      var args = arguments,
          prop, 
          value;

      if (args.length == 2) {
        for (prop in properties) {
          value = properties[prop];
          if (value !== undefined && properties.hasOwnProperty(prop)) applyCss(element, prop, value);
        }
      } else {
        applyCss(element, args[1], args[2]);
      }
    }
  })();

  /**
   * (Internal) Determines if an element or space separated list of class names contains a class name.
   */

  function hasClass(element, name) {
    var list = typeof element == 'string' ? element : classList(element);
    return list.indexOf(' ' + name + ' ') >= 0;
  }

  /**
   * (Internal) Adds a class to an element.
   */

  function addClass(element, name) {
    var oldList = classList(element),
        newList = oldList + name;

    if (hasClass(oldList, name)) return; 

    // Trim the opening space.
    element.className = newList.substring(1);
  }

  /**
   * (Internal) Removes a class from an element.
   */

  function removeClass(element, name) {
    var oldList = classList(element),
        newList;

    if (!hasClass(element, name)) return;

    // Replace the class name.
    newList = oldList.replace(' ' + name + ' ', ' ');

    // Trim the opening and closing spaces.
    element.className = newList.substring(1, newList.length - 1);
  }

  /**
   * (Internal) Gets a space separated list of the class names on the element. 
   * The list is wrapped with a single space on each end to facilitate finding 
   * matches within the list.
   */

  function classList(element) {
    return (' ' + (element.className || '') + ' ').replace(/\s+/gi, ' ');
  }

  /**
   * (Internal) Removes an element from the DOM.
   */

  function removeElement(element) {
    element && element.parentNode && element.parentNode.removeChild(element);
  }

  return NProgress;
});



/***/ }),

/***/ 20074:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

"use strict";
/**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */



var ReactPropTypesSecret = __webpack_require__(86635);

function emptyFunction() {}
function emptyFunctionWithReset() {}
emptyFunctionWithReset.resetWarningCache = emptyFunction;

module.exports = function() {
  function shim(props, propName, componentName, location, propFullName, secret) {
    if (secret === ReactPropTypesSecret) {
      // It is still safe when called from React.
      return;
    }
    var err = new Error(
      'Calling PropTypes validators directly is not supported by the `prop-types` package. ' +
      'Use PropTypes.checkPropTypes() to call them. ' +
      'Read more at http://fb.me/use-check-prop-types'
    );
    err.name = 'Invariant Violation';
    throw err;
  };
  shim.isRequired = shim;
  function getShim() {
    return shim;
  };
  // Important!
  // Keep this list in sync with production version in `./factoryWithTypeCheckers.js`.
  var ReactPropTypes = {
    array: shim,
    bigint: shim,
    bool: shim,
    func: shim,
    number: shim,
    object: shim,
    string: shim,
    symbol: shim,

    any: shim,
    arrayOf: getShim,
    element: shim,
    elementType: shim,
    instanceOf: getShim,
    node: shim,
    objectOf: getShim,
    oneOf: getShim,
    oneOfType: getShim,
    shape: getShim,
    exact: getShim,

    checkPropTypes: emptyFunctionWithReset,
    resetWarningCache: emptyFunction
  };

  ReactPropTypes.PropTypes = ReactPropTypes;

  return ReactPropTypes;
};


/***/ }),

/***/ 18091:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

/**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

if (false) { var throwOnDirectAccess, ReactIs; } else {
  // By explicitly using `prop-types` you are opting into new production behavior.
  // http://fb.me/prop-types-in-prod
  module.exports = __webpack_require__(20074)();
}


/***/ }),

/***/ 86635:
/***/ ((module) => {

"use strict";
/**
 * Copyright (c) 2013-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */



var ReactPropTypesSecret = 'SECRET_DO_NOT_PASS_THIS_OR_YOU_WILL_BE_FIRED';

module.exports = ReactPropTypesSecret;


/***/ }),

/***/ 20299:
/***/ ((module) => {

function _arrayLikeToArray(arr, len) {
  if (len == null || len > arr.length) len = arr.length;
  for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i];
  return arr2;
}
module.exports = _arrayLikeToArray, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 54763:
/***/ ((module) => {

function _arrayWithHoles(arr) {
  if (Array.isArray(arr)) return arr;
}
module.exports = _arrayWithHoles, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 99650:
/***/ ((module) => {

function _assertThisInitialized(self) {
  if (self === void 0) {
    throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
  }
  return self;
}
module.exports = _assertThisInitialized, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 15357:
/***/ ((module) => {

function asyncGeneratorStep(gen, resolve, reject, _next, _throw, key, arg) {
  try {
    var info = gen[key](arg);
    var value = info.value;
  } catch (error) {
    reject(error);
    return;
  }
  if (info.done) {
    resolve(value);
  } else {
    Promise.resolve(value).then(_next, _throw);
  }
}
function _asyncToGenerator(fn) {
  return function () {
    var self = this,
      args = arguments;
    return new Promise(function (resolve, reject) {
      var gen = fn.apply(self, args);
      function _next(value) {
        asyncGeneratorStep(gen, resolve, reject, _next, _throw, "next", value);
      }
      function _throw(err) {
        asyncGeneratorStep(gen, resolve, reject, _next, _throw, "throw", err);
      }
      _next(undefined);
    });
  };
}
module.exports = _asyncToGenerator, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 39472:
/***/ ((module) => {

function _classCallCheck(instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError("Cannot call a class as a function");
  }
}
module.exports = _classCallCheck, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 48103:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var setPrototypeOf = __webpack_require__(8691);
var isNativeReflectConstruct = __webpack_require__(90851);
function _construct(Parent, args, Class) {
  if (isNativeReflectConstruct()) {
    module.exports = _construct = Reflect.construct.bind(), module.exports.__esModule = true, module.exports["default"] = module.exports;
  } else {
    module.exports = _construct = function _construct(Parent, args, Class) {
      var a = [null];
      a.push.apply(a, args);
      var Constructor = Function.bind.apply(Parent, a);
      var instance = new Constructor();
      if (Class) setPrototypeOf(instance, Class.prototype);
      return instance;
    }, module.exports.__esModule = true, module.exports["default"] = module.exports;
  }
  return _construct.apply(null, arguments);
}
module.exports = _construct, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 44204:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var toPropertyKey = __webpack_require__(61090);
function _defineProperties(target, props) {
  for (var i = 0; i < props.length; i++) {
    var descriptor = props[i];
    descriptor.enumerable = descriptor.enumerable || false;
    descriptor.configurable = true;
    if ("value" in descriptor) descriptor.writable = true;
    Object.defineProperty(target, toPropertyKey(descriptor.key), descriptor);
  }
}
function _createClass(Constructor, protoProps, staticProps) {
  if (protoProps) _defineProperties(Constructor.prototype, protoProps);
  if (staticProps) _defineProperties(Constructor, staticProps);
  Object.defineProperty(Constructor, "prototype", {
    writable: false
  });
  return Constructor;
}
module.exports = _createClass, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 86126:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var toPropertyKey = __webpack_require__(61090);
function _defineProperty(obj, key, value) {
  key = toPropertyKey(key);
  if (key in obj) {
    Object.defineProperty(obj, key, {
      value: value,
      enumerable: true,
      configurable: true,
      writable: true
    });
  } else {
    obj[key] = value;
  }
  return obj;
}
module.exports = _defineProperty, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 80278:
/***/ ((module) => {

function _getPrototypeOf(o) {
  module.exports = _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function _getPrototypeOf(o) {
    return o.__proto__ || Object.getPrototypeOf(o);
  }, module.exports.__esModule = true, module.exports["default"] = module.exports;
  return _getPrototypeOf(o);
}
module.exports = _getPrototypeOf, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 66250:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var setPrototypeOf = __webpack_require__(8691);
function _inherits(subClass, superClass) {
  if (typeof superClass !== "function" && superClass !== null) {
    throw new TypeError("Super expression must either be null or a function");
  }
  subClass.prototype = Object.create(superClass && superClass.prototype, {
    constructor: {
      value: subClass,
      writable: true,
      configurable: true
    }
  });
  Object.defineProperty(subClass, "prototype", {
    writable: false
  });
  if (superClass) setPrototypeOf(subClass, superClass);
}
module.exports = _inherits, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 40207:
/***/ ((module) => {

function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : {
    "default": obj
  };
}
module.exports = _interopRequireDefault, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 64759:
/***/ ((module) => {

function _isNativeFunction(fn) {
  return Function.toString.call(fn).indexOf("[native code]") !== -1;
}
module.exports = _isNativeFunction, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 90851:
/***/ ((module) => {

function _isNativeReflectConstruct() {
  if (typeof Reflect === "undefined" || !Reflect.construct) return false;
  if (Reflect.construct.sham) return false;
  if (typeof Proxy === "function") return true;
  try {
    Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {}));
    return true;
  } catch (e) {
    return false;
  }
}
module.exports = _isNativeReflectConstruct, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 30550:
/***/ ((module) => {

function _iterableToArrayLimit(arr, i) {
  var _i = null == arr ? null : "undefined" != typeof Symbol && arr[Symbol.iterator] || arr["@@iterator"];
  if (null != _i) {
    var _s,
      _e,
      _x,
      _r,
      _arr = [],
      _n = !0,
      _d = !1;
    try {
      if (_x = (_i = _i.call(arr)).next, 0 === i) {
        if (Object(_i) !== _i) return;
        _n = !1;
      } else for (; !(_n = (_s = _x.call(_i)).done) && (_arr.push(_s.value), _arr.length !== i); _n = !0);
    } catch (err) {
      _d = !0, _e = err;
    } finally {
      try {
        if (!_n && null != _i["return"] && (_r = _i["return"](), Object(_r) !== _r)) return;
      } finally {
        if (_d) throw _e;
      }
    }
    return _arr;
  }
}
module.exports = _iterableToArrayLimit, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 10228:
/***/ ((module) => {

function _nonIterableRest() {
  throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.");
}
module.exports = _nonIterableRest, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 888:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var _typeof = (__webpack_require__(40345)["default"]);
var assertThisInitialized = __webpack_require__(99650);
function _possibleConstructorReturn(self, call) {
  if (call && (_typeof(call) === "object" || typeof call === "function")) {
    return call;
  } else if (call !== void 0) {
    throw new TypeError("Derived constructors may only return object or undefined");
  }
  return assertThisInitialized(self);
}
module.exports = _possibleConstructorReturn, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 82673:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var _typeof = (__webpack_require__(40345)["default"]);
function _regeneratorRuntime() {
  "use strict"; /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */
  module.exports = _regeneratorRuntime = function _regeneratorRuntime() {
    return exports;
  }, module.exports.__esModule = true, module.exports["default"] = module.exports;
  var exports = {},
    Op = Object.prototype,
    hasOwn = Op.hasOwnProperty,
    defineProperty = Object.defineProperty || function (obj, key, desc) {
      obj[key] = desc.value;
    },
    $Symbol = "function" == typeof Symbol ? Symbol : {},
    iteratorSymbol = $Symbol.iterator || "@@iterator",
    asyncIteratorSymbol = $Symbol.asyncIterator || "@@asyncIterator",
    toStringTagSymbol = $Symbol.toStringTag || "@@toStringTag";
  function define(obj, key, value) {
    return Object.defineProperty(obj, key, {
      value: value,
      enumerable: !0,
      configurable: !0,
      writable: !0
    }), obj[key];
  }
  try {
    define({}, "");
  } catch (err) {
    define = function define(obj, key, value) {
      return obj[key] = value;
    };
  }
  function wrap(innerFn, outerFn, self, tryLocsList) {
    var protoGenerator = outerFn && outerFn.prototype instanceof Generator ? outerFn : Generator,
      generator = Object.create(protoGenerator.prototype),
      context = new Context(tryLocsList || []);
    return defineProperty(generator, "_invoke", {
      value: makeInvokeMethod(innerFn, self, context)
    }), generator;
  }
  function tryCatch(fn, obj, arg) {
    try {
      return {
        type: "normal",
        arg: fn.call(obj, arg)
      };
    } catch (err) {
      return {
        type: "throw",
        arg: err
      };
    }
  }
  exports.wrap = wrap;
  var ContinueSentinel = {};
  function Generator() {}
  function GeneratorFunction() {}
  function GeneratorFunctionPrototype() {}
  var IteratorPrototype = {};
  define(IteratorPrototype, iteratorSymbol, function () {
    return this;
  });
  var getProto = Object.getPrototypeOf,
    NativeIteratorPrototype = getProto && getProto(getProto(values([])));
  NativeIteratorPrototype && NativeIteratorPrototype !== Op && hasOwn.call(NativeIteratorPrototype, iteratorSymbol) && (IteratorPrototype = NativeIteratorPrototype);
  var Gp = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(IteratorPrototype);
  function defineIteratorMethods(prototype) {
    ["next", "throw", "return"].forEach(function (method) {
      define(prototype, method, function (arg) {
        return this._invoke(method, arg);
      });
    });
  }
  function AsyncIterator(generator, PromiseImpl) {
    function invoke(method, arg, resolve, reject) {
      var record = tryCatch(generator[method], generator, arg);
      if ("throw" !== record.type) {
        var result = record.arg,
          value = result.value;
        return value && "object" == _typeof(value) && hasOwn.call(value, "__await") ? PromiseImpl.resolve(value.__await).then(function (value) {
          invoke("next", value, resolve, reject);
        }, function (err) {
          invoke("throw", err, resolve, reject);
        }) : PromiseImpl.resolve(value).then(function (unwrapped) {
          result.value = unwrapped, resolve(result);
        }, function (error) {
          return invoke("throw", error, resolve, reject);
        });
      }
      reject(record.arg);
    }
    var previousPromise;
    defineProperty(this, "_invoke", {
      value: function value(method, arg) {
        function callInvokeWithMethodAndArg() {
          return new PromiseImpl(function (resolve, reject) {
            invoke(method, arg, resolve, reject);
          });
        }
        return previousPromise = previousPromise ? previousPromise.then(callInvokeWithMethodAndArg, callInvokeWithMethodAndArg) : callInvokeWithMethodAndArg();
      }
    });
  }
  function makeInvokeMethod(innerFn, self, context) {
    var state = "suspendedStart";
    return function (method, arg) {
      if ("executing" === state) throw new Error("Generator is already running");
      if ("completed" === state) {
        if ("throw" === method) throw arg;
        return doneResult();
      }
      for (context.method = method, context.arg = arg;;) {
        var delegate = context.delegate;
        if (delegate) {
          var delegateResult = maybeInvokeDelegate(delegate, context);
          if (delegateResult) {
            if (delegateResult === ContinueSentinel) continue;
            return delegateResult;
          }
        }
        if ("next" === context.method) context.sent = context._sent = context.arg;else if ("throw" === context.method) {
          if ("suspendedStart" === state) throw state = "completed", context.arg;
          context.dispatchException(context.arg);
        } else "return" === context.method && context.abrupt("return", context.arg);
        state = "executing";
        var record = tryCatch(innerFn, self, context);
        if ("normal" === record.type) {
          if (state = context.done ? "completed" : "suspendedYield", record.arg === ContinueSentinel) continue;
          return {
            value: record.arg,
            done: context.done
          };
        }
        "throw" === record.type && (state = "completed", context.method = "throw", context.arg = record.arg);
      }
    };
  }
  function maybeInvokeDelegate(delegate, context) {
    var methodName = context.method,
      method = delegate.iterator[methodName];
    if (undefined === method) return context.delegate = null, "throw" === methodName && delegate.iterator["return"] && (context.method = "return", context.arg = undefined, maybeInvokeDelegate(delegate, context), "throw" === context.method) || "return" !== methodName && (context.method = "throw", context.arg = new TypeError("The iterator does not provide a '" + methodName + "' method")), ContinueSentinel;
    var record = tryCatch(method, delegate.iterator, context.arg);
    if ("throw" === record.type) return context.method = "throw", context.arg = record.arg, context.delegate = null, ContinueSentinel;
    var info = record.arg;
    return info ? info.done ? (context[delegate.resultName] = info.value, context.next = delegate.nextLoc, "return" !== context.method && (context.method = "next", context.arg = undefined), context.delegate = null, ContinueSentinel) : info : (context.method = "throw", context.arg = new TypeError("iterator result is not an object"), context.delegate = null, ContinueSentinel);
  }
  function pushTryEntry(locs) {
    var entry = {
      tryLoc: locs[0]
    };
    1 in locs && (entry.catchLoc = locs[1]), 2 in locs && (entry.finallyLoc = locs[2], entry.afterLoc = locs[3]), this.tryEntries.push(entry);
  }
  function resetTryEntry(entry) {
    var record = entry.completion || {};
    record.type = "normal", delete record.arg, entry.completion = record;
  }
  function Context(tryLocsList) {
    this.tryEntries = [{
      tryLoc: "root"
    }], tryLocsList.forEach(pushTryEntry, this), this.reset(!0);
  }
  function values(iterable) {
    if (iterable) {
      var iteratorMethod = iterable[iteratorSymbol];
      if (iteratorMethod) return iteratorMethod.call(iterable);
      if ("function" == typeof iterable.next) return iterable;
      if (!isNaN(iterable.length)) {
        var i = -1,
          next = function next() {
            for (; ++i < iterable.length;) if (hasOwn.call(iterable, i)) return next.value = iterable[i], next.done = !1, next;
            return next.value = undefined, next.done = !0, next;
          };
        return next.next = next;
      }
    }
    return {
      next: doneResult
    };
  }
  function doneResult() {
    return {
      value: undefined,
      done: !0
    };
  }
  return GeneratorFunction.prototype = GeneratorFunctionPrototype, defineProperty(Gp, "constructor", {
    value: GeneratorFunctionPrototype,
    configurable: !0
  }), defineProperty(GeneratorFunctionPrototype, "constructor", {
    value: GeneratorFunction,
    configurable: !0
  }), GeneratorFunction.displayName = define(GeneratorFunctionPrototype, toStringTagSymbol, "GeneratorFunction"), exports.isGeneratorFunction = function (genFun) {
    var ctor = "function" == typeof genFun && genFun.constructor;
    return !!ctor && (ctor === GeneratorFunction || "GeneratorFunction" === (ctor.displayName || ctor.name));
  }, exports.mark = function (genFun) {
    return Object.setPrototypeOf ? Object.setPrototypeOf(genFun, GeneratorFunctionPrototype) : (genFun.__proto__ = GeneratorFunctionPrototype, define(genFun, toStringTagSymbol, "GeneratorFunction")), genFun.prototype = Object.create(Gp), genFun;
  }, exports.awrap = function (arg) {
    return {
      __await: arg
    };
  }, defineIteratorMethods(AsyncIterator.prototype), define(AsyncIterator.prototype, asyncIteratorSymbol, function () {
    return this;
  }), exports.AsyncIterator = AsyncIterator, exports.async = function (innerFn, outerFn, self, tryLocsList, PromiseImpl) {
    void 0 === PromiseImpl && (PromiseImpl = Promise);
    var iter = new AsyncIterator(wrap(innerFn, outerFn, self, tryLocsList), PromiseImpl);
    return exports.isGeneratorFunction(outerFn) ? iter : iter.next().then(function (result) {
      return result.done ? result.value : iter.next();
    });
  }, defineIteratorMethods(Gp), define(Gp, toStringTagSymbol, "Generator"), define(Gp, iteratorSymbol, function () {
    return this;
  }), define(Gp, "toString", function () {
    return "[object Generator]";
  }), exports.keys = function (val) {
    var object = Object(val),
      keys = [];
    for (var key in object) keys.push(key);
    return keys.reverse(), function next() {
      for (; keys.length;) {
        var key = keys.pop();
        if (key in object) return next.value = key, next.done = !1, next;
      }
      return next.done = !0, next;
    };
  }, exports.values = values, Context.prototype = {
    constructor: Context,
    reset: function reset(skipTempReset) {
      if (this.prev = 0, this.next = 0, this.sent = this._sent = undefined, this.done = !1, this.delegate = null, this.method = "next", this.arg = undefined, this.tryEntries.forEach(resetTryEntry), !skipTempReset) for (var name in this) "t" === name.charAt(0) && hasOwn.call(this, name) && !isNaN(+name.slice(1)) && (this[name] = undefined);
    },
    stop: function stop() {
      this.done = !0;
      var rootRecord = this.tryEntries[0].completion;
      if ("throw" === rootRecord.type) throw rootRecord.arg;
      return this.rval;
    },
    dispatchException: function dispatchException(exception) {
      if (this.done) throw exception;
      var context = this;
      function handle(loc, caught) {
        return record.type = "throw", record.arg = exception, context.next = loc, caught && (context.method = "next", context.arg = undefined), !!caught;
      }
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i],
          record = entry.completion;
        if ("root" === entry.tryLoc) return handle("end");
        if (entry.tryLoc <= this.prev) {
          var hasCatch = hasOwn.call(entry, "catchLoc"),
            hasFinally = hasOwn.call(entry, "finallyLoc");
          if (hasCatch && hasFinally) {
            if (this.prev < entry.catchLoc) return handle(entry.catchLoc, !0);
            if (this.prev < entry.finallyLoc) return handle(entry.finallyLoc);
          } else if (hasCatch) {
            if (this.prev < entry.catchLoc) return handle(entry.catchLoc, !0);
          } else {
            if (!hasFinally) throw new Error("try statement without catch or finally");
            if (this.prev < entry.finallyLoc) return handle(entry.finallyLoc);
          }
        }
      }
    },
    abrupt: function abrupt(type, arg) {
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        if (entry.tryLoc <= this.prev && hasOwn.call(entry, "finallyLoc") && this.prev < entry.finallyLoc) {
          var finallyEntry = entry;
          break;
        }
      }
      finallyEntry && ("break" === type || "continue" === type) && finallyEntry.tryLoc <= arg && arg <= finallyEntry.finallyLoc && (finallyEntry = null);
      var record = finallyEntry ? finallyEntry.completion : {};
      return record.type = type, record.arg = arg, finallyEntry ? (this.method = "next", this.next = finallyEntry.finallyLoc, ContinueSentinel) : this.complete(record);
    },
    complete: function complete(record, afterLoc) {
      if ("throw" === record.type) throw record.arg;
      return "break" === record.type || "continue" === record.type ? this.next = record.arg : "return" === record.type ? (this.rval = this.arg = record.arg, this.method = "return", this.next = "end") : "normal" === record.type && afterLoc && (this.next = afterLoc), ContinueSentinel;
    },
    finish: function finish(finallyLoc) {
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        if (entry.finallyLoc === finallyLoc) return this.complete(entry.completion, entry.afterLoc), resetTryEntry(entry), ContinueSentinel;
      }
    },
    "catch": function _catch(tryLoc) {
      for (var i = this.tryEntries.length - 1; i >= 0; --i) {
        var entry = this.tryEntries[i];
        if (entry.tryLoc === tryLoc) {
          var record = entry.completion;
          if ("throw" === record.type) {
            var thrown = record.arg;
            resetTryEntry(entry);
          }
          return thrown;
        }
      }
      throw new Error("illegal catch attempt");
    },
    delegateYield: function delegateYield(iterable, resultName, nextLoc) {
      return this.delegate = {
        iterator: values(iterable),
        resultName: resultName,
        nextLoc: nextLoc
      }, "next" === this.method && (this.arg = undefined), ContinueSentinel;
    }
  }, exports;
}
module.exports = _regeneratorRuntime, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 8691:
/***/ ((module) => {

function _setPrototypeOf(o, p) {
  module.exports = _setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function _setPrototypeOf(o, p) {
    o.__proto__ = p;
    return o;
  }, module.exports.__esModule = true, module.exports["default"] = module.exports;
  return _setPrototypeOf(o, p);
}
module.exports = _setPrototypeOf, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 82237:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var arrayWithHoles = __webpack_require__(54763);
var iterableToArrayLimit = __webpack_require__(30550);
var unsupportedIterableToArray = __webpack_require__(282);
var nonIterableRest = __webpack_require__(10228);
function _slicedToArray(arr, i) {
  return arrayWithHoles(arr) || iterableToArrayLimit(arr, i) || unsupportedIterableToArray(arr, i) || nonIterableRest();
}
module.exports = _slicedToArray, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 41440:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var _typeof = (__webpack_require__(40345)["default"]);
function _toPrimitive(input, hint) {
  if (_typeof(input) !== "object" || input === null) return input;
  var prim = input[Symbol.toPrimitive];
  if (prim !== undefined) {
    var res = prim.call(input, hint || "default");
    if (_typeof(res) !== "object") return res;
    throw new TypeError("@@toPrimitive must return a primitive value.");
  }
  return (hint === "string" ? String : Number)(input);
}
module.exports = _toPrimitive, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 61090:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var _typeof = (__webpack_require__(40345)["default"]);
var toPrimitive = __webpack_require__(41440);
function _toPropertyKey(arg) {
  var key = toPrimitive(arg, "string");
  return _typeof(key) === "symbol" ? key : String(key);
}
module.exports = _toPropertyKey, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 40345:
/***/ ((module) => {

function _typeof(obj) {
  "@babel/helpers - typeof";

  return (module.exports = _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
    return typeof obj;
  } : function (obj) {
    return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
  }, module.exports.__esModule = true, module.exports["default"] = module.exports), _typeof(obj);
}
module.exports = _typeof, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 282:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var arrayLikeToArray = __webpack_require__(20299);
function _unsupportedIterableToArray(o, minLen) {
  if (!o) return;
  if (typeof o === "string") return arrayLikeToArray(o, minLen);
  var n = Object.prototype.toString.call(o).slice(8, -1);
  if (n === "Object" && o.constructor) n = o.constructor.name;
  if (n === "Map" || n === "Set") return Array.from(o);
  if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return arrayLikeToArray(o, minLen);
}
module.exports = _unsupportedIterableToArray, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 19172:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

var getPrototypeOf = __webpack_require__(80278);
var setPrototypeOf = __webpack_require__(8691);
var isNativeFunction = __webpack_require__(64759);
var construct = __webpack_require__(48103);
function _wrapNativeSuper(Class) {
  var _cache = typeof Map === "function" ? new Map() : undefined;
  module.exports = _wrapNativeSuper = function _wrapNativeSuper(Class) {
    if (Class === null || !isNativeFunction(Class)) return Class;
    if (typeof Class !== "function") {
      throw new TypeError("Super expression must either be null or a function");
    }
    if (typeof _cache !== "undefined") {
      if (_cache.has(Class)) return _cache.get(Class);
      _cache.set(Class, Wrapper);
    }
    function Wrapper() {
      return construct(Class, arguments, getPrototypeOf(this).constructor);
    }
    Wrapper.prototype = Object.create(Class.prototype, {
      constructor: {
        value: Wrapper,
        enumerable: false,
        writable: true,
        configurable: true
      }
    });
    return setPrototypeOf(Wrapper, Class);
  }, module.exports.__esModule = true, module.exports["default"] = module.exports;
  return _wrapNativeSuper(Class);
}
module.exports = _wrapNativeSuper, module.exports.__esModule = true, module.exports["default"] = module.exports;

/***/ }),

/***/ 94957:
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

// TODO(Babel 8): Remove this file.

var runtime = __webpack_require__(82673)();
module.exports = runtime;

// Copied from https://github.com/facebook/regenerator/blob/main/packages/runtime/runtime.js#L736=
try {
  regeneratorRuntime = runtime;
} catch (accidentalStrictMode) {
  if (typeof globalThis === "object") {
    globalThis.regeneratorRuntime = runtime;
  } else {
    Function("r", "regeneratorRuntime = r")(runtime);
  }
}


/***/ }),

/***/ 15200:
/***/ ((__unused_webpack_module, exports) => {

"use strict";


exports._ = exports._class_private_field_loose_base = _class_private_field_loose_base;
function _class_private_field_loose_base(receiver, privateKey) {
    if (!Object.prototype.hasOwnProperty.call(receiver, privateKey)) {
        throw new TypeError("attempted to use private field on non-instance");
    }

    return receiver;
}


/***/ }),

/***/ 3070:
/***/ ((__unused_webpack_module, exports) => {

"use strict";


var id = 0;

exports._ = exports._class_private_field_loose_key = _class_private_field_loose_key;
function _class_private_field_loose_key(name) {
    return "__private_" + id++ + "_" + name;
}


/***/ }),

/***/ 84813:
/***/ ((__unused_webpack_module, exports) => {

"use strict";


exports._ = exports._interop_require_default = _interop_require_default;
function _interop_require_default(obj) {
    return obj && obj.__esModule ? obj : { default: obj };
}


/***/ }),

/***/ 45298:
/***/ ((__unused_webpack_module, exports) => {

"use strict";


function _getRequireWildcardCache(nodeInterop) {
    if (typeof WeakMap !== "function") return null;

    var cacheBabelInterop = new WeakMap();
    var cacheNodeInterop = new WeakMap();

    return (_getRequireWildcardCache = function(nodeInterop) {
        return nodeInterop ? cacheNodeInterop : cacheBabelInterop;
    })(nodeInterop);
}
exports._ = exports._interop_require_wildcard = _interop_require_wildcard;
function _interop_require_wildcard(obj, nodeInterop) {
    if (!nodeInterop && obj && obj.__esModule) return obj;
    if (obj === null || typeof obj !== "object" && typeof obj !== "function") return { default: obj };

    var cache = _getRequireWildcardCache(nodeInterop);

    if (cache && cache.has(obj)) return cache.get(obj);

    var newObj = {};
    var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor;

    for (var key in obj) {
        if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) {
            var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null;
            if (desc && (desc.get || desc.set)) Object.defineProperty(newObj, key, desc);
            else newObj[key] = obj[key];
        }
    }

    newObj.default = obj;

    if (cache) cache.set(obj, newObj);

    return newObj;
}


/***/ }),

/***/ 34088:
/***/ ((__unused_webpack_module, exports) => {

"use strict";

exports._ = exports._interop_require_default = _interop_require_default;
function _interop_require_default(obj) {
    return obj && obj.__esModule ? obj : {
        default: obj
    };
}


/***/ }),

/***/ 91911:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  F: () => (/* binding */ chunk_UIGT7YZF_useTheme)
});

// EXTERNAL MODULE: external "next/dist/compiled/react"
var react_ = __webpack_require__(18038);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+sheet@1.2.2/node_modules/@emotion/sheet/dist/emotion-sheet.esm.js
/*

Based off glamor's StyleSheet, thanks Sunil ❤️

high performance StyleSheet for css-in-js systems

- uses multiple style tags behind the scenes for millions of rules
- uses `insertRule` for appending in production for *much* faster performance

// usage

import { StyleSheet } from '@emotion/sheet'

let styleSheet = new StyleSheet({ key: '', container: document.head })

styleSheet.insert('#box { border: 1px solid red; }')
- appends a css rule into the stylesheet

styleSheet.flush()
- empties the stylesheet of all its contents

*/
// $FlowFixMe
function sheetForTag(tag) {
  if (tag.sheet) {
    // $FlowFixMe
    return tag.sheet;
  } // this weirdness brought to you by firefox

  /* istanbul ignore next */


  for (var i = 0; i < document.styleSheets.length; i++) {
    if (document.styleSheets[i].ownerNode === tag) {
      // $FlowFixMe
      return document.styleSheets[i];
    }
  }
}

function createStyleElement(options) {
  var tag = document.createElement('style');
  tag.setAttribute('data-emotion', options.key);

  if (options.nonce !== undefined) {
    tag.setAttribute('nonce', options.nonce);
  }

  tag.appendChild(document.createTextNode(''));
  tag.setAttribute('data-s', '');
  return tag;
}

var StyleSheet = /*#__PURE__*/function () {
  // Using Node instead of HTMLElement since container may be a ShadowRoot
  function StyleSheet(options) {
    var _this = this;

    this._insertTag = function (tag) {
      var before;

      if (_this.tags.length === 0) {
        if (_this.insertionPoint) {
          before = _this.insertionPoint.nextSibling;
        } else if (_this.prepend) {
          before = _this.container.firstChild;
        } else {
          before = _this.before;
        }
      } else {
        before = _this.tags[_this.tags.length - 1].nextSibling;
      }

      _this.container.insertBefore(tag, before);

      _this.tags.push(tag);
    };

    this.isSpeedy = options.speedy === undefined ? "production" === 'production' : options.speedy;
    this.tags = [];
    this.ctr = 0;
    this.nonce = options.nonce; // key is the value of the data-emotion attribute, it's used to identify different sheets

    this.key = options.key;
    this.container = options.container;
    this.prepend = options.prepend;
    this.insertionPoint = options.insertionPoint;
    this.before = null;
  }

  var _proto = StyleSheet.prototype;

  _proto.hydrate = function hydrate(nodes) {
    nodes.forEach(this._insertTag);
  };

  _proto.insert = function insert(rule) {
    // the max length is how many rules we have per style tag, it's 65000 in speedy mode
    // it's 1 in dev because we insert source maps that map a single rule to a location
    // and you can only have one source map per style tag
    if (this.ctr % (this.isSpeedy ? 65000 : 1) === 0) {
      this._insertTag(createStyleElement(this));
    }

    var tag = this.tags[this.tags.length - 1];

    if (false) { var isImportRule; }

    if (this.isSpeedy) {
      var sheet = sheetForTag(tag);

      try {
        // this is the ultrafast version, works across browsers
        // the big drawback is that the css won't be editable in devtools
        sheet.insertRule(rule, sheet.cssRules.length);
      } catch (e) {
        if (false) {}
      }
    } else {
      tag.appendChild(document.createTextNode(rule));
    }

    this.ctr++;
  };

  _proto.flush = function flush() {
    // $FlowFixMe
    this.tags.forEach(function (tag) {
      return tag.parentNode && tag.parentNode.removeChild(tag);
    });
    this.tags = [];
    this.ctr = 0;

    if (false) {}
  };

  return StyleSheet;
}();



;// CONCATENATED MODULE: ../../node_modules/.pnpm/stylis@4.2.0/node_modules/stylis/src/Utility.js
/**
 * @param {number}
 * @return {number}
 */
var abs = Math.abs

/**
 * @param {number}
 * @return {string}
 */
var Utility_from = String.fromCharCode

/**
 * @param {object}
 * @return {object}
 */
var Utility_assign = Object.assign

/**
 * @param {string} value
 * @param {number} length
 * @return {number}
 */
function hash (value, length) {
	return Utility_charat(value, 0) ^ 45 ? (((((((length << 2) ^ Utility_charat(value, 0)) << 2) ^ Utility_charat(value, 1)) << 2) ^ Utility_charat(value, 2)) << 2) ^ Utility_charat(value, 3) : 0
}

/**
 * @param {string} value
 * @return {string}
 */
function trim (value) {
	return value.trim()
}

/**
 * @param {string} value
 * @param {RegExp} pattern
 * @return {string?}
 */
function Utility_match (value, pattern) {
	return (value = pattern.exec(value)) ? value[0] : value
}

/**
 * @param {string} value
 * @param {(string|RegExp)} pattern
 * @param {string} replacement
 * @return {string}
 */
function Utility_replace (value, pattern, replacement) {
	return value.replace(pattern, replacement)
}

/**
 * @param {string} value
 * @param {string} search
 * @return {number}
 */
function indexof (value, search) {
	return value.indexOf(search)
}

/**
 * @param {string} value
 * @param {number} index
 * @return {number}
 */
function Utility_charat (value, index) {
	return value.charCodeAt(index) | 0
}

/**
 * @param {string} value
 * @param {number} begin
 * @param {number} end
 * @return {string}
 */
function Utility_substr (value, begin, end) {
	return value.slice(begin, end)
}

/**
 * @param {string} value
 * @return {number}
 */
function Utility_strlen (value) {
	return value.length
}

/**
 * @param {any[]} value
 * @return {number}
 */
function Utility_sizeof (value) {
	return value.length
}

/**
 * @param {any} value
 * @param {any[]} array
 * @return {any}
 */
function Utility_append (value, array) {
	return array.push(value), value
}

/**
 * @param {string[]} array
 * @param {function} callback
 * @return {string}
 */
function Utility_combine (array, callback) {
	return array.map(callback).join('')
}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/stylis@4.2.0/node_modules/stylis/src/Tokenizer.js


var line = 1
var column = 1
var Tokenizer_length = 0
var position = 0
var character = 0
var characters = ''

/**
 * @param {string} value
 * @param {object | null} root
 * @param {object | null} parent
 * @param {string} type
 * @param {string[] | string} props
 * @param {object[] | string} children
 * @param {number} length
 */
function node (value, root, parent, type, props, children, length) {
	return {value: value, root: root, parent: parent, type: type, props: props, children: children, line: line, column: column, length: length, return: ''}
}

/**
 * @param {object} root
 * @param {object} props
 * @return {object}
 */
function Tokenizer_copy (root, props) {
	return Utility_assign(node('', null, null, '', null, null, 0), root, {length: -root.length}, props)
}

/**
 * @return {number}
 */
function Tokenizer_char () {
	return character
}

/**
 * @return {number}
 */
function prev () {
	character = position > 0 ? Utility_charat(characters, --position) : 0

	if (column--, character === 10)
		column = 1, line--

	return character
}

/**
 * @return {number}
 */
function next () {
	character = position < Tokenizer_length ? Utility_charat(characters, position++) : 0

	if (column++, character === 10)
		column = 1, line++

	return character
}

/**
 * @return {number}
 */
function peek () {
	return Utility_charat(characters, position)
}

/**
 * @return {number}
 */
function caret () {
	return position
}

/**
 * @param {number} begin
 * @param {number} end
 * @return {string}
 */
function slice (begin, end) {
	return Utility_substr(characters, begin, end)
}

/**
 * @param {number} type
 * @return {number}
 */
function token (type) {
	switch (type) {
		// \0 \t \n \r \s whitespace token
		case 0: case 9: case 10: case 13: case 32:
			return 5
		// ! + , / > @ ~ isolate token
		case 33: case 43: case 44: case 47: case 62: case 64: case 126:
		// ; { } breakpoint token
		case 59: case 123: case 125:
			return 4
		// : accompanied token
		case 58:
			return 3
		// " ' ( [ opening delimit token
		case 34: case 39: case 40: case 91:
			return 2
		// ) ] closing delimit token
		case 41: case 93:
			return 1
	}

	return 0
}

/**
 * @param {string} value
 * @return {any[]}
 */
function alloc (value) {
	return line = column = 1, Tokenizer_length = Utility_strlen(characters = value), position = 0, []
}

/**
 * @param {any} value
 * @return {any}
 */
function dealloc (value) {
	return characters = '', value
}

/**
 * @param {number} type
 * @return {string}
 */
function delimit (type) {
	return trim(slice(position - 1, delimiter(type === 91 ? type + 2 : type === 40 ? type + 1 : type)))
}

/**
 * @param {string} value
 * @return {string[]}
 */
function Tokenizer_tokenize (value) {
	return dealloc(tokenizer(alloc(value)))
}

/**
 * @param {number} type
 * @return {string}
 */
function whitespace (type) {
	while (character = peek())
		if (character < 33)
			next()
		else
			break

	return token(type) > 2 || token(character) > 3 ? '' : ' '
}

/**
 * @param {string[]} children
 * @return {string[]}
 */
function tokenizer (children) {
	while (next())
		switch (token(character)) {
			case 0: append(identifier(position - 1), children)
				break
			case 2: append(delimit(character), children)
				break
			default: append(from(character), children)
		}

	return children
}

/**
 * @param {number} index
 * @param {number} count
 * @return {string}
 */
function escaping (index, count) {
	while (--count && next())
		// not 0-9 A-F a-f
		if (character < 48 || character > 102 || (character > 57 && character < 65) || (character > 70 && character < 97))
			break

	return slice(index, caret() + (count < 6 && peek() == 32 && next() == 32))
}

/**
 * @param {number} type
 * @return {number}
 */
function delimiter (type) {
	while (next())
		switch (character) {
			// ] ) " '
			case type:
				return position
			// " '
			case 34: case 39:
				if (type !== 34 && type !== 39)
					delimiter(character)
				break
			// (
			case 40:
				if (type === 41)
					delimiter(type)
				break
			// \
			case 92:
				next()
				break
		}

	return position
}

/**
 * @param {number} type
 * @param {number} index
 * @return {number}
 */
function commenter (type, index) {
	while (next())
		// //
		if (type + character === 47 + 10)
			break
		// /*
		else if (type + character === 42 + 42 && peek() === 47)
			break

	return '/*' + slice(index, position - 1) + '*' + Utility_from(type === 47 ? type : next())
}

/**
 * @param {number} index
 * @return {string}
 */
function identifier (index) {
	while (!token(peek()))
		next()

	return slice(index, position)
}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/stylis@4.2.0/node_modules/stylis/src/Enum.js
var Enum_MS = '-ms-'
var Enum_MOZ = '-moz-'
var Enum_WEBKIT = '-webkit-'

var COMMENT = 'comm'
var Enum_RULESET = 'rule'
var Enum_DECLARATION = 'decl'

var PAGE = '@page'
var MEDIA = '@media'
var IMPORT = '@import'
var CHARSET = '@charset'
var VIEWPORT = '@viewport'
var SUPPORTS = '@supports'
var DOCUMENT = '@document'
var NAMESPACE = '@namespace'
var Enum_KEYFRAMES = '@keyframes'
var FONT_FACE = '@font-face'
var COUNTER_STYLE = '@counter-style'
var FONT_FEATURE_VALUES = '@font-feature-values'
var LAYER = '@layer'

;// CONCATENATED MODULE: ../../node_modules/.pnpm/stylis@4.2.0/node_modules/stylis/src/Serializer.js



/**
 * @param {object[]} children
 * @param {function} callback
 * @return {string}
 */
function Serializer_serialize (children, callback) {
	var output = ''
	var length = Utility_sizeof(children)

	for (var i = 0; i < length; i++)
		output += callback(children[i], i, children, callback) || ''

	return output
}

/**
 * @param {object} element
 * @param {number} index
 * @param {object[]} children
 * @param {function} callback
 * @return {string}
 */
function stringify (element, index, children, callback) {
	switch (element.type) {
		case LAYER: if (element.children.length) break
		case IMPORT: case Enum_DECLARATION: return element.return = element.return || element.value
		case COMMENT: return ''
		case Enum_KEYFRAMES: return element.return = element.value + '{' + Serializer_serialize(element.children, callback) + '}'
		case Enum_RULESET: element.value = element.props.join(',')
	}

	return Utility_strlen(children = Serializer_serialize(element.children, callback)) ? element.return = element.value + '{' + children + '}' : ''
}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/stylis@4.2.0/node_modules/stylis/src/Middleware.js






/**
 * @param {function[]} collection
 * @return {function}
 */
function middleware (collection) {
	var length = Utility_sizeof(collection)

	return function (element, index, children, callback) {
		var output = ''

		for (var i = 0; i < length; i++)
			output += collection[i](element, index, children, callback) || ''

		return output
	}
}

/**
 * @param {function} callback
 * @return {function}
 */
function rulesheet (callback) {
	return function (element) {
		if (!element.root)
			if (element = element.return)
				callback(element)
	}
}

/**
 * @param {object} element
 * @param {number} index
 * @param {object[]} children
 * @param {function} callback
 */
function prefixer (element, index, children, callback) {
	if (element.length > -1)
		if (!element.return)
			switch (element.type) {
				case DECLARATION: element.return = prefix(element.value, element.length, children)
					return
				case KEYFRAMES:
					return serialize([copy(element, {value: replace(element.value, '@', '@' + WEBKIT)})], callback)
				case RULESET:
					if (element.length)
						return combine(element.props, function (value) {
							switch (match(value, /(::plac\w+|:read-\w+)/)) {
								// :read-(only|write)
								case ':read-only': case ':read-write':
									return serialize([copy(element, {props: [replace(value, /:(read-\w+)/, ':' + MOZ + '$1')]})], callback)
								// :placeholder
								case '::placeholder':
									return serialize([
										copy(element, {props: [replace(value, /:(plac\w+)/, ':' + WEBKIT + 'input-$1')]}),
										copy(element, {props: [replace(value, /:(plac\w+)/, ':' + MOZ + '$1')]}),
										copy(element, {props: [replace(value, /:(plac\w+)/, MS + 'input-$1')]})
									], callback)
							}

							return ''
						})
			}
}

/**
 * @param {object} element
 * @param {number} index
 * @param {object[]} children
 */
function namespace (element) {
	switch (element.type) {
		case RULESET:
			element.props = element.props.map(function (value) {
				return combine(tokenize(value), function (value, index, children) {
					switch (charat(value, 0)) {
						// \f
						case 12:
							return substr(value, 1, strlen(value))
						// \0 ( + > ~
						case 0: case 40: case 43: case 62: case 126:
							return value
						// :
						case 58:
							if (children[++index] === 'global')
								children[index] = '', children[++index] = '\f' + substr(children[index], index = 1, -1)
						// \s
						case 32:
							return index === 1 ? '' : value
						default:
							switch (index) {
								case 0: element = value
									return sizeof(children) > 1 ? '' : value
								case index = sizeof(children) - 1: case 2:
									return index === 2 ? value + element + element : value + element
								default:
									return value
							}
					}
				})
			})
	}
}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/stylis@4.2.0/node_modules/stylis/src/Parser.js




/**
 * @param {string} value
 * @return {object[]}
 */
function compile (value) {
	return dealloc(parse('', null, null, null, [''], value = alloc(value), 0, [0], value))
}

/**
 * @param {string} value
 * @param {object} root
 * @param {object?} parent
 * @param {string[]} rule
 * @param {string[]} rules
 * @param {string[]} rulesets
 * @param {number[]} pseudo
 * @param {number[]} points
 * @param {string[]} declarations
 * @return {object}
 */
function parse (value, root, parent, rule, rules, rulesets, pseudo, points, declarations) {
	var index = 0
	var offset = 0
	var length = pseudo
	var atrule = 0
	var property = 0
	var previous = 0
	var variable = 1
	var scanning = 1
	var ampersand = 1
	var character = 0
	var type = ''
	var props = rules
	var children = rulesets
	var reference = rule
	var characters = type

	while (scanning)
		switch (previous = character, character = next()) {
			// (
			case 40:
				if (previous != 108 && Utility_charat(characters, length - 1) == 58) {
					if (indexof(characters += Utility_replace(delimit(character), '&', '&\f'), '&\f') != -1)
						ampersand = -1
					break
				}
			// " ' [
			case 34: case 39: case 91:
				characters += delimit(character)
				break
			// \t \n \r \s
			case 9: case 10: case 13: case 32:
				characters += whitespace(previous)
				break
			// \
			case 92:
				characters += escaping(caret() - 1, 7)
				continue
			// /
			case 47:
				switch (peek()) {
					case 42: case 47:
						Utility_append(comment(commenter(next(), caret()), root, parent), declarations)
						break
					default:
						characters += '/'
				}
				break
			// {
			case 123 * variable:
				points[index++] = Utility_strlen(characters) * ampersand
			// } ; \0
			case 125 * variable: case 59: case 0:
				switch (character) {
					// \0 }
					case 0: case 125: scanning = 0
					// ;
					case 59 + offset: if (ampersand == -1) characters = Utility_replace(characters, /\f/g, '')
						if (property > 0 && (Utility_strlen(characters) - length))
							Utility_append(property > 32 ? declaration(characters + ';', rule, parent, length - 1) : declaration(Utility_replace(characters, ' ', '') + ';', rule, parent, length - 2), declarations)
						break
					// @ ;
					case 59: characters += ';'
					// { rule/at-rule
					default:
						Utility_append(reference = ruleset(characters, root, parent, index, offset, rules, points, type, props = [], children = [], length), rulesets)

						if (character === 123)
							if (offset === 0)
								parse(characters, root, reference, reference, props, rulesets, length, points, children)
							else
								switch (atrule === 99 && Utility_charat(characters, 3) === 110 ? 100 : atrule) {
									// d l m s
									case 100: case 108: case 109: case 115:
										parse(value, reference, reference, rule && Utility_append(ruleset(value, reference, reference, 0, 0, rules, points, type, rules, props = [], length), children), rules, children, length, points, rule ? props : children)
										break
									default:
										parse(characters, reference, reference, reference, [''], children, 0, points, children)
								}
				}

				index = offset = property = 0, variable = ampersand = 1, type = characters = '', length = pseudo
				break
			// :
			case 58:
				length = 1 + Utility_strlen(characters), property = previous
			default:
				if (variable < 1)
					if (character == 123)
						--variable
					else if (character == 125 && variable++ == 0 && prev() == 125)
						continue

				switch (characters += Utility_from(character), character * variable) {
					// &
					case 38:
						ampersand = offset > 0 ? 1 : (characters += '\f', -1)
						break
					// ,
					case 44:
						points[index++] = (Utility_strlen(characters) - 1) * ampersand, ampersand = 1
						break
					// @
					case 64:
						// -
						if (peek() === 45)
							characters += delimit(next())

						atrule = peek(), offset = length = Utility_strlen(type = characters += identifier(caret())), character++
						break
					// -
					case 45:
						if (previous === 45 && Utility_strlen(characters) == 2)
							variable = 0
				}
		}

	return rulesets
}

/**
 * @param {string} value
 * @param {object} root
 * @param {object?} parent
 * @param {number} index
 * @param {number} offset
 * @param {string[]} rules
 * @param {number[]} points
 * @param {string} type
 * @param {string[]} props
 * @param {string[]} children
 * @param {number} length
 * @return {object}
 */
function ruleset (value, root, parent, index, offset, rules, points, type, props, children, length) {
	var post = offset - 1
	var rule = offset === 0 ? rules : ['']
	var size = Utility_sizeof(rule)

	for (var i = 0, j = 0, k = 0; i < index; ++i)
		for (var x = 0, y = Utility_substr(value, post + 1, post = abs(j = points[i])), z = value; x < size; ++x)
			if (z = trim(j > 0 ? rule[x] + ' ' + y : Utility_replace(y, /&\f/g, rule[x])))
				props[k++] = z

	return node(value, root, parent, offset === 0 ? Enum_RULESET : type, props, children, length)
}

/**
 * @param {number} value
 * @param {object} root
 * @param {object?} parent
 * @return {object}
 */
function comment (value, root, parent) {
	return node(value, root, parent, COMMENT, Utility_from(Tokenizer_char()), Utility_substr(value, 2, -2), 0)
}

/**
 * @param {string} value
 * @param {object} root
 * @param {object?} parent
 * @param {number} length
 * @return {object}
 */
function declaration (value, root, parent, length) {
	return node(value, root, parent, Enum_DECLARATION, Utility_substr(value, 0, length), Utility_substr(value, length + 1, -1), length)
}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+weak-memoize@0.3.1/node_modules/@emotion/weak-memoize/dist/emotion-weak-memoize.esm.js
var emotion_weak_memoize_esm_weakMemoize = function weakMemoize(func) {
  // $FlowFixMe flow doesn't include all non-primitive types as allowed for weakmaps
  var cache = new WeakMap();
  return function (arg) {
    if (cache.has(arg)) {
      // $FlowFixMe
      return cache.get(arg);
    }

    var ret = func(arg);
    cache.set(arg, ret);
    return ret;
  };
};



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+memoize@0.8.1/node_modules/@emotion/memoize/dist/emotion-memoize.esm.js
function emotion_memoize_esm_memoize(fn) {
  var cache = Object.create(null);
  return function (arg) {
    if (cache[arg] === undefined) cache[arg] = fn(arg);
    return cache[arg];
  };
}



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+cache@11.11.0/node_modules/@emotion/cache/dist/emotion-cache.esm.js





var identifierWithPointTracking = function identifierWithPointTracking(begin, points, index) {
  var previous = 0;
  var character = 0;

  while (true) {
    previous = character;
    character = peek(); // &\f

    if (previous === 38 && character === 12) {
      points[index] = 1;
    }

    if (token(character)) {
      break;
    }

    next();
  }

  return slice(begin, position);
};

var toRules = function toRules(parsed, points) {
  // pretend we've started with a comma
  var index = -1;
  var character = 44;

  do {
    switch (token(character)) {
      case 0:
        // &\f
        if (character === 38 && peek() === 12) {
          // this is not 100% correct, we don't account for literal sequences here - like for example quoted strings
          // stylis inserts \f after & to know when & where it should replace this sequence with the context selector
          // and when it should just concatenate the outer and inner selectors
          // it's very unlikely for this sequence to actually appear in a different context, so we just leverage this fact here
          points[index] = 1;
        }

        parsed[index] += identifierWithPointTracking(position - 1, points, index);
        break;

      case 2:
        parsed[index] += delimit(character);
        break;

      case 4:
        // comma
        if (character === 44) {
          // colon
          parsed[++index] = peek() === 58 ? '&\f' : '';
          points[index] = parsed[index].length;
          break;
        }

      // fallthrough

      default:
        parsed[index] += Utility_from(character);
    }
  } while (character = next());

  return parsed;
};

var getRules = function getRules(value, points) {
  return dealloc(toRules(alloc(value), points));
}; // WeakSet would be more appropriate, but only WeakMap is supported in IE11


var fixedElements = /* #__PURE__ */new WeakMap();
var compat = function compat(element) {
  if (element.type !== 'rule' || !element.parent || // positive .length indicates that this rule contains pseudo
  // negative .length indicates that this rule has been already prefixed
  element.length < 1) {
    return;
  }

  var value = element.value,
      parent = element.parent;
  var isImplicitRule = element.column === parent.column && element.line === parent.line;

  while (parent.type !== 'rule') {
    parent = parent.parent;
    if (!parent) return;
  } // short-circuit for the simplest case


  if (element.props.length === 1 && value.charCodeAt(0) !== 58
  /* colon */
  && !fixedElements.get(parent)) {
    return;
  } // if this is an implicitly inserted rule (the one eagerly inserted at the each new nested level)
  // then the props has already been manipulated beforehand as they that array is shared between it and its "rule parent"


  if (isImplicitRule) {
    return;
  }

  fixedElements.set(element, true);
  var points = [];
  var rules = getRules(value, points);
  var parentRules = parent.props;

  for (var i = 0, k = 0; i < rules.length; i++) {
    for (var j = 0; j < parentRules.length; j++, k++) {
      element.props[k] = points[i] ? rules[i].replace(/&\f/g, parentRules[j]) : parentRules[j] + " " + rules[i];
    }
  }
};
var removeLabel = function removeLabel(element) {
  if (element.type === 'decl') {
    var value = element.value;

    if ( // charcode for l
    value.charCodeAt(0) === 108 && // charcode for b
    value.charCodeAt(2) === 98) {
      // this ignores label
      element["return"] = '';
      element.value = '';
    }
  }
};
var ignoreFlag = 'emotion-disable-server-rendering-unsafe-selector-warning-please-do-not-use-this-the-warning-exists-for-a-reason';

var isIgnoringComment = function isIgnoringComment(element) {
  return element.type === 'comm' && element.children.indexOf(ignoreFlag) > -1;
};

var createUnsafeSelectorsAlarm = function createUnsafeSelectorsAlarm(cache) {
  return function (element, index, children) {
    if (element.type !== 'rule' || cache.compat) return;
    var unsafePseudoClasses = element.value.match(/(:first|:nth|:nth-last)-child/g);

    if (unsafePseudoClasses) {
      var isNested = !!element.parent; // in nested rules comments become children of the "auto-inserted" rule and that's always the `element.parent`
      //
      // considering this input:
      // .a {
      //   .b /* comm */ {}
      //   color: hotpink;
      // }
      // we get output corresponding to this:
      // .a {
      //   & {
      //     /* comm */
      //     color: hotpink;
      //   }
      //   .b {}
      // }

      var commentContainer = isNested ? element.parent.children : // global rule at the root level
      children;

      for (var i = commentContainer.length - 1; i >= 0; i--) {
        var node = commentContainer[i];

        if (node.line < element.line) {
          break;
        } // it is quite weird but comments are *usually* put at `column: element.column - 1`
        // so we seek *from the end* for the node that is earlier than the rule's `element` and check that
        // this will also match inputs like this:
        // .a {
        //   /* comm */
        //   .b {}
        // }
        //
        // but that is fine
        //
        // it would be the easiest to change the placement of the comment to be the first child of the rule:
        // .a {
        //   .b { /* comm */ }
        // }
        // with such inputs we wouldn't have to search for the comment at all
        // TODO: consider changing this comment placement in the next major version


        if (node.column < element.column) {
          if (isIgnoringComment(node)) {
            return;
          }

          break;
        }
      }

      unsafePseudoClasses.forEach(function (unsafePseudoClass) {
        console.error("The pseudo class \"" + unsafePseudoClass + "\" is potentially unsafe when doing server-side rendering. Try changing it to \"" + unsafePseudoClass.split('-child')[0] + "-of-type\".");
      });
    }
  };
};

var isImportRule = function isImportRule(element) {
  return element.type.charCodeAt(1) === 105 && element.type.charCodeAt(0) === 64;
};

var isPrependedWithRegularRules = function isPrependedWithRegularRules(index, children) {
  for (var i = index - 1; i >= 0; i--) {
    if (!isImportRule(children[i])) {
      return true;
    }
  }

  return false;
}; // use this to remove incorrect elements from further processing
// so they don't get handed to the `sheet` (or anything else)
// as that could potentially lead to additional logs which in turn could be overhelming to the user


var nullifyElement = function nullifyElement(element) {
  element.type = '';
  element.value = '';
  element["return"] = '';
  element.children = '';
  element.props = '';
};

var incorrectImportAlarm = function incorrectImportAlarm(element, index, children) {
  if (!isImportRule(element)) {
    return;
  }

  if (element.parent) {
    console.error("`@import` rules can't be nested inside other rules. Please move it to the top level and put it before regular rules. Keep in mind that they can only be used within global styles.");
    nullifyElement(element);
  } else if (isPrependedWithRegularRules(index, children)) {
    console.error("`@import` rules can't be after other rules. Please put your `@import` rules before your other rules.");
    nullifyElement(element);
  }
};

/* eslint-disable no-fallthrough */

function emotion_cache_esm_prefix(value, length) {
  switch (hash(value, length)) {
    // color-adjust
    case 5103:
      return Enum_WEBKIT + 'print-' + value + value;
    // animation, animation-(delay|direction|duration|fill-mode|iteration-count|name|play-state|timing-function)

    case 5737:
    case 4201:
    case 3177:
    case 3433:
    case 1641:
    case 4457:
    case 2921: // text-decoration, filter, clip-path, backface-visibility, column, box-decoration-break

    case 5572:
    case 6356:
    case 5844:
    case 3191:
    case 6645:
    case 3005: // mask, mask-image, mask-(mode|clip|size), mask-(repeat|origin), mask-position, mask-composite,

    case 6391:
    case 5879:
    case 5623:
    case 6135:
    case 4599:
    case 4855: // background-clip, columns, column-(count|fill|gap|rule|rule-color|rule-style|rule-width|span|width)

    case 4215:
    case 6389:
    case 5109:
    case 5365:
    case 5621:
    case 3829:
      return Enum_WEBKIT + value + value;
    // appearance, user-select, transform, hyphens, text-size-adjust

    case 5349:
    case 4246:
    case 4810:
    case 6968:
    case 2756:
      return Enum_WEBKIT + value + Enum_MOZ + value + Enum_MS + value + value;
    // flex, flex-direction

    case 6828:
    case 4268:
      return Enum_WEBKIT + value + Enum_MS + value + value;
    // order

    case 6165:
      return Enum_WEBKIT + value + Enum_MS + 'flex-' + value + value;
    // align-items

    case 5187:
      return Enum_WEBKIT + value + Utility_replace(value, /(\w+).+(:[^]+)/, Enum_WEBKIT + 'box-$1$2' + Enum_MS + 'flex-$1$2') + value;
    // align-self

    case 5443:
      return Enum_WEBKIT + value + Enum_MS + 'flex-item-' + Utility_replace(value, /flex-|-self/, '') + value;
    // align-content

    case 4675:
      return Enum_WEBKIT + value + Enum_MS + 'flex-line-pack' + Utility_replace(value, /align-content|flex-|-self/, '') + value;
    // flex-shrink

    case 5548:
      return Enum_WEBKIT + value + Enum_MS + Utility_replace(value, 'shrink', 'negative') + value;
    // flex-basis

    case 5292:
      return Enum_WEBKIT + value + Enum_MS + Utility_replace(value, 'basis', 'preferred-size') + value;
    // flex-grow

    case 6060:
      return Enum_WEBKIT + 'box-' + Utility_replace(value, '-grow', '') + Enum_WEBKIT + value + Enum_MS + Utility_replace(value, 'grow', 'positive') + value;
    // transition

    case 4554:
      return Enum_WEBKIT + Utility_replace(value, /([^-])(transform)/g, '$1' + Enum_WEBKIT + '$2') + value;
    // cursor

    case 6187:
      return Utility_replace(Utility_replace(Utility_replace(value, /(zoom-|grab)/, Enum_WEBKIT + '$1'), /(image-set)/, Enum_WEBKIT + '$1'), value, '') + value;
    // background, background-image

    case 5495:
    case 3959:
      return Utility_replace(value, /(image-set\([^]*)/, Enum_WEBKIT + '$1' + '$`$1');
    // justify-content

    case 4968:
      return Utility_replace(Utility_replace(value, /(.+:)(flex-)?(.*)/, Enum_WEBKIT + 'box-pack:$3' + Enum_MS + 'flex-pack:$3'), /s.+-b[^;]+/, 'justify') + Enum_WEBKIT + value + value;
    // (margin|padding)-inline-(start|end)

    case 4095:
    case 3583:
    case 4068:
    case 2532:
      return Utility_replace(value, /(.+)-inline(.+)/, Enum_WEBKIT + '$1$2') + value;
    // (min|max)?(width|height|inline-size|block-size)

    case 8116:
    case 7059:
    case 5753:
    case 5535:
    case 5445:
    case 5701:
    case 4933:
    case 4677:
    case 5533:
    case 5789:
    case 5021:
    case 4765:
      // stretch, max-content, min-content, fill-available
      if (Utility_strlen(value) - 1 - length > 6) switch (Utility_charat(value, length + 1)) {
        // (m)ax-content, (m)in-content
        case 109:
          // -
          if (Utility_charat(value, length + 4) !== 45) break;
        // (f)ill-available, (f)it-content

        case 102:
          return Utility_replace(value, /(.+:)(.+)-([^]+)/, '$1' + Enum_WEBKIT + '$2-$3' + '$1' + Enum_MOZ + (Utility_charat(value, length + 3) == 108 ? '$3' : '$2-$3')) + value;
        // (s)tretch

        case 115:
          return ~indexof(value, 'stretch') ? emotion_cache_esm_prefix(Utility_replace(value, 'stretch', 'fill-available'), length) + value : value;
      }
      break;
    // position: sticky

    case 4949:
      // (s)ticky?
      if (Utility_charat(value, length + 1) !== 115) break;
    // display: (flex|inline-flex)

    case 6444:
      switch (Utility_charat(value, Utility_strlen(value) - 3 - (~indexof(value, '!important') && 10))) {
        // stic(k)y
        case 107:
          return Utility_replace(value, ':', ':' + Enum_WEBKIT) + value;
        // (inline-)?fl(e)x

        case 101:
          return Utility_replace(value, /(.+:)([^;!]+)(;|!.+)?/, '$1' + Enum_WEBKIT + (Utility_charat(value, 14) === 45 ? 'inline-' : '') + 'box$3' + '$1' + Enum_WEBKIT + '$2$3' + '$1' + Enum_MS + '$2box$3') + value;
      }

      break;
    // writing-mode

    case 5936:
      switch (Utility_charat(value, length + 11)) {
        // vertical-l(r)
        case 114:
          return Enum_WEBKIT + value + Enum_MS + Utility_replace(value, /[svh]\w+-[tblr]{2}/, 'tb') + value;
        // vertical-r(l)

        case 108:
          return Enum_WEBKIT + value + Enum_MS + Utility_replace(value, /[svh]\w+-[tblr]{2}/, 'tb-rl') + value;
        // horizontal(-)tb

        case 45:
          return Enum_WEBKIT + value + Enum_MS + Utility_replace(value, /[svh]\w+-[tblr]{2}/, 'lr') + value;
      }

      return Enum_WEBKIT + value + Enum_MS + value + value;
  }

  return value;
}

var emotion_cache_esm_prefixer = function prefixer(element, index, children, callback) {
  if (element.length > -1) if (!element["return"]) switch (element.type) {
    case Enum_DECLARATION:
      element["return"] = emotion_cache_esm_prefix(element.value, element.length);
      break;

    case Enum_KEYFRAMES:
      return Serializer_serialize([Tokenizer_copy(element, {
        value: Utility_replace(element.value, '@', '@' + Enum_WEBKIT)
      })], callback);

    case Enum_RULESET:
      if (element.length) return Utility_combine(element.props, function (value) {
        switch (Utility_match(value, /(::plac\w+|:read-\w+)/)) {
          // :read-(only|write)
          case ':read-only':
          case ':read-write':
            return Serializer_serialize([Tokenizer_copy(element, {
              props: [Utility_replace(value, /:(read-\w+)/, ':' + Enum_MOZ + '$1')]
            })], callback);
          // :placeholder

          case '::placeholder':
            return Serializer_serialize([Tokenizer_copy(element, {
              props: [Utility_replace(value, /:(plac\w+)/, ':' + Enum_WEBKIT + 'input-$1')]
            }), Tokenizer_copy(element, {
              props: [Utility_replace(value, /:(plac\w+)/, ':' + Enum_MOZ + '$1')]
            }), Tokenizer_copy(element, {
              props: [Utility_replace(value, /:(plac\w+)/, Enum_MS + 'input-$1')]
            })], callback);
        }

        return '';
      });
  }
};

var isBrowser = typeof document !== 'undefined';
var getServerStylisCache = isBrowser ? undefined : emotion_weak_memoize_esm_weakMemoize(function () {
  return emotion_memoize_esm_memoize(function () {
    var cache = {};
    return function (name) {
      return cache[name];
    };
  });
});
var defaultStylisPlugins = [emotion_cache_esm_prefixer];

var createCache = function createCache(options) {
  var key = options.key;

  if (false) {}

  if (isBrowser && key === 'css') {
    var ssrStyles = document.querySelectorAll("style[data-emotion]:not([data-s])"); // get SSRed styles out of the way of React's hydration
    // document.head is a safe place to move them to(though note document.head is not necessarily the last place they will be)
    // note this very very intentionally targets all style elements regardless of the key to ensure
    // that creating a cache works inside of render of a React component

    Array.prototype.forEach.call(ssrStyles, function (node) {
      // we want to only move elements which have a space in the data-emotion attribute value
      // because that indicates that it is an Emotion 11 server-side rendered style elements
      // while we will already ignore Emotion 11 client-side inserted styles because of the :not([data-s]) part in the selector
      // Emotion 10 client-side inserted styles did not have data-s (but importantly did not have a space in their data-emotion attributes)
      // so checking for the space ensures that loading Emotion 11 after Emotion 10 has inserted some styles
      // will not result in the Emotion 10 styles being destroyed
      var dataEmotionAttribute = node.getAttribute('data-emotion');

      if (dataEmotionAttribute.indexOf(' ') === -1) {
        return;
      }
      document.head.appendChild(node);
      node.setAttribute('data-s', '');
    });
  }

  var stylisPlugins = options.stylisPlugins || defaultStylisPlugins;

  if (false) {}

  var inserted = {};
  var container;
  var nodesToHydrate = [];

  if (isBrowser) {
    container = options.container || document.head;
    Array.prototype.forEach.call( // this means we will ignore elements which don't have a space in them which
    // means that the style elements we're looking at are only Emotion 11 server-rendered style elements
    document.querySelectorAll("style[data-emotion^=\"" + key + " \"]"), function (node) {
      var attrib = node.getAttribute("data-emotion").split(' '); // $FlowFixMe

      for (var i = 1; i < attrib.length; i++) {
        inserted[attrib[i]] = true;
      }

      nodesToHydrate.push(node);
    });
  }

  var _insert;

  var omnipresentPlugins = [compat, removeLabel];

  if (false) {}

  if (isBrowser) {
    var currentSheet;
    var finalizingPlugins = [stringify,  false ? 0 : rulesheet(function (rule) {
      currentSheet.insert(rule);
    })];
    var serializer = middleware(omnipresentPlugins.concat(stylisPlugins, finalizingPlugins));

    var stylis = function stylis(styles) {
      return Serializer_serialize(compile(styles), serializer);
    };

    _insert = function insert(selector, serialized, sheet, shouldCache) {
      currentSheet = sheet;

      if (false) {}

      stylis(selector ? selector + "{" + serialized.styles + "}" : serialized.styles);

      if (shouldCache) {
        cache.inserted[serialized.name] = true;
      }
    };
  } else {
    var _finalizingPlugins = [stringify];

    var _serializer = middleware(omnipresentPlugins.concat(stylisPlugins, _finalizingPlugins));

    var _stylis = function _stylis(styles) {
      return Serializer_serialize(compile(styles), _serializer);
    }; // $FlowFixMe


    var serverStylisCache = getServerStylisCache(stylisPlugins)(key);

    var getRules = function getRules(selector, serialized) {
      var name = serialized.name;

      if (serverStylisCache[name] === undefined) {
        serverStylisCache[name] = _stylis(selector ? selector + "{" + serialized.styles + "}" : serialized.styles);
      }

      return serverStylisCache[name];
    };

    _insert = function _insert(selector, serialized, sheet, shouldCache) {
      var name = serialized.name;
      var rules = getRules(selector, serialized);

      if (cache.compat === undefined) {
        // in regular mode, we don't set the styles on the inserted cache
        // since we don't need to and that would be wasting memory
        // we return them so that they are rendered in a style tag
        if (shouldCache) {
          cache.inserted[name] = true;
        }

        if ( // using === development instead of !== production
        // because if people do ssr in tests, the source maps showing up would be annoying
        false) {}

        return rules;
      } else {
        // in compat mode, we put the styles on the inserted cache so
        // that emotion-server can pull out the styles
        // except when we don't want to cache it which was in Global but now
        // is nowhere but we don't want to do a major right now
        // and just in case we're going to leave the case here
        // it's also not affecting client side bundle size
        // so it's really not a big deal
        if (shouldCache) {
          cache.inserted[name] = rules;
        } else {
          return rules;
        }
      }
    };
  }

  var cache = {
    key: key,
    sheet: new StyleSheet({
      key: key,
      container: container,
      nonce: options.nonce,
      speedy: options.speedy,
      prepend: options.prepend,
      insertionPoint: options.insertionPoint
    }),
    nonce: options.nonce,
    inserted: inserted,
    registered: {},
    insert: _insert
  };
  cache.sheet.hydrate(nodesToHydrate);
  return cache;
};



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+utils@1.2.1/node_modules/@emotion/utils/dist/emotion-utils.esm.js
var emotion_utils_esm_isBrowser = typeof document !== 'undefined';
function emotion_utils_esm_getRegisteredStyles(registered, registeredStyles, classNames) {
  var rawClassName = '';
  classNames.split(' ').forEach(function (className) {
    if (registered[className] !== undefined) {
      registeredStyles.push(registered[className] + ";");
    } else {
      rawClassName += className + " ";
    }
  });
  return rawClassName;
}
var emotion_utils_esm_registerStyles = function registerStyles(cache, serialized, isStringTag) {
  var className = cache.key + "-" + serialized.name;

  if ( // we only need to add the styles to the registered cache if the
  // class name could be used further down
  // the tree but if it's a string tag, we know it won't
  // so we don't have to add it to registered cache.
  // this improves memory usage since we can avoid storing the whole style string
  (isStringTag === false || // we need to always store it if we're in compat mode and
  // in node since emotion-server relies on whether a style is in
  // the registered cache to know whether a style is global or not
  // also, note that this check will be dead code eliminated in the browser
  emotion_utils_esm_isBrowser === false && cache.compat !== undefined) && cache.registered[className] === undefined) {
    cache.registered[className] = serialized.styles;
  }
};
var emotion_utils_esm_insertStyles = function insertStyles(cache, serialized, isStringTag) {
  emotion_utils_esm_registerStyles(cache, serialized, isStringTag);
  var className = cache.key + "-" + serialized.name;

  if (cache.inserted[serialized.name] === undefined) {
    var stylesForSSR = '';
    var current = serialized;

    do {
      var maybeStyles = cache.insert(serialized === current ? "." + className : '', current, cache.sheet, true);

      if (!emotion_utils_esm_isBrowser && maybeStyles !== undefined) {
        stylesForSSR += maybeStyles;
      }

      current = current.next;
    } while (current !== undefined);

    if (!emotion_utils_esm_isBrowser && stylesForSSR.length !== 0) {
      return stylesForSSR;
    }
  }
};



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+unitless@0.8.1/node_modules/@emotion/unitless/dist/emotion-unitless.esm.js
var unitlessKeys = {
  animationIterationCount: 1,
  aspectRatio: 1,
  borderImageOutset: 1,
  borderImageSlice: 1,
  borderImageWidth: 1,
  boxFlex: 1,
  boxFlexGroup: 1,
  boxOrdinalGroup: 1,
  columnCount: 1,
  columns: 1,
  flex: 1,
  flexGrow: 1,
  flexPositive: 1,
  flexShrink: 1,
  flexNegative: 1,
  flexOrder: 1,
  gridRow: 1,
  gridRowEnd: 1,
  gridRowSpan: 1,
  gridRowStart: 1,
  gridColumn: 1,
  gridColumnEnd: 1,
  gridColumnSpan: 1,
  gridColumnStart: 1,
  msGridRow: 1,
  msGridRowSpan: 1,
  msGridColumn: 1,
  msGridColumnSpan: 1,
  fontWeight: 1,
  lineHeight: 1,
  opacity: 1,
  order: 1,
  orphans: 1,
  tabSize: 1,
  widows: 1,
  zIndex: 1,
  zoom: 1,
  WebkitLineClamp: 1,
  // SVG-related properties
  fillOpacity: 1,
  floodOpacity: 1,
  stopOpacity: 1,
  strokeDasharray: 1,
  strokeDashoffset: 1,
  strokeMiterlimit: 1,
  strokeOpacity: 1,
  strokeWidth: 1
};



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+serialize@1.1.2/node_modules/@emotion/serialize/dist/emotion-serialize.esm.js




var ILLEGAL_ESCAPE_SEQUENCE_ERROR = "You have illegal escape sequence in your template literal, most likely inside content's property value.\nBecause you write your CSS inside a JavaScript string you actually have to do double escaping, so for example \"content: '\\00d7';\" should become \"content: '\\\\00d7';\".\nYou can read more about this here:\nhttps://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals#ES2018_revision_of_illegal_escape_sequences";
var UNDEFINED_AS_OBJECT_KEY_ERROR = "You have passed in falsy value as style object's key (can happen when in example you pass unexported component as computed key).";
var hyphenateRegex = /[A-Z]|^ms/g;
var animationRegex = /_EMO_([^_]+?)_([^]*?)_EMO_/g;

var isCustomProperty = function isCustomProperty(property) {
  return property.charCodeAt(1) === 45;
};

var isProcessableValue = function isProcessableValue(value) {
  return value != null && typeof value !== 'boolean';
};

var processStyleName = /* #__PURE__ */(/* unused pure expression or super */ null && (memoize(function (styleName) {
  return isCustomProperty(styleName) ? styleName : styleName.replace(hyphenateRegex, '-$&').toLowerCase();
})));

var processStyleValue = function processStyleValue(key, value) {
  switch (key) {
    case 'animation':
    case 'animationName':
      {
        if (typeof value === 'string') {
          return value.replace(animationRegex, function (match, p1, p2) {
            cursor = {
              name: p1,
              styles: p2,
              next: cursor
            };
            return p1;
          });
        }
      }
  }

  if (unitless[key] !== 1 && !isCustomProperty(key) && typeof value === 'number' && value !== 0) {
    return value + 'px';
  }

  return value;
};

if (false) { var hyphenatedCache, hyphenPattern, msPattern, oldProcessStyleValue, contentValues, contentValuePattern; }

var noComponentSelectorMessage = (/* unused pure expression or super */ null && ('Component selectors can only be used in conjunction with ' + '@emotion/babel-plugin, the swc Emotion plugin, or another Emotion-aware ' + 'compiler transform.'));

function handleInterpolation(mergedProps, registered, interpolation) {
  if (interpolation == null) {
    return '';
  }

  if (interpolation.__emotion_styles !== undefined) {
    if (false) {}

    return interpolation;
  }

  switch (typeof interpolation) {
    case 'boolean':
      {
        return '';
      }

    case 'object':
      {
        if (interpolation.anim === 1) {
          cursor = {
            name: interpolation.name,
            styles: interpolation.styles,
            next: cursor
          };
          return interpolation.name;
        }

        if (interpolation.styles !== undefined) {
          var next = interpolation.next;

          if (next !== undefined) {
            // not the most efficient thing ever but this is a pretty rare case
            // and there will be very few iterations of this generally
            while (next !== undefined) {
              cursor = {
                name: next.name,
                styles: next.styles,
                next: cursor
              };
              next = next.next;
            }
          }

          var styles = interpolation.styles + ";";

          if (false) {}

          return styles;
        }

        return createStringFromObject(mergedProps, registered, interpolation);
      }

    case 'function':
      {
        if (mergedProps !== undefined) {
          var previousCursor = cursor;
          var result = interpolation(mergedProps);
          cursor = previousCursor;
          return handleInterpolation(mergedProps, registered, result);
        } else if (false) {}

        break;
      }

    case 'string':
      if (false) { var replaced, matched; }

      break;
  } // finalize string values (regular strings and functions interpolated into css calls)


  if (registered == null) {
    return interpolation;
  }

  var cached = registered[interpolation];
  return cached !== undefined ? cached : interpolation;
}

function createStringFromObject(mergedProps, registered, obj) {
  var string = '';

  if (Array.isArray(obj)) {
    for (var i = 0; i < obj.length; i++) {
      string += handleInterpolation(mergedProps, registered, obj[i]) + ";";
    }
  } else {
    for (var _key in obj) {
      var value = obj[_key];

      if (typeof value !== 'object') {
        if (registered != null && registered[value] !== undefined) {
          string += _key + "{" + registered[value] + "}";
        } else if (isProcessableValue(value)) {
          string += processStyleName(_key) + ":" + processStyleValue(_key, value) + ";";
        }
      } else {
        if (_key === 'NO_COMPONENT_SELECTOR' && "production" !== 'production') {}

        if (Array.isArray(value) && typeof value[0] === 'string' && (registered == null || registered[value[0]] === undefined)) {
          for (var _i = 0; _i < value.length; _i++) {
            if (isProcessableValue(value[_i])) {
              string += processStyleName(_key) + ":" + processStyleValue(_key, value[_i]) + ";";
            }
          }
        } else {
          var interpolated = handleInterpolation(mergedProps, registered, value);

          switch (_key) {
            case 'animation':
            case 'animationName':
              {
                string += processStyleName(_key) + ":" + interpolated + ";";
                break;
              }

            default:
              {
                if (false) {}

                string += _key + "{" + interpolated + "}";
              }
          }
        }
      }
    }
  }

  return string;
}

var labelPattern = /label:\s*([^\s;\n{]+)\s*(;|$)/g;
var sourceMapPattern;

if (false) {} // this is the cursor for keyframes
// keyframes are stored on the SerializedStyles object as a linked list


var cursor;
var emotion_serialize_esm_serializeStyles = function serializeStyles(args, registered, mergedProps) {
  if (args.length === 1 && typeof args[0] === 'object' && args[0] !== null && args[0].styles !== undefined) {
    return args[0];
  }

  var stringMode = true;
  var styles = '';
  cursor = undefined;
  var strings = args[0];

  if (strings == null || strings.raw === undefined) {
    stringMode = false;
    styles += handleInterpolation(mergedProps, registered, strings);
  } else {
    if (false) {}

    styles += strings[0];
  } // we start at 1 since we've already handled the first arg


  for (var i = 1; i < args.length; i++) {
    styles += handleInterpolation(mergedProps, registered, args[i]);

    if (stringMode) {
      if (false) {}

      styles += strings[i];
    }
  }

  var sourceMap;

  if (false) {} // using a global regex with .exec is stateful so lastIndex has to be reset each time


  labelPattern.lastIndex = 0;
  var identifierName = '';
  var match; // https://esbench.com/bench/5b809c2cf2949800a0f61fb5

  while ((match = labelPattern.exec(styles)) !== null) {
    identifierName += '-' + // $FlowFixMe we know it's not null
    match[1];
  }

  var name = hashString(styles) + identifierName;

  if (false) {}

  return {
    name: name,
    styles: styles,
    next: cursor
  };
};



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+use-insertion-effect-with-fallbacks@1.0.1_react@18.2.0/node_modules/@emotion/use-insertion-effect-with-fallbacks/dist/emotion-use-insertion-effect-with-fallbacks.esm.js


var emotion_use_insertion_effect_with_fallbacks_esm_isBrowser = typeof document !== 'undefined';

var syncFallback = function syncFallback(create) {
  return create();
};

var useInsertionEffect = react_['useInsertion' + 'Effect'] ? react_['useInsertion' + 'Effect'] : false;
var emotion_use_insertion_effect_with_fallbacks_esm_useInsertionEffectAlwaysWithSyncFallback = !emotion_use_insertion_effect_with_fallbacks_esm_isBrowser ? syncFallback : useInsertionEffect || syncFallback;
var useInsertionEffectWithLayoutFallback = useInsertionEffect || react_.useLayoutEffect;



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@emotion+react@11.11.1_@types+react@18.2.20_react@18.2.0/node_modules/@emotion/react/dist/emotion-element-6bdfffb2.esm.js










var emotion_element_6bdfffb2_esm_isBrowser = typeof document !== 'undefined';
var emotion_element_6bdfffb2_esm_hasOwnProperty = {}.hasOwnProperty;

var EmotionCacheContext = /* #__PURE__ */react_.createContext( // we're doing this to avoid preconstruct's dead code elimination in this one case
// because this module is primarily intended for the browser and node
// but it's also required in react native and similar environments sometimes
// and we could have a special build just for that
// but this is much easier and the native packages
// might use a different theme context in the future anyway
typeof HTMLElement !== 'undefined' ? /* #__PURE__ */createCache({
  key: 'css'
}) : null);

if (false) {}

var CacheProvider = EmotionCacheContext.Provider;
var __unsafe_useEmotionCache = function useEmotionCache() {
  return useContext(EmotionCacheContext);
};

var withEmotionCache = function withEmotionCache(func) {
  // $FlowFixMe
  return /*#__PURE__*/forwardRef(function (props, ref) {
    // the cache will never be null in the browser
    var cache = useContext(EmotionCacheContext);
    return func(props, cache, ref);
  });
};

if (!emotion_element_6bdfffb2_esm_isBrowser) {
  withEmotionCache = function withEmotionCache(func) {
    return function (props) {
      var cache = (0,react_.useContext)(EmotionCacheContext);

      if (cache === null) {
        // yes, we're potentially creating this on every render
        // it doesn't actually matter though since it's only on the server
        // so there will only every be a single render
        // that could change in the future because of suspense and etc. but for now,
        // this works and i don't want to optimise for a future thing that we aren't sure about
        cache = createCache({
          key: 'css'
        });
        return /*#__PURE__*/react_.createElement(EmotionCacheContext.Provider, {
          value: cache
        }, func(props, cache));
      } else {
        return func(props, cache);
      }
    };
  };
}

var ThemeContext = /* #__PURE__ */react_.createContext({});

if (false) {}

var useTheme = function useTheme() {
  return React.useContext(ThemeContext);
};

var getTheme = function getTheme(outerTheme, theme) {
  if (typeof theme === 'function') {
    var mergedTheme = theme(outerTheme);

    if (false) {}

    return mergedTheme;
  }

  if (false) {}

  return _extends({}, outerTheme, theme);
};

var createCacheWithTheme = /* #__PURE__ */(/* unused pure expression or super */ null && (weakMemoize(function (outerTheme) {
  return weakMemoize(function (theme) {
    return getTheme(outerTheme, theme);
  });
})));
var ThemeProvider = function ThemeProvider(props) {
  var theme = React.useContext(ThemeContext);

  if (props.theme !== theme) {
    theme = createCacheWithTheme(theme)(props.theme);
  }

  return /*#__PURE__*/React.createElement(ThemeContext.Provider, {
    value: theme
  }, props.children);
};
function withTheme(Component) {
  var componentName = Component.displayName || Component.name || 'Component';

  var render = function render(props, ref) {
    var theme = React.useContext(ThemeContext);
    return /*#__PURE__*/React.createElement(Component, _extends({
      theme: theme,
      ref: ref
    }, props));
  }; // $FlowFixMe


  var WithTheme = /*#__PURE__*/React.forwardRef(render);
  WithTheme.displayName = "WithTheme(" + componentName + ")";
  return hoistNonReactStatics(WithTheme, Component);
}

var getLastPart = function getLastPart(functionName) {
  // The match may be something like 'Object.createEmotionProps' or
  // 'Loader.prototype.render'
  var parts = functionName.split('.');
  return parts[parts.length - 1];
};

var getFunctionNameFromStackTraceLine = function getFunctionNameFromStackTraceLine(line) {
  // V8
  var match = /^\s+at\s+([A-Za-z0-9$.]+)\s/.exec(line);
  if (match) return getLastPart(match[1]); // Safari / Firefox

  match = /^([A-Za-z0-9$.]+)@/.exec(line);
  if (match) return getLastPart(match[1]);
  return undefined;
};

var internalReactFunctionNames = /* #__PURE__ */new Set(['renderWithHooks', 'processChild', 'finishClassComponent', 'renderToString']); // These identifiers come from error stacks, so they have to be valid JS
// identifiers, thus we only need to replace what is a valid character for JS,
// but not for CSS.

var sanitizeIdentifier = function sanitizeIdentifier(identifier) {
  return identifier.replace(/\$/g, '-');
};

var getLabelFromStackTrace = function getLabelFromStackTrace(stackTrace) {
  if (!stackTrace) return undefined;
  var lines = stackTrace.split('\n');

  for (var i = 0; i < lines.length; i++) {
    var functionName = getFunctionNameFromStackTraceLine(lines[i]); // The first line of V8 stack traces is just "Error"

    if (!functionName) continue; // If we reach one of these, we have gone too far and should quit

    if (internalReactFunctionNames.has(functionName)) break; // The component name is the first function in the stack that starts with an
    // uppercase letter

    if (/^[A-Z]/.test(functionName)) return sanitizeIdentifier(functionName);
  }

  return undefined;
};

var typePropName = '__EMOTION_TYPE_PLEASE_DO_NOT_USE__';
var labelPropName = '__EMOTION_LABEL_PLEASE_DO_NOT_USE__';
var createEmotionProps = function createEmotionProps(type, props) {
  if (false) {}

  var newProps = {};

  for (var key in props) {
    if (emotion_element_6bdfffb2_esm_hasOwnProperty.call(props, key)) {
      newProps[key] = props[key];
    }
  }

  newProps[typePropName] = type; // For performance, only call getLabelFromStackTrace in development and when
  // the label hasn't already been computed

  if (false) { var label; }

  return newProps;
};

var Insertion = function Insertion(_ref) {
  var cache = _ref.cache,
      serialized = _ref.serialized,
      isStringTag = _ref.isStringTag;
  registerStyles(cache, serialized, isStringTag);
  var rules = useInsertionEffectAlwaysWithSyncFallback(function () {
    return insertStyles(cache, serialized, isStringTag);
  });

  if (!emotion_element_6bdfffb2_esm_isBrowser && rules !== undefined) {
    var _ref2;

    var serializedNames = serialized.name;
    var next = serialized.next;

    while (next !== undefined) {
      serializedNames += ' ' + next.name;
      next = next.next;
    }

    return /*#__PURE__*/React.createElement("style", (_ref2 = {}, _ref2["data-emotion"] = cache.key + " " + serializedNames, _ref2.dangerouslySetInnerHTML = {
      __html: rules
    }, _ref2.nonce = cache.sheet.nonce, _ref2));
  }

  return null;
};

var Emotion = /* #__PURE__ */(/* unused pure expression or super */ null && (withEmotionCache(function (props, cache, ref) {
  var cssProp = props.css; // so that using `css` from `emotion` and passing the result to the css prop works
  // not passing the registered cache to serializeStyles because it would
  // make certain babel optimisations not possible

  if (typeof cssProp === 'string' && cache.registered[cssProp] !== undefined) {
    cssProp = cache.registered[cssProp];
  }

  var WrappedComponent = props[typePropName];
  var registeredStyles = [cssProp];
  var className = '';

  if (typeof props.className === 'string') {
    className = getRegisteredStyles(cache.registered, registeredStyles, props.className);
  } else if (props.className != null) {
    className = props.className + " ";
  }

  var serialized = serializeStyles(registeredStyles, undefined, React.useContext(ThemeContext));

  if (false) { var labelFromStack; }

  className += cache.key + "-" + serialized.name;
  var newProps = {};

  for (var key in props) {
    if (emotion_element_6bdfffb2_esm_hasOwnProperty.call(props, key) && key !== 'css' && key !== typePropName && ( true || 0)) {
      newProps[key] = props[key];
    }
  }

  newProps.ref = ref;
  newProps.className = className;
  return /*#__PURE__*/React.createElement(React.Fragment, null, /*#__PURE__*/React.createElement(Insertion, {
    cache: cache,
    serialized: serialized,
    isStringTag: typeof WrappedComponent === 'string'
  }), /*#__PURE__*/React.createElement(WrappedComponent, newProps));
})));

if (false) {}

var Emotion$1 = (/* unused pure expression or super */ null && (Emotion));



;// CONCATENATED MODULE: ../../node_modules/.pnpm/@chakra-ui+system@2.6.0_@emotion+react@11.11.1_@emotion+styled@11.11.0_react@18.2.0/node_modules/@chakra-ui/system/dist/chunk-UIGT7YZF.mjs
'use client'

// src/use-theme.ts
;

function chunk_UIGT7YZF_useTheme() {
  const theme = (0,react_.useContext)(
    ThemeContext
  );
  if (!theme) {
    throw Error(
      "useTheme: `theme` is undefined. Seems you forgot to wrap your app in `<ChakraProvider />` or `<ThemeProvider />`"
    );
  }
  return theme;
}


//# sourceMappingURL=chunk-UIGT7YZF.mjs.map

/***/ }),

/***/ 44384:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   R: () => (/* binding */ o)
/* harmony export */ });
var o=(r=>(r.Space=" ",r.Enter="Enter",r.Escape="Escape",r.Backspace="Backspace",r.Delete="Delete",r.ArrowLeft="ArrowLeft",r.ArrowUp="ArrowUp",r.ArrowRight="ArrowRight",r.ArrowDown="ArrowDown",r.Home="Home",r.End="End",r.PageUp="PageUp",r.PageDown="PageDown",r.Tab="Tab",r))(o||{});


/***/ }),

/***/ 44955:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  v: () => (/* binding */ it)
});

// EXTERNAL MODULE: external "next/dist/compiled/react"
var react_ = __webpack_require__(18038);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/match.js
var match = __webpack_require__(36220);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/render.js
var render = __webpack_require__(94878);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/disposables.js
var disposables = __webpack_require__(77020);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-disposables.js
var use_disposables = __webpack_require__(72274);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-iso-morphic-effect.js
var use_iso_morphic_effect = __webpack_require__(45272);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-sync-refs.js
var use_sync_refs = __webpack_require__(63573);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-id.js
var use_id = __webpack_require__(72712);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/components/keyboard.js
var keyboard = __webpack_require__(44384);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/calculate-active-index.js
function f(r){throw new Error("Unexpected object: "+r)}var calculate_active_index_a=(e=>(e[e.First=0]="First",e[e.Previous=1]="Previous",e[e.Next=2]="Next",e[e.Last=3]="Last",e[e.Specific=4]="Specific",e[e.Nothing=5]="Nothing",e))(calculate_active_index_a||{});function x(r,n){let t=n.resolveItems();if(t.length<=0)return null;let l=n.resolveActiveIndex(),s=l!=null?l:-1,d=(()=>{switch(r.focus){case 0:return t.findIndex(e=>!n.resolveDisabled(e));case 1:{let e=t.slice().reverse().findIndex((i,c,u)=>s!==-1&&u.length-c-1>=s?!1:!n.resolveDisabled(i));return e===-1?e:t.length-1-e}case 2:return t.findIndex((e,i)=>i<=s?!1:!n.resolveDisabled(e));case 3:{let e=t.slice().reverse().findIndex(i=>!n.resolveDisabled(i));return e===-1?e:t.length-1-e}case 4:return t.findIndex(e=>n.resolveId(e)===r.id);case 5:return null;default:f(r)}})();return d===-1?l:d}

// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/bugs.js
var bugs = __webpack_require__(20947);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/focus-management.js
var focus_management = __webpack_require__(42780);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-outside-click.js + 1 modules
var use_outside_click = __webpack_require__(95574);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/owner.js
var owner = __webpack_require__(96597);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-tree-walker.js
function F({container:e,accept:t,walk:r,enabled:c=!0}){let o=(0,react_.useRef)(t),l=(0,react_.useRef)(r);(0,react_.useEffect)(()=>{o.current=t,l.current=r},[t,r]),(0,use_iso_morphic_effect/* useIsoMorphicEffect */.e)(()=>{if(!e||!c)return;let n=(0,owner/* getOwnerDocument */.r)(e);if(!n)return;let f=o.current,p=l.current,d=Object.assign(i=>f(i),{acceptNode:f}),u=n.createTreeWalker(e,NodeFilter.SHOW_ELEMENT,d,!1);for(;u.nextNode();)p(u.currentNode)},[e,c,o,l])}

// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/internal/open-closed.js
var open_closed = __webpack_require__(41963);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-resolve-button-type.js
function i(t){var n;if(t.type)return t.type;let e=(n=t.as)!=null?n:"button";if(typeof e=="string"&&e.toLowerCase()==="button")return"button"}function use_resolve_button_type_s(t,e){let[n,u]=(0,react_.useState)(()=>i(t));return (0,use_iso_morphic_effect/* useIsoMorphicEffect */.e)(()=>{u(i(t))},[t.type,t.as]),(0,use_iso_morphic_effect/* useIsoMorphicEffect */.e)(()=>{n||e.current&&e.current instanceof HTMLButtonElement&&!e.current.hasAttribute("type")&&u("button")},[n,e]),n}

// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-owner.js
var use_owner = __webpack_require__(53318);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-event.js
var use_event = __webpack_require__(30985);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-tracked-pointer.js
function t(e){return[e.screenX,e.screenY]}function use_tracked_pointer_u(){let e=(0,react_.useRef)([-1,-1]);return{wasMoved(r){let n=t(r);return e.current[0]===n[0]&&e.current[1]===n[1]?!1:(e.current=n,!0)},update(r){e.current=t(r)}}}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/get-text-value.js
let a=/([\u2700-\u27BF]|[\uE000-\uF8FF]|\uD83C[\uDC00-\uDFFF]|\uD83D[\uDC00-\uDFFF]|[\u2011-\u26FF]|\uD83E[\uDD10-\uDDFF])/g;function o(e){var r,i;let n=(r=e.innerText)!=null?r:"",t=e.cloneNode(!0);if(!(t instanceof HTMLElement))return n;let u=!1;for(let f of t.querySelectorAll('[hidden],[aria-hidden],[role="img"]'))f.remove(),u=!0;let l=u?(i=t.innerText)!=null?i:"":n;return a.test(l)&&(l=l.replace(a,"")),l}function g(e){let n=e.getAttribute("aria-label");if(typeof n=="string")return n.trim();let t=e.getAttribute("aria-labelledby");if(t){let u=t.split(" ").map(l=>{let r=document.getElementById(l);if(r){let i=r.getAttribute("aria-label");return typeof i=="string"?i.trim():o(r).trim()}return null}).filter(Boolean);if(u.length>0)return u.join(", ")}return o(e).trim()}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-text-value.js
function use_text_value_b(c){let t=(0,react_.useRef)(""),r=(0,react_.useRef)("");return (0,use_event/* useEvent */.z)(()=>{let e=c.current;if(!e)return"";let u=e.innerText;if(t.current===u)return r.current;let n=g(e).trim().toLowerCase();return t.current=u,r.current=n,n})}

;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/components/menu/menu.js
var me=(r=>(r[r.Open=0]="Open",r[r.Closed=1]="Closed",r))(me||{}),de=(r=>(r[r.Pointer=0]="Pointer",r[r.Other=1]="Other",r))(de||{}),fe=(a=>(a[a.OpenMenu=0]="OpenMenu",a[a.CloseMenu=1]="CloseMenu",a[a.GoToItem=2]="GoToItem",a[a.Search=3]="Search",a[a.ClearSearch=4]="ClearSearch",a[a.RegisterItem=5]="RegisterItem",a[a.UnregisterItem=6]="UnregisterItem",a))(fe||{});function w(e,u=r=>r){let r=e.activeItemIndex!==null?e.items[e.activeItemIndex]:null,i=(0,focus_management/* sortByDomNode */.z2)(u(e.items.slice()),t=>t.dataRef.current.domRef.current),s=r?i.indexOf(r):null;return s===-1&&(s=null),{items:i,activeItemIndex:s}}let Te={[1](e){return e.menuState===1?e:{...e,activeItemIndex:null,menuState:1}},[0](e){return e.menuState===0?e:{...e,__demoMode:!1,menuState:0}},[2]:(e,u)=>{var s;let r=w(e),i=x(u,{resolveItems:()=>r.items,resolveActiveIndex:()=>r.activeItemIndex,resolveId:t=>t.id,resolveDisabled:t=>t.dataRef.current.disabled});return{...e,...r,searchQuery:"",activeItemIndex:i,activationTrigger:(s=u.trigger)!=null?s:1}},[3]:(e,u)=>{let i=e.searchQuery!==""?0:1,s=e.searchQuery+u.value.toLowerCase(),o=(e.activeItemIndex!==null?e.items.slice(e.activeItemIndex+i).concat(e.items.slice(0,e.activeItemIndex+i)):e.items).find(l=>{var m;return((m=l.dataRef.current.textValue)==null?void 0:m.startsWith(s))&&!l.dataRef.current.disabled}),a=o?e.items.indexOf(o):-1;return a===-1||a===e.activeItemIndex?{...e,searchQuery:s}:{...e,searchQuery:s,activeItemIndex:a,activationTrigger:1}},[4](e){return e.searchQuery===""?e:{...e,searchQuery:"",searchActiveItemIndex:null}},[5]:(e,u)=>{let r=w(e,i=>[...i,{id:u.id,dataRef:u.dataRef}]);return{...e,...r}},[6]:(e,u)=>{let r=w(e,i=>{let s=i.findIndex(t=>t.id===u.id);return s!==-1&&i.splice(s,1),i});return{...e,...r,activationTrigger:1}}},U=(0,react_.createContext)(null);U.displayName="MenuContext";function O(e){let u=(0,react_.useContext)(U);if(u===null){let r=new Error(`<${e} /> is missing a parent <Menu /> component.`);throw Error.captureStackTrace&&Error.captureStackTrace(r,O),r}return u}function ye(e,u){return (0,match/* match */.E)(u.type,Te,e,u)}let Ie=react_.Fragment;function Me(e,u){let{__demoMode:r=!1,...i}=e,s=(0,react_.useReducer)(ye,{__demoMode:r,menuState:r?0:1,buttonRef:(0,react_.createRef)(),itemsRef:(0,react_.createRef)(),items:[],searchQuery:"",activeItemIndex:null,activationTrigger:1}),[{menuState:t,itemsRef:o,buttonRef:a},l]=s,m=(0,use_sync_refs/* useSyncRefs */.T)(u);(0,use_outside_click/* useOutsideClick */.O)([a,o],(g,R)=>{var p;l({type:1}),(0,focus_management/* isFocusableElement */.sP)(R,focus_management/* FocusableMode */.tJ.Loose)||(g.preventDefault(),(p=a.current)==null||p.focus())},t===0);let I=(0,use_event/* useEvent */.z)(()=>{l({type:1})}),A=(0,react_.useMemo)(()=>({open:t===0,close:I}),[t,I]),f={ref:m};return react_.createElement(U.Provider,{value:s},react_.createElement(open_closed/* OpenClosedProvider */.up,{value:(0,match/* match */.E)(t,{[0]:open_closed/* State */.ZM.Open,[1]:open_closed/* State */.ZM.Closed})},(0,render/* render */.sY)({ourProps:f,theirProps:i,slot:A,defaultTag:Ie,name:"Menu"})))}let ge="button";function Re(e,u){var R;let r=(0,use_id/* useId */.M)(),{id:i=`headlessui-menu-button-${r}`,...s}=e,[t,o]=O("Menu.Button"),a=(0,use_sync_refs/* useSyncRefs */.T)(t.buttonRef,u),l=(0,use_disposables/* useDisposables */.G)(),m=(0,use_event/* useEvent */.z)(p=>{switch(p.key){case keyboard/* Keys */.R.Space:case keyboard/* Keys */.R.Enter:case keyboard/* Keys */.R.ArrowDown:p.preventDefault(),p.stopPropagation(),o({type:0}),l.nextFrame(()=>o({type:2,focus:calculate_active_index_a.First}));break;case keyboard/* Keys */.R.ArrowUp:p.preventDefault(),p.stopPropagation(),o({type:0}),l.nextFrame(()=>o({type:2,focus:calculate_active_index_a.Last}));break}}),I=(0,use_event/* useEvent */.z)(p=>{switch(p.key){case keyboard/* Keys */.R.Space:p.preventDefault();break}}),A=(0,use_event/* useEvent */.z)(p=>{if((0,bugs/* isDisabledReactIssue7711 */.P)(p.currentTarget))return p.preventDefault();e.disabled||(t.menuState===0?(o({type:1}),l.nextFrame(()=>{var M;return(M=t.buttonRef.current)==null?void 0:M.focus({preventScroll:!0})})):(p.preventDefault(),o({type:0})))}),f=(0,react_.useMemo)(()=>({open:t.menuState===0}),[t]),g={ref:a,id:i,type:use_resolve_button_type_s(e,t.buttonRef),"aria-haspopup":"menu","aria-controls":(R=t.itemsRef.current)==null?void 0:R.id,"aria-expanded":t.menuState===0,onKeyDown:m,onKeyUp:I,onClick:A};return (0,render/* render */.sY)({ourProps:g,theirProps:s,slot:f,defaultTag:ge,name:"Menu.Button"})}let Ae="div",be=render/* Features */.AN.RenderStrategy|render/* Features */.AN.Static;function Ee(e,u){var M,b;let r=(0,use_id/* useId */.M)(),{id:i=`headlessui-menu-items-${r}`,...s}=e,[t,o]=O("Menu.Items"),a=(0,use_sync_refs/* useSyncRefs */.T)(t.itemsRef,u),l=(0,use_owner/* useOwnerDocument */.i)(t.itemsRef),m=(0,use_disposables/* useDisposables */.G)(),I=(0,open_closed/* useOpenClosed */.oJ)(),A=(()=>I!==null?(I&open_closed/* State */.ZM.Open)===open_closed/* State */.ZM.Open:t.menuState===0)();(0,react_.useEffect)(()=>{let n=t.itemsRef.current;n&&t.menuState===0&&n!==(l==null?void 0:l.activeElement)&&n.focus({preventScroll:!0})},[t.menuState,t.itemsRef,l]),F({container:t.itemsRef.current,enabled:t.menuState===0,accept(n){return n.getAttribute("role")==="menuitem"?NodeFilter.FILTER_REJECT:n.hasAttribute("role")?NodeFilter.FILTER_SKIP:NodeFilter.FILTER_ACCEPT},walk(n){n.setAttribute("role","none")}});let f=(0,use_event/* useEvent */.z)(n=>{var E,P;switch(m.dispose(),n.key){case keyboard/* Keys */.R.Space:if(t.searchQuery!=="")return n.preventDefault(),n.stopPropagation(),o({type:3,value:n.key});case keyboard/* Keys */.R.Enter:if(n.preventDefault(),n.stopPropagation(),o({type:1}),t.activeItemIndex!==null){let{dataRef:S}=t.items[t.activeItemIndex];(P=(E=S.current)==null?void 0:E.domRef.current)==null||P.click()}(0,focus_management/* restoreFocusIfNecessary */.wI)(t.buttonRef.current);break;case keyboard/* Keys */.R.ArrowDown:return n.preventDefault(),n.stopPropagation(),o({type:2,focus:calculate_active_index_a.Next});case keyboard/* Keys */.R.ArrowUp:return n.preventDefault(),n.stopPropagation(),o({type:2,focus:calculate_active_index_a.Previous});case keyboard/* Keys */.R.Home:case keyboard/* Keys */.R.PageUp:return n.preventDefault(),n.stopPropagation(),o({type:2,focus:calculate_active_index_a.First});case keyboard/* Keys */.R.End:case keyboard/* Keys */.R.PageDown:return n.preventDefault(),n.stopPropagation(),o({type:2,focus:calculate_active_index_a.Last});case keyboard/* Keys */.R.Escape:n.preventDefault(),n.stopPropagation(),o({type:1}),(0,disposables/* disposables */.k)().nextFrame(()=>{var S;return(S=t.buttonRef.current)==null?void 0:S.focus({preventScroll:!0})});break;case keyboard/* Keys */.R.Tab:n.preventDefault(),n.stopPropagation(),o({type:1}),(0,disposables/* disposables */.k)().nextFrame(()=>{(0,focus_management/* focusFrom */.EO)(t.buttonRef.current,n.shiftKey?focus_management/* Focus */.TO.Previous:focus_management/* Focus */.TO.Next)});break;default:n.key.length===1&&(o({type:3,value:n.key}),m.setTimeout(()=>o({type:4}),350));break}}),g=(0,use_event/* useEvent */.z)(n=>{switch(n.key){case keyboard/* Keys */.R.Space:n.preventDefault();break}}),R=(0,react_.useMemo)(()=>({open:t.menuState===0}),[t]),p={"aria-activedescendant":t.activeItemIndex===null||(M=t.items[t.activeItemIndex])==null?void 0:M.id,"aria-labelledby":(b=t.buttonRef.current)==null?void 0:b.id,id:i,onKeyDown:f,onKeyUp:g,role:"menu",tabIndex:0,ref:a};return (0,render/* render */.sY)({ourProps:p,theirProps:s,slot:R,defaultTag:Ae,features:be,visible:A,name:"Menu.Items"})}let Se=react_.Fragment;function Pe(e,u){let r=(0,use_id/* useId */.M)(),{id:i=`headlessui-menu-item-${r}`,disabled:s=!1,...t}=e,[o,a]=O("Menu.Item"),l=o.activeItemIndex!==null?o.items[o.activeItemIndex].id===i:!1,m=(0,react_.useRef)(null),I=(0,use_sync_refs/* useSyncRefs */.T)(u,m);(0,use_iso_morphic_effect/* useIsoMorphicEffect */.e)(()=>{if(o.__demoMode||o.menuState!==0||!l||o.activationTrigger===0)return;let T=(0,disposables/* disposables */.k)();return T.requestAnimationFrame(()=>{var v,B;(B=(v=m.current)==null?void 0:v.scrollIntoView)==null||B.call(v,{block:"nearest"})}),T.dispose},[o.__demoMode,m,l,o.menuState,o.activationTrigger,o.activeItemIndex]);let A=use_text_value_b(m),f=(0,react_.useRef)({disabled:s,domRef:m,get textValue(){return A()}});(0,use_iso_morphic_effect/* useIsoMorphicEffect */.e)(()=>{f.current.disabled=s},[f,s]),(0,use_iso_morphic_effect/* useIsoMorphicEffect */.e)(()=>(a({type:5,id:i,dataRef:f}),()=>a({type:6,id:i})),[f,i]);let g=(0,use_event/* useEvent */.z)(()=>{a({type:1})}),R=(0,use_event/* useEvent */.z)(T=>{if(s)return T.preventDefault();a({type:1}),(0,focus_management/* restoreFocusIfNecessary */.wI)(o.buttonRef.current)}),p=(0,use_event/* useEvent */.z)(()=>{if(s)return a({type:2,focus:calculate_active_index_a.Nothing});a({type:2,focus:calculate_active_index_a.Specific,id:i})}),M=use_tracked_pointer_u(),b=(0,use_event/* useEvent */.z)(T=>M.update(T)),n=(0,use_event/* useEvent */.z)(T=>{M.wasMoved(T)&&(s||l||a({type:2,focus:calculate_active_index_a.Specific,id:i,trigger:0}))}),E=(0,use_event/* useEvent */.z)(T=>{M.wasMoved(T)&&(s||l&&a({type:2,focus:calculate_active_index_a.Nothing}))}),P=(0,react_.useMemo)(()=>({active:l,disabled:s,close:g}),[l,s,g]);return (0,render/* render */.sY)({ourProps:{id:i,ref:I,role:"menuitem",tabIndex:s===!0?void 0:-1,"aria-disabled":s===!0?!0:void 0,disabled:void 0,onClick:R,onFocus:p,onPointerEnter:b,onMouseEnter:b,onPointerMove:n,onMouseMove:n,onPointerLeave:E,onMouseLeave:E},theirProps:t,slot:P,defaultTag:Se,name:"Menu.Item"})}let ve=(0,render/* forwardRefWithAs */.yV)(Me),xe=(0,render/* forwardRefWithAs */.yV)(Re),he=(0,render/* forwardRefWithAs */.yV)(Ee),De=(0,render/* forwardRefWithAs */.yV)(Pe),it=Object.assign(ve,{Button:xe,Items:he,Item:De});


/***/ }),

/***/ 72274:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   G: () => (/* binding */ p)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _utils_disposables_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(77020);
function p(){let[e]=(0,react__WEBPACK_IMPORTED_MODULE_0__.useState)(_utils_disposables_js__WEBPACK_IMPORTED_MODULE_1__/* .disposables */ .k);return (0,react__WEBPACK_IMPORTED_MODULE_0__.useEffect)(()=>()=>e.dispose(),[e]),e}


/***/ }),

/***/ 30985:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   z: () => (/* binding */ o)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _use_latest_value_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(3773);
let o=function(t){let e=(0,_use_latest_value_js__WEBPACK_IMPORTED_MODULE_1__/* .useLatestValue */ .E)(t);return react__WEBPACK_IMPORTED_MODULE_0__.useCallback((...r)=>e.current(...r),[e])};


/***/ }),

/***/ 72712:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   M: () => (/* binding */ I)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _use_iso_morphic_effect_js__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(45272);
/* harmony import */ var _use_server_handoff_complete_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(84678);
/* harmony import */ var _utils_env_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(86910);
var o;let I=(o=react__WEBPACK_IMPORTED_MODULE_0__.useId)!=null?o:function(){let n=(0,_use_server_handoff_complete_js__WEBPACK_IMPORTED_MODULE_1__/* .useServerHandoffComplete */ .H)(),[e,u]=react__WEBPACK_IMPORTED_MODULE_0__.useState(n?()=>_utils_env_js__WEBPACK_IMPORTED_MODULE_2__/* .env */ .O.nextId():null);return (0,_use_iso_morphic_effect_js__WEBPACK_IMPORTED_MODULE_3__/* .useIsoMorphicEffect */ .e)(()=>{e===null&&u(_utils_env_js__WEBPACK_IMPORTED_MODULE_2__/* .env */ .O.nextId())},[e]),e!=null?""+e:void 0};


/***/ }),

/***/ 45272:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   e: () => (/* binding */ l)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _utils_env_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(86910);
let l=(e,f)=>{_utils_env_js__WEBPACK_IMPORTED_MODULE_1__/* .env */ .O.isServer?(0,react__WEBPACK_IMPORTED_MODULE_0__.useEffect)(e,f):(0,react__WEBPACK_IMPORTED_MODULE_0__.useLayoutEffect)(e,f)};


/***/ }),

/***/ 3773:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   E: () => (/* binding */ s)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _use_iso_morphic_effect_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(45272);
function s(e){let r=(0,react__WEBPACK_IMPORTED_MODULE_0__.useRef)(e);return (0,_use_iso_morphic_effect_js__WEBPACK_IMPORTED_MODULE_1__/* .useIsoMorphicEffect */ .e)(()=>{r.current=e},[e]),r}


/***/ }),

/***/ 95574:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";

// EXPORTS
__webpack_require__.d(__webpack_exports__, {
  O: () => (/* binding */ h)
});

// EXTERNAL MODULE: external "next/dist/compiled/react"
var react_ = __webpack_require__(18038);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/utils/focus-management.js
var focus_management = __webpack_require__(42780);
// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-latest-value.js
var use_latest_value = __webpack_require__(3773);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-document-event.js
function d(e,r,n){let o=(0,use_latest_value/* useLatestValue */.E)(r);(0,react_.useEffect)(()=>{function t(u){o.current(u)}return document.addEventListener(e,t,n),()=>document.removeEventListener(e,t,n)},[e,n])}

// EXTERNAL MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-window-event.js
var use_window_event = __webpack_require__(1744);
;// CONCATENATED MODULE: ../../node_modules/.pnpm/@headlessui+react@1.7.17_react-dom@18.2.0_react@18.2.0/node_modules/@headlessui/react/dist/hooks/use-outside-click.js
function h(s,m,a=!0){let i=(0,react_.useRef)(!1);(0,react_.useEffect)(()=>{requestAnimationFrame(()=>{i.current=a})},[a]);function c(e,r){if(!i.current||e.defaultPrevented)return;let t=r(e);if(t===null||!t.getRootNode().contains(t)||!t.isConnected)return;let E=function u(n){return typeof n=="function"?u(n()):Array.isArray(n)||n instanceof Set?n:[n]}(s);for(let u of E){if(u===null)continue;let n=u instanceof HTMLElement?u:u.current;if(n!=null&&n.contains(t)||e.composed&&e.composedPath().includes(n))return}return!(0,focus_management/* isFocusableElement */.sP)(t,focus_management/* FocusableMode */.tJ.Loose)&&t.tabIndex!==-1&&e.preventDefault(),m(e,t)}let o=(0,react_.useRef)(null);d("pointerdown",e=>{var r,t;i.current&&(o.current=((t=(r=e.composedPath)==null?void 0:r.call(e))==null?void 0:t[0])||e.target)},!0),d("mousedown",e=>{var r,t;i.current&&(o.current=((t=(r=e.composedPath)==null?void 0:r.call(e))==null?void 0:t[0])||e.target)},!0),d("click",e=>{o.current&&(c(e,()=>o.current),o.current=null)},!0),d("touchend",e=>c(e,()=>e.target instanceof HTMLElement?e.target:null),!0),(0,use_window_event/* useWindowEvent */.s)("blur",e=>c(e,()=>window.document.activeElement instanceof HTMLIFrameElement?window.document.activeElement:null),!0)}


/***/ }),

/***/ 53318:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   i: () => (/* binding */ n)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _utils_owner_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(96597);
function n(...e){return (0,react__WEBPACK_IMPORTED_MODULE_0__.useMemo)(()=>(0,_utils_owner_js__WEBPACK_IMPORTED_MODULE_1__/* .getOwnerDocument */ .r)(...e),[...e])}


/***/ }),

/***/ 84678:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
var react__WEBPACK_IMPORTED_MODULE_0___namespace_cache;
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   H: () => (/* binding */ l)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _utils_env_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(86910);
function s(){let r=typeof document=="undefined";return"useSyncExternalStore" in /*#__PURE__*/ (react__WEBPACK_IMPORTED_MODULE_0___namespace_cache || (react__WEBPACK_IMPORTED_MODULE_0___namespace_cache = __webpack_require__.t(react__WEBPACK_IMPORTED_MODULE_0__, 2)))?(o=>o.useSyncExternalStore)(/*#__PURE__*/ (react__WEBPACK_IMPORTED_MODULE_0___namespace_cache || (react__WEBPACK_IMPORTED_MODULE_0___namespace_cache = __webpack_require__.t(react__WEBPACK_IMPORTED_MODULE_0__, 2))))(()=>()=>{},()=>!1,()=>!r):!1}function l(){let r=s(),[e,n]=react__WEBPACK_IMPORTED_MODULE_0__.useState(_utils_env_js__WEBPACK_IMPORTED_MODULE_1__/* .env */ .O.isHandoffComplete);return e&&_utils_env_js__WEBPACK_IMPORTED_MODULE_1__/* .env */ .O.isHandoffComplete===!1&&n(!1),react__WEBPACK_IMPORTED_MODULE_0__.useEffect(()=>{e!==!0&&n(!0)},[e]),react__WEBPACK_IMPORTED_MODULE_0__.useEffect(()=>_utils_env_js__WEBPACK_IMPORTED_MODULE_1__/* .env */ .O.handoff(),[]),r?!1:e}


/***/ }),

/***/ 63573:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   T: () => (/* binding */ y),
/* harmony export */   h: () => (/* binding */ T)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _use_event_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(30985);
let u=Symbol();function T(t,n=!0){return Object.assign(t,{[u]:n})}function y(...t){let n=(0,react__WEBPACK_IMPORTED_MODULE_0__.useRef)(t);(0,react__WEBPACK_IMPORTED_MODULE_0__.useEffect)(()=>{n.current=t},[t]);let c=(0,_use_event_js__WEBPACK_IMPORTED_MODULE_1__/* .useEvent */ .z)(e=>{for(let o of n.current)o!=null&&(typeof o=="function"?o(e):o.current=e)});return t.every(e=>e==null||(e==null?void 0:e[u]))?void 0:c}


/***/ }),

/***/ 1744:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   s: () => (/* binding */ s)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _use_latest_value_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(3773);
function s(e,r,n){let o=(0,_use_latest_value_js__WEBPACK_IMPORTED_MODULE_1__/* .useLatestValue */ .E)(r);(0,react__WEBPACK_IMPORTED_MODULE_0__.useEffect)(()=>{function t(i){o.current(i)}return window.addEventListener(e,t,n),()=>window.removeEventListener(e,t,n)},[e,n])}


/***/ }),

/***/ 41963:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   ZM: () => (/* binding */ d),
/* harmony export */   oJ: () => (/* binding */ C),
/* harmony export */   up: () => (/* binding */ c)
/* harmony export */ });
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
let n=(0,react__WEBPACK_IMPORTED_MODULE_0__.createContext)(null);n.displayName="OpenClosedContext";var d=(e=>(e[e.Open=1]="Open",e[e.Closed=2]="Closed",e[e.Closing=4]="Closing",e[e.Opening=8]="Opening",e))(d||{});function C(){return (0,react__WEBPACK_IMPORTED_MODULE_0__.useContext)(n)}function c({value:o,children:r}){return react__WEBPACK_IMPORTED_MODULE_0__.createElement(n.Provider,{value:o},r)}


/***/ }),

/***/ 20947:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   P: () => (/* binding */ r)
/* harmony export */ });
function r(n){let e=n.parentElement,l=null;for(;e&&!(e instanceof HTMLFieldSetElement);)e instanceof HTMLLegendElement&&(l=e),e=e.parentElement;let t=(e==null?void 0:e.getAttribute("disabled"))==="";return t&&i(l)?!1:t}function i(n){if(!n)return!1;let e=n.previousElementSibling;for(;e!==null;){if(e instanceof HTMLLegendElement)return!1;e=e.previousElementSibling}return!0}


/***/ }),

/***/ 19689:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   A: () => (/* binding */ t)
/* harmony export */ });
function t(...r){return Array.from(new Set(r.flatMap(n=>typeof n=="string"?n.split(" "):[]))).filter(Boolean).join(" ")}


/***/ }),

/***/ 77020:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   k: () => (/* binding */ o)
/* harmony export */ });
/* harmony import */ var _micro_task_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(42126);
function o(){let n=[],r={addEventListener(e,t,s,a){return e.addEventListener(t,s,a),r.add(()=>e.removeEventListener(t,s,a))},requestAnimationFrame(...e){let t=requestAnimationFrame(...e);return r.add(()=>cancelAnimationFrame(t))},nextFrame(...e){return r.requestAnimationFrame(()=>r.requestAnimationFrame(...e))},setTimeout(...e){let t=setTimeout(...e);return r.add(()=>clearTimeout(t))},microTask(...e){let t={current:!0};return (0,_micro_task_js__WEBPACK_IMPORTED_MODULE_0__/* .microTask */ .Y)(()=>{t.current&&e[0]()}),r.add(()=>{t.current=!1})},style(e,t,s){let a=e.style.getPropertyValue(t);return Object.assign(e.style,{[t]:s}),this.add(()=>{Object.assign(e.style,{[t]:a})})},group(e){let t=o();return e(t),this.add(()=>t.dispose())},add(e){return n.push(e),()=>{let t=n.indexOf(e);if(t>=0)for(let s of n.splice(t,1))s()}},dispose(){for(let e of n.splice(0))e()}};return r}


/***/ }),

/***/ 86910:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   O: () => (/* binding */ s)
/* harmony export */ });
var i=Object.defineProperty;var d=(t,e,n)=>e in t?i(t,e,{enumerable:!0,configurable:!0,writable:!0,value:n}):t[e]=n;var r=(t,e,n)=>(d(t,typeof e!="symbol"?e+"":e,n),n);class o{constructor(){r(this,"current",this.detect());r(this,"handoffState","pending");r(this,"currentId",0)}set(e){this.current!==e&&(this.handoffState="pending",this.currentId=0,this.current=e)}reset(){this.set(this.detect())}nextId(){return++this.currentId}get isServer(){return this.current==="server"}get isClient(){return this.current==="client"}detect(){return typeof window=="undefined"||typeof document=="undefined"?"server":"client"}handoff(){this.handoffState==="pending"&&(this.handoffState="complete")}get isHandoffComplete(){return this.handoffState==="complete"}}let s=new o;


/***/ }),

/***/ 42780:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   C5: () => (/* binding */ y),
/* harmony export */   EO: () => (/* binding */ _),
/* harmony export */   TO: () => (/* binding */ M),
/* harmony export */   fE: () => (/* binding */ N),
/* harmony export */   jA: () => (/* binding */ O),
/* harmony export */   sP: () => (/* binding */ h),
/* harmony export */   tJ: () => (/* binding */ T),
/* harmony export */   wI: () => (/* binding */ D),
/* harmony export */   z2: () => (/* binding */ I)
/* harmony export */ });
/* unused harmony export getFocusableElements */
/* harmony import */ var _disposables_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(77020);
/* harmony import */ var _match_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(36220);
/* harmony import */ var _owner_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(96597);
let c=["[contentEditable=true]","[tabindex]","a[href]","area[href]","button:not([disabled])","iframe","input:not([disabled])","select:not([disabled])","textarea:not([disabled])"].map(e=>`${e}:not([tabindex='-1'])`).join(",");var M=(n=>(n[n.First=1]="First",n[n.Previous=2]="Previous",n[n.Next=4]="Next",n[n.Last=8]="Last",n[n.WrapAround=16]="WrapAround",n[n.NoScroll=32]="NoScroll",n))(M||{}),N=(o=>(o[o.Error=0]="Error",o[o.Overflow=1]="Overflow",o[o.Success=2]="Success",o[o.Underflow=3]="Underflow",o))(N||{}),F=(t=>(t[t.Previous=-1]="Previous",t[t.Next=1]="Next",t))(F||{});function f(e=document.body){return e==null?[]:Array.from(e.querySelectorAll(c)).sort((r,t)=>Math.sign((r.tabIndex||Number.MAX_SAFE_INTEGER)-(t.tabIndex||Number.MAX_SAFE_INTEGER)))}var T=(t=>(t[t.Strict=0]="Strict",t[t.Loose=1]="Loose",t))(T||{});function h(e,r=0){var t;return e===((t=(0,_owner_js__WEBPACK_IMPORTED_MODULE_0__/* .getOwnerDocument */ .r)(e))==null?void 0:t.body)?!1:(0,_match_js__WEBPACK_IMPORTED_MODULE_1__/* .match */ .E)(r,{[0](){return e.matches(c)},[1](){let l=e;for(;l!==null;){if(l.matches(c))return!0;l=l.parentElement}return!1}})}function D(e){let r=(0,_owner_js__WEBPACK_IMPORTED_MODULE_0__/* .getOwnerDocument */ .r)(e);(0,_disposables_js__WEBPACK_IMPORTED_MODULE_2__/* .disposables */ .k)().nextFrame(()=>{r&&!h(r.activeElement,0)&&y(e)})}var w=(t=>(t[t.Keyboard=0]="Keyboard",t[t.Mouse=1]="Mouse",t))(w||{});typeof window!="undefined"&&typeof document!="undefined"&&(document.addEventListener("keydown",e=>{e.metaKey||e.altKey||e.ctrlKey||(document.documentElement.dataset.headlessuiFocusVisible="")},!0),document.addEventListener("click",e=>{e.detail===1?delete document.documentElement.dataset.headlessuiFocusVisible:e.detail===0&&(document.documentElement.dataset.headlessuiFocusVisible="")},!0));function y(e){e==null||e.focus({preventScroll:!0})}let S=["textarea","input"].join(",");function H(e){var r,t;return(t=(r=e==null?void 0:e.matches)==null?void 0:r.call(e,S))!=null?t:!1}function I(e,r=t=>t){return e.slice().sort((t,l)=>{let o=r(t),i=r(l);if(o===null||i===null)return 0;let n=o.compareDocumentPosition(i);return n&Node.DOCUMENT_POSITION_FOLLOWING?-1:n&Node.DOCUMENT_POSITION_PRECEDING?1:0})}function _(e,r){return O(f(),r,{relativeTo:e})}function O(e,r,{sorted:t=!0,relativeTo:l=null,skipElements:o=[]}={}){let i=Array.isArray(e)?e.length>0?e[0].ownerDocument:document:e.ownerDocument,n=Array.isArray(e)?t?I(e):e:f(e);o.length>0&&n.length>1&&(n=n.filter(s=>!o.includes(s))),l=l!=null?l:i.activeElement;let E=(()=>{if(r&5)return 1;if(r&10)return-1;throw new Error("Missing Focus.First, Focus.Previous, Focus.Next or Focus.Last")})(),x=(()=>{if(r&1)return 0;if(r&2)return Math.max(0,n.indexOf(l))-1;if(r&4)return Math.max(0,n.indexOf(l))+1;if(r&8)return n.length-1;throw new Error("Missing Focus.First, Focus.Previous, Focus.Next or Focus.Last")})(),p=r&32?{preventScroll:!0}:{},d=0,a=n.length,u;do{if(d>=a||d+a<=0)return 0;let s=x+d;if(r&16)s=(s+a)%a;else{if(s<0)return 3;if(s>=a)return 1}u=n[s],u==null||u.focus(p),d+=E}while(u!==i.activeElement);return r&6&&H(u)&&u.select(),2}


/***/ }),

/***/ 36220:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   E: () => (/* binding */ u)
/* harmony export */ });
function u(r,n,...a){if(r in n){let e=n[r];return typeof e=="function"?e(...a):e}let t=new Error(`Tried to handle "${r}" but there is no handler defined. Only defined handlers are: ${Object.keys(n).map(e=>`"${e}"`).join(", ")}.`);throw Error.captureStackTrace&&Error.captureStackTrace(t,u),t}


/***/ }),

/***/ 42126:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   Y: () => (/* binding */ t)
/* harmony export */ });
function t(e){typeof queueMicrotask=="function"?queueMicrotask(e):Promise.resolve().then(e).catch(o=>setTimeout(()=>{throw o}))}


/***/ }),

/***/ 96597:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   r: () => (/* binding */ e)
/* harmony export */ });
/* harmony import */ var _env_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(86910);
function e(r){return _env_js__WEBPACK_IMPORTED_MODULE_0__/* .env */ .O.isServer?null:r instanceof Node?r.ownerDocument:r!=null&&r.hasOwnProperty("current")&&r.current instanceof Node?r.current.ownerDocument:document}


/***/ }),

/***/ 94878:
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

"use strict";
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   AN: () => (/* binding */ S),
/* harmony export */   l4: () => (/* binding */ j),
/* harmony export */   sY: () => (/* binding */ X),
/* harmony export */   yV: () => (/* binding */ D)
/* harmony export */ });
/* unused harmony export compact */
/* harmony import */ var react__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(18038);
/* harmony import */ var _class_names_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(19689);
/* harmony import */ var _match_js__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(36220);
var S=(a=>(a[a.None=0]="None",a[a.RenderStrategy=1]="RenderStrategy",a[a.Static=2]="Static",a))(S||{}),j=(e=>(e[e.Unmount=0]="Unmount",e[e.Hidden=1]="Hidden",e))(j||{});function X({ourProps:r,theirProps:t,slot:e,defaultTag:a,features:s,visible:n=!0,name:f}){let o=N(t,r);if(n)return c(o,e,a,f);let u=s!=null?s:0;if(u&2){let{static:l=!1,...p}=o;if(l)return c(p,e,a,f)}if(u&1){let{unmount:l=!0,...p}=o;return (0,_match_js__WEBPACK_IMPORTED_MODULE_1__/* .match */ .E)(l?0:1,{[0](){return null},[1](){return c({...p,hidden:!0,style:{display:"none"}},e,a,f)}})}return c(o,e,a,f)}function c(r,t={},e,a){let{as:s=e,children:n,refName:f="ref",...o}=g(r,["unmount","static"]),u=r.ref!==void 0?{[f]:r.ref}:{},l=typeof n=="function"?n(t):n;"className"in o&&o.className&&typeof o.className=="function"&&(o.className=o.className(t));let p={};if(t){let i=!1,m=[];for(let[y,d]of Object.entries(t))typeof d=="boolean"&&(i=!0),d===!0&&m.push(y);i&&(p["data-headlessui-state"]=m.join(" "))}if(s===react__WEBPACK_IMPORTED_MODULE_0__.Fragment&&Object.keys(R(o)).length>0){if(!(0,react__WEBPACK_IMPORTED_MODULE_0__.isValidElement)(l)||Array.isArray(l)&&l.length>1)throw new Error(['Passing props on "Fragment"!',"",`The current component <${a} /> is rendering a "Fragment".`,"However we need to passthrough the following props:",Object.keys(o).map(d=>`  - ${d}`).join(`
`),"","You can apply a few solutions:",['Add an `as="..."` prop, to ensure that we render an actual element instead of a "Fragment".',"Render a single element as the child so that we can forward the props onto that element."].map(d=>`  - ${d}`).join(`
`)].join(`
`));let i=l.props,m=typeof(i==null?void 0:i.className)=="function"?(...d)=>(0,_class_names_js__WEBPACK_IMPORTED_MODULE_2__/* .classNames */ .A)(i==null?void 0:i.className(...d),o.className):(0,_class_names_js__WEBPACK_IMPORTED_MODULE_2__/* .classNames */ .A)(i==null?void 0:i.className,o.className),y=m?{className:m}:{};return (0,react__WEBPACK_IMPORTED_MODULE_0__.cloneElement)(l,Object.assign({},N(l.props,R(g(o,["ref"]))),p,u,w(l.ref,u.ref),y))}return (0,react__WEBPACK_IMPORTED_MODULE_0__.createElement)(s,Object.assign({},g(o,["ref"]),s!==react__WEBPACK_IMPORTED_MODULE_0__.Fragment&&u,s!==react__WEBPACK_IMPORTED_MODULE_0__.Fragment&&p),l)}function w(...r){return{ref:r.every(t=>t==null)?void 0:t=>{for(let e of r)e!=null&&(typeof e=="function"?e(t):e.current=t)}}}function N(...r){var a;if(r.length===0)return{};if(r.length===1)return r[0];let t={},e={};for(let s of r)for(let n in s)n.startsWith("on")&&typeof s[n]=="function"?((a=e[n])!=null||(e[n]=[]),e[n].push(s[n])):t[n]=s[n];if(t.disabled||t["aria-disabled"])return Object.assign(t,Object.fromEntries(Object.keys(e).map(s=>[s,void 0])));for(let s in e)Object.assign(t,{[s](n,...f){let o=e[s];for(let u of o){if((n instanceof Event||(n==null?void 0:n.nativeEvent)instanceof Event)&&n.defaultPrevented)return;u(n,...f)}}});return t}function D(r){var t;return Object.assign((0,react__WEBPACK_IMPORTED_MODULE_0__.forwardRef)(r),{displayName:(t=r.displayName)!=null?t:r.name})}function R(r){let t=Object.assign({},r);for(let e in t)t[e]===void 0&&delete t[e];return t}function g(r,t=[]){let e=Object.assign({},r);for(let a of t)a in e&&delete e[a];return e}


/***/ })

};
;