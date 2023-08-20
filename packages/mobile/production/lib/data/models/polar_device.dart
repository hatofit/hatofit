class PolarDevice {
  final String name;
  final String address;
  final String deviceId;
  final int rssi;
  final String imageAsset;
  bool? isConnected;
  bool? isConnectable;
  int? battery;
  String? firmware;

  PolarDevice({
    required this.name,
    required this.address,
    required this.deviceId,
    required this.rssi,
    required this.imageAsset,
    this.isConnected,
    this.isConnectable,
    this.battery,
    this.firmware,
  });
}
