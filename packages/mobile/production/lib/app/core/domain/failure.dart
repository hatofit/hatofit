class Failure implements Exception {
  final String? code;
  final String? message;
  final String? details;

  Failure({
    this.code,
    this.message,
    this.details,
  });
}
