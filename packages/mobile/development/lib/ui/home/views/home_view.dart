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
    final homeCubit = context.watch<HomeCubit>();
    return RefreshIndicator(
      onRefresh: () => context.read<HomeCubit>().getData(),
      child: Parent(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, Dimens.height40),
          child: AppBarView(
            title: Text('Hi, ${homeCubit.userName} 👋'),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.width8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ConnectedDevice(),
                const ExerciseNow(),
                SizedBox(height: Dimens.height16),
                ContainerWrapper(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconWrapper(
                            icon: Icons.show_chart_rounded,
                            color:
                                Theme.of(context).extension<AppColors>()!.red!,
                          ),
                          SizedBox(width: Dimens.width8),
                          Text(
                            Strings.of(context)!.activityTrends,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Dimens.height8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: CalorieGauge()),
                    SizedBox(width: Dimens.width8),
                    const Expanded(child: BMIGauge()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
