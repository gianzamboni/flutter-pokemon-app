import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon_states.dart';
import 'package:pokeapp/models/pokemon_types.dart';


@immutable
class Pokemon {

  final String name;
  final PokemonTypes type; 
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
    return state.imagePath(name);
  }

}