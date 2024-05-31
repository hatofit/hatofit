import { _ as __nuxt_component_1 } from './Container-BL9-rOfc.mjs';
import { _ as _sfc_main$1 } from './Title-THJIYvs6.mjs';
import { _ as __nuxt_component_1$1 } from './Section-DHOkqozb.mjs';
import { g as useSeoMeta, O as Link } from './server.mjs';
import { defineComponent, withCtx, createTextVNode, createVNode, useSSRContext } from 'vue';
import { ssrRenderComponent } from 'vue/server-renderer';
import 'tailwind-merge';
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
  __name: "index",
  __ssrInlineRender: true,
  setup(__props) {
    useSeoMeta({
      title: "Privacy Policies",
      keywords: [
        "Hatofit",
        "privacy policy",
        "health app",
        "fitness app",
        "data protection",
        "personal information",
        "health data"
      ].join(", "),
      applicationName: "Hatofit",
      authors: [
        {
          name: "Hatofit",
          url: "mailto:hatofit@gmail.com"
        }
      ]
    });
    return (_ctx, _push, _parent, _attrs) => {
      const _component_PageContainer = __nuxt_component_1;
      const _component_PageTitle = _sfc_main$1;
      const _component_PageSection = __nuxt_component_1$1;
      const _component_Link = Link;
      _push(ssrRenderComponent(_component_PageContainer, _attrs, {
        default: withCtx((_, _push2, _parent2, _scopeId) => {
          if (_push2) {
            _push2(ssrRenderComponent(_component_PageTitle, {
              text: "Privacy Policies",
              class: "text-center"
            }, null, _parent2, _scopeId));
            _push2(ssrRenderComponent(_component_PageSection, { class: "bg-gray-200 dark:bg-gray-800 rounded p-4" }, {
              default: withCtx((_2, _push3, _parent3, _scopeId2) => {
                if (_push3) {
                  _push3(`<section${_scopeId2}><h2${_scopeId2}>1. Introduction</h2><p${_scopeId2}> Welcome to Hatofit, a health and fitness application. This Privacy Policy explains how we collect, use, and safeguard your personal information. </p></section><section${_scopeId2}><h2${_scopeId2}>2. Information We Collect</h2><p${_scopeId2}>When you use Hatofit, we may collect the following information:</p><ul${_scopeId2}><li${_scopeId2}><strong${_scopeId2}>Personal Information:</strong> Name, email, date of birth, weight, height, and profile photo. </li><li${_scopeId2}><strong${_scopeId2}>Health and Fitness Data:</strong> Real-time heart rate (connected from Polar H1o or Verity Sense), exercise data (recorded during workouts). </li></ul></section><section${_scopeId2}><h2${_scopeId2}>3. How We Use Your Information</h2><p${_scopeId2}>We use the collected information for the following purposes:</p><ul${_scopeId2}><li${_scopeId2}><strong${_scopeId2}>User Authentication and Account Management:</strong> To create and manage user accounts, allowing you to log in and use Hatofit. </li><li${_scopeId2}><strong${_scopeId2}>Real-time Display of Heart Rate:</strong> To provide you with real-time heart rate data during your workouts. </li><li${_scopeId2}><strong${_scopeId2}>Recording and Storing Exercise Data:</strong> To track and store data related to your exercises, enabling you to review your fitness progress. </li><li${_scopeId2}><strong${_scopeId2}>API Interaction:</strong> When you end an exercise, the app will request a POST method to an API for data retrieval and storage. </li><li${_scopeId2}><strong${_scopeId2}>Data Accessibility:</strong> Allowing users to access their health and fitness data from the mobile app or website. </li><li${_scopeId2}><strong${_scopeId2}>Optional Google Fit Integration:</strong> If you choose to connect Hatofit to Google Fit, additional health and fitness data may be processed as permitted by the Google Fit API. This integration is optional, and you can manage the permissions within the app settings. </li></ul></section><section${_scopeId2}><h2${_scopeId2}>4. Data Security</h2><p${_scopeId2}> We take reasonable measures to protect your personal information, including your date of birth. This includes encryption, secure data storage, and access controls. However, no method of transmission over the internet or electronic storage is 100% secure. </p></section><section${_scopeId2}><h2${_scopeId2}>5. Permissions</h2><p${_scopeId2}> The Hatofit app requires the following permissions on your device, as described in the AndroidManifest.xml: </p><ul${_scopeId2}><li${_scopeId2}><strong${_scopeId2}>INTERNET:</strong> Allows the app to access the internet for API communication. </li><li${_scopeId2}><strong${_scopeId2}>BLUETOOTH and BLUETOOTH_ADMIN (API 18-30):</strong> Required for Bluetooth connectivity with heart rate monitors. </li><li${_scopeId2}><strong${_scopeId2}> ACCESS_COARSE_LOCATION and ACCESS_FINE_LOCATION (API 23-30): </strong>{&quot; &quot;} Required for location-based permissions. </li><li${_scopeId2}><strong${_scopeId2}>BLUETOOTH_CONNECT and BLUETOOTH_SCAN (API 31+):</strong> New permissions for Bluetooth in API 31 and above. </li><li${_scopeId2}><strong${_scopeId2}>ACTIVITY_RECOGNITION:</strong> Allows the app to recognize the user&#39;s physical activity. </li><li${_scopeId2}><strong${_scopeId2}> Health-related Permissions (READ/WRITE_STEPS, READ/WRITE_WEIGHT, READ/WRITE_HEIGHT, READ/WRITE_HEART_RATE, READ/WRITE_SLEEP): </strong>{&quot; &quot;} Necessary for accessing health-related data. </li><li${_scopeId2}><strong${_scopeId2}></strong></li></ul><p${_scopeId2}> These permissions are crucial for the proper functioning of the app and ensuring a seamless user experience. </p></section><section${_scopeId2}><h2${_scopeId2}>6. Optional Google Fit Integration</h2><p${_scopeId2}> If you choose to connect your Hatofit app to Google Fit, we may collect and process additional health and fitness data as permitted by the Google Fit API. This integration is optional, and you can manage the permissions within the app settings. </p></section><section${_scopeId2}><h2${_scopeId2}>7. Changes to This Privacy Policy</h2><p${_scopeId2}> We may update this Privacy Policy from time to time. You will be notified of any changes by reviewing the policy on our website or through the app. It is advisable to regularly check for updates to stay informed about how we are handling your personal information. </p></section><section${_scopeId2}><h2${_scopeId2}>8. User Rights</h2><p${_scopeId2}>As a user of Hatofit, you have the following rights:</p><ul${_scopeId2}><li${_scopeId2}><strong${_scopeId2}>Access:</strong> You can request access to the personal information, including your date of birth, we hold about you. </li><li${_scopeId2}><strong${_scopeId2}>Correction:</strong> You can request corrections to any inaccurate or incomplete personal information, including your date of birth. </li><li${_scopeId2}><strong${_scopeId2}>Deletion:</strong> You can request the deletion of your personal information under certain circumstances. </li><li${_scopeId2}><strong${_scopeId2}>Portability:</strong> You can request the transfer of your personal information to another service or platform. </li><li${_scopeId2}><strong${_scopeId2}>Withdrawal of Consent:</strong> If you have provided consent for specific processing activities, you can withdraw that consent at any time. </li></ul><p${_scopeId2}> To exercise these rights or if you have any questions or concerns about our Privacy Policy, please contact us `);
                  _push3(ssrRenderComponent(_component_Link, { href: "mailto:hatofit@gmail.com" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(` Google e-Mail `);
                      } else {
                        return [
                          createTextVNode(" Google e-Mail ")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</p></section><section${_scopeId2}><h2${_scopeId2}>9. Contact Us</h2><p${_scopeId2}> If you have any questions or concerns about our Privacy Policy, please contact us at{&quot; &quot;} `);
                  _push3(ssrRenderComponent(_component_Link, { href: "mailto:hatofit@gmail.com" }, {
                    default: withCtx((_3, _push4, _parent4, _scopeId3) => {
                      if (_push4) {
                        _push4(` Google e-Mail `);
                      } else {
                        return [
                          createTextVNode(" Google e-Mail ")
                        ];
                      }
                    }),
                    _: 1
                  }, _parent3, _scopeId2));
                  _push3(`</p></section>`);
                } else {
                  return [
                    createVNode("section", null, [
                      createVNode("h2", null, "1. Introduction"),
                      createVNode("p", null, " Welcome to Hatofit, a health and fitness application. This Privacy Policy explains how we collect, use, and safeguard your personal information. ")
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "2. Information We Collect"),
                      createVNode("p", null, "When you use Hatofit, we may collect the following information:"),
                      createVNode("ul", null, [
                        createVNode("li", null, [
                          createVNode("strong", null, "Personal Information:"),
                          createTextVNode(" Name, email, date of birth, weight, height, and profile photo. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Health and Fitness Data:"),
                          createTextVNode(" Real-time heart rate (connected from Polar H1o or Verity Sense), exercise data (recorded during workouts). ")
                        ])
                      ])
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "3. How We Use Your Information"),
                      createVNode("p", null, "We use the collected information for the following purposes:"),
                      createVNode("ul", null, [
                        createVNode("li", null, [
                          createVNode("strong", null, "User Authentication and Account Management:"),
                          createTextVNode(" To create and manage user accounts, allowing you to log in and use Hatofit. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Real-time Display of Heart Rate:"),
                          createTextVNode(" To provide you with real-time heart rate data during your workouts. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Recording and Storing Exercise Data:"),
                          createTextVNode(" To track and store data related to your exercises, enabling you to review your fitness progress. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "API Interaction:"),
                          createTextVNode(" When you end an exercise, the app will request a POST method to an API for data retrieval and storage. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Data Accessibility:"),
                          createTextVNode(" Allowing users to access their health and fitness data from the mobile app or website. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Optional Google Fit Integration:"),
                          createTextVNode(" If you choose to connect Hatofit to Google Fit, additional health and fitness data may be processed as permitted by the Google Fit API. This integration is optional, and you can manage the permissions within the app settings. ")
                        ])
                      ])
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "4. Data Security"),
                      createVNode("p", null, " We take reasonable measures to protect your personal information, including your date of birth. This includes encryption, secure data storage, and access controls. However, no method of transmission over the internet or electronic storage is 100% secure. ")
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "5. Permissions"),
                      createVNode("p", null, " The Hatofit app requires the following permissions on your device, as described in the AndroidManifest.xml: "),
                      createVNode("ul", null, [
                        createVNode("li", null, [
                          createVNode("strong", null, "INTERNET:"),
                          createTextVNode(" Allows the app to access the internet for API communication. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "BLUETOOTH and BLUETOOTH_ADMIN (API 18-30):"),
                          createTextVNode(" Required for Bluetooth connectivity with heart rate monitors. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, " ACCESS_COARSE_LOCATION and ACCESS_FINE_LOCATION (API 23-30): "),
                          createTextVNode('{" "} Required for location-based permissions. ')
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "BLUETOOTH_CONNECT and BLUETOOTH_SCAN (API 31+):"),
                          createTextVNode(" New permissions for Bluetooth in API 31 and above. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "ACTIVITY_RECOGNITION:"),
                          createTextVNode(" Allows the app to recognize the user's physical activity. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, " Health-related Permissions (READ/WRITE_STEPS, READ/WRITE_WEIGHT, READ/WRITE_HEIGHT, READ/WRITE_HEART_RATE, READ/WRITE_SLEEP): "),
                          createTextVNode('{" "} Necessary for accessing health-related data. ')
                        ]),
                        createVNode("li", null, [
                          createVNode("strong")
                        ])
                      ]),
                      createVNode("p", null, " These permissions are crucial for the proper functioning of the app and ensuring a seamless user experience. ")
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "6. Optional Google Fit Integration"),
                      createVNode("p", null, " If you choose to connect your Hatofit app to Google Fit, we may collect and process additional health and fitness data as permitted by the Google Fit API. This integration is optional, and you can manage the permissions within the app settings. ")
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "7. Changes to This Privacy Policy"),
                      createVNode("p", null, " We may update this Privacy Policy from time to time. You will be notified of any changes by reviewing the policy on our website or through the app. It is advisable to regularly check for updates to stay informed about how we are handling your personal information. ")
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "8. User Rights"),
                      createVNode("p", null, "As a user of Hatofit, you have the following rights:"),
                      createVNode("ul", null, [
                        createVNode("li", null, [
                          createVNode("strong", null, "Access:"),
                          createTextVNode(" You can request access to the personal information, including your date of birth, we hold about you. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Correction:"),
                          createTextVNode(" You can request corrections to any inaccurate or incomplete personal information, including your date of birth. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Deletion:"),
                          createTextVNode(" You can request the deletion of your personal information under certain circumstances. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Portability:"),
                          createTextVNode(" You can request the transfer of your personal information to another service or platform. ")
                        ]),
                        createVNode("li", null, [
                          createVNode("strong", null, "Withdrawal of Consent:"),
                          createTextVNode(" If you have provided consent for specific processing activities, you can withdraw that consent at any time. ")
                        ])
                      ]),
                      createVNode("p", null, [
                        createTextVNode(" To exercise these rights or if you have any questions or concerns about our Privacy Policy, please contact us "),
                        createVNode(_component_Link, { href: "mailto:hatofit@gmail.com" }, {
                          default: withCtx(() => [
                            createTextVNode(" Google e-Mail ")
                          ]),
                          _: 1
                        })
                      ])
                    ]),
                    createVNode("section", null, [
                      createVNode("h2", null, "9. Contact Us"),
                      createVNode("p", null, [
                        createTextVNode(' If you have any questions or concerns about our Privacy Policy, please contact us at{" "} '),
                        createVNode(_component_Link, { href: "mailto:hatofit@gmail.com" }, {
                          default: withCtx(() => [
                            createTextVNode(" Google e-Mail ")
                          ]),
                          _: 1
                        })
                      ])
                    ])
                  ];
                }
              }),
              _: 1
            }, _parent2, _scopeId));
          } else {
            return [
              createVNode(_component_PageTitle, {
                text: "Privacy Policies",
                class: "text-center"
              }),
              createVNode(_component_PageSection, { class: "bg-gray-200 dark:bg-gray-800 rounded p-4" }, {
                default: withCtx(() => [
                  createVNode("section", null, [
                    createVNode("h2", null, "1. Introduction"),
                    createVNode("p", null, " Welcome to Hatofit, a health and fitness application. This Privacy Policy explains how we collect, use, and safeguard your personal information. ")
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "2. Information We Collect"),
                    createVNode("p", null, "When you use Hatofit, we may collect the following information:"),
                    createVNode("ul", null, [
                      createVNode("li", null, [
                        createVNode("strong", null, "Personal Information:"),
                        createTextVNode(" Name, email, date of birth, weight, height, and profile photo. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Health and Fitness Data:"),
                        createTextVNode(" Real-time heart rate (connected from Polar H1o or Verity Sense), exercise data (recorded during workouts). ")
                      ])
                    ])
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "3. How We Use Your Information"),
                    createVNode("p", null, "We use the collected information for the following purposes:"),
                    createVNode("ul", null, [
                      createVNode("li", null, [
                        createVNode("strong", null, "User Authentication and Account Management:"),
                        createTextVNode(" To create and manage user accounts, allowing you to log in and use Hatofit. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Real-time Display of Heart Rate:"),
                        createTextVNode(" To provide you with real-time heart rate data during your workouts. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Recording and Storing Exercise Data:"),
                        createTextVNode(" To track and store data related to your exercises, enabling you to review your fitness progress. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "API Interaction:"),
                        createTextVNode(" When you end an exercise, the app will request a POST method to an API for data retrieval and storage. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Data Accessibility:"),
                        createTextVNode(" Allowing users to access their health and fitness data from the mobile app or website. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Optional Google Fit Integration:"),
                        createTextVNode(" If you choose to connect Hatofit to Google Fit, additional health and fitness data may be processed as permitted by the Google Fit API. This integration is optional, and you can manage the permissions within the app settings. ")
                      ])
                    ])
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "4. Data Security"),
                    createVNode("p", null, " We take reasonable measures to protect your personal information, including your date of birth. This includes encryption, secure data storage, and access controls. However, no method of transmission over the internet or electronic storage is 100% secure. ")
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "5. Permissions"),
                    createVNode("p", null, " The Hatofit app requires the following permissions on your device, as described in the AndroidManifest.xml: "),
                    createVNode("ul", null, [
                      createVNode("li", null, [
                        createVNode("strong", null, "INTERNET:"),
                        createTextVNode(" Allows the app to access the internet for API communication. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "BLUETOOTH and BLUETOOTH_ADMIN (API 18-30):"),
                        createTextVNode(" Required for Bluetooth connectivity with heart rate monitors. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, " ACCESS_COARSE_LOCATION and ACCESS_FINE_LOCATION (API 23-30): "),
                        createTextVNode('{" "} Required for location-based permissions. ')
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "BLUETOOTH_CONNECT and BLUETOOTH_SCAN (API 31+):"),
                        createTextVNode(" New permissions for Bluetooth in API 31 and above. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "ACTIVITY_RECOGNITION:"),
                        createTextVNode(" Allows the app to recognize the user's physical activity. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, " Health-related Permissions (READ/WRITE_STEPS, READ/WRITE_WEIGHT, READ/WRITE_HEIGHT, READ/WRITE_HEART_RATE, READ/WRITE_SLEEP): "),
                        createTextVNode('{" "} Necessary for accessing health-related data. ')
                      ]),
                      createVNode("li", null, [
                        createVNode("strong")
                      ])
                    ]),
                    createVNode("p", null, " These permissions are crucial for the proper functioning of the app and ensuring a seamless user experience. ")
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "6. Optional Google Fit Integration"),
                    createVNode("p", null, " If you choose to connect your Hatofit app to Google Fit, we may collect and process additional health and fitness data as permitted by the Google Fit API. This integration is optional, and you can manage the permissions within the app settings. ")
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "7. Changes to This Privacy Policy"),
                    createVNode("p", null, " We may update this Privacy Policy from time to time. You will be notified of any changes by reviewing the policy on our website or through the app. It is advisable to regularly check for updates to stay informed about how we are handling your personal information. ")
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "8. User Rights"),
                    createVNode("p", null, "As a user of Hatofit, you have the following rights:"),
                    createVNode("ul", null, [
                      createVNode("li", null, [
                        createVNode("strong", null, "Access:"),
                        createTextVNode(" You can request access to the personal information, including your date of birth, we hold about you. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Correction:"),
                        createTextVNode(" You can request corrections to any inaccurate or incomplete personal information, including your date of birth. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Deletion:"),
                        createTextVNode(" You can request the deletion of your personal information under certain circumstances. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Portability:"),
                        createTextVNode(" You can request the transfer of your personal information to another service or platform. ")
                      ]),
                      createVNode("li", null, [
                        createVNode("strong", null, "Withdrawal of Consent:"),
                        createTextVNode(" If you have provided consent for specific processing activities, you can withdraw that consent at any time. ")
                      ])
                    ]),
                    createVNode("p", null, [
                      createTextVNode(" To exercise these rights or if you have any questions or concerns about our Privacy Policy, please contact us "),
                      createVNode(_component_Link, { href: "mailto:hatofit@gmail.com" }, {
                        default: withCtx(() => [
                          createTextVNode(" Google e-Mail ")
                        ]),
                        _: 1
                      })
                    ])
                  ]),
                  createVNode("section", null, [
                    createVNode("h2", null, "9. Contact Us"),
                    createVNode("p", null, [
                      createTextVNode(' If you have any questions or concerns about our Privacy Policy, please contact us at{" "} '),
                      createVNode(_component_Link, { href: "mailto:hatofit@gmail.com" }, {
                        default: withCtx(() => [
                          createTextVNode(" Google e-Mail ")
                        ]),
                        _: 1
                      })
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
    };
  }
});
const _sfc_setup = _sfc_main.setup;
_sfc_main.setup = (props, ctx) => {
  const ssrContext = useSSRContext();
  (ssrContext.modules || (ssrContext.modules = /* @__PURE__ */ new Set())).add("pages/privacy-policies/index.vue");
  return _sfc_setup ? _sfc_setup(props, ctx) : void 0;
};

export { _sfc_main as default };
//# sourceMappingURL=index-BlbZaXWD.mjs.map
