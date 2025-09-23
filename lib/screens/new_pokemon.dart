import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/app_drawer.dart';
import 'package:pokeapp/screens/new_pokemon/new_pokemon_form.dart';

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
      appBar: pokeAppBar("Nuevo Pokemon", context, showIcon: false),
      body: Padding(
        padding: const EdgeInsets.all(48),
        child: NewPokemonForm(),
      )
    );
  }
}

