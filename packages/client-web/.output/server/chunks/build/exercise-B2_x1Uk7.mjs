import { _ as __nuxt_component_0 } from './Table-DL8m-bVo.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-BbTDYNmI.mjs';
import { e as __nuxt_component_2 } from './server.mjs';
import { defineComponent, mergeProps, withCtx, createVNode, useSSRContext } from 'vue';
import { ssrRenderComponent } from 'vue/server-renderer';
import 'tailwind-merge';
import './useFormGroup-4DdrZmPB.mjs';
import '@vueuse/core';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
import './id-CaXZ3KPQ.mjs';
import './usePopper-CR3Qno1T.mjs';
import '../routes/renderer.mjs';
import 'vue-bundle-renderer/runtime';
import 'devalue';
import '@unhead/ssr';
import 'unhead';
import '@unhead/shared';
import 'vue-router';
import 'dayjs';
import 'dayjs/plugin/updateLocale.js';
import 'dayjs/plugin/relativeTime.js';
import 'dayjs/plugin/utc.js';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "exercise",
  __ssrInlineRender: true,
  setup(__props) {
    const columns = [
      {
        key: "no",
        label: "#"
      },
      {
        key: "name",
        label: "Name"
      },
      {
        key: "duration",
        label: "Duration"
      },
      {
        key: "actions"
      }
    ];
    const exercises = [{
      no: 1,
      name: "Yoga Poses",
      duration: "30 minutes"
    }, {
      no: 2,
      name: "Kettlebell Swing",
      duration: "20 minutes"
    }];
    const items = (row) => [
      [{
        label: "Edit",
        icon: "i-heroicons-pencil-square-20-solid",
        click: () => console.log("Edit", row.id)
      }, {
        label: "Duplicate",
        icon: "i-heroicons-document-duplicate-20-solid"
      }],
      [{
        label: "Archive",
        icon: "i-heroicons-archive-box-20-solid"
      }, {
        label: "Move",
        icon: "i-heroicons-arrow-right-circle-20-solid"
      }],
      [{
        label: "Delete",
        icon: "i-heroicons-trash-20-solid"
      }]
    ];
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UTable = __nuxt_component_0;
      const _component_UDropdown = __nuxt_component_1;
      const _component_UButton = __nuxt_component_2;
      _push(ssrRenderComponent(_component_UTable, mergeProps({
        columns,
        rows: exercises
      }, _attrs), {
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/manage/exercise.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=exercise-B2_x1Uk7.mjs.map
