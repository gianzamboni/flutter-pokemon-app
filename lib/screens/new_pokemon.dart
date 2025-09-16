import 'package:flutter/material.dart';
import 'package:pokeapp/app_drawer.dart';

class NewPokemon extends StatefulWidget {
  const NewPokemon({super.key});

  @override
  State<NewPokemon> createState() => _NewPokemonState();
}

class _NewPokemonState extends State<NewPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: const Text("Nuevo Pokémon")),
      body: const Placeholder()
    );
  }
}