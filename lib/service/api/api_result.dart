abstract class ApiResult<T> {
  const ApiResult._();
  const factory ApiResult.success({T data, String? message}) = ApiSuccess<T>;
  const factory ApiResult.failure(
      {required bool isError, String? errorMessage}) = ApiFailure<T>;
}

class ApiSuccess<T> extends ApiResult<T> {
  final T? data;
  final String? message;
  const ApiSuccess({this.data, this.message}) : super._();
}

class ApiFailure<T> extends ApiResult<T> {
  final bool isError;
  final String? errorMessage;
  const ApiFailure({required this.isError, this.errorMessage}) : super._();
}
