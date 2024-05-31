import { _ as __nuxt_component_0 } from './Card-BVh4Co2a.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-BbTDYNmI.mjs';
import { e as __nuxt_component_2 } from './server.mjs';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import { defineComponent, ref, mergeProps, unref, withCtx, createVNode, openBlock, createBlock, Fragment, renderList, toDisplayString, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderList, ssrRenderComponent, ssrInterpolate } from 'vue/server-renderer';
import { Line } from 'vue-chartjs';
import { Chart, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, LineElement, PointElement } from 'chart.js';
import 'tailwind-merge';
import './id-CaXZ3KPQ.mjs';
import './usePopper-CR3Qno1T.mjs';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
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
import '@vueuse/core';
import '@iconify/vue/dist/offline';
import '@iconify/vue';

const _sfc_main = /* @__PURE__ */ defineComponent({
  __name: "DetailWidget",
  __ssrInlineRender: true,
  props: {
    data: {
      type: Object,
      required: true
    }
  },
  setup(__props) {
    Chart.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, LineElement, PointElement);
    const chartOptions = {
      responsive: true
    };
    const $dayjs = useDayjs();
    const generated = ref([]);
    const downloadData = (type, device = "Merged", format = "csv") => {
      {
        const data = generated.value.find((item) => item.type === "hr");
        if (data) {
          const flabel = data.datasets.find((item) => item.label === device);
          if (!flabel)
            throw new Error("Device not found");
          const rest = data.labels.map((label, i) => [label, flabel.data[i]]);
          const csv = [
            ["Time", "Heart Rate"],
            ...rest
          ].map((item) => item.join(",")).join("\n");
          const blob = new Blob([csv], { type: "text/csv" });
          const url = URL.createObjectURL(blob);
          const a = (void 0).createElement("a");
          a.href = url;
          a.download = `heart_rate_${device}_${$dayjs().format("YYYYMMDD_HHmmss")}.csv`;
          a.click();
          URL.revokeObjectURL(url);
        }
      }
    };
    return (_ctx, _push, _parent, _attrs) => {
      const _component_UCard = __nuxt_component_0;
      const _component_UDropdown = __nuxt_component_1;
      const _component_UButton = __nuxt_component_2;
      _push(`<div${ssrRenderAttrs(mergeProps({ class: "flex flex-col gap-4" }, _attrs))}><!--[-->`);
      ssrRenderList(unref(generated), (item, i) => {
        _push(`<!--[-->`);
        if (item.type == "hr") {
          _push(ssrRenderComponent(_component_UCard, null, {
            header: withCtx((_, _push2, _parent2, _scopeId) => {
              var _a, _b;
              if (_push2) {
                _push2(`<div class="flex justify-between"${_scopeId}><div class="flex items-end gap-2"${_scopeId}><h2 class="text-xl font-semibold"${_scopeId}>Heart Rate</h2><span class="text-xs mb-0.5 text-gray-500"${_scopeId}>(bpm)</span></div><div${_scopeId}>`);
                _push2(ssrRenderComponent(_component_UDropdown, {
                  items: [
                    [
                      // { label: 'Merged data', icon: 'i-heroicons-arrow-down-tray', click: () => downloadData('hr', 'Merged', 'csv') },
                      ...(((_a = unref(generated).find((item2) => item2.type === "hr")) == null ? void 0 : _a.datasets) || []).map((item2) => item2.label).map((label) => ({
                        label: `csv ${label}`,
                        icon: "i-heroicons-arrow-down-tray",
                        click: () => downloadData("hr", label, "csv")
                      }))
                    ]
                  ]
                }, {
                  default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                    if (_push3) {
                      _push3(ssrRenderComponent(_component_UButton, {
                        icon: "i-heroicons-bars-3-bottom-right",
                        variant: "soft"
                      }, null, _parent3, _scopeId2));
                    } else {
                      return [
                        createVNode(_component_UButton, {
                          icon: "i-heroicons-bars-3-bottom-right",
                          variant: "soft"
                        })
                      ];
                    }
                  }),
                  _: 2
                }, _parent2, _scopeId));
                _push2(`</div></div>`);
              } else {
                return [
                  createVNode("div", { class: "flex justify-between" }, [
                    createVNode("div", { class: "flex items-end gap-2" }, [
                      createVNode("h2", { class: "text-xl font-semibold" }, "Heart Rate"),
                      createVNode("span", { class: "text-xs mb-0.5 text-gray-500" }, "(bpm)")
                    ]),
                    createVNode("div", null, [
                      createVNode(_component_UDropdown, {
                        items: [
                          [
                            // { label: 'Merged data', icon: 'i-heroicons-arrow-down-tray', click: () => downloadData('hr', 'Merged', 'csv') },
                            ...(((_b = unref(generated).find((item2) => item2.type === "hr")) == null ? void 0 : _b.datasets) || []).map((item2) => item2.label).map((label) => ({
                              label: `csv ${label}`,
                              icon: "i-heroicons-arrow-down-tray",
                              click: () => downloadData("hr", label, "csv")
                            }))
                          ]
                        ]
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UButton, {
                            icon: "i-heroicons-bars-3-bottom-right",
                            variant: "soft"
                          })
                        ]),
                        _: 2
                      }, 1032, ["items"])
                    ])
                  ])
                ];
              }
            }),
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(`<div class="flex justify-around mb-6"${_scopeId}><!--[-->`);
                ssrRenderList(item.stats, (stat, j) => {
                  _push2(`<div class="text-center"${_scopeId}><div class="mb-2"${_scopeId}>${ssrInterpolate(stat.label)}</div><div class="text-5xl"${_scopeId}>${ssrInterpolate(stat.value)}</div></div>`);
                });
                _push2(`<!--]--></div>`);
                _push2(ssrRenderComponent(unref(Line), {
                  options: {
                    ...chartOptions,
                    elements: {
                      point: {
                        radius: 0,
                        hitRadius: 0
                      }
                    },
                    scales: {
                      // current tick interval is 00:15, 00:30, 00:45, 01:00, make more bigger like 00:30, 01:00, 01:30, 02:00
                      x: {
                        ticks: {
                          maxTicksLimit: 10,
                          maxRotation: 0,
                          minRotation: 0
                        }
                      },
                      // add more space / gap for Y, example +20, -20
                      y: {
                        suggestedMin: item.yMin - 20,
                        suggestedMax: item.yMax + 20
                      }
                    }
                  },
                  data: {
                    labels: item.labels,
                    datasets: [...item.datasets.map((item2) => ({
                      ...item2
                    }))]
                  }
                }, null, _parent2, _scopeId));
              } else {
                return [
                  createVNode("div", { class: "flex justify-around mb-6" }, [
                    (openBlock(true), createBlock(Fragment, null, renderList(item.stats, (stat, j) => {
                      return openBlock(), createBlock("div", { class: "text-center" }, [
                        createVNode("div", { class: "mb-2" }, toDisplayString(stat.label), 1),
                        createVNode("div", { class: "text-5xl" }, toDisplayString(stat.value), 1)
                      ]);
                    }), 256))
                  ]),
                  createVNode(unref(Line), {
                    options: {
                      ...chartOptions,
                      elements: {
                        point: {
                          radius: 0,
                          hitRadius: 0
                        }
                      },
                      scales: {
                        // current tick interval is 00:15, 00:30, 00:45, 01:00, make more bigger like 00:30, 01:00, 01:30, 02:00
                        x: {
                          ticks: {
                            maxTicksLimit: 10,
                            maxRotation: 0,
                            minRotation: 0
                          }
                        },
                        // add more space / gap for Y, example +20, -20
                        y: {
                          suggestedMin: item.yMin - 20,
                          suggestedMax: item.yMax + 20
                        }
                      }
                    },
                    data: {
                      labels: item.labels,
                      datasets: [...item.datasets.map((item2) => ({
                        ...item2
                      }))]
                    }
                  }, null, 8, ["options", "data"])
                ];
              }
            }),
            _: 2
          }, _parent));
        } else if (item.type == "ecg") {
          _push(ssrRenderComponent(_component_UCard, null, {
            header: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(`<div class="flex items-end gap-2"${_scopeId}><h2 class="text-xl font-semibold"${_scopeId}>Electrocardiogram</h2><span class="text-xs mb-0.5 text-gray-500"${_scopeId}>(mV)</span></div>`);
              } else {
                return [
                  createVNode("div", { class: "flex items-end gap-2" }, [
                    createVNode("h2", { class: "text-xl font-semibold" }, "Electrocardiogram"),
                    createVNode("span", { class: "text-xs mb-0.5 text-gray-500" }, "(mV)")
                  ])
                ];
              }
            }),
            default: withCtx((_, _push2, _parent2, _scopeId) => {
              if (_push2) {
                _push2(ssrRenderComponent(unref(Line), {
                  options: {
                    ...chartOptions,
                    elements: {
                      point: {
                        radius: 0,
                        hitRadius: 0
                      }
                    },
                    scales: {
                      // current tick interval is 00:15, 00:30, 00:45, 01:00, make more bigger like 00:30, 01:00, 01:30, 02:00
                      x: {
                        ticks: {
                          maxTicksLimit: 10,
                          maxRotation: 0,
                          minRotation: 0
                        }
                      },
                      // add more space / gap for Y, example +20, -20
                      y: {
                        suggestedMin: item.yMin,
                        suggestedMax: item.yMax
                      }
                    }
                  },
                  data: {
                    labels: item.labels,
                    datasets: [...item.datasets.map((item2) => ({
                      ...item2
                    }))]
                  }
                }, null, _parent2, _scopeId));
              } else {
                return [
                  createVNode(unref(Line), {
                    options: {
                      ...chartOptions,
                      elements: {
                        point: {
                          radius: 0,
                          hitRadius: 0
                        }
                      },
                      scales: {
                        // current tick interval is 00:15, 00:30, 00:45, 01:00, make more bigger like 00:30, 01:00, 01:30, 02:00
                        x: {
                          ticks: {
                            maxTicksLimit: 10,
                            maxRotation: 0,
                            minRotation: 0
                          }
                        },
                        // add more space / gap for Y, example +20, -20
                        y: {
                          suggestedMin: item.yMin,
                          suggestedMax: item.yMax
                        }
                      }
                    },
                    data: {
                      labels: item.labels,
                      datasets: [...item.datasets.map((item2) => ({
                        ...item2
                      }))]
                    }
                  }, null, 8, ["options", "data"])
                ];
              }
            }),
            _: 2
          }, _parent));
        } else {
          _push(`<!---->`);
        }
        _push(`<!--]-->`);
      });
      _push(`<!--]-->`);
      if (unref(generated).length == 0) {
        _push(`<div><div class="h-[600px] w-full rounded-lg bg-gray-100 dark:bg-gray-900 p-4 flex flex-col gap-4"><div class="h-[50px] w-full rounded-lg bg-gray-300 dark:bg-gray-700 animate-pulse"></div><div class="flex-1 w-full rounded-lg bg-gray-300 dark:bg-gray-700 animate-pulse"></div></div></div>`);
      } else {
        _push(`<!---->`);
      }
      _push(`</div>`);
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("components/SessionWidget/DetailWidget.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=DetailWidget-B1poF25h.mjs.map
