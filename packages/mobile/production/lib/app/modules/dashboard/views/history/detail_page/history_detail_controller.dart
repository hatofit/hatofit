import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryDetailController extends GetxController {
  final String title = 'History Detail';
  final argument = Get.arguments;
  final ZoomPanBehavior _zoomPanBehavior = ZoomPanBehavior(
    enablePinching: true,
    enableDoubleTapZooming: true,
    zoomMode: ZoomMode.xy,
    enablePanning: true,
  );

  ZoomPanBehavior get zoomPanBehavior => _zoomPanBehavior;

}
