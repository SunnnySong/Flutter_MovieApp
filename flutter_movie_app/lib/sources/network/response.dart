//! Network response를 감싸는 타입
sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T value;

  Success(this.value);
}

class Error<T> extends Result<T> {
  final Exception exception;

  Error(this.exception);
}
