import 'package:flutter/material.dart';
import 'package:pokeapp/move_direction.dart';
import 'package:pokeapp/pokemon.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.index,
    required this.moveCallback,
  });

  final Pokemon pokemon;
  final int index;
  final Function(int, MoveDirection) moveCallback;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  bool showShinny = false;

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Pokemon does not have a shinny version!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    String pokemonImagePath = showShinny
        ? widget.pokemon.imageShiny()
        : widget.pokemon.image();

    return GestureDetector(
      onTap: () {
        if (!widget.pokemon.hasShinyVersion && !showShinny) {
          showSnackBar(context);
          return;
        } else {
          setState(() {
            showShinny = !showShinny;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: widget.pokemon.typeColor(Theme.of(context).brightness),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(color: Colors.black.withAlpha(51), blurRadius: 10),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 30.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.moveCallback(widget.index, MoveDirection.up);
                      },
                      child: Icon(Icons.arrow_upward),
                    ),
                    Text(
                      widget.pokemon.capitalizedName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.moveCallback(widget.index, MoveDirection.down);
                      },
                      child: Icon(Icons.arrow_downward),
                    ),
                  ],
                ),
                SizedBox(
                  height: 162,  
                  width: 162,
                  child: Image.asset(
                    pokemonImagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, object, s) {
                      return Placeholder(); // Cambiar error image
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
