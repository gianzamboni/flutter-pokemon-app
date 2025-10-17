import 'package:pokeapp/models/user_session.dart';
import 'package:pokeapp/services/base_pokemon_service.dart';

class AuthService {
  static final String _basePath = "/auth";

  static Future<bool> signUp(String name, String surname, String username, String password) async {
    final response = await BasePokemonService.post("$_basePath/register", {
        'name': name,
        'surname': surname,
        'username': username,
        'password': password,
      });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return true;
    } else {
      throw Exception("Failed to sign up: ${response.statusCode} ${response.body}");
    }
  }

  static Future<UserSession> login(String username, String password) async {
    final response = await BasePokemonService.post("$_basePath/login", {
      'username': username,
      'password': password,
    });

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final userSession = await UserSession.fromJson(response.body);
      return userSession;
    } else {
      throw Exception("Failed to login: ${response.statusCode} ${response.body}");
    }
  }
}