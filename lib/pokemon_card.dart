import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemon
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: DecoratedBox(decoration: BoxDecoration(
        color: pokemon.typeColor(Theme.of(context).brightness),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(51), blurRadius: 10)
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(pokemon.capitalizedName, style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(
              height: 150,
              child: Image.asset(pokemon.image, fit: BoxFit.contain)
            )
          ],
        ),
      ),
      ),
    );
  }
}