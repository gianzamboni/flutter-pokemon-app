import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokeapp/themes/pokemon_theme_extension.dart';

enum PokemonTypes {
  fire,
  water,
  psychic,
  plant,
  fight,
  normal;


  Color? themeColor(BuildContext context) {
    final pokemonColors = Theme.of(context).extension<PokemonColors>();
    return switch(this) {
      PokemonTypes.fire => pokemonColors?.fire,
      PokemonTypes.water => pokemonColors?.water,
      PokemonTypes.psychic => pokemonColors?.psychic,
      PokemonTypes.plant => pokemonColors?.plant,
      PokemonTypes.fight => pokemonColors?.fight,
      PokemonTypes.normal => pokemonColors?.normal,
    };
  }
}

enum PokemonState {
  normal,
  shiny,
  evolved;
  
}

class Pokemon {

  String name;
  PokemonTypes type; 
  final Map<PokemonState, bool> availableStates;

  Pokemon(this.name, this.type, {final hasShinyVersion = false, final hasEvolution = false}) :
    availableStates = {
      PokemonState.normal: true,
      PokemonState.shiny: hasShinyVersion,
      PokemonState.evolved: hasEvolution
    };

  String get capitalizedName {
    return "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
  }

  bool hasState(PokemonState state) {
    return availableStates[state] ?? false;
  }

  String image({PokemonState state = PokemonState.normal}) {
    return switch(state) {
      PokemonState.normal => "assets/img/${name.toLowerCase()}.png",
      PokemonState.shiny => "assets/img/${name.toLowerCase()}-shiny.png",
      PokemonState.evolved => "assets/img/${name.toLowerCase()}-evolution.png",
    };
  }
}
