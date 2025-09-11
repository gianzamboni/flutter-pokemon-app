
import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/pokemon_card.dart';
import 'package:pokeapp/pokemon_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Pokemon> pokemons = [
    Pokemon("charmander", PokemonTypes.fire),
    Pokemon("vaporeon", PokemonTypes.water),
    Pokemon("mew", PokemonTypes.psychic),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: AppBarTitle(title: widget.title)
       ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Center(
          child: Column(
            children: pokemons.map((pokemon) {
              return PokemonCard(pokemon: pokemon);
          }).toList(),
        ),
            ),
      )
  ) ;
  }
}
