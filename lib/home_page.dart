import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/move_direction.dart';
import 'package:pokeapp/pokemon_card.dart';
import 'package:pokeapp/pokemon_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pokemonList = pokemons;

  void move(int index, MoveDirection direction) {
    setState(() {
      if (direction == MoveDirection.up && index > 0) {
        var temp = pokemonList[index - 1];
        pokemonList[index - 1] = pokemonList[index];
        pokemonList[index] = temp;
      } else if (direction == MoveDirection.down &&
          index < pokemonList.length - 1) {
        var temp = pokemonList[index + 1];
        pokemonList[index + 1] = pokemonList[index];
        pokemonList[index] = temp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: AppBarTitle(title: widget.title),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Center(
          child: ListView(
            children: [...pokemons.asMap().entries.map((entry) {
              return PokemonCard(
                pokemon: entry.value,
                index: entry.key,
                moveCallback: move,
              );
            })],
        ),
      ),
    ));
  }
}
