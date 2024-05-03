import CredentialsProvider from 'next-auth/providers/credentials';
import { E as ERROR_MESSAGES, d as defu, e as eventHandler, s as setCookie, a as appendHeader, b as sendRedirect, u as useTypedBackendConfig, c as useRuntimeConfig, g as getRequestURLFromRequest, p as parseCookies, f as getHeaders, h as getMethod, i as getQuery, j as createError, k as isMethod, r as readBody } from '../../../runtime.mjs';
import axios, { AxiosError } from 'axios';
import { AuthHandler } from 'next-auth/core';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';

let preparedAuthHandler;
let usedSecret;
const SUPPORTED_ACTIONS = ["providers", "session", "csrf", "signin", "signout", "callback", "verify-request", "error", "_log"];
const useConfig = () => useTypedBackendConfig(useRuntimeConfig());
const readBodyForNext = async (event) => {
  let body;
  if (isMethod(event, "PATCH") || isMethod(event, "POST") || isMethod(event, "PUT") || isMethod(event, "DELETE")) {
    body = await readBody(event);
  }
  return body;
};
const parseActionAndProvider = ({ context }) => {
  const params = context.params?._?.split("/");
  if (!params || ![1, 2].includes(params.length)) {
    throw createError({ statusCode: 400, statusMessage: `Invalid path used for auth-endpoint. Supply either one path parameter (e.g., \`/api/auth/session\`) or two (e.g., \`/api/auth/signin/github\` after the base path (in previous examples base path was: \`/api/auth/\`. Received \`${params}\`` });
  }
  const [unvalidatedAction, providerId] = params;
  const action = SUPPORTED_ACTIONS.find((action2) => action2 === unvalidatedAction);
  if (!action) {
    throw createError({ statusCode: 400, statusMessage: `Called endpoint with unsupported action ${unvalidatedAction}. Only the following actions are supported: ${SUPPORTED_ACTIONS.join(", ")}` });
  }
  return { action, providerId };
};
const NuxtAuthHandler = (nuxtAuthOptions) => {
  usedSecret = nuxtAuthOptions?.secret;
  if (!usedSecret) {
    {
      throw new Error(ERROR_MESSAGES.NO_SECRET);
    }
  }
  const options = defu(nuxtAuthOptions, {
    secret: usedSecret,
    logger: void 0,
    providers: [],
    trustHost: useConfig().trustHost
  });
  const getInternalNextAuthRequestData = async (event) => {
    const nextRequest = {
      host: getRequestURLFromRequest(event, { trustHost: useConfig().trustHost }),
      body: void 0,
      cookies: parseCookies(event),
      query: void 0,
      headers: getHeaders(event),
      method: getMethod(event),
      providerId: void 0,
      error: void 0
    };
    if (event.context.checkSessionOnNonAuthRequest === true) {
      return {
        ...nextRequest,
        method: "GET",
        action: "session"
      };
    }
    const query = getQuery(event);
    const { action, providerId } = parseActionAndProvider(event);
    const error = query.error;
    if (Array.isArray(error)) {
      throw createError({ statusCode: 400, statusMessage: "Error query parameter can only appear once" });
    }
    const body = await readBodyForNext(event);
    return {
      ...nextRequest,
      body,
      query,
      action,
      providerId,
      error: String(error) || void 0
    };
  };
  const handler = eventHandler(async (event) => {
    const { res } = event.node;
    const nextRequest = await getInternalNextAuthRequestData(event);
    const nextResult = await AuthHandler({
      req: nextRequest,
      options
    });
    if (nextResult.status) {
      res.statusCode = nextResult.status;
    }
    nextResult.cookies?.forEach((cookie) => setCookie(event, cookie.name, cookie.value, cookie.options));
    nextResult.headers?.forEach((header) => appendHeader(event, header.key, header.value));
    if (!nextResult.redirect) {
      return nextResult.body;
    }
    if (nextRequest.body?.json) {
      return { url: nextResult.redirect };
    }
    return sendRedirect(event, nextResult.redirect);
  });
  if (preparedAuthHandler) {
    console.warn("You setup the auth handler for a second time - this is likely undesired. Make sure that you only call `NuxtAuthHandler( ... )` once");
  }
  preparedAuthHandler = handler;
  return handler;
};

