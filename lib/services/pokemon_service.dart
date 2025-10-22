import 'dart:convert';

import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/services/base_pokemon_service.dart';

class PokemonService {
  static final String _basePath = "/pokemon";

  const PokemonService();

  Future<List<Pokemon>> getPokemons(List<int> ids) async {
    final response = await BasePokemonService.get(
      "$_basePath?ids=${ids.join(",")}",
    );
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
        .map((pokemon) => Pokemon.fromJson(pokemon))
        .toList();
    return pokemons;
  }

  Future<List<BasicPokemon>> getPokemonNames() async {
    final response = await BasePokemonService.get("$_basePath?fields=name");
    List<dynamic> json = jsonDecode(response.body);
    return json.map((pokemon) => BasicPokemon.fromJson(pokemon)).toList();
  }
}
