import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthException implements Exception {
  final int statusCode;
  final String message;

  AuthException({required this.statusCode, required this.message});

  // Allows syntax: `throw AuthException(response);`
  factory AuthException.fromResponse(http.Response response) {
    final int status = response.statusCode;
    String message = switch(response.statusCode) {
      401 => 'Unauthorized',
      403 => 'Forbidden',
      _ => 'Unknown error',
    };

    final Map<String, dynamic> body = json.decode(response.body);
    message = body['message'] ?? "Unknown error";
    print(message);
    return AuthException(
      statusCode: status,
      message: message.isNotEmpty ? message : 'Unkown error',
    );
  }

  @override
  String toString() {
    return message.isNotEmpty ? message : 'Unkown error';
  }
}
