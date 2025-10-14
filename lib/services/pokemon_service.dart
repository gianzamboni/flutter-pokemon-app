import 'dart:convert';

import 'package:pokeapp/models/pokemon.dart';

import 'base_pokemon_service.dart';

class PokemonService {
  static final String _basePath = "api/pokemon";

  static Future<List<Pokemon>> getPokemons(List<int> ids) async {
    final response = await BasePokemonService.get("$_basePath?ids=${ids.join(",")}");
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
        .map((pokemon) => Pokemon.fromJson(pokemon))
        .toList();
    return pokemons;
  }
}
