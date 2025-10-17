import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon_states.dart';
import 'package:pokeapp/models/pokemon_types.dart';


class BasicPokemon {
  final int _id;
  final String _name;

  BasicPokemon(this._id, this._name);

  factory BasicPokemon.fromJson(Map<String, dynamic> json) {
    return BasicPokemon(json['id'], json['name']);
  }

  int get id => _id;
  String get name => _name;
  
}


class Pokemon extends BasicPokemon {
  final PokemonTypes _type;
  final Map<PokemonState, String?> _images;

  Pokemon(
    super._id,
    super._name,
    this._type, {
    required String imageUrl,
    String? shinyUrl,
  }) : _images = {PokemonState.normal: imageUrl, PokemonState.shiny: shinyUrl};

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final type = PokemonTypes.values.byName(json['type']['name'].toLowerCase());
    return Pokemon(
      json['id'],
      json['name'],
      type,
      imageUrl: json['picture'],
      shinyUrl: json['shinyPicture'],
    );
  }

  int get id => _id;

  String get name => _name;

  bool hasState(PokemonState state) {
    return _images.containsKey(state) && _images[state] != null;
  }

  String image({PokemonState state = PokemonState.normal}) {
    if (!hasState(state)) {
      throw Exception("Image for state $state not found");
    }
    return _images[state]!;
  }

  Color? themeColor(BuildContext context) {
    return _type.themeColor(context);
  }
}
