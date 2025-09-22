import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/api_pokemon.dart';

class PokeApi {
  static final _baseUrl = "https://pokeapi.co/api/v2";

  static Future<List<ApiPokemon>> getAllNames() async {
    var url = Uri.parse("$_baseUrl/pokemon?limit=2000");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body)["results"];
      var pokemonList = body.map<ApiPokemon>((json) => ApiPokemon.fromJson(json)).toList();
      return pokemonList;
    } else {
      throw Exception("Failed to fetch pokemon names");
    }
  }
}
