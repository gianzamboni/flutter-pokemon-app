class User {
  final String username;
  final String name;
  final String surname;

  User({required this.username, required this.name, required this.surname});

  static Future<User> fromJson(decode) async {
    return User(username: decode['username'], name: decode['name'], surname: decode['surname']);
  }
}