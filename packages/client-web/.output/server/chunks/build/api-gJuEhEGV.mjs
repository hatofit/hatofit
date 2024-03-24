import { G as useRuntimeConfig } from './server.mjs';

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

export { Api as A, getApiUrl as g };
//# sourceMappingURL=api-gJuEhEGV.mjs.map
