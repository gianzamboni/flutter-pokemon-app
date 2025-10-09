import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class BasePokemonService {
  static final String _baseUrl = dotenv.env['POKEAPI_BASE_URL'] ?? '';

  static Future<http.Response> get(String path) async {
    final response = await http.get(Uri.parse("$_baseUrl/$path"));
    return response;
  }

  static Future<http.Response> post(String path, dynamic body) async {
    final response = await http.post(
      Uri.parse("$_baseUrl$path"),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response;
    } else {
      throw Exception("Failed to post $path: ${response.statusCode} ${response.body}");
    }
  }
}