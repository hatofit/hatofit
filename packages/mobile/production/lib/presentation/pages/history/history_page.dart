import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hatofit/presentation/controller/page/page_con.dart';

import '../../../app/themes/app_theme.dart';
import '../../../app/themes/colors_constants.dart';
import '../../widget/appBar/custom_app_bar.dart';

class HistoryPage extends GetView<PageCon> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'History',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Center(
          child: RefreshIndicator(
            onRefresh: () => controller.fetchHistory(),
            child: Obx(
              () => ListView.builder(
                itemCount: controller.historyData.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    height: 104,
                    margin: const EdgeInsets.only(bottom: 16),
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
                        controller.navigateHistoryDetail(
                          controller.historyData[index]['_id'],
                        );
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
                                      controller.historyData[index]['exercise']
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.historyData[index]['exercise']
                                          ['name'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.calendar,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          controller.formattedDateHistory(
                                              controller.historyData[index]
                                                  ['exercise']['createdAt']),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          CupertinoIcons.time,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "${controller.historyData[index]['exercise']['duration']} s",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
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
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
