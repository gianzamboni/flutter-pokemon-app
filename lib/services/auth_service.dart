import 'dart:convert';

import 'package:pokeapp/models/user_session.dart';
import 'package:pokeapp/services/base_pokemon_service.dart';
import 'package:pokeapp/utils/ApiServiceError.dart';
import 'package:pokeapp/utils/AuthException.dart';
import 'package:http/http.dart' as http;

class AuthService {
  static final String _basePath = "/auth";

  static Future<bool> signUp(String name, String surname, String username, String password) async {
    try {
    final response = await BasePokemonService.post("$_basePath/register", {
        'name': name,
        'surname': surname,
        'username': username,
        'password': password,
      });
      return true;
    } catch (error) {
      print(error);
      throw error;
    }
  }

  static Future<UserSession> login(String username, String password) async {
    try { 
      final response = await BasePokemonService.post("$_basePath/login", {
      'username': username,
      'password': password,
      });

      return UserSession.fromJson(response.body);
    } catch (error) {
      print(error);

      if (error is ApiServiceError) {
        final body = jsonDecode(error.body);
        throw AuthException(statusCode: error.statusCode, message: body['message'] ?? "Unknown error");
      }
      throw AuthException(statusCode: 500, message: "Unknown error");
    }
  }
}