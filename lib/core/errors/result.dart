import 'failures.dart';

class Result<T> {
  final T? value;
  final Failure? failure;

  Result._({this.value, this.failure});

  factory Result.success(T value) => Result._(value: value);
  factory Result.failure(Failure failure) => Result._(failure: failure);

  bool get isSuccess => failure == null;
  bool get isFailure => failure != null;

  void fold(void Function(T value) onSuccess, void Function(Failure failure) onFailure) {
    if (isSuccess) {
      onSuccess(value as T);
    } else {
      onFailure(failure!);
    }
  }
}
