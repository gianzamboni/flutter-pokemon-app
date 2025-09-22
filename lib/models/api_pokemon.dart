class ApiPokemon {
  final String name;
  final String url;

  ApiPokemon({ required this.name, required this.url });

  String get printableName {
    return "${name[0].toUpperCase()}${name.substring(1).toLowerCase().replaceAll("-", " ")}";
  }

  factory ApiPokemon.fromJson(Map<String, dynamic> json) {
    return ApiPokemon(name: json["name"], url: json["url"]);
  }
}