import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/providers/orientation.dart';
import 'package:pokeapp/screens/home/pokemon_card.dart';

List<int> pokemonIds = [4, 134, 151, 153, 576, 107, 108, 158, 201, 392];

class PokemonList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the orientation provider
    final orientation = ref.watch(orientationProvider);
    final pokemonList = ref.watch(favouritePokemonsProvider);

    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Center(
        child: SizedBox(
          height: orientation == Axis.horizontal ? 350 : null,
          child: pokemonList.when(
            data: (data) => ListView(
              scrollDirection: orientation,
              children: [
                ...data.asMap().entries.map((entry) {
                  return PokemonCard(
                    pokemon: entry.value,
                    index: entry.key,
                    mainAxisFlow: orientation,
                  );
                }),
              ],
            ),
            error: (error, stackTrace) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Error loading pokemon list $error"),
            ),
            loading: () => CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
