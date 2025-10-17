import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/providers/favourite_pokemons.dart';
import 'package:pokeapp/utils/ApiServiceError.dart';
import 'package:pokeapp/utils/strings.dart';

class AddPokemonDialog extends ConsumerStatefulWidget {
  const AddPokemonDialog({super.key, required this.pokemon});

  final BasicPokemon pokemon;

  @override
  ConsumerState<AddPokemonDialog> createState() => _AddPokemonDialogState();
}

class _AddPokemonDialogState extends ConsumerState<AddPokemonDialog> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(kebabCaseToPrintable(widget.pokemon.name)),
      content: Text("¿Desea agregar este pokemon a la lista de favoritos?"),
      actions: [
        TextButton(onPressed: () {
          Navigator.of(context).pop();
        }, child: Text("Cancel")),
        TextButton(onPressed: isLoading ? null : () async {
          setState(() {
            isLoading = true;
          });
          try { 
            await ref.read(favouritePokemonsProvider.notifier).add(widget.pokemon);
          } catch (e) {
            final message = e is ApiServiceError && e.statusCode == 409 
              ? "Este pokemon ya esta en la lista de favoritos"   
              : "Error al agregar el pokemon a la lista de favoritos: ${e.toString()}";
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
          } finally {
            setState(() {
              isLoading = false;
            });
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          }
        }, child: isLoading ? const CircularProgressIndicator() : Text("Add")),
      ]
    );
  }
}