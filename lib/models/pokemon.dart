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
  final int _rankingNumber;
  final PokemonTypes _type;
  final Map<PokemonState, String?> _images;

  Pokemon(
    super._id,
    super._name,
    this._rankingNumber,
    this._type, {
    required String imageUrl,
    String? shinyUrl,
  }) : _images = {PokemonState.normal: imageUrl, PokemonState.shiny: shinyUrl};

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    print(json);
    final type = PokemonTypes.values.byName(json['pokemon']['type']['name'].toLowerCase());
    final rankingNumber = json['rankingNumber'];
    final pokemon = json['pokemon'];
    return Pokemon(
      pokemon['id'],
      pokemon['name'],
      rankingNumber,
      type,
      imageUrl: pokemon['picture'],
      shinyUrl: pokemon['shinyPicture'],
    );
  }

  int get id => _id;

  String get name => _name;

  int get rankingNumber => _rankingNumber;

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
