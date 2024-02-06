export 'active_theme.dart';
export 'api_constant.dart';
export 'firebase_constant.dart';
export 'guid_constant.dart';
export 'keys.dart';

class Constants {
  Constants._();

  static Constants get = Constants._();

  String appName = "Hatofit";
  String english = "English";
  String bahasa = "Bahasa";

  String centimeter = "Centimeter";
  String inch = "Inch";

  String kilocalorie = "Kilocalorie";
  String kilojoule = "Kilojoule";

  String kilogram = "Kilogram";
  String pound = "Pound";

  String google = "Google";
  String email = "Email";

  String bmi = "BMI";

  String placeholderImage =
      "https://untirta.ac.id/wp-content/uploads/2023/08/placeholder-44.png";
}

final Map<String, String> serviceName = {
  "0000180d-0000-1000-8000-00805f9b34fb": "Heart Rate",
  "0000180a-0000-1000-8000-00805f9b34fb": "Device Information",
  "0000180f-0000-1000-8000-00805f9b34fb": "Battery",
  "00002a29-0000-1000-8000-00805f9b34fb": "Manufacturer Name",
  "00001800-0000-1000-8000-00805f9b34fb": "Generic Access",
  "00002a19-0000-1000-8000-00805f9b34fb": "Battery Level",
  "00001801-0000-1000-8000-00805f9b34fb": "Generic Attribute",
  "0000181c-0000-1000-8000-00805f9b34fb": "User Data",
};

final Map<String, String> characteristicName = {
  // Generic Access
  "00002a00-0000-1000-8000-00805f9b34fb": "Device Name",
  "00002a01-0000-1000-8000-00805f9b34fb": "Appearance",
  "00002a04-0000-1000-8000-00805f9b34fb":
      "Peripheral Preferred Connection Parameters",
  "00002aa6-0000-1000-8000-00805f9b34fb": "Central Address Resolution",
  // Heart Rate
  "00002a37-0000-1000-8000-00805f9b34fb": "Heart Rate Measurement",
  "00002a38-0000-1000-8000-00805f9b34fb": "Body Sensor Location",
  // Device Information
  "00002a29-0000-1000-8000-00805f9b34fb": "Manufacturer Name",
  "00002a24-0000-1000-8000-00805f9b34fb": "Model Number",
  "00002a25-0000-1000-8000-00805f9b34fb": "Serial Number",
  "00002a27-0000-1000-8000-00805f9b34fb": "Hardware Revision",
  "00002a26-0000-1000-8000-00805f9b34fb": "Firmware Revision",
  "00002a28-0000-1000-8000-00805f9b34fb": "Software Revision",
  "00002a23-0000-1000-8000-00805f9b34fb": "System ID",
  // Battery
  "00002a19-0000-1000-8000-00805f9b34fb": "Battery Level",
};
