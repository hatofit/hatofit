import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class GuidConstant {
  GuidConstant._();

  static GuidConstant get = GuidConstant._();

  // heart rate service
  Guid hrS = Guid("180D");
  // device information service
  Guid diS = Guid("180A");
  // battery service
  Guid bsS = Guid("180F");

  // heart rate measurement characteristic
  Guid hrmC = Guid("2A37");
  // body sensor location characteristic
  Guid bslC = Guid("2A38");
  // manufacturer name string characteristic
  Guid mnsC = Guid("2A29");
  // battery level characteristic
  Guid blC = Guid("2A19");
}
