import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/screens/home/pokemon_card.dart';

class PokemonList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the orientation provider
    final mainAxisDirection =
        MediaQuery.of(context).orientation == Orientation.portrait
        ? Axis.vertical
        : Axis.horizontal;

    final pokemonList = ref.watch(favouritePokemonsProvider);

    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Center(
        child: pokemonList.when(
            data: (data) => data.isEmpty ? Center(child: Text("No hay pokemons favoritos")) : ListView.builder(
              scrollDirection: mainAxisDirection,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return PokemonCard(
                  key: Key("pokemon-${data[index].id.toString()}"),
                  index: index,
                  mainAxisFlow: mainAxisDirection,
                  pokemon: data[index],
                );
              },
            ),
            error: (error, stackTrace) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Error loading pokemon list $error"),
            ),
            loading: () => CircularProgressIndicator(),
          ),
        ),
    );
  }

}
