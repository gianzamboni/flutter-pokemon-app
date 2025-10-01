import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapp/models/pokemon.dart';

class PokeApi {
  static final String _baseUrl =
      dotenv.env['POKEAPI_BASE_URL'] ?? "http://10.0.2.2:8080";

  static Future<List<Pokemon>> getPokemons(List<int> ids) async {
    final url = Uri.parse("$_baseUrl/pokemon?ids=${ids.join(",")}");
    print(url);
    final response = await http.get(url);
    print(response.body);
    List<dynamic> json = jsonDecode(response.body);
    final List<Pokemon> pokemons = json
        .map((pokemon) => Pokemon.fromJson(pokemon))
        .toList();
    return pokemons;
  }
}
