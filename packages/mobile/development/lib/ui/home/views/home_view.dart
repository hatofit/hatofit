import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getData(),
      child: Parent(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimens.height40),
          child: AppBarView(
            title: Text('Hi, ${context.watch<HomeCubit>().userName} 👋'),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.width16),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => state.when(
              loading: () => const Center(child: Loading()),
              failure: (message) => Center(child: Text(message)),
              empty: () => Container(),
              success: (exercises) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icon(
                        //   Icons.local_activity,
                        //   color: Theme.of(context).colorScheme.primary,
                        // ),
                        // SizedBox(width: Dimens.width8),
                        Text(
                          Strings.of(context)!.todayActivity,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(Dimens.width8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimens.width8),
                        color: Theme.of(context).cardColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconWrapper(
                                icon: Icons.show_chart_rounded,
                                color: Theme.of(context)
                                    .extension<AppColors>()!
                                    .red!,
                              ),
                              SizedBox(width: Dimens.width8),
                              Text(
                                Strings.of(context)!.activityTrends,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          SizedBox(height: Dimens.height16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
