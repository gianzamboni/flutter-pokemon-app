import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/utils/strings.dart';

class PokemonNamesFilter extends ConsumerStatefulWidget {
  PokemonNamesFilter({
    super.key,
    required this.pokemonList,
  });

  final List<BasicPokemon> pokemonList;

  @override
  ConsumerState<PokemonNamesFilter> createState() => _PokemonFilterListState();
}

class _PokemonFilterListState extends ConsumerState<PokemonNamesFilter> {

  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();

  List<BasicPokemon> filteredPokemons = [];

  final isLoading = false;

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

    final favouritePokemons = ref.read(favouritePokemonsProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Buscar pokemon",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: filteredPokemons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    key: Key("pokemon-${filteredPokemons[index]}"),
                    title: Text(kebabCaseToPrintable(filteredPokemons[index].name)),
                    onTap: () {
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Text(kebabCaseToPrintable(filteredPokemons[index].name)),
                        content: Text("¿Desea agregar este pokemon a la lista de favoritos?"),
                        actions: [
                          TextButton(onPressed: () {
                            Navigator.of(context).pop();
                          }, child: Text("Cancel")),
                          TextButton(onPressed: () {
                            favouritePokemons.add(filteredPokemons[index]);

                          }, child: Text("Add")),
                        ],
                      ));
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

  void dispose() {
    _searchController.dispose();
    super.dispose();
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