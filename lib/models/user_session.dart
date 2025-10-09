import 'package:pokeapp/models/user.dart';

class UserSession {
  final String token;
  final User user;
  
  UserSession({required this.token, required this.user});

  static Future<UserSession> fromJson(decode) async {
    return UserSession(token: decode['token'], user: await User.fromJson(decode));
  }
}