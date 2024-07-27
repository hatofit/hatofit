import { _ as __nuxt_component_0 } from './Table-BxsFRJhE.mjs';
import { j as useToast, h as useAuth, d as __nuxt_component_1, e as __nuxt_component_3 } from './server.mjs';
import { _ as __nuxt_component_1$1 } from './Dropdown-lhX-bojE.mjs';
import { defineComponent, withAsyncContext, mergeProps, unref, withCtx, createVNode, toDisplayString, createTextVNode, useSSRContext } from 'vue';
import { u as useCompanyLayout } from './use-company-layout-B-oDRjJ3.mjs';
import { u as useFetchWithAuth } from './use-fetch-with-auth-N9InCXnT.mjs';
import { $ as $fetchWithAuth } from './fetch-B7X2m9-g.mjs';
import { A as Api, a as parseErrorFromResponseWithToast } from './api-DoRhrA3A.mjs';
import { ssrRenderComponent, ssrInterpolate } from 'vue/server-renderer';
import { O as FetchError } from '../runtime.mjs';
import 'tailwind-merge';
import './useFormGroup-4DdrZmPB.mjs';
import '@vueuse/core';
import './id-CT9Cm1Vi.mjs';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'devalue';
import '@unhead/ssr';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'requrl';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'node:fs';
import 'node:url';
import 'ipx';
import './Kbd-CWGxBI2b.mjs';
import './tabs-B_zyHFOf.mjs';
import './usePopper-C-zM4LTl.mjs';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "member",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const columns = [
      {
        key: "id",
        label: "#"
      },
      {
        key: "name",
        label: "Name"
      },
      {
        key: "User.email",
        label: "Email"
      },
      {
        key: "role",
        label: "Role"
      },
      {
        key: "createdAt",
        label: "Since"
      },
      {
        key: "actions"
      }
    ];
    const $toast = useToast();
    const $auth = useAuth();
    const { companyId } = ([__temp, __restore] = withAsyncContext(() => useCompanyLayout()), __temp = await __temp, __restore(), __temp);
    const { data, refresh } = useFetchWithAuth(Api.Company.Members.url(companyId.value));
    const adminDemote = async (id) => {
      console.log("Demote", id);
      try {
        const res = await $fetchWithAuth(Api.Company.AdminDemote.url(companyId.value, id), {
          method: "PUT"
        });
        refresh();
        $toast.add({ title: "Success demote admin" });
      } catch (e) {
        console.error(e);
        if (e instanceof FetchError && e.response)
          parseErrorFromResponseWithToast(e.response);
      }
    };
    const adminPromote = async (id) => {
      console.log("Promote", id);
      try {
        const res = await $fetchWithAuth(Api.Company.AdminPromote.url(companyId.value, id), {
          method: "PUT"
        });
        refresh();
        $toast.add({ title: "Success promote admin" });
      } catch (e) {
        console.error(e);
        if (e instanceof FetchError && e.response)
          parseErrorFromResponseWithToast(e.response);
      }
    };
    const memberKick = async (id) => {
      console.log("Kick", id);
      try {
        const res = await $fetchWithAuth(Api.Company.MemberKick.url(companyId.value, id), {
          method: "DELETE"
        });
        refresh();
        $toast.add({ title: "Success kick member" });
      } catch (e) {
        console.error(e);
        if (e instanceof FetchError && e.response)
          parseErrorFromResponseWithToast(e.response);
      }
    };
    const items = (row) => {
      var _a, _b;
      return [
        // [{
        //   label: 'Edit',
        //   icon: 'i-heroicons-pencil-square-20-solid',
        //   click: () => console.log('Edit', row.id)
        // }, {
        //   label: 'Duplicate',
        //   icon: 'i-heroicons-document-duplicate-20-solid'
        // }], [{
        //   label: 'Archive',
        //   icon: 'i-heroicons-archive-box-20-solid'
        // }, {
        //   label: 'Move',
        //   icon: 'i-heroicons-arrow-right-circle-20-solid'
        // }],
        [
          ...row.role == "admin" ? [{
            label: `Demote to Member`,
            icon: "i-heroicons-arrow-down-circle-20-solid",
            click: () => adminDemote(row.User._id)
          }] : [
            {
              label: `Promote to Admin`,
              icon: "i-heroicons-arrow-up-circle-20-solid",
              click: () => adminPromote(row.User._id)
            }
          ],
          ...row.role != "admin" && `${row.User.firstName} ${row.User.lastName}` != ((_b = (_a = $auth.data.value) == null ? void 0 : _a.user) == null ? void 0 : _b.name) ? [{
            label: `Kick Member`,
            icon: "i-heroicons-trash-20-solid",
            click: () => memberKick(row.User._id)
          }] : []
        ]
      ];
    };
    return (_ctx, _push, _parent, _attrs) => {
      var _a;
      const _component_UTable = __nuxt_component_0;
      const _component_UAvatar = __nuxt_component_1;
      const _component_UDropdown = __nuxt_component_1$1;
      const _component_UButton = __nuxt_component_3;
      _push(ssrRenderComponent(_component_UTable, mergeProps({
        columns,
        rows: (_a = unref(data)) == null ? void 0 : _a.members
      }, _attrs), {
        "name-data": withCtx(({ row }, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex items-center"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UAvatar, {
              name: row.name
            }, null, _parent2, _scopeId));
            _push2(`<div class="ml-2"${_scopeId}><div class="font-semibold"${_scopeId}>${ssrInterpolate(row.User.firstName)} ${ssrInterpolate(row.User.lastName)}</div></div></div>`);
          } else {
            return [
              createVNode("div", { class: "flex items-center" }, [
                createVNode(_component_UAvatar, {
                  name: row.name
                }, null, 8, ["name"]),
                createVNode("div", { class: "ml-2" }, [
                  createVNode("div", { class: "font-semibold" }, toDisplayString(row.User.firstName) + " " + toDisplayString(row.User.lastName), 1)
                ])
              ])
            ];
          }
        }),
        "createdAt-data": withCtx(({ row }, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`${ssrInterpolate(_ctx.$dayjs(row.createdAt).format("dddd, DD MMMM YYYY"))}`);
          } else {
            return [
              createTextVNode(toDisplayString(_ctx.$dayjs(row.createdAt).format("dddd, DD MMMM YYYY")), 1)
            ];
          }
        }),
        "actions-data": withCtx(({ row }, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UDropdown, {
              items: items(row)
            }, {
              default: withCtx((_, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "gray",
                    variant: "ghost",
                    icon: "i-heroicons-ellipsis-horizontal-20-solid"
                  }, null, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UButton, {
                      color: "gray",
                      variant: "ghost",
                      icon: "i-heroicons-ellipsis-horizontal-20-solid"
                    })
                  ];
                }
              }),
              _: 2
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UDropdown, {
                items: items(row)
              }, {
                default: withCtx(() => [
                  createVNode(_component_UButton, {
                    color: "gray",
                    variant: "ghost",
                    icon: "i-heroicons-ellipsis-horizontal-20-solid"
                  })
                ]),
                _: 2
              }, 1032, ["items"])
            ];
          }
        }),
        _: 1
      }, _parent));
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/manage/member.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=member-DCsZ1Jmt.mjs.map
