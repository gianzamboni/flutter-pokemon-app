import 'package:flutter/cupertino.dart';
import 'package:pokeapp/services/auth_service.dart';
import 'package:pokeapp/services/favrourite_pokemon_service.dart';
import 'package:pokeapp/services/local_storage_service.dart';
import 'package:pokeapp/services/pokemon_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'services.g.dart';

class ServiceManager {
  AuthService authService;
  FavouritePokemonService favouritePokemonService;
  LocalStorageService localStorageService;
  PokemonService pokemonService;

  ServiceManager({
    required this.authService,
    required this.favouritePokemonService,
    required this.localStorageService,
    required this.pokemonService,
  });

  factory ServiceManager.withDefaults() {
    return ServiceManager(
      authService: AuthService(),
      favouritePokemonService: FavouritePokemonService(),
      localStorageService: LocalStorageService(),
      pokemonService: PokemonService(),
    );
  }
}

@riverpod
ServiceManager services(Ref ref) {
  return ServiceManager.withDefaults();
}
