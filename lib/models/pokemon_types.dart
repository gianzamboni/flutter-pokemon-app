import 'package:flutter/material.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';

enum PokemonTypes {
  bug,
  dark,
  dragon,
  electric,
  fairy,
  fight,
  fire,
  flying,
  ghost,
  grass,
  ground,
  ice,
  normal,
  poison,
  psychic,
  rock,
  shadow,
  steel,
  unknown,
  water;

  Color? themeColor(BuildContext context) {
    return Theme.of(context).extension<PokemonColors>()?[this];
  }
}
