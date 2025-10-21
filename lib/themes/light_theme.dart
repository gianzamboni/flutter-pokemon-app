import 'package:flutter/material.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';
import 'package:pokeapp/themes/common_theme.dart';
import 'package:pokeapp/models/pokemon_types.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Colors.red,
    secondary: const Color(0xffc2ae00),
    surface: Colors.grey.shade100,
  ),
  textTheme: textTheme,
  extensions: <ThemeExtension<dynamic>>[
    const PokemonColors(colors: {
      PokemonTypes.fight: Color(0xffff6a6a),
      PokemonTypes.fire: Color(0xffff7f00),
      PokemonTypes.normal: Color(0xffddccaa),
      PokemonTypes.grass: Color(0xff99ff66),
      PokemonTypes.psychic: Color(0xffffb5c5),
      PokemonTypes.water: Color(0xffb0e2ff),
      PokemonTypes.bug: Color(0xff92a212),
    }),
  ],
);
