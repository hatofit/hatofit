class Success<T> {
  final String code;
  final String message;
  final T data;
  Success({required this.code, required this.message, required this.data});
}
