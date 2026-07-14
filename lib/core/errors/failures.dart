import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
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
