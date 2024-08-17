class AppException<T> implements Exception {
  final String message;

  AppException({required this.message});

  static AppException from(Object error) =>
      error is AppException ? error : UnknownException();
}

class UnknownException extends AppException {
  UnknownException() : super(message: 'An unknown error occured');
}

class ServerException implements Exception {}

class CacheException implements Exception {}
