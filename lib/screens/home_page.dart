import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/app_drawer.dart';
import 'package:pokeapp/models/move_direction.dart';
import 'package:pokeapp/screens/home/pokemon_card.dart';
import 'package:pokeapp/screens/home/pokemon_list.dart';

import '../models/pokemon.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key, required this.title, this.pokemons});

  final String title;
  final List<Pokemon>? pokemons;
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  var pokemonList = pokemons;
  var orientation = Axis.vertical;

  void move(int index, MoveDirection direction) {

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
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pokeAppBar("Pokeapp", context),
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            orientation = orientation == Axis.horizontal
                ? Axis.vertical
                : Axis.horizontal;
          });
        },
        child: Icon(Icons.screen_rotation_alt),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
        child: Center(child: SizedBox(
          height: orientation == Axis.horizontal ? 350 : null,
          child: ListView(
      scrollDirection: orientation,
      children: [
        ...pokemons.asMap().entries.map((entry) {
          return PokemonCard(
            pokemon: entry.value,
            index: entry.key,
            moveCallback: move,
            mainAxisFlow: orientation,
          );
        }),
      ],
    )
        )),
      ),
    );
  }
}
