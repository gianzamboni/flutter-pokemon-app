
import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/pokemon_card.dart';
import 'package:pokeapp/pokemon_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          child: ListView(
            children: pokemons.map((pokemon) {
              return PokemonCard(pokemon: pokemon);
          }).toList(),
        ),
            ),
      )
  ) ;
  }
}
