import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/models/user.dart';
import 'package:pokeapp/models/user_session.dart';

void main() {
  group('UserSession.fromJson', () {
    test('parses token and user map', () {
      final userMap = {
        'id': 99,
        'username': 'ash',
        'name': 'Ash',
        'surname': 'Ketchum',
      };
      final jsonString = json.encode({
        'token': 'abc123',
        'user': userMap,
      });

      final session = UserSession.fromJson(jsonString);
      expect(session.token, 'abc123');
      expect(session.fullName, 'Ash Ketchum');
    });
  });

  group('UserSession.toJson', () {
    test('serializes back to token and user dto', () {
      final user = User(id: 1, username: 'misty', name: 'Misty', surname: 'Waterflower');
      final session = UserSession(token: 'abc123', user: user);

      final encoded = session.toJson();
      final decoded = json.decode(encoded) as Map<String, dynamic>;

      expect(decoded['token'], 'abc123');
      expect(decoded['user'], user.toDto());
    });
  });

  group('UserSession.getters', () {
    test('token and fullName expose underlying values', () {
      final user = User(id: 2, username: 'brock', name: 'Brock', surname: 'Harrison');
      final session = UserSession(token: 'xyz', user: user);
      expect(session.fullName, 'Brock Harrison');
    });
  });
}


