import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/models/pokemon_states.dart';
import 'package:pokeapp/models/pokemon_types.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';

void main() {
  group('Pokemon.fromJson', () {
    test('parses nested structure and type', () {
      final json = {
        'rankingNumber': 7,
        'pokemon': {
          'id': 133,
          'name': 'Eevee',
          'picture': 'https://img/eevee.png',
          'shinyPicture': 'https://img/eevee_shiny.png',
          'type': {'name': 'Normal'},
        },
      };

      final p = Pokemon.fromJson(json);
      expect(p.id, 133);
      expect(p.name, 'Eevee');
      expect(p.rankingNumber, 7);
      // theme uses lowercased byName
      expect(p.themeColor, isA<Function>()); // method exists
      // cannot access type directly; verify behavior instead
      expect(p.hasState(PokemonState.normal), isTrue);
      expect(p.hasState(PokemonState.shiny), isTrue);
      expect(p.image(), 'https://img/eevee.png');
      expect(p.image(state: PokemonState.shiny), 'https://img/eevee_shiny.png');
    });

    test('shiny missing makes hasState(shiny) false and image throws', () {
      final json = {
        'rankingNumber': 1,
        'pokemon': {
          'id': 4,
          'name': 'Charmander',
          'picture': 'https://img/charmander.png',
          'shinyPicture': null,
          'type': {'name': 'Fire'},
        },
      };

      final p = Pokemon.fromJson(json);
      expect(p.hasState(PokemonState.normal), isTrue);
      expect(p.hasState(PokemonState.shiny), isFalse);
      expect(() => p.image(state: PokemonState.shiny), throwsA(isA<Exception>()));
    });
  });

  group('Pokemon.themeColor', () {
    testWidgets('returns null when no PokemonColors in theme', (tester) async {
      final json = {
        'rankingNumber': 1,
        'pokemon': {
          'id': 7,
          'name': 'Squirtle',
          'picture': 'https://img/squirtle.png',
          'shinyPicture': null,
          'type': {'name': 'Water'},
        },
      };
      final p = Pokemon.fromJson(json);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              final color = p.themeColor(context);
              expect(color, isNull);
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });

    testWidgets('reads color from PokemonColors extension when provided', (tester) async {
      final json = {
        'rankingNumber': 1,
        'pokemon': {
          'id': 7,
          'name': 'Squirtle',
          'picture': 'https://img/squirtle.png',
          'shinyPicture': null,
          'type': {'name': 'Water'},
        },
      };
      final p = Pokemon.fromJson(json);

      final pokemonColors = PokemonColors(
        colors: {
          PokemonTypes.water: const Color(0xFF0000FF),
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(extensions: [pokemonColors]),
          home: Builder(
            builder: (context) {
              final color = p.themeColor(context);
              expect(color, const Color(0xFF0000FF));
              return const SizedBox.shrink();
            },
          ),
        ),
      );
    });
  });
}


