class ApiServiceError implements Exception {
  final int statusCode;
  final dynamic body;

  ApiServiceError({required this.statusCode, required this.body});

  @override
  String toString() {
    return 'ApiServiceError: Status Code: $statusCode, Body: $body';
  }
}