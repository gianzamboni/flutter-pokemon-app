import 'package:flutter/material.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';
import 'package:pokeapp/themes/common_theme.dart';
import 'package:pokeapp/models/pokemon_types.dart';

final darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: Colors.red.shade900,
    secondary: Colors.yellow,
    surface: Colors.grey.shade900,
  ),
  textTheme: textTheme,
  extensions: <ThemeExtension<dynamic>>[
    const PokemonColors(colors: {
      PokemonTypes.fight: Color(0xff9e001b),
      PokemonTypes.fire: Color(0xff933e00),
      PokemonTypes.normal: Color(0xff68593a),
      PokemonTypes.grass: Color(0xff236e00),
      PokemonTypes.psychic: Color(0xff834454),
      PokemonTypes.water: Color(0xff32617a),
    }),
  ],
);
