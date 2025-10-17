import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapp/utils/ApiServiceError.dart';

class BasePokemonService {
  static final String _baseUrl = dotenv.env['POKEAPI_BASE_URL'] ?? '';


  static Map<String, String> _getHeaders(String? bearerToken) {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (bearerToken != null) {
      headers['Authorization'] = 'Bearer $bearerToken';
    }
    
    return headers;
  }   

  static Future<http.Response> get(String path, {String? bearerToken}) async {
    final Map<String, String> headers = _getHeaders(bearerToken);

    final response = await http.get(Uri.parse("$_baseUrl$path"), headers: headers);
    return response;
  }

  static Future<http.Response> post(String path, dynamic body, {String? bearerToken}) async {
    final Map<String, String> headers = _getHeaders(bearerToken);

    final response = await http.post(
      Uri.parse("$_baseUrl$path"),
      headers: headers,
      body: json.encode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw ApiServiceError(statusCode: response.statusCode, body: response.body);
    }
  }
}