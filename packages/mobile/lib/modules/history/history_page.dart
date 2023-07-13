import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polar_hr_devices/routes/app_routes.dart';
import 'package:polar_hr_devices/services/internet_service.dart';
import 'package:polar_hr_devices/themes/app_theme.dart';
import 'package:polar_hr_devices/themes/colors_constants.dart';
import 'package:polar_hr_devices/widget/appBar/custom_app_bar.dart';

import 'history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: controller.title,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: FutureBuilder(
            future: InternetService().fetchHistory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 104,
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: ThemeManager().isDarkMode
                            ? ColorConstants.darkContainer
                            : ColorConstants.lightContainer,
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(AppRoutes.historyDetail,
                              arguments: snapshot.data![index]['_id']);
                        },
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 124,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        snapshot.data![index]['exercise']
                                            ['thumbnail'],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index]['exercise']
                                            ['name'],
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.calendar,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            controller.dateConverter(
                                                snapshot.data![index]
                                                    ['exercise']['createdAt']),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            CupertinoIcons.time,
                                            size: 18,
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                              "${snapshot.data![index]['exercise']['duration']} s",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.chevron_right_square,
                              size: 28,
                              color: Theme.of(context)
                                  .iconTheme
                                  .color
                                  ?.withOpacity(0.5),
                            ),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CupertinoActivityIndicator(
                radius: 16,
              );
            },
          ),
        ),
      ),
    );
  }
}
