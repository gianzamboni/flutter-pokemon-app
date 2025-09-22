enum PokemonState {
  normal,
  shiny,
  evolved;

  String imagePath(String pokemonName) {
    return switch(this) {
      PokemonState.normal => "assets/img/${pokemonName.toLowerCase()}.png",
      PokemonState.shiny => "assets/img/${pokemonName.toLowerCase()}-shiny.png",
      PokemonState.evolved => "assets/img/${pokemonName.toLowerCase()}-evolution.png",
    };
  }
}