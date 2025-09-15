import 'package:flutter/material.dart';
import 'package:pokeapp/move_direction.dart';
import 'package:pokeapp/pokemon.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.index,
    required this.moveCallback,
    required this.mainAxisFlow,
  });

  final Pokemon pokemon;
  final int index;
  final Function(int, MoveDirection) moveCallback;
  final Axis mainAxisFlow;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  
  PokemonState currentState = PokemonState.normal;
  void showSnackBar(BuildContext context, PokemonState state) {
    final article = state.name.startsWith(RegExp("(a|e|i|o|u)"))? "an" : "a";
    final snackBar = SnackBar(
      content: Text('${widget.pokemon.capitalizedName} does not have $article ${state.name} version!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void updateCurrentPokemonState(PokemonState newState) {
    var state = currentState == newState ? PokemonState.normal : newState;
    if (!widget.pokemon.hasState(state)) {
      showSnackBar(context, newState);
      return;
    } else {
      setState(() {
        currentState = state;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String pokemonImagePath = widget.pokemon.image(state: currentState);

    return GestureDetector(
      onTap: () {
       updateCurrentPokemonState(PokemonState.shiny);
      },
      onDoubleTap: () {
        updateCurrentPokemonState(PokemonState.evolved);
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
            child: Flex(
              direction: widget.mainAxisFlow == Axis.horizontal ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flex(
                  direction: widget.mainAxisFlow,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        widget.moveCallback(widget.index, MoveDirection.up);
                      },
                      child: Icon(widget.mainAxisFlow == Axis.horizontal ? Icons.arrow_back : Icons.arrow_upward),
                    ),
                    Text(
                      widget.pokemon.capitalizedName,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.moveCallback(widget.index, MoveDirection.down);
                      },
                      child: Icon(widget.mainAxisFlow == Axis.horizontal ? Icons.arrow_forward : Icons.arrow_downward),
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
