class Failure implements Exception {
  final String code;
  final String message;
  final String details;

  Failure({
    required this.code,
    required this.message,
    required this.details,
  });
}
