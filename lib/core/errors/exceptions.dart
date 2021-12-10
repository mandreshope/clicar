class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}

class SocketException implements Exception {
  final String message;
  SocketException({required this.message});
}

class CacheException implements Exception {}
