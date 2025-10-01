import 'package:flutter/material.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';
import 'package:pokeapp/themes/common_theme.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Colors.red,
    secondary: const Color(0xffc2ae00),
    surface: Colors.grey.shade100,
  ),
  textTheme: textTheme,
  extensions: <ThemeExtension<dynamic>>[
    const PokemonColors(
      fight: Color(0xffff6a6a),
      fire: Color(0xffff7f00),
      normal: Color(0xffddccaa),
      grass: Color(0xff99ff66),
      psychic: Color(0xffffb5c5),
      water: Color(0xffb0e2ff),
    ),
  ],
);
