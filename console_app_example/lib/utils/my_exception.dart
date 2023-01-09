class MyException {
  Object exception;
  String message;

  MyException(this.exception, this.message);

  @override
  String toString() {
    return 'exception: $exception, error message: $message';
  }

  get getException => this.exception;

  set setException(exception) => this.exception = exception;

  get getMessage => this.message;

  set setMessage(message) => this.message = message;
}
