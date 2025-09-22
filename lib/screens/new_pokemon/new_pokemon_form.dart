import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp/models/api_pokemon.dart';
import 'package:pokeapp/services/poke_api.dart';

class NewPokemonForm extends StatefulWidget {
  const NewPokemonForm({super.key});

  @override
  State<NewPokemonForm> createState() => _NewPokemonFormState();
}

InputDecoration inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
  );
}

String? fieldIsRequired<T>(T? value) {
  if (value == null) {
    return "Este valor ese necesario";
  }
  return null;
}

String? fieldIsUrl(String? value) {
  if (value == null || value.isEmpty) return null;

  final uri = Uri.tryParse(value);
  if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
    return "Tiene que ser un link válido";
  }
  return null;
}

FormFieldValidator<T> validatorChain<T>(List<FormFieldValidator<T>> validators) {
  return (T? value) {
    for (final validator in validators) {
      String? result = validator(value);
      if (result != null) return result;
    }
    return null;
  };
}


class _NewPokemonFormState extends State<NewPokemonForm> {

  final _formKey = GlobalKey<FormState>();
  final _pokemonNameController = TextEditingController();

  final _pokemonImgUrlController = TextEditingController();
  final _pokemonImgUrlFocusNode = FocusNode();

  bool _isValidForm = false;

  late Future<List<ApiPokemon>> pokemonList;

  @override
  void initState() {
    super.initState();
    pokemonList = PokeApi.getAllNames();
  }

  @override
  void dispose() {
    _pokemonNameController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final state = _formKey.currentState;
    state?.save();

    setState(() {
      _isValidForm = state?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        onChanged: _validateForm,
        child: Column(
          spacing: 32,
          children: [
            FutureBuilder<List<ApiPokemon>>(
              future: pokemonList,
              builder: (context, asyncSnapshot) {
                if(asyncSnapshot.hasError) {
                  return Text("Could not load pokemon list");
                } else if(asyncSnapshot.hasData) {
                  final pokemonList = asyncSnapshot.data!;
                  return PokemonSearch(pokemonList: pokemonList, pokemonNameController: _pokemonNameController, pokemonImgUrlFocusNode: _pokemonImgUrlFocusNode);
                }

                return const CircularProgressIndicator();
              }
            ),
            Row(
              children: [

              ],
            ),
            SizedBox(
              width: MediaQuery.widthOf(context),
              child: FilledButton.icon(
                icon: Icon(Icons.add),
                label: Text("Agregar"),
                style: ElevatedButton.styleFrom(
                  elevation: 2.0,
                ),
                onPressed: _isValidForm ? () {} : null,
              ),
            )
          ],
        )
    );
  }
}

class PokemonSearch extends StatelessWidget {
  const PokemonSearch({
    super.key,
    required this.pokemonList,
    required TextEditingController pokemonNameController,
    required FocusNode pokemonImgUrlFocusNode,
  }) : _pokemonNameController = pokemonNameController, _pokemonImgUrlFocusNode = pokemonImgUrlFocusNode;

  final List<ApiPokemon> pokemonList;
  final TextEditingController _pokemonNameController;
  final FocusNode _pokemonImgUrlFocusNode;

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}