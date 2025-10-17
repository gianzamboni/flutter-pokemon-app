import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/screens/home/new_pokemon_form/add_pokemon_dialog.dart';
import 'package:pokeapp/utils/strings.dart';

class PokemonNamesFilter extends ConsumerStatefulWidget {
  const PokemonNamesFilter({super.key, required this.pokemonList});

  final List<BasicPokemon> pokemonList;
  @override
  ConsumerState<PokemonNamesFilter> createState() => _PokemonNamesFilterState();
}

class _PokemonNamesFilterState extends ConsumerState<PokemonNamesFilter> {

  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();

  List<BasicPokemon> filteredPokemons = [];

  @override
  void initState() {
    super.initState();
    filteredPokemons = widget.pokemonList;
    _searchController.addListener(() {
      final query = _searchController.text;
      _filterPokemonNames(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 32,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Buscar pokemon",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                itemCount: filteredPokemons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: Key("pokemon-${filteredPokemons[index]}"),
                    title: Text(kebabCaseToPrintable(filteredPokemons[index].name)),
                    onTap: () {
                      showDialog(context: context, builder: (context) => AddPokemonDialog(pokemon: filteredPokemons[index]));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _filterPokemonNames(String query) {
    final List<BasicPokemon> newFilteredList = List<BasicPokemon>.from(widget.pokemonList).where((pokemon) {
      final formattedName = kebabCaseToPrintable(pokemon.name);
      return formattedName.toLowerCase().startsWith(query.toLowerCase());
    }).toList();
    
    setState(() {
      filteredPokemons = newFilteredList;
    });
  }
}