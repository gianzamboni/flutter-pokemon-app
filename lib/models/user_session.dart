import 'dart:convert';

import 'package:pokeapp/models/user.dart';

class UserSession {
  final String _token;
  final User _user;
  
  factory UserSession.fromJson(String jsonString) {
    final decode = json.decode(jsonString);

    final user = User.fromJsonMap(decode['user']);
    
    return UserSession(token: decode['token'], user: user);
  }

  UserSession({required String token, required User user}) : _token = token, _user = user;

  String toJson() {
    return json.encode({
      'token': _token,
      'user': _user.toDto(),
    });
  }

  String get fullName => _user.fullName;
}


enum UserSessionState {
  authenticated,
  anonymous,
  error,
  loading;
}