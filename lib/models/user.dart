import 'dart:convert';

class User {
  final int _id;
  final String _username;
  final String _name;
  final String _surname;

  User({
    required int id,
    required String username,
    required String name,
    required String surname,
  })  : _id = id,
        _username = username,
        _name = name,
        _surname = surname;

  int get id => _id;
  String get username => _username;
  String get name => _name;
  String get surname => _surname;

  String get fullName => "${_name} ${_surname}";

  factory User.fromJson(String jsonString) {
    final decode = json.decode(jsonString);
    return User.fromJsonMap(decode);
  }

  factory User.fromJsonMap(Map<String, dynamic> jsonMap) {
    return User(
      id: jsonMap['id'], 
      username: jsonMap['username'], 
      name: jsonMap['name'], 
      surname: jsonMap['surname'],
    );
  }

  String toJson() {
    return json.encode({
      'id': _id,
      'username': _username,
      'name': name,
      'surname': surname,
    });
  }

  Map<String, dynamic> toDto() {
    return {
      'id': _id,
      'username': _username,
      'name': _name,
      'surname': _surname,
    };
  }
}