import 'dart:convert';

import 'package:pokeapp/models/pokemon.dart';

import 'base_pokemon_service.dart';

class FavouritePokemonService {
  static final String _basePath = "/favourite-pokemon";

  const FavouritePokemonService();

  Future<List<Pokemon>> getFavouritePokemons(String token) async {
    final response = await BasePokemonService.get(
      "$_basePath",
      bearerToken: token,
    );
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
        .map((pokemon) => Pokemon.fromJson(pokemon))
        .toList();
    return pokemons;
  }

  Future<Pokemon> addFavouritePokemon(String token, int pokemonId) async {
    final response = await BasePokemonService.post("$_basePath", {
      'pokemonId': pokemonId,
    }, bearerToken: token);
    return Pokemon.fromJson(jsonDecode(response.body));
  }

  Future<List<Pokemon>> swapFavouritePokemons(
    String token,
    int index1,
    int index2,
  ) async {
    final response = await BasePokemonService.patch("$_basePath", {
      'rankingNumber1': index1,
      'rankingNumber2': index2,
    }, bearerToken: token);

    List<dynamic> json = jsonDecode(response.body);
    return json.map((pokemon) => Pokemon.fromJson(pokemon)).toList();
  }

  Future<void> deleteFavouritePokemon(String token, int index) async {
    await BasePokemonService.delete("$_basePath/$index", bearerToken: token);
  }
}
