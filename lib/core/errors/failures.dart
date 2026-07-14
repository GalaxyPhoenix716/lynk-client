class Failure {
  final String message;
  const Failure(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure &&
          runtimeType == other.runtimeType &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => '$runtimeType: $message';
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  bool operator ==(Object other) =>
      super == other &&
      other is ServerFailure &&
      statusCode == other.statusCode;

  @override
  int get hashCode => Object.hash(super.hashCode, statusCode);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class R2Failure extends Failure {
  const R2Failure(super.message);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message);
}

class QRValidationFailure extends Failure {
  const QRValidationFailure(super.message);
}

class ExpirationFailure extends Failure {
  const ExpirationFailure(super.message);
}
