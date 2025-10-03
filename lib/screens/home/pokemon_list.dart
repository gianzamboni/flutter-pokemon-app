import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/screens/home/pokemon_card.dart';

List<int> pokemonIds = [4, 134, 151, 153, 576, 107, 108, 158, 201, 392];

class PokemonList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the orientation provider
    final mainAxisDirection =
        MediaQuery.of(context).orientation == Orientation.portrait
        ? Axis.vertical
        : Axis.horizontal;

    // Watch the provider to handle loading/error states and trigger initialization
    final pokemonAsyncValue = ref.watch(favouritePokemonsProvider);

    return DecoratedBox(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
      child: Center(
        child: SizedBox(
          height: mainAxisDirection == Axis.horizontal ? 350 : null,
          child: ListView(
              scrollDirection: mainAxisDirection,
              item
              itemBuilder: (context, index) {
                return PokemonCard(
                  pokemon: pokemonAsyncValue[index],
                  index: index,
                  mainAxisFlow: mainAxisDirection,
                );
              },
          ),
        ),
      ),
    );
  }
}
