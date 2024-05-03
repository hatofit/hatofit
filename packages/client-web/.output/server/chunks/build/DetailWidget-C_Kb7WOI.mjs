import { _ as __nuxt_component_0 } from './Card-BVh4Co2a.mjs';
import { _ as __nuxt_component_1 } from './Dropdown-CcLYNkkJ.mjs';
import { e as __nuxt_component_2 } from './server.mjs';
import { u as useDayjs } from './dayjs-DjHdTGjd.mjs';
import { defineComponent, ref, mergeProps, unref, withCtx, createVNode, useSSRContext } from 'vue';
import { ssrRenderAttrs, ssrRenderList, ssrRenderComponent } from 'vue/server-renderer';
import { Line } from 'vue-chartjs';
import { Chart, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale, LineElement, PointElement } from 'chart.js';
import 'tailwind-merge';
import './id-C5IKnQCN.mjs';
import './usePopper-BvwpwiAU.mjs';
import '../runtime.mjs';
import 'node:http';
import 'node:https';
import 'fs';
import 'path';
import 'requrl';
import 'node:fs';
import 'node:url';
import 'ipx';
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
    const downloadData = (type, format) => {
      if (type === "hr") {
        const data = generated.value.find((item) => item.type === "hr");
        if (data) {
          const rest = data.labels.map((label, i) => [label, data.datasets[0].data[i]]);
          console.log(rest);
          const csv = [
            ["Time", "Heart Rate"],
            ...rest
          ].map((item) => item.join(",")).join("\n");
          const blob = new Blob([csv], { type: "text/csv" });
          const url = URL.createObjectURL(blob);
          const a = (void 0).createElement("a");
          a.href = url;
          a.download = `heart_rate_${$dayjs().format("YYYYMMDD_HHmmss")}.csv`;
          a.click();
          URL.revokeObjectURL(url);
        }
      } else if (type === "ecg") {
        const data = generated.value.find((item) => item.type === "ecg");
        if (data) {
          const rest = data.labels.map((label, i) => [label, data.datasets[0].data[i]]);
          console.log(rest);
          const csv = [
            ["Time", "Electrocardiogram"],
            ...rest
          ].map((item) => item.join(",")).join("\n");
          const blob = new Blob([csv], { type: "text/csv" });
          const url = URL.createObjectURL(blob);
          const a = (void 0).createElement("a");
          a.href = url;
          a.download = `electrocardiogram_${$dayjs().format("YYYYMMDD_HHmmss")}.csv`;
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
              if (_push2) {
                _push2(`<div class="flex justify-between"${_scopeId}><div class="flex items-end gap-2"${_scopeId}><h2 class="text-xl font-semibold"${_scopeId}>Heart Rate</h2><span class="text-xs mb-0.5 text-gray-500"${_scopeId}>(bpm)</span></div><div${_scopeId}>`);
                _push2(ssrRenderComponent(_component_UDropdown, {
                  items: [
                    [
                      { label: "Download CSV", icon: "i-heroicons-arrow-down-tray", click: () => downloadData("hr") }
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
                            { label: "Download CSV", icon: "i-heroicons-arrow-down-tray", click: () => downloadData("hr") }
                          ]
                        ]
                      }, {
                        default: withCtx(() => [
                          createVNode(_component_UButton, {
                            icon: "i-heroicons-bars-3-bottom-right",
                            variant: "soft"
                          })
                        ]),
                        _: 1
                      }, 8, ["items"])
                    ])
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
//# sourceMappingURL=DetailWidget-C_Kb7WOI.mjs.map
