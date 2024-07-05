import { _ as __nuxt_component_0 } from './Card-L1vIobqU.mjs';
import { _ as __nuxt_component_3 } from './Form-uRAMIMTQ.mjs';
import { _ as __nuxt_component_4 } from './FormGroup-D_Rddz50.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { _ as __nuxt_component_10 } from './Textarea-nwSmVUgI.mjs';
import { e as __nuxt_component_2 } from './server.mjs';
import { defineComponent, ref, withAsyncContext, mergeProps, withCtx, createVNode, unref, useSSRContext } from 'vue';
import { u as useCompanyLayout } from './use-company-layout-DWK67hVH.mjs';
import { u as useFetchWithAuth } from './use-fetch-with-auth-D9SMyDpm.mjs';
import { $ as $fetchWithAuth } from './fetch-Dko1vf_T.mjs';
import { A as Api, a as parseErrorFromResponseWithToast } from './api-Bs5Sh9SF.mjs';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import { z } from 'zod';
import { O as FetchError } from '../runtime.mjs';
import 'tailwind-merge';
import './id-CT9Cm1Vi.mjs';
import '@vueuse/core';
import './useFormGroup-4DdrZmPB.mjs';
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

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "setting",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const isLoading = ref(false);
    const { companyId } = ([__temp, __restore] = withAsyncContext(() => useCompanyLayout()), __temp = await __temp, __restore(), __temp);
    const { data, refresh } = ([__temp, __restore] = withAsyncContext(() => useFetchWithAuth(Api.Company.Company.url(companyId.value))), __temp = await __temp, __restore(), __temp);
    const schema = z.object({
      name: z.string().min(4, "Must be at least 4 characters"),
      description: z.string().min(4, "Must be at least 4 characters"),
      address: z.string().min(4, "Must be at least 4 characters")
    });
    const state = ref({
      name: "",
      description: "",
      address: ""
    });
    const syncState = () => {
      var _a, _b, _c;
      state.value = {
        name: ((_a = data.value) == null ? void 0 : _a.company.name) || "",
        description: ((_b = data.value) == null ? void 0 : _b.company.description) || "",
        address: ((_c = data.value) == null ? void 0 : _c.company.address) || ""
      };
    };
    async function onSubmit(event) {
      isLoading.value = true;
      try {
        const res = await $fetchWithAuth(Api.Company.UpdateCompany.url(companyId.value), {
          method: "PUT",
          body: JSON.stringify(Api.Company.UpdateCompany.parseData({
            name: state.value.name,
            description: state.value.description,
            address: state.value.address
          }))
        });
        try {
          await refresh();
        } catch (error) {
        }
        syncState();
      } catch (error) {
        if (error instanceof FetchError && error.response)
          parseErrorFromResponseWithToast(error.response);
        console.error(error);
      }
      isLoading.value = false;
    }
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UCard = __nuxt_component_0;
      const _component_UForm = __nuxt_component_3;
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_UTextarea = __nuxt_component_10;
      const _component_UButton = __nuxt_component_2;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col gap-4" }, _attrs))}>`);
      _push(ssrRenderComponent(_component_UCard, null, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<h2 class="text-xl font-semibold"${_scopeId}>General</h2>`);
          } else {
            return [
              createVNode("h2", { class: "text-xl font-semibold" }, "General")
            ];
          }
        }),
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UForm, {
              state: unref(state),
              schema: unref(schema),
              onSubmit,
              class: "flex flex-col gap-4"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Company Name",
                    name: "name",
                    required: ""
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          modelValue: unref(state).name,
                          "onUpdate:modelValue": ($event) => unref(state).name = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            modelValue: unref(state).name,
                            "onUpdate:modelValue": ($event) => unref(state).name = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Company Description",
                    name: "description",
                    required: ""
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UTextarea, {
                          modelValue: unref(state).description,
                          "onUpdate:modelValue": ($event) => unref(state).description = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UTextarea, {
                            modelValue: unref(state).description,
                            "onUpdate:modelValue": ($event) => unref(state).description = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Company Address",
                    name: "address",
                    required: ""
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UTextarea, {
                          modelValue: unref(state).address,
                          "onUpdate:modelValue": ($event) => unref(state).address = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UTextarea, {
                            modelValue: unref(state).address,
                            "onUpdate:modelValue": ($event) => unref(state).address = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`<div class="flex justify-end"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UButton, {
                    variant: "solid",
                    color: "primary",
                    type: "submit",
                    label: "Save"
                  }, null, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode(_component_UFormGroup, {
                      label: "Company Name",
                      name: "name",
                      required: ""
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          modelValue: unref(state).name,
                          "onUpdate:modelValue": ($event) => unref(state).name = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "Company Description",
                      name: "description",
                      required: ""
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UTextarea, {
                          modelValue: unref(state).description,
                          "onUpdate:modelValue": ($event) => unref(state).description = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "Company Address",
                      name: "address",
                      required: ""
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UTextarea, {
                          modelValue: unref(state).address,
                          "onUpdate:modelValue": ($event) => unref(state).address = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode("div", { class: "flex justify-end" }, [
                      createVNode(_component_UButton, {
                        variant: "solid",
                        color: "primary",
                        type: "submit",
                        label: "Save"
                      })
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UForm, {
                state: unref(state),
                schema: unref(schema),
                onSubmit,
                class: "flex flex-col gap-4"
              }, {
                default: withCtx(() => [
                  createVNode(_component_UFormGroup, {
                    label: "Company Name",
                    name: "name",
                    required: ""
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UInput, {
                        modelValue: unref(state).name,
                        "onUpdate:modelValue": ($event) => unref(state).name = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  }),
                  createVNode(_component_UFormGroup, {
                    label: "Company Description",
                    name: "description",
                    required: ""
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UTextarea, {
                        modelValue: unref(state).description,
                        "onUpdate:modelValue": ($event) => unref(state).description = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  }),
                  createVNode(_component_UFormGroup, {
                    label: "Company Address",
                    name: "address",
                    required: ""
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UTextarea, {
                        modelValue: unref(state).address,
                        "onUpdate:modelValue": ($event) => unref(state).address = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  }),
                  createVNode("div", { class: "flex justify-end" }, [
                    createVNode(_component_UButton, {
                      variant: "solid",
                      color: "primary",
                      type: "submit",
                      label: "Save"
                    })
                  ])
                ]),
                _: 1
              }, 8, ["state", "schema"])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/manage/setting.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=setting-BtdgPD-s.mjs.map
