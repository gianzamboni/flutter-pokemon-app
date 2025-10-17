import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/move_direction.dart';
import 'package:pokeapp/screens/home/pokemon_card/dissmisable_pokemon_card_background.dart';
import 'package:pokeapp/utils/strings.dart';

import '../../models/pokemon.dart';
import '../../models/pokemon_states.dart';
import '../../providers/favourite_pokemons.dart';

class PokemonCard extends ConsumerStatefulWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.index,
    required this.mainAxisFlow,
  });

  final Pokemon pokemon;
  final int index;
  final Axis mainAxisFlow;
  
  @override
  ConsumerState<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends ConsumerState<PokemonCard> {
  
  PokemonState currentState = PokemonState.normal;

  void showSnackBar(BuildContext context, PokemonState state) {
    final article = state.name.startsWith(RegExp("(a|e|i|o|u)")) ? "an" : "a";
    final snackBar = SnackBar(
      content: Text(
        '${widget.pokemon.name} does not have $article ${state.name} version!',
      ),
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

  void _handleCardTap() {
    updateCurrentPokemonState(PokemonState.shiny);
  }

  void _handleDismissed(DismissDirection direction) {
    ref.read(favouritePokemonsProvider.notifier).delete(widget.index);
  }

  void _handleMoveUp() {
    ref.read(favouritePokemonsProvider.notifier).move(widget.index, MoveDirection.up);
  }

  void _handleMoveDown() {
    ref.read(favouritePokemonsProvider.notifier).move(widget.index, MoveDirection.down);
  }

  Icon _leadingArrowIcon() {
    return Icon(
      widget.mainAxisFlow == Axis.horizontal
          ? Icons.arrow_back
          : Icons.arrow_upward,
    );
  }

  Icon _trailingArrowIcon() {
    return Icon(
      widget.mainAxisFlow == Axis.horizontal
          ? Icons.arrow_forward
          : Icons.arrow_downward,
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Flex(
      direction: widget.mainAxisFlow,
      spacing: 10,
      children: [
        ElevatedButton(onPressed: _handleMoveUp, child: _leadingArrowIcon()),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.4,
          ),
          child: Text(
            kebabCaseToPrintable(widget.pokemon.name),
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        ElevatedButton(onPressed: _handleMoveDown, child: _trailingArrowIcon()),
      ],
    );
  }

  Widget _buildImage(String pokemonImagePath) {
    return SizedBox(
      height: 162,
      width: 162,
      child: Image.network(
        pokemonImagePath,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, object, s) {
          return Placeholder(); // Cambiar error image
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String pokemonImagePath = widget.pokemon.image(state: currentState);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Dismissible(
        key: Key("dismissible-pokemon-${widget.pokemon.id.toString()}"),
        onDismissed: _handleDismissed,
        background: DismissablePokemonCardBackground(),
        secondaryBackground: DismissablePokemonCardBackground(
          alignment: Alignment.centerRight,
        ),
        child: GestureDetector(
          onTap: _handleCardTap,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: widget.pokemon.themeColor(context),
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
                direction: widget.mainAxisFlow == Axis.horizontal
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildHeader(context),
                  _buildImage(pokemonImagePath),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
