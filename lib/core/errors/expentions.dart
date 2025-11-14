// lib/core/errors/exceptions.dart

import 'error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException(this.errorModel); // positional
}

class CacheException implements Exception {
  final String errorMessage;
  CacheException({required this.errorMessage});
}

// ────────────────────── Subclasses ──────────────────────
class BadCertificateException extends ServerException {
  BadCertificateException(ErrorModel errorModel) : super(errorModel);
}

class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(ErrorModel errorModel) : super(errorModel);
}

class BadResponseException extends ServerException {
  BadResponseException(ErrorModel errorModel) : super(errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(ErrorModel errorModel) : super(errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(ErrorModel errorModel) : super(errorModel);
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(ErrorModel errorModel) : super(errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(ErrorModel errorModel) : super(errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(ErrorModel errorModel) : super(errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(ErrorModel errorModel) : super(errorModel);
}

class ConflictException extends ServerException {
  ConflictException(ErrorModel errorModel) : super(errorModel);
}

class CancelException extends ServerException {
  CancelException(ErrorModel errorModel) : super(errorModel);
}

class UnknownException extends ServerException {
  UnknownException(ErrorModel errorModel) : super(errorModel);
}
