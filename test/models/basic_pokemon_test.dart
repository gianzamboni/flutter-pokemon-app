import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/models/pokemon.dart';

void main() {
  group('BasicPokemon', () {
    test('fromJson parses id and name', () {
      final json = {
        'id': 25,
        'name': 'Pikachu',
      };

      final basic = BasicPokemon.fromJson(json);

      expect(basic.id, 25);
      expect(basic.name, 'Pikachu');
    });
  });
}


