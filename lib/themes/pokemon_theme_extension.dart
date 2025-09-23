import 'package:flutter/material.dart';

@immutable
class PokemonColors extends ThemeExtension<PokemonColors> {

  final Color fire;
  final Color water;
  final Color plant;
  final Color psychic;
  final Color fight;
  final Color normal;

  const PokemonColors({
    required this.fire,
    required this.water,
    required this.plant,
    required this.psychic,
    required this.fight,
    required this.normal,
  });

  @override
  PokemonColors copyWith({
    Color? fire,
    Color? water,
    Color? plant,
    Color? psychic,
    Color? fight,
    Color? normal,
  }) {
    return PokemonColors(
      fire: fire ?? this.fire,
      water: water ?? this.water,
      plant: plant ?? this.plant,
      psychic: psychic ?? this.psychic,
      fight: fight ?? this.fight,
      normal: normal ?? this.normal,
    );
  }

  @override
  PokemonColors lerp(ThemeExtension<PokemonColors>? other, double t) {
    if (other is! PokemonColors) {
      return this;
    }
    return PokemonColors(
      fire: Color.lerp(fire, other.fire, t) ?? fire,
      water: Color.lerp(water, other.water, t) ?? water,
      plant: Color.lerp(plant, other.plant, t) ?? plant,
      psychic: Color.lerp(psychic, other.psychic, t) ?? psychic,
      fight: Color.lerp(fight, other.fight, t) ?? fight,
      normal: Color.lerp(normal, other.normal, t) ?? normal,
    );
  }

  @override
  String toString() => 'PokemonColors(fire: $fire, water: $water, plant: $plant, psychic: $psychic, fight: $fight, normal: $normal)';
}