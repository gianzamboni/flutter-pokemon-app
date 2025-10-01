import 'package:flutter/material.dart';

import '../themes/pokemon_theme_extension.dart';

enum PokemonTypes {
  fire,
  water,
  psychic,
  grass,
  fight,
  normal;

  Color? themeColor(BuildContext context) {
    final pokemonColors = Theme.of(context).extension<PokemonColors>();
    return switch (this) {
      PokemonTypes.fire => pokemonColors?.fire,
      PokemonTypes.water => pokemonColors?.water,
      PokemonTypes.psychic => pokemonColors?.psychic,
      PokemonTypes.grass => pokemonColors?.grass,
      PokemonTypes.fight => pokemonColors?.fight,
      PokemonTypes.normal => pokemonColors?.normal,
    };
  }
}
