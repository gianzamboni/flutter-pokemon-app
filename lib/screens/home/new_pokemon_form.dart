import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/screens/home/new_pokemon_form/pokemon_names_filter.dart';
import 'package:pokeapp/services/pokemon_service.dart';

class NewPokemonForm extends ConsumerWidget {
  const NewPokemonForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Center(child: 
      FutureBuilder<List<BasicPokemon>>(
        future: PokemonService.getPokemonNames(),
        builder: (context, asyncSnapshot) {

          if(asyncSnapshot.hasError) {
            return Text("Error loading pokemon names");
          } 
          if(asyncSnapshot.hasData) {
            final List<BasicPokemon> pokemonList = asyncSnapshot.data ?? [];
            return PokemonNamesFilter(pokemonList: pokemonList);
          }

          return const CircularProgressIndicator();
        },
      )
    );
  }
}
