import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/models/user.dart';

void main() {
  group('User.fromJsonMap', () {
    test('parses fields from map', () {
      final map = {
        'id': 10,
        'username': 'gary',
        'name': 'Gary',
        'surname': 'Oak',
      };
      final user = User.fromJsonMap(map);
      expect(user.id, 10);
      expect(user.username, 'gary');
      expect(user.name, 'Gary');
      expect(user.surname, 'Oak');
      expect(user.fullName, 'Gary Oak');
    });
  });

  group('User.fromJson', () {
    test('parses fields from JSON string', () {
      final jsonString = json.encode({
        'id': 5,
        'username': 'serena',
        'name': 'Serena',
        'surname': 'Yvonne',
      });
      final user = User.fromJson(jsonString);
      expect(user.id, 5);
      expect(user.username, 'serena');
      expect(user.name, 'Serena');
      expect(user.surname, 'Yvonne');
      expect(user.fullName, 'Serena Yvonne');
    });
  });

  group('User.toJson', () {
    test('serializes to JSON string with public fields', () {
      final user = User(id: 3, username: 'may', name: 'May', surname: 'Maple');
      final jsonString = user.toJson();
      final map = json.decode(jsonString) as Map<String, dynamic>;
      expect(map['id'], 3);
      expect(map['username'], 'may');
      expect(map['name'], 'May');
      expect(map['surname'], 'Maple');
    });
  });

  group('User.toDto', () {
    test('returns a Map with all fields', () {
      final user = User(id: 1, username: 'dawn', name: 'Dawn', surname: 'Berlitz');
      final dto = user.toDto();
      expect(dto, {
        'id': 1,
        'username': 'dawn',
        'name': 'Dawn',
        'surname': 'Berlitz',
      });
    });
  });
}


