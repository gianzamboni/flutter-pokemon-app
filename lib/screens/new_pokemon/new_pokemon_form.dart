import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon.dart';

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

  bool _isValidForm = false;

  late Future<List<Pokemon>> pokemonList;

  @override
  void initState() {
    super.initState();
  //  pokemonList = PokeApi.getAllNames();
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
            FutureBuilder<List<Pokemon>>(
              future: pokemonList,
              builder: (context, asyncSnapshot) {
                if(asyncSnapshot.hasError) {
                  return Text("Could not load pokemon list");
                } else if(asyncSnapshot.hasData) {
                  return Placeholder();
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