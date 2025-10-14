import 'package:flutter/material.dart';
import 'package:pokeapp/models/pokemon_types.dart';

@immutable
class PokemonColors extends ThemeExtension<PokemonColors> {
  // Immutable map of colors keyed by PokemonTypes
  final Map<PokemonTypes, Color?> _colors;

  const PokemonColors({
    required Map<PokemonTypes, Color?> colors,
  }) : _colors = colors;

  // Convenience getter
  Color? operator [](PokemonTypes type) => _colors[type];
  Map<PokemonTypes, Color?> get asMap => Map.unmodifiable(_colors);

  @override
  PokemonColors copyWith({Map<PokemonTypes, Color?>? overrides}) {
    if (overrides == null || overrides.isEmpty) return this;
    final merged = Map<PokemonTypes, Color?>.from(_colors)..addAll(overrides);
    return PokemonColors(colors: merged);
  }

  @override
  PokemonColors lerp(ThemeExtension<PokemonColors>? other, double t) {
    if (other is! PokemonColors) {
      return this;
    }
    
    final Map<PokemonTypes, Color?> lerped = {};
    for (final type in PokemonTypes.values) {
      final thisColor = _colors[type];
      final otherColor = other._colors[type];
      final lerpedColor = Color.lerp(thisColor, otherColor, t);

      if(thisColor == null) {
        lerped[type] = otherColor;
      } else if (otherColor == null) {
        lerped[type] = thisColor;
      } else {
        lerped[type] = lerpedColor;
      }   
    }
    return PokemonColors(colors: lerped);
  }

  @override
  String toString() =>
      'PokemonColors(colors: $_colors)';
}

extension PokemonTypesTheme on PokemonTypes {
  Color? themeColor(BuildContext context) {
    final pokemonColors = Theme.of(context).extension<PokemonColors>();
    return pokemonColors?[this];
  }
}