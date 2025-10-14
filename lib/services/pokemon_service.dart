import 'dart:convert';

import 'package:pokeapp/models/pokemon.dart';

import 'base_pokemon_service.dart';

class PokemonService {
  static Future<List<Pokemon>> getPokemons(List<int> ids) async {
    final response = await BasePokemonService.get("api/pokemon?ids=${ids.join(",")}");
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
      .map((pokemon) => Pokemon.fromJson(pokemon))
      .toList();
    return pokemons;
  }

  static Future<List<Pokemon>> getFavouritePokemons(String token) async {
    
    final response = await BasePokemonService.get("api/favourite-pokemon", bearerToken: token);
    print(response.body);
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
      .map((pokemon) => Pokemon.fromJson(pokemon))
      .toList();
    return pokemons;
  }
}
