import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/models/pokemon_types.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/providers/orientation.dart';
import 'package:pokeapp/screens/home/pokemon_card.dart';

List<Pokemon> pokemons = [
    Pokemon(1, "charmander", PokemonTypes.fire, imageUrl: "charmander.png"),
    Pokemon(134, "vaporeon", PokemonTypes.water, imageUrl: "vaporeon.png", shinyUrl: "vaporeon_shiny.png"),
    Pokemon(151, "mew", PokemonTypes.psychic, imageUrl: "mew.png",       shinyUrl: "mew_shiny.png"),
    Pokemon(153, "bayleef", PokemonTypes.plant, imageUrl: "bayleef.png", shinyUrl: "bayleef_shiny.png"),
    Pokemon(153, "gothitelle", PokemonTypes.psychic, imageUrl: "gothitelle.png", shinyUrl: "gothitelle_shiny.png"),
    Pokemon(158, "hitmonchan", PokemonTypes.fight, imageUrl: "hitmonchan.png", shinyUrl: "hitmonchan_shiny.png"),
    Pokemon(201, "lickitung", PokemonTypes.normal, imageUrl: "lickitung.png", shinyUrl: "lickitung_shiny.png"),
    Pokemon(576, "totodile", PokemonTypes.water, imageUrl: "totodile.png", shinyUrl: "totodile_shiny.png"),
    Pokemon(392, "unknown", PokemonTypes.psychic, imageUrl: "unknown.png"),
    Pokemon(107, "infernape", PokemonTypes.fire, imageUrl: "infernape.png", shinyUrl: "infernape_shiny.png")
];

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