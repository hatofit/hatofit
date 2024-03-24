import { _ as __nuxt_component_0 } from './Card-BVh4Co2a.mjs';
import { _ as __nuxt_component_3 } from './Form-J8Xi7ebG.mjs';
import { _ as __nuxt_component_4, a as __nuxt_component_5 } from './Input-D4f5F2Uv.mjs';
import { _ as __nuxt_component_9 } from './SelectMenu-32_eluQV.mjs';
import { e as __nuxt_component_2 } from './server.mjs';
import { defineComponent, ref, mergeProps, withCtx, createVNode, unref, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderComponent } from 'vue/server-renderer';
import 'tailwind-merge';
import './id-C5IKnQCN.mjs';
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
import './useFormGroup-4DdrZmPB.mjs';
import '@tanstack/vue-virtual';
import './usePopper-DnPFaP2s.mjs';
import './micro-task-DbFZIhYP.mjs';
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
  __name: "profile",
  __ssrInlineRender: true,
  setup(__props) {
    const state = ref({
      firstName: "John",
      lastName: "Doe",
      email: "john.doe@mail.com",
      dateOfBirth: "",
      weight: 70,
      height: 50,
      gender: "male"
    });
    const changePasswordState = ref({
      oldPassword: "",
      newPassword: "",
      confirmPassword: ""
    });
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UCard = __nuxt_component_0;
      const _component_UForm = __nuxt_component_3;
      const _component_UFormGroup = __nuxt_component_4;
      const _component_UInput = __nuxt_component_5;
      const _component_USelectMenu = __nuxt_component_9;
      const _component_UButton = __nuxt_component_2;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col gap-4" }, _attrs))}>`);
      _push(ssrRenderComponent(_component_UCard, null, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<h2 class="text-xl font-semibold"${_scopeId}>Profile</h2>`);
          } else {
            return [
              createVNode("h2", { class: "text-xl font-semibold" }, "Profile")
            ];
          }
        }),
        footer: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-end"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UButton, {
              variant: "solid",
              color: "primary",
              label: "Save"
            }, null, _parent2, _scopeId));
            _push2(`</div>`);
          } else {
            return [
              createVNode("div", { class: "flex justify-end" }, [
                createVNode(_component_UButton, {
                  variant: "solid",
                  color: "primary",
                  label: "Save"
                })
              ])
            ];
          }
        }),
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UForm, {
              state: unref(state),
              class: "flex flex-col gap-4"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<div class="flex gap-4 flex-1 w-full"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "First Name",
                    name: "firstName",
                    class: "flex-1"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          modelValue: unref(state).firstName,
                          "onUpdate:modelValue": ($event) => unref(state).firstName = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            modelValue: unref(state).firstName,
                            "onUpdate:modelValue": ($event) => unref(state).firstName = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Last Name",
                    name: "lastName",
                    class: "flex-1"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          modelValue: unref(state).lastName,
                          "onUpdate:modelValue": ($event) => unref(state).lastName = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            modelValue: unref(state).lastName,
                            "onUpdate:modelValue": ($event) => unref(state).lastName = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div><div class="flex gap-4 flex-1 w-full"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Date of Birth",
                    name: "dateOfBirth",
                    class: "flex-1"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          type: "date",
                          modelValue: unref(state).dateOfBirth,
                          "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            type: "date",
                            modelValue: unref(state).dateOfBirth,
                            "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Gender",
                    name: "gender",
                    class: "flex-1"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_USelectMenu, {
                          modelValue: unref(state).gender,
                          "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                          options: ["male", "female"]
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_USelectMenu, {
                            modelValue: unref(state).gender,
                            "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                            options: ["male", "female"]
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div><div class="flex gap-4 flex-1 w-full"${_scopeId2}>`);
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Weight",
                    name: "weight",
                    class: "flex-1"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          type: "number",
                          modelValue: unref(state).weight,
                          "onUpdate:modelValue": ($event) => unref(state).weight = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            type: "number",
                            modelValue: unref(state).weight,
                            "onUpdate:modelValue": ($event) => unref(state).weight = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Height",
                    name: "height",
                    class: "flex-1"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          type: "number",
                          modelValue: unref(state).height,
                          "onUpdate:modelValue": ($event) => unref(state).height = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            type: "number",
                            modelValue: unref(state).height,
                            "onUpdate:modelValue": ($event) => unref(state).height = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</div>`);
                } else {
                  return [
                    createVNode("div", { class: "flex gap-4 flex-1 w-full" }, [
                      createVNode(_component_UFormGroup, {
                        label: "First Name",
                        name: "firstName",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            modelValue: unref(state).firstName,
                            "onUpdate:modelValue": ($event) => unref(state).firstName = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Last Name",
                        name: "lastName",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            modelValue: unref(state).lastName,
                            "onUpdate:modelValue": ($event) => unref(state).lastName = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      })
                    ]),
                    createVNode("div", { class: "flex gap-4 flex-1 w-full" }, [
                      createVNode(_component_UFormGroup, {
                        label: "Date of Birth",
                        name: "dateOfBirth",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            type: "date",
                            modelValue: unref(state).dateOfBirth,
                            "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Gender",
                        name: "gender",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_USelectMenu, {
                            modelValue: unref(state).gender,
                            "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                            options: ["male", "female"]
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      })
                    ]),
                    createVNode("div", { class: "flex gap-4 flex-1 w-full" }, [
                      createVNode(_component_UFormGroup, {
                        label: "Weight",
                        name: "weight",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            type: "number",
                            modelValue: unref(state).weight,
                            "onUpdate:modelValue": ($event) => unref(state).weight = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
                      }),
                      createVNode(_component_UFormGroup, {
                        label: "Height",
                        name: "height",
                        class: "flex-1"
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UInput, {
                            type: "number",
                            modelValue: unref(state).height,
                            "onUpdate:modelValue": ($event) => unref(state).height = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ]),
                        _: 1
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
                class: "flex flex-col gap-4"
              }, {
                default: withCtx(() => [
                  createVNode("div", { class: "flex gap-4 flex-1 w-full" }, [
                    createVNode(_component_UFormGroup, {
                      label: "First Name",
                      name: "firstName",
                      class: "flex-1"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          modelValue: unref(state).firstName,
                          "onUpdate:modelValue": ($event) => unref(state).firstName = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "Last Name",
                      name: "lastName",
                      class: "flex-1"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          modelValue: unref(state).lastName,
                          "onUpdate:modelValue": ($event) => unref(state).lastName = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    })
                  ]),
                  createVNode("div", { class: "flex gap-4 flex-1 w-full" }, [
                    createVNode(_component_UFormGroup, {
                      label: "Date of Birth",
                      name: "dateOfBirth",
                      class: "flex-1"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          type: "date",
                          modelValue: unref(state).dateOfBirth,
                          "onUpdate:modelValue": ($event) => unref(state).dateOfBirth = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "Gender",
                      name: "gender",
                      class: "flex-1"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_USelectMenu, {
                          modelValue: unref(state).gender,
                          "onUpdate:modelValue": ($event) => unref(state).gender = $event,
                          options: ["male", "female"]
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    })
                  ]),
                  createVNode("div", { class: "flex gap-4 flex-1 w-full" }, [
                    createVNode(_component_UFormGroup, {
                      label: "Weight",
                      name: "weight",
                      class: "flex-1"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          type: "number",
                          modelValue: unref(state).weight,
                          "onUpdate:modelValue": ($event) => unref(state).weight = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "Height",
                      name: "height",
                      class: "flex-1"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          type: "number",
                          modelValue: unref(state).height,
                          "onUpdate:modelValue": ($event) => unref(state).height = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    })
                  ])
                ]),
                _: 1
              }, 8, ["state"])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`<div class="flex gap-4"><div class="flex-1">`);
      _push(ssrRenderComponent(_component_UCard, { class: "" }, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<h2 class="text-xl font-semibold"${_scopeId}>Change Email</h2>`);
          } else {
            return [
              createVNode("h2", { class: "text-xl font-semibold" }, "Change Email")
            ];
          }
        }),
        footer: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-end"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UButton, {
              variant: "solid",
              color: "primary",
              label: "Change Email"
            }, null, _parent2, _scopeId));
            _push2(`</div>`);
          } else {
            return [
              createVNode("div", { class: "flex justify-end" }, [
                createVNode(_component_UButton, {
                  variant: "solid",
                  color: "primary",
                  label: "Change Email"
                })
              ])
            ];
          }
        }),
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UForm, {
              state: unref(state),
              class: "flex flex-col gap-4"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Email",
                    name: "email"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          modelValue: unref(state).email,
                          "onUpdate:modelValue": ($event) => unref(state).email = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            modelValue: unref(state).email,
                            "onUpdate:modelValue": ($event) => unref(state).email = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UFormGroup, {
                      label: "Email",
                      name: "email"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          modelValue: unref(state).email,
                          "onUpdate:modelValue": ($event) => unref(state).email = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    })
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UForm, {
                state: unref(state),
                class: "flex flex-col gap-4"
              }, {
                default: withCtx(() => [
                  createVNode(_component_UFormGroup, {
                    label: "Email",
                    name: "email"
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UInput, {
                        modelValue: unref(state).email,
                        "onUpdate:modelValue": ($event) => unref(state).email = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  })
                ]),
                _: 1
              }, 8, ["state"])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div>`);
      _push(ssrRenderComponent(_component_UCard, { class: "flex-1" }, {
        header: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<h2 class="text-xl font-semibold"${_scopeId}>Change Password</h2>`);
          } else {
            return [
              createVNode("h2", { class: "text-xl font-semibold" }, "Change Password")
            ];
          }
        }),
        footer: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(`<div class="flex justify-end"${_scopeId}>`);
            _push2(ssrRenderComponent(_component_UButton, {
              variant: "solid",
              color: "primary",
              label: "Change Email"
            }, null, _parent2, _scopeId));
            _push2(`</div>`);
          } else {
            return [
              createVNode("div", { class: "flex justify-end" }, [
                createVNode(_component_UButton, {
                  variant: "solid",
                  color: "primary",
                  label: "Change Email"
                })
              ])
            ];
          }
        }),
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_UForm, {
              state: unref(changePasswordState),
              class: "flex flex-col gap-4"
            }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Old Password",
                    name: "oldPassword"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          type: "password",
                          modelValue: unref(changePasswordState).oldPassword,
                          "onUpdate:modelValue": ($event) => unref(changePasswordState).oldPassword = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            type: "password",
                            modelValue: unref(changePasswordState).oldPassword,
                            "onUpdate:modelValue": ($event) => unref(changePasswordState).oldPassword = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "New Password",
                    name: "newPassword"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          type: "password",
                          modelValue: unref(changePasswordState).newPassword,
                          "onUpdate:modelValue": ($event) => unref(changePasswordState).newPassword = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            type: "password",
                            modelValue: unref(changePasswordState).newPassword,
                            "onUpdate:modelValue": ($event) => unref(changePasswordState).newPassword = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(ssrRenderComponent(_component_UFormGroup, {
                    label: "Confirm Password",
                    name: "confirmPassword"
                  }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(ssrRenderComponent(_component_UInput, {
                          type: "password",
                          modelValue: unref(changePasswordState).confirmPassword,
                          "onUpdate:modelValue": ($event) => unref(changePasswordState).confirmPassword = $event
                        }, null, _parent4, _scopeId3));
                      } else {
                        return [
                          createVNode(_component_UInput, {
                            type: "password",
                            modelValue: unref(changePasswordState).confirmPassword,
                            "onUpdate:modelValue": ($event) => unref(changePasswordState).confirmPassword = $event
                          }, null, 8, ["modelValue", "onUpdate:modelValue"])
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                } else {
                  return [
                    createVNode(_component_UFormGroup, {
                      label: "Old Password",
                      name: "oldPassword"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          type: "password",
                          modelValue: unref(changePasswordState).oldPassword,
                          "onUpdate:modelValue": ($event) => unref(changePasswordState).oldPassword = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "New Password",
                      name: "newPassword"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          type: "password",
                          modelValue: unref(changePasswordState).newPassword,
                          "onUpdate:modelValue": ($event) => unref(changePasswordState).newPassword = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    }),
                    createVNode(_component_UFormGroup, {
                      label: "Confirm Password",
                      name: "confirmPassword"
                    }, {
                      default: withCtx(() => [
                        createVNode(_component_UInput, {
                          type: "password",
                          modelValue: unref(changePasswordState).confirmPassword,
                          "onUpdate:modelValue": ($event) => unref(changePasswordState).confirmPassword = $event
                        }, null, 8, ["modelValue", "onUpdate:modelValue"])
                      ]),
                      _: 1
                    })
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_UForm, {
                state: unref(changePasswordState),
                class: "flex flex-col gap-4"
              }, {
                default: withCtx(() => [
                  createVNode(_component_UFormGroup, {
                    label: "Old Password",
                    name: "oldPassword"
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UInput, {
                        type: "password",
                        modelValue: unref(changePasswordState).oldPassword,
                        "onUpdate:modelValue": ($event) => unref(changePasswordState).oldPassword = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  }),
                  createVNode(_component_UFormGroup, {
                    label: "New Password",
                    name: "newPassword"
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UInput, {
                        type: "password",
                        modelValue: unref(changePasswordState).newPassword,
                        "onUpdate:modelValue": ($event) => unref(changePasswordState).newPassword = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  }),
                  createVNode(_component_UFormGroup, {
                    label: "Confirm Password",
                    name: "confirmPassword"
                  }, {
                    default: withCtx(() => [
                      createVNode(_component_UInput, {
                        type: "password",
                        modelValue: unref(changePasswordState).confirmPassword,
                        "onUpdate:modelValue": ($event) => unref(changePasswordState).confirmPassword = $event
                      }, null, 8, ["modelValue", "onUpdate:modelValue"])
                    ]),
                    _: 1
                  })
                ]),
                _: 1
              }, 8, ["state"])
            ];
          }
        }),
        _: 1
      }, _parent));
      _push(`</div></div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/dashboard.bak/user/profile.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=profile-CDKvrWrR.mjs.map
