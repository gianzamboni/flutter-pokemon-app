import 'package:flutter/material.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';
import 'package:pokeapp/themes/common_theme.dart';

final darkTheme = ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(
          primary: Colors.red.shade900,
          secondary:  Colors.yellow,
          surface: Colors.grey.shade900

        ),
        textTheme: textTheme,
        extensions: <ThemeExtension<dynamic>>[
          const PokemonColors(
            fight: Color(0xff9e001b),
            fire: Color(0xff933e00),
            normal: Color(0xff68593a),
            plant: Color(0xff236e00),
            psychic: Color(0xff834454),
            water: Color(0xff32617a),
          )
        ],
      );