import { j as useToast, e as __nuxt_component_3 } from './server.mjs';
import { _ as __nuxt_component_0 } from './Table-BxsFRJhE.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-lhX-bojE.mjs';
import { _ as __nuxt_component_6 } from './Modal-D84Qr6-q.mjs';
import { _ as __nuxt_component_0$1 } from './Card-L1vIobqU.mjs';
import { _ as __nuxt_component_3$1 } from './Form-uRAMIMTQ.mjs';
import { _ as __nuxt_component_4 } from './FormGroup-D_Rddz50.mjs';
import { _ as __nuxt_component_5 } from './Input-DxIn0Fn8.mjs';
import { _ as __nuxt_component_10 } from './Textarea-nwSmVUgI.mjs';
import { _ as __nuxt_component_9 } from './Select-hmpclB81.mjs';
import { defineComponent, withAsyncContext, computed, ref, unref, withCtx, createTextVNode, createVNode, toDisplayString, openBlock, createBlock, Fragment, renderList, createCommentVNode, useSSRContext } from 'vue';
import { u as useCompanyLayout } from './use-company-layout-B-oDRjJ3.mjs';
import { u as useFetchWithAuth } from './use-fetch-with-auth-N9InCXnT.mjs';
import { $ as $fetchWithAuth } from './fetch-B7X2m9-g.mjs';
import { A as Api, a as parseErrorFromResponseWithToast } from './api-DoRhrA3A.mjs';
import { ssrRenderAttrs, ssrRenderComponent, ssrInterpolate, ssrRenderList } from 'vue/server-renderer';
import { z } from 'zod';
import { O as FetchError } from '../runtime.mjs';
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
import '@vueuse/core';
import 'tailwind-merge';
import '@iconify/vue/dist/offline';
import '@iconify/vue';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'node:fs';
import 'node:url';
import 'ipx';
import './useFormGroup-4DdrZmPB.mjs';
import './id-CT9Cm1Vi.mjs';
import './Kbd-CWGxBI2b.mjs';
import './tabs-B_zyHFOf.mjs';
import './usePopper-C-zM4LTl.mjs';
import './active-element-history-DcQBj1iE.mjs';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "index",
  __ssrInlineRender: true,
  async setup(__props) {
    let __temp, __restore;
    const $toast = useToast();
    const { companyId } = ([__temp, __restore] = withAsyncContext(() => useCompanyLayout()), __temp = await __temp, __restore(), __temp);
    const { data, refresh } = useFetchWithAuth(Api.Company.Exercises.url(companyId.value));
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
        key: "type",
        label: "type"
      },
      {
        key: "difficulty",
        label: "difficulty"
      },
      {
        key: "duration",
        label: "Duration"
      },
      {
        key: "actions"
      }
    ];
    const exercises = computed(() => {
      var _a;
      return (((_a = data.value) == null ? void 0 : _a.exercises) || []).map((exercise, i) => ({
        no: i + 1,
        id: exercise._id,
        name: exercise.name,
        duration: exercise.duration + " seconds",
        type: exercise.type,
        difficulty: exercise.difficulty,
        raw: exercise
      }));
    });
    const CreateEditExerciseModal = (() => {
      const vals = {
        isOpen: ref(false),
        mode: ref("create"),
        schema: z.object({
          name: z.string().min(3).max(255),
          description: z.string().min(3).max(255),
          thumbnail: z.string().url().optional(),
          type: z.enum(["cardio", "strength", "flexibility", "balance", "endurance", "power", "speed", "agility", "coordination", "reaction", "mobility", "stability", "other"]),
          difficulty: z.enum(["expert", "intermediate", "advanced", "beginner", "professional", "olympic", "paralympic", "other"]),
          // duration: z.number().int().min(0),
          instructions: z.array(z.object({
            type: z.enum(["instruction", "rest"]),
            duration: z.number().int().min(0),
            name: z.string().min(3).max(255).optional(),
            content: z.object({
              lottie: z.string().url().optional(),
              video: z.string().url().optional(),
              image: z.string().url().optional()
            }).optional()
          }))
        }),
        inputs: ref({
          name: "",
          description: "",
          thumbnail: "",
          type: "cardio",
          difficulty: "expert",
          duration: 0,
          instructions: [
            {
              "content": {
                "lottie": "https://assets2.lottiefiles.com/packages/lf20_dwydvW8JJ7.json",
                "video": "https://www.youtube.com/watch?v=LXuVHYAfyGU",
                "image": "https://static.vecteezy.com/system/resources/previews/005/178/354/original/woman-doing-jump-rope-skipping-cardio-exercise-flat-illustration-isolated-on-white-background-free-vector.jpg"
              },
              "name": "Jumping rope",
              "duration": 30,
              "type": "instruction"
            },
            {
              "duration": 30,
              "type": "rest"
            }
          ]
        }),
        editId: ref(null)
      };
      return {
        ...vals,
        onSubmitRegister: async (event) => {
          console.log("onSubmitRegister", event);
          if (vals.mode.value === "create") {
            console.log("Create Exercise");
            try {
              const http = await $fetchWithAuth(Api.Company.CreateExercises.url(companyId.value), {
                method: "POST",
                body: JSON.stringify(vals.inputs.value)
              });
              console.log(http);
              $toast.add({ title: "Exercise created" });
              vals.isOpen.value = false;
            } catch (error) {
              if (error instanceof FetchError && error.response)
                parseErrorFromResponseWithToast(error.response);
              console.error(error);
            }
          } else {
            console.log("Edit Exercise", vals.editId.value);
            if (!vals.editId.value)
              return;
            try {
              const http = await $fetchWithAuth(Api.Company.UpdateExercises.url(companyId.value, vals.editId.value), {
                method: "PUT",
                body: JSON.stringify(vals.inputs.value)
              });
              console.log(http);
              $toast.add({ title: "Exercise updated" });
              vals.isOpen.value = false;
            } catch (error) {
              if (error instanceof FetchError && error.response)
                parseErrorFromResponseWithToast(error.response);
              console.error(error);
            }
            refresh();
          }
        }
      };
    })();
    const items = (row) => [
      [
        {
          label: "Sessions",
          icon: "i-material-symbols-light-exercise-outline",
          to: `/dashboard/company/${companyId.value}/manage/exercise/${row.id}`
        },
        // {
        //   label: 'Duplicate',
        //   icon: 'i-heroicons-document-duplicate-20-solid'
        // },
        {
          label: "Edit",
          icon: "i-heroicons-pencil-square-20-solid",
          click: () => {
            const data2 = row == null ? void 0 : row.raw;
            CreateEditExerciseModal.isOpen.value = true;
            CreateEditExerciseModal.mode.value = "edit";
            CreateEditExerciseModal.inputs.value = {
              name: data2.name,
              description: data2.description,
              thumbnail: data2.thumbnail,
              type: data2.type,
              difficulty: data2.difficulty,
              duration: data2.duration,
              instructions: data2.instructions
            };
            CreateEditExerciseModal.editId.value = data2._id;
          }
        }
      ],
      // [{
      //   label: 'Archive',
      //   icon: 'i-heroicons-archive-box-20-solid'
      // }, {
      //   label: 'Move',
      //   icon: 'i-heroicons-arrow-right-circle-20-solid'
      // }],
      [{
        label: "Delete",
        icon: "i-heroicons-trash-20-solid"
      }]
    ];
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UButton = __nuxt_component_3;
      const _component_UTable = __nuxt_component_0;
      const _component_UDropdown = __nuxt_component_1;
      const _component_UModal = __nuxt_component_6;
      const _component_UCard = __nuxt_component_0$1;
      const _component_UForm = __nuxt_component_3$1;
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_UTextarea = __nuxt_component_10;
      const _component_USelect = __nuxt_component_9;
      _push(`<div${ssrRenderAttrs(_attrs)}><div class="mb-6"><div class="flex justify-between"><h2 class="text-3xl">Exercises</h2>`);
      _push(ssrRenderComponent(_component_UButton, {
        onClick: ($event) => unref(CreateEditExerciseModal).isOpen.value = true
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`Create Exercise`);
          } else {
            return [
              createTextVNode("Create Exercise")
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div></div><div>`);
      _push(ssrRenderComponent(_component_UTable, {
        columns,
        rows: unref(exercises)
      }, {
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
      _push(`</div>`);
      _push(ssrRenderComponent(_component_UModal, {
        modelValue: unref(CreateEditExerciseModal).isOpen.value,
        "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).isOpen.value = $event
      }, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UCard, { ui: { ring: "", divide: "divide-y divide-gray-100 dark:divide-gray-800" } }, {
              header: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`${ssrInterpolate(unref(CreateEditExerciseModal).mode.value === "create" ? "Create" : "Edit")} Exercise `);
                } else {
                  return [
                    createTextVNode(toDisplayString(unref(CreateEditExerciseModal).mode.value === "create" ? "Create" : "Edit") + " Exercise ", 1)
                  ];
                }
              }),
              footer: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<div class="flex justify-end gap-2"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "gray",
                    variant: "ghost",
                    onClick: ($event) => unref(CreateEditExerciseModal).isOpen.value = false
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`Cancel`);
                      } else {
                        return [
                          createTextVNode("Cancel")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UButton, {
                    color: "primary",
                    onClick: unref(CreateEditExerciseModal).onSubmitRegister
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(` Save `);
                      } else {
                        return [
                          createTextVNode(" Save ")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode("div", { class: "flex justify-end gap-2" }, [
                      createVNode(_component_UButton, {
                        color: "gray",
                        variant: "ghost",
                        onClick: ($event) => unref(CreateEditExerciseModal).isOpen.value = false
                      }, {
                        default: withCtx(() => [
                          createTextVNode("Cancel")
                        ]),
                        _: 1
                      }, 8, ["onClick"]),
                      createVNode(_component_UButton, {
                        color: "primary",
                        onClick: unref(CreateEditExerciseModal).onSubmitRegister
                      }, {
                        default: withCtx(() => [
                          createTextVNode(" Save ")
                        ]),
                        _: 1
                      }, 8, ["onClick"])
                    ])
                  ];
                }
              }),
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UForm, {
                    schema: unref(CreateEditExerciseModal).schema,
                    state: unref(CreateEditExerciseModal).inputs.value,
                    class: "flex flex-col gap-4",
                    onSubmit: unref(CreateEditExerciseModal).onSubmitRegister
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Name",
                          name: "name",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UInput, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.name,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.name = $event,
                                placeholder: "name"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UInput, {
                                  modelValue: unref(CreateEditExerciseModal).inputs.value.name,
                                  "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.name = $event,
                                  placeholder: "name"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Description",
                          name: "description",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UTextarea, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.description,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.description = $event,
                                placeholder: "description"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UTextarea, {
                                  modelValue: unref(CreateEditExerciseModal).inputs.value.description,
                                  "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.description = $event,
                                  placeholder: "description"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Thumbnail",
                          name: "thumbnail",
                          class: "flex-1"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_UInput, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.thumbnail,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.thumbnail = $event,
                                placeholder: "thumbnail"
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_UInput, {
                                  modelValue: unref(CreateEditExerciseModal).inputs.value.thumbnail,
                                  "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.thumbnail = $event,
                                  placeholder: "thumbnail"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Type",
                          name: "type",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_USelect, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.type,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.type = $event,
                                options: ["cardio", "strength", "flexibility", "balance", "endurance", "power", "speed", "agility", "coordination", "reaction", "mobility", "stability", "other"]
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_USelect, {
                                  modelValue: unref(CreateEditExerciseModal).inputs.value.type,
                                  "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.type = $event,
                                  options: ["cardio", "strength", "flexibility", "balance", "endurance", "power", "speed", "agility", "coordination", "reaction", "mobility", "stability", "other"]
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                        _push4(ssrRenderComponent(_component_UFormGroup, {
                          label: "Difficulty",
                          name: "difficulty",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx((_4, _push5, _parent5, _scopeId4) => {
                            if (_push5) {
                              _push5(ssrRenderComponent(_component_USelect, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.difficulty,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.difficulty = $event,
                                options: ["expert", "intermediate", "advanced", "beginner", "professional", "olympic", "paralympic", "other"]
                              }, null, _parent5, _scopeId4));
                            } else {
                              return [
                                createVNode(_component_USelect, {
                                  modelValue: unref(CreateEditExerciseModal).inputs.value.difficulty,
                                  "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.difficulty = $event,
                                  options: ["expert", "intermediate", "advanced", "beginner", "professional", "olympic", "paralympic", "other"]
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ];
                            }
                          }),
                          _: 1
                        }, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UFormGroup, {
                            label: "Name",
                            name: "name",
                            required: "",
                            class: "flex-1"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UInput, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.name,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.name = $event,
                                placeholder: "name"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UFormGroup, {
                            label: "Description",
                            name: "description",
                            required: "",
                            class: "flex-1"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UTextarea, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.description,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.description = $event,
                                placeholder: "description"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UFormGroup, {
                            label: "Thumbnail",
                            name: "thumbnail",
                            class: "flex-1"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_UInput, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.thumbnail,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.thumbnail = $event,
                                placeholder: "thumbnail"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UFormGroup, {
                            label: "Type",
                            name: "type",
                            required: "",
                            class: "flex-1"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_USelect, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.type,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.type = $event,
                                options: ["cardio", "strength", "flexibility", "balance", "endurance", "power", "speed", "agility", "coordination", "reaction", "mobility", "stability", "other"]
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          }),
                          createVNode(_component_UFormGroup, {
                            label: "Difficulty",
                            name: "difficulty",
                            required: "",
                            class: "flex-1"
                          }, {
                            default: withCtx(() => [
                              createVNode(_component_USelect, {
                                modelValue: unref(CreateEditExerciseModal).inputs.value.difficulty,
                                "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.difficulty = $event,
                                options: ["expert", "intermediate", "advanced", "beginner", "professional", "olympic", "paralympic", "other"]
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ]),
                            _: 1
                          })
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`<div class="border-t border-gray-50/50 py-6 mt-6 flex flex-col gap-4"${_scopeId2}><div${_scopeId2}>Instructions (${ssrInterpolate(unref(CreateEditExerciseModal).inputs.value.instructions.length)})</div><div class="flex flex-col gap-4"${_scopeId2}><!--[-->`);
                  ssrRenderList(unref(CreateEditExerciseModal).inputs.value.instructions, (instruction, i) => {
                    _push3(`<div class="border rounded border-gray-500/50"${_scopeId2}><div class="px-3 py-2 border-b border-gray-500/50 flex justify-between items-center"${_scopeId2}><div${_scopeId2}>Intruction ${ssrInterpolate(i + 1)}</div><div class="text-xs"${_scopeId2}>`);
                    _push3(ssrRenderComponent(_component_UButton, {
                      color: "red",
                      variant: "ghost",
                      icon: "i-heroicons-trash-20-solid",
                      size: "xs",
                      onClick: ($event) => unref(CreateEditExerciseModal).inputs.value.instructions.splice(i, 1)
                    }, null, _parent3, _scopeId2));
                    _push3(`</div></div><div class="px-3 py-2"${_scopeId2}>`);
                    _push3(ssrRenderComponent(_component_UFormGroup, {
                      label: "Type",
                      name: "type",
                      required: "",
                      class: "flex-1"
                    }, {
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        if (_push4) {
                          _push4(ssrRenderComponent(_component_USelect, {
                            modelValue: instruction.type,
                            "onUpdate:modelValue": ($event) => instruction.type = $event,
                            options: ["instruction", "rest"]
                          }, null, _parent4, _scopeId3));
                        } else {
                          return [
                            createVNode(_component_USelect, {
                              modelValue: instruction.type,
                              "onUpdate:modelValue": ($event) => instruction.type = $event,
                              options: ["instruction", "rest"]
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ];
                        }
                      }),
                      _: 2
                    }, _parent3, _scopeId2));
                    _push3(ssrRenderComponent(_component_UFormGroup, {
                      label: "Duration",
                      name: "duration",
                      required: "",
                      class: "flex-1"
                    }, {
                      default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                        if (_push4) {
                          _push4(ssrRenderComponent(_component_UInput, {
                            modelValue: instruction.duration,
                            "onUpdate:modelValue": ($event) => instruction.duration = $event,
                            type: "number",
                            placeholder: "duration"
                          }, null, _parent4, _scopeId3));
                        } else {
                          return [
                            createVNode(_component_UInput, {
                              modelValue: instruction.duration,
                              "onUpdate:modelValue": ($event) => instruction.duration = $event,
                              type: "number",
                              placeholder: "duration"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ];
                        }
                      }),
                      _: 2
                    }, _parent3, _scopeId2));
                    if (instruction.type == "instruction") {
                      _push3(ssrRenderComponent(_component_UFormGroup, {
                        label: "Name",
                        name: "name",
                        class: "flex-1"
                      }, {
                        default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                          if (_push4) {
                            _push4(ssrRenderComponent(_component_UInput, {
                              modelValue: instruction.name,
                              "onUpdate:modelValue": ($event) => instruction.name = $event,
                              placeholder: "name"
                            }, null, _parent4, _scopeId3));
                          } else {
                            return [
                              createVNode(_component_UInput, {
                                modelValue: instruction.name,
                                "onUpdate:modelValue": ($event) => instruction.name = $event,
                                placeholder: "name"
                              }, null, 8, ["modelValue", "onUpdate:modelValue"])
                            ];
                          }
                        }),
                        _: 2
                      }, _parent3, _scopeId2));
                    } else {
                      _push3(`<!---->`);
                    }
                    _push3(`</div></div>`);
                  });
                  _push3(`<!--]--><div class="flex justify-end"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UButton, {
                    onClick: ($event) => unref(CreateEditExerciseModal).inputs.value.instructions.push({ type: "instruction", duration: 0 })
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(`Add Instruction`);
                      } else {
                        return [
                          createTextVNode("Add Instruction")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div></div></div>`);
                } else {
                  return [
                    createVNode(_component_UForm, {
                      schema: unref(CreateEditExerciseModal).schema,
                      state: unref(CreateEditExerciseModal).inputs.value,
                      class: "flex flex-col gap-4",
                      onSubmit: unref(CreateEditExerciseModal).onSubmitRegister
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UFormGroup, {
                          label: "Name",
                          name: "name",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UInput, {
                              modelValue: unref(CreateEditExerciseModal).inputs.value.name,
                              "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.name = $event,
                              placeholder: "name"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UFormGroup, {
                          label: "Description",
                          name: "description",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UTextarea, {
                              modelValue: unref(CreateEditExerciseModal).inputs.value.description,
                              "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.description = $event,
                              placeholder: "description"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UFormGroup, {
                          label: "Thumbnail",
                          name: "thumbnail",
                          class: "flex-1"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_UInput, {
                              modelValue: unref(CreateEditExerciseModal).inputs.value.thumbnail,
                              "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.thumbnail = $event,
                              placeholder: "thumbnail"
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UFormGroup, {
                          label: "Type",
                          name: "type",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_USelect, {
                              modelValue: unref(CreateEditExerciseModal).inputs.value.type,
                              "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.type = $event,
                              options: ["cardio", "strength", "flexibility", "balance", "endurance", "power", "speed", "agility", "coordination", "reaction", "mobility", "stability", "other"]
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        }),
                        createVNode(_component_UFormGroup, {
                          label: "Difficulty",
                          name: "difficulty",
                          required: "",
                          class: "flex-1"
                        }, {
                          default: withCtx(() => [
                            createVNode(_component_USelect, {
                              modelValue: unref(CreateEditExerciseModal).inputs.value.difficulty,
                              "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.difficulty = $event,
                              options: ["expert", "intermediate", "advanced", "beginner", "professional", "olympic", "paralympic", "other"]
                            }, null, 8, ["modelValue", "onUpdate:modelValue"])
                          ]),
                          _: 1
                        })
                      ]),
                      _: 1
                    }, 8, ["schema", "state", "onSubmit"]),
                    createVNode("div", { class: "border-t border-gray-50/50 py-6 mt-6 flex flex-col gap-4" }, [
                      createVNode("div", null, "Instructions (" + toDisplayString(unref(CreateEditExerciseModal).inputs.value.instructions.length) + ")", 1),
                      createVNode("div", { class: "flex flex-col gap-4" }, [
                        (openBlock(true), createBlock(Fragment, null, renderList(unref(CreateEditExerciseModal).inputs.value.instructions, (instruction, i) => {
                          return openBlock(), createBlock("div", {
                            key: i,
                            class: "border rounded border-gray-500/50"
                          }, [
                            createVNode("div", { class: "px-3 py-2 border-b border-gray-500/50 flex justify-between items-center" }, [
                              createVNode("div", null, "Intruction " + toDisplayString(i + 1), 1),
                              createVNode("div", { class: "text-xs" }, [
                                createVNode(_component_UButton, {
                                  color: "red",
                                  variant: "ghost",
                                  icon: "i-heroicons-trash-20-solid",
                                  size: "xs",
                                  onClick: ($event) => unref(CreateEditExerciseModal).inputs.value.instructions.splice(i, 1)
                                }, null, 8, ["onClick"])
                              ])
                            ]),
                            createVNode("div", { class: "px-3 py-2" }, [
                              createVNode(_component_UFormGroup, {
                                label: "Type",
                                name: "type",
                                required: "",
                                class: "flex-1"
                              }, {
                                default: withCtx(() => [
                                  createVNode(_component_USelect, {
                                    modelValue: instruction.type,
                                    "onUpdate:modelValue": ($event) => instruction.type = $event,
                                    options: ["instruction", "rest"]
                                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                                ]),
                                _: 2
                              }, 1024),
                              createVNode(_component_UFormGroup, {
                                label: "Duration",
                                name: "duration",
                                required: "",
                                class: "flex-1"
                              }, {
                                default: withCtx(() => [
                                  createVNode(_component_UInput, {
                                    modelValue: instruction.duration,
                                    "onUpdate:modelValue": ($event) => instruction.duration = $event,
                                    type: "number",
                                    placeholder: "duration"
                                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                                ]),
                                _: 2
                              }, 1024),
                              instruction.type == "instruction" ? (openBlock(), createBlock(_component_UFormGroup, {
                                key: 0,
                                label: "Name",
                                name: "name",
                                class: "flex-1"
                              }, {
                                default: withCtx(() => [
                                  createVNode(_component_UInput, {
                                    modelValue: instruction.name,
                                    "onUpdate:modelValue": ($event) => instruction.name = $event,
                                    placeholder: "name"
                                  }, null, 8, ["modelValue", "onUpdate:modelValue"])
                                ]),
                                _: 2
                              }, 1024)) : createCommentVNode("", true)
                            ])
                          ]);
                        }), 128)),
                        createVNode("div", { class: "flex justify-end" }, [
                          createVNode(_component_UButton, {
                            onClick: ($event) => unref(CreateEditExerciseModal).inputs.value.instructions.push({ type: "instruction", duration: 0 })
                          }, {
                            default: withCtx(() => [
                              createTextVNode("Add Instruction")
                            ]),
                            _: 1
                          }, 8, ["onClick"])
                        ])
                      ])
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UCard, { ui: { ring: "", divide: "divide-y divide-gray-100 dark:divide-gray-800" } }, {
                header: withCtx(() => [
                  createTextVNode(toDisplayString(unref(CreateEditExerciseModal).mode.value === "create" ? "Create" : "Edit") + " Exercise ", 1)
                ]),
                footer: withCtx(() => [
                  createVNode("div", { class: "flex justify-end gap-2" }, [
                    createVNode(_component_UButton, {
                      color: "gray",
                      variant: "ghost",
                      onClick: ($event) => unref(CreateEditExerciseModal).isOpen.value = false
                    }, {
                      default: withCtx(() => [
                        createTextVNode("Cancel")
                      ]),
                      _: 1
                    }, 8, ["onClick"]),
                    createVNode(_component_UButton, {
                      color: "primary",
                      onClick: unref(CreateEditExerciseModal).onSubmitRegister
                    }, {
                      default: withCtx(() => [
                        createTextVNode(" Save ")
                      ]),
                      _: 1
                    }, 8, ["onClick"])
                  ])
                ]),
                default: withCtx(() => [
                  createVNode(_component_UForm, {
                    schema: unref(CreateEditExerciseModal).schema,
                    state: unref(CreateEditExerciseModal).inputs.value,
                    class: "flex flex-col gap-4",
                    onSubmit: unref(CreateEditExerciseModal).onSubmitRegister
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UFormGroup, {
                        label: "Name",
                        name: "name",
                        required: "",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            modelValue: unref(CreateEditExerciseModal).inputs.value.name,
                            "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.name = $event,
                            placeholder: "name"
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Description",
                        name: "description",
                        required: "",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UTextarea, {
                            modelValue: unref(CreateEditExerciseModal).inputs.value.description,
                            "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.description = $event,
                            placeholder: "description"
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Thumbnail",
                        name: "thumbnail",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            modelValue: unref(CreateEditExerciseModal).inputs.value.thumbnail,
                            "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.thumbnail = $event,
                            placeholder: "thumbnail"
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Type",
                        name: "type",
                        required: "",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_USelect, {
                            modelValue: unref(CreateEditExerciseModal).inputs.value.type,
                            "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.type = $event,
                            options: ["cardio", "strength", "flexibility", "balance", "endurance", "power", "speed", "agility", "coordination", "reaction", "mobility", "stability", "other"]
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Difficulty",
                        name: "difficulty",
                        required: "",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_USelect, {
                            modelValue: unref(CreateEditExerciseModal).inputs.value.difficulty,
                            "onUpdate:modelValue": ($event) => unref(CreateEditExerciseModal).inputs.value.difficulty = $event,
                            options: ["expert", "intermediate", "advanced", "beginner", "professional", "olympic", "paralympic", "other"]
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      })
                    ]),
                    _: 1
                  }, 8, ["schema", "state", "onSubmit"]),
                  createVNode("div", { class: "border-t border-gray-50/50 py-6 mt-6 flex flex-col gap-4" }, [
                    createVNode("div", null, "Instructions (" + toDisplayString(unref(CreateEditExerciseModal).inputs.value.instructions.length) + ")", 1),
                    createVNode("div", { class: "flex flex-col gap-4" }, [
                      (openBlock(true), createBlock(Fragment, null, renderList(unref(CreateEditExerciseModal).inputs.value.instructions, (instruction, i) => {
                        return openBlock(), createBlock("div", {
                          key: i,
                          class: "border rounded border-gray-500/50"
                        }, [
                          createVNode("div", { class: "px-3 py-2 border-b border-gray-500/50 flex justify-between items-center" }, [
                            createVNode("div", null, "Intruction " + toDisplayString(i + 1), 1),
                            createVNode("div", { class: "text-xs" }, [
                              createVNode(_component_UButton, {
                                color: "red",
                                variant: "ghost",
                                icon: "i-heroicons-trash-20-solid",
                                size: "xs",
                                onClick: ($event) => unref(CreateEditExerciseModal).inputs.value.instructions.splice(i, 1)
                              }, null, 8, ["onClick"])
                            ])
                          ]),
                          createVNode("div", { class: "px-3 py-2" }, [
                            createVNode(_component_UFormGroup, {
                              label: "Type",
                              name: "type",
                              required: "",
                              class: "flex-1"
                            }, {
                              default: withCtx(() => [
                                createVNode(_component_USelect, {
                                  modelValue: instruction.type,
                                  "onUpdate:modelValue": ($event) => instruction.type = $event,
                                  options: ["instruction", "rest"]
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ]),
                              _: 2
                            }, 1024),
                            createVNode(_component_UFormGroup, {
                              label: "Duration",
                              name: "duration",
                              required: "",
                              class: "flex-1"
                            }, {
                              default: withCtx(() => [
                                createVNode(_component_UInput, {
                                  modelValue: instruction.duration,
                                  "onUpdate:modelValue": ($event) => instruction.duration = $event,
                                  type: "number",
                                  placeholder: "duration"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ]),
                              _: 2
                            }, 1024),
                            instruction.type == "instruction" ? (openBlock(), createBlock(_component_UFormGroup, {
                              key: 0,
                              label: "Name",
                              name: "name",
                              class: "flex-1"
                            }, {
                              default: withCtx(() => [
                                createVNode(_component_UInput, {
                                  modelValue: instruction.name,
                                  "onUpdate:modelValue": ($event) => instruction.name = $event,
                                  placeholder: "name"
                                }, null, 8, ["modelValue", "onUpdate:modelValue"])
                              ]),
                              _: 2
                            }, 1024)) : createCommentVNode("", true)
                          ])
                        ]);
                      }), 128)),
                      createVNode("div", { class: "flex justify-end" }, [
                        createVNode(_component_UButton, {
                          onClick: ($event) => unref(CreateEditExerciseModal).inputs.value.instructions.push({ type: "instruction", duration: 0 })
                        }, {
                          default: withCtx(() => [
                            createTextVNode("Add Instruction")
                          ]),
                          _: 1
                        }, 8, ["onClick"])
                      ])
                    ])
                  ])
                ]),
                _: 1
              })
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
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard/company/[companyId]/manage/exercise/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-x--kS5Au.mjs.map
