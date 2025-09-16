import 'dart:ui';

enum PokemonTypes {
  fire(color: Color(0xffff7f00)),
  water(color: Color(0xffff7f00)),
  psychic(color: Color(0xffff7f00));

  final Color color;

  const PokemonTypes({
    required this.color
  });
}

class Pokemon {

  String name;
  PokemonTypes type; 
  Pokemon(this.name, this.type);

  String get capitalizedName {
    return "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
  }

  String get image {
    return "assets/img/${name.toLowerCase()}.png";
  }

  Color typeColor(Brightness theme) {
    final useLightColors = theme == Brightness.light;
    final Color color;

    if(useLightColors) {
      color = switch(type) {
        PokemonTypes.fire =>Color(0xffff7f00),
        PokemonTypes.water => Color(0xffb0e2ff),
        PokemonTypes.psychic => Color(0xffffb5c5)
      };
    } else {
      color = switch(type) {
        PokemonTypes.fire =>Color(0xff933e00),
        PokemonTypes.water => Color(0xff32617a),
        PokemonTypes.psychic => Color(0xff834454)
      };
    }

    return color;
  }
}
