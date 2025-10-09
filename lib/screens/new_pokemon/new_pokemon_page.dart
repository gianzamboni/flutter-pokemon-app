import 'package:flutter/material.dart';
import 'package:pokeapp/app_bar_title.dart';
import 'package:pokeapp/app_drawer.dart';

class NewPokemonPage extends StatelessWidget {
  const NewPokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: pokeAppBar("Nuevo Pokemon", context, showIcon: false),
      body: Padding(padding: const EdgeInsets.all(48), child: Placeholder()),
    );
  }
}
