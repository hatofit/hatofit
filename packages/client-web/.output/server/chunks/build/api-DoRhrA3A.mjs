import { C as useRuntimeConfig, j as useToast } from './server.mjs';

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
    ((ForgotPasswordSendOTP2) => {
      ForgotPasswordSendOTP2.url = (email) => getApiUrl("/auth/forgot-password/" + email);
    })(Auth2.ForgotPasswordSendOTP || (Auth2.ForgotPasswordSendOTP = {}));
    ((ForgotPasswordVerifyOTP2) => {
      ForgotPasswordVerifyOTP2.url = () => getApiUrl("/auth/forgot-password-verify");
      ForgotPasswordVerifyOTP2.parseData = (data) => ({ ...data });
    })(Auth2.ForgotPasswordVerifyOTP || (Auth2.ForgotPasswordVerifyOTP = {}));
    ((ForgotPasswordReset2) => {
      ForgotPasswordReset2.url = () => getApiUrl("/auth/forgot-password-reset");
      ForgotPasswordReset2.parseData = (data) => ({ ...data });
    })(Auth2.ForgotPasswordReset || (Auth2.ForgotPasswordReset = {}));
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
  ((_Company) => {
    ((Company3) => {
      Company3.url = (id) => getApiUrl("/company/" + id);
    })(_Company.Company || (_Company.Company = {}));
    ((Join2) => {
      Join2.url = () => getApiUrl("/company/join");
    })(_Company.Join || (_Company.Join = {}));
    ((Leave2) => {
      Leave2.url = () => getApiUrl("/company/leave");
    })(_Company.Leave || (_Company.Leave = {}));
    ((Companies2) => {
      Companies2.url = () => getApiUrl("/company");
    })(_Company.Companies || (_Company.Companies = {}));
    ((CreateCompany2) => {
      CreateCompany2.url = () => getApiUrl("/company");
      CreateCompany2.parseData = (data) => ({ ...data });
    })(_Company.CreateCompany || (_Company.CreateCompany = {}));
    ((UpdateCompany2) => {
      UpdateCompany2.url = (id) => getApiUrl("/company/" + id);
      UpdateCompany2.parseData = (data) => ({ ...data });
    })(_Company.UpdateCompany || (_Company.UpdateCompany = {}));
    ((Members2) => {
      Members2.url = (companyId) => getApiUrl(`/company/${companyId}/member`);
    })(_Company.Members || (_Company.Members = {}));
    ((Exercises2) => {
      Exercises2.url = (companyId) => getApiUrl(`/company/${companyId}/exercise`);
    })(_Company.Exercises || (_Company.Exercises = {}));
    ((Exercise2) => {
      Exercise2.url = (companyId, exerciseId) => getApiUrl(`/company/${companyId}/exercise/${exerciseId}`);
    })(_Company.Exercise || (_Company.Exercise = {}));
    ((CreateExercises2) => {
      CreateExercises2.url = (companyId) => getApiUrl(`/company/${companyId}/exercise`);
    })(_Company.CreateExercises || (_Company.CreateExercises = {}));
    ((UpdateExercises2) => {
      UpdateExercises2.url = (companyId, exerciseId) => getApiUrl(`/company/${companyId}/exercise/${exerciseId}`);
    })(_Company.UpdateExercises || (_Company.UpdateExercises = {}));
    ((AdminPromote2) => {
      AdminPromote2.url = (companyId, userId) => getApiUrl(`/company/${companyId}/member/${userId}/promote`);
    })(_Company.AdminPromote || (_Company.AdminPromote = {}));
    ((AdminDemote2) => {
      AdminDemote2.url = (companyId, userId) => getApiUrl(`/company/${companyId}/member/${userId}/demote`);
    })(_Company.AdminDemote || (_Company.AdminDemote = {}));
    ((MemberKick2) => {
      MemberKick2.url = (companyId, userId) => getApiUrl(`/company/${companyId}/member/${userId}/kick`);
    })(_Company.MemberKick || (_Company.MemberKick = {}));
  })(Api2.Company || (Api2.Company = {}));
})(Api || (Api = {}));
const parseErrorFromResponse = (response) => {
  const data = response._data;
  let isError = false;
  let message = "Unknown error";
  if (data && data.success === false) {
    isError = true;
    message = data.message || "Unknown error";
  }
  return [isError, message];
};
const parseErrorFromResponseWithToast = (response) => {
  const $toast = useToast();
  const [isError, message] = parseErrorFromResponse(response);
  if (isError) {
    $toast.add({
      title: "Error",
      description: message
    });
  }
  return [isError, message];
};

export { Api as A, parseErrorFromResponseWithToast as a, getApiUrl as g, parseErrorFromResponse as p };
//# sourceMappingURL=api-DoRhrA3A.mjs.map
