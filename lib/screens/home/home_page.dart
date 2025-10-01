import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/app_drawer.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/providers/orientation.dart';
import 'package:pokeapp/screens/home/pokemon_list.dart';

class HomePage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonListHasError = ref.watch(pokemonListHasErrorProvider);

    final floatinButton = pokemonListHasError 
      ? FloatingActionButton(
          onPressed: () => ref.invalidate(favouritePokemonsProvider),
          child: Icon(Icons.refresh),
        ) 
      : null;
  
    
    return Scaffold(
      appBar: pokeAppBar("Pokeapp", context),
      drawer: AppDrawer(),
      floatingActionButton: floatinButton,
      body: PokemonList(),
    );
  }
}
