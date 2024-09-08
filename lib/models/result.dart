class Result<T> {
  final bool success;
  final String message;
  final T? content;

  Result._(this.success, this.message, this.content);

  static Result successfull<T>([T? content]) {
    return Result._(true, "", content);
  }

  static Result failed<T>(String message) {
    return Result._(false, message, null);
  }
}