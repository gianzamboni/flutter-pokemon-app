import 'dart:convert';

import 'package:pokeapp/models/pokemon.dart';

import 'base_pokemon_service.dart';

class FavouritePokemonService {

  static final String _basePath = "/favourite-pokemon";

  static Future<List<Pokemon>> getFavouritePokemons(String token) async {
    final response = await BasePokemonService.get("$_basePath", bearerToken: token);
    print(response.body);
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
      .map((pokemon) => Pokemon.fromJson(pokemon))
      .toList();
    return pokemons;
  }

  static Future<Pokemon> addFavouritePokemon(String token, int pokemonId) async {
    final response = await BasePokemonService.post("$_basePath", {
      'pokemonId': pokemonId,
    }, bearerToken: token);
    return Pokemon.fromJson(jsonDecode(response.body));
  }
}