const getApiUrl = (path = "") => {
  const $config = useRuntimeConfig();
  let baseUrl = $config.public.api.baseUrl || "";
  let schema = "http";
  if (baseUrl.includes("https://")) {
    schema = "https";
  }
  baseUrl = baseUrl.replace(/https?:\/\//, "");
  const route = baseUrl.split("/");
  route.push(...path.split("/"));
  return schema + "://" + route.filter(Boolean).join("/");
};
var Api;
((Api2) => {
  ((Auth2) => {
    ((Login2) => {
      Login2.url = () => getApiUrl("/auth/login");
    })(Auth2.Login || (Auth2.Login = {}));
    ((Dashboard2) => {
      Dashboard2.url = () => getApiUrl("/auth/dashboard");
    })(Auth2.Dashboard || (Auth2.Dashboard = {}));
    Auth2.logout = "/auth/logout";
    ((Register2) => {
      Register2.url = () => getApiUrl("/auth/register");
      Register2.parseData = (data) => ({ ...data });
    })(Auth2.Register || (Auth2.Register = {}));
    ((Delete2) => {
      Delete2.url = () => getApiUrl("/auth/delete");
    })(Auth2.Delete || (Auth2.Delete = {}));
  })(Api2.Auth || (Api2.Auth = {}));
  ((Session2) => {
    ((All2) => {
      All2.url = () => getApiUrl("/session");
    })(Session2.All || (Session2.All = {}));
  })(Api2.Session || (Api2.Session = {}));
  ((Report2) => {
    ((Get2) => {
      Get2.url = (id) => getApiUrl(`/report/${id}`);
    })(Report2.Get || (Report2.Get = {}));
  })(Api2.Report || (Api2.Report = {}));
  ((User2) => {
    ((RequestDelete2) => {
      RequestDelete2.url = () => getApiUrl("/user/request-delete");
      RequestDelete2.parseData = (data) => ({ ...data });
    })(User2.RequestDelete || (User2.RequestDelete = {}));
  })(Api2.User || (Api2.User = {}));
})(Api || (Api = {}));

const _____ = NuxtAuthHandler({
  secret: process.env.AUTH_SECRET,
  pages: {
    signIn: "/auth/login",
    error: "/auth/login",
    signOut: "/auth/login",
    newUser: "/register"
  },
  providers: [
    // @ts-expect-error You need to use .default here for it to work during SSR. May be fixed via Vite at some point
    CredentialsProvider.default({
      // The name to display on the sign in form (e.g. 'Sign in with...')
      name: "Credentials",
      // The credentials is used to generate a suitable form on the sign in page.
      // You can specify whatever fields you are expecting to be submitted.
      // e.g. domain, username, password, 2FA token, etc.
      // You can pass any HTML attribute to the <input> tag through the object.
      credentials: {
        // email & password
        email: { label: "email", type: "email" },
        password: { label: "password", type: "password" }
      },
      async authorize(credentials, { query }) {
        var _a, _b, _c, _d, _e, _f, _g, _h;
        const url = Api.Auth.Login.url();
        console.log("credentials url", url);
        try {
          const data = {
            email: query.email,
            password: query.password
          };
          const response = await axios({
            url,
            method: "POST",
            data
          });
          if (response.status === 200) {
            return {
              ...response.data.user,
              name: ((_b = (_a = response.data) == null ? void 0 : _a.user) == null ? void 0 : _b.firstName) + " " + ((_d = (_c = response.data) == null ? void 0 : _c.user) == null ? void 0 : _d.lastName),
              token: (_e = response.data) == null ? void 0 : _e.token
            };
          } else if (response.data.message == "User not found") {
            throw new Error("Wrong email or password");
          } else {
            if (!response.data.message)
              throw new Error("An error occurred");
            throw new Error(response.data.message);
          }
        } catch (error) {
          if (error instanceof AxiosError) {
            if (((_f = error.response) == null ? void 0 : _f.data.message) == "User not found") {
              throw new Error("Wrong email or password");
            } else if (((_g = error.response) == null ? void 0 : _g.data.message) == "Invalid email or password") {
              throw new Error("Wrong email or password");
            } else {
              console.error((_h = error.response) == null ? void 0 : _h.data, error);
            }
          } else if (error instanceof Error) {
            console.error(error);
            throw error;
          }
          throw new Error("An error occurred");
        }
        return null;
      }
    })
  ],
  callbacks: {
    jwt: async (arg) => {
      const { token, user } = arg;
      try {
        if (user) {
          token.data = user;
        }
        return token;
      } catch (error) {
        throw error;
      }
    },
    session: async ({ session, token, user }) => {
      try {
        if (token.data) {
          session.user = token.data;
        }
        return session;
      } catch (error) {
        throw error;
      }
    }
  }
});

export { _____ as default };
//# sourceMappingURL=_..._.mjs.map
