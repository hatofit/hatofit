import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<ActivityCubit>().getSessions(),
      child: Parent(
        appBar: AppBar(
          title: Text(Strings.of(context)!.activity),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
        ),
        child: BlocBuilder<ActivityCubit, ActivityState>(
          buildWhen: (p, c) => p != c,
          builder: (context, state) => state.when(
            loading: () => const Center(child: Loading()),
            failure: (message) {
              if (message is CacheFailure) {
                return Center(
                    child: Text(Strings.of(context)!.noActivityFound));
              }
              return Center(child: Text(message.toString()));
            },
            success: (session) {
              return ListView.builder(
                itemCount: session.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      Routes.activityDetail.name,
                      extra: session[index],
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: Dimens.width4, horizontal: Dimens.width8),
                    height: Dimens.height100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color:
                          context.isDarkMode ? Palette.cardDark : Palette.card,
                    ),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: Dimens.width128,
                              height: Dimens.height100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    session[index].exercise?.thumbnail ??
                                        Constants.get.placeholderImage,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimens.width16),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimens.height4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    session[index].exercise?.name ?? '',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.calendar_month,
                                      ),
                                      SizedBox(width: Dimens.width8),
                                      Text(
                                        DateFormat('d MMMM yyyy').format(
                                          DateTime.fromMicrosecondsSinceEpoch(
                                              session[index].startTime ?? 0),
                                        ),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.access_time,
                                      ),
                                      SizedBox(width: Dimens.width8),
                                      Text(
                                        Duration(
                                          microseconds:
                                              session[index].endTime! -
                                                  session[index].startTime!,
                                        ).toString().split('.')[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        // Text('Name: ${session[index].exercise?.name}',
                        //     style: Theme.of(context).textTheme.bodyLarge),
                        // Text(
                        //     'Date: ${DateFormat('d MMMM yyyy').format(
                        //       DateTime.fromMicrosecondsSinceEpoch(
                        //           session[index].startTime ?? 0),
                        //     )}',
                        //     style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
