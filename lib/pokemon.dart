import 'dart:ui';

enum PokemonTypes {
  fire,
  water,
  psychic,
  plant,
  fight,
  normal
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
        PokemonTypes.psychic => Color(0xffffb5c5),
        PokemonTypes.plant => Color(0xff99ff66),
        PokemonTypes.fight => Color(0xffff6a6a),
        PokemonTypes.normal => Color(0xffddccaa)
      };
    } else {
      color = switch(type) {
        PokemonTypes.fire =>Color(0xff933e00),
        PokemonTypes.water => Color(0xff32617a),
        PokemonTypes.psychic => Color(0xff834454),
        PokemonTypes.plant => Color(0xff236e00),
        PokemonTypes.fight => Color(0xff9e001b),
        PokemonTypes.normal => Color(0xff68593a)
      };
    }

    return color;
  }
}
