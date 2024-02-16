import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/data/data.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:intl/intl.dart';

class ActivityDetailView extends StatefulWidget {
  final SessionEntity session;
  const ActivityDetailView({super.key, required this.session});

  @override
  State<ActivityDetailView> createState() => _ActivityDetailViewState();
}

class _ActivityDetailViewState extends State<ActivityDetailView> {
  late Duration duration;
  late String startTime;
  late String endTime;
  late String eDate;
  late ReportModel? report;
  MetaHr? metaHr;
  List<HrChartModel> hrChart = [];

  final formatter = DateFormat('HH:mm:ss');
  @override
  void initState() { 
    final report = ReportModel.fromSession(widget.session);
    setState(() {
      this.report = report;
    });
    _parseHr(report);
    _parseTime(widget.session.startTime!, widget.session.endTime!);

    super.initState();
  }

  void _parseTime(int s, int e) {
    final sD = DateTime.fromMicrosecondsSinceEpoch(s);
    final eD = DateTime.fromMicrosecondsSinceEpoch(e);

    setState(() {
      eDate = DateFormat('d MMMM yyyy').format(
        DateTime.fromMicrosecondsSinceEpoch(s),
      );
      startTime = formatter.format(sD);
      endTime = formatter.format(eD);
      duration = eD.difference(sD);
    });
  }

  void _parseHr(ReportModel r) async {
    if (r.reports == null || r.reports!.isEmpty) return;
    final has = r.reports?.any((element) => element.type!.contains("hr"));
    if (has == true) {
      final hr = r.reports?.firstWhere(
        (element) => element.type!.contains("hr"),
      );
      final hrChart = await hr?.generateHrChart();
      final mt = await widget.session.generateMeta();
      if (!mounted  ) return;
      setState(() {
        this.hrChart = hrChart ?? [];
        metaHr = mt;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final str = Strings.of(context)!;
    final sesInfo = Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
        );
    return Parent(
      appBar: AppBar(
        title: Text(widget.session.exercise?.name ?? ''),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.9), BlendMode.darken),
                    image: CachedNetworkImageProvider(
                        widget.session.exercise?.thumbnail ??
                            Constants.get.placeholderImage),
                  ),
                ),
                padding: EdgeInsets.all(Dimens.width16),
                margin: EdgeInsets.symmetric(horizontal: Dimens.width8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconWrapper(
                          icon: Icons.details_rounded,
                          color:
                              Theme.of(context).extension<AppColors>()!.yellow!,
                        ),
                        SizedBox(width: Dimens.width8),
                        Text(str.activityDetails,
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    SizedBox(height: Dimens.height8),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(str.exerciseName, style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(str.mood, style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(str.date, style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(str.startTime, style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(str.endTime, style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(str.duration, style: sesInfo),
                          ],
                        ),
                        SizedBox(width: Dimens.width8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(': ${widget.session.exercise?.name}',
                                style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(': ${widget.session.mood?.trMood(context)} ',
                                style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(': $eDate', style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(': $startTime', style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(': $endTime', style: sesInfo),
                            SizedBox(height: Dimens.height8),
                            Text(
                                ": ${duration.inHours}h ${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}s",
                                style: sesInfo),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
            SizedBox(height: Dimens.height8),
            SessionDeviceCard(devices: report?.devices),
            SizedBox(height: Dimens.height8),
            MetaHrWidget(metaHr: metaHr, hrChart: hrChart),
          ],
        ),
      ),
    );
  }
}
