import 'package:pokeapp/providers/services.dart';
import 'package:pokeapp/services/auth_service.dart';
import 'package:pokeapp/services/favrourite_pokemon_service.dart';
import 'package:pokeapp/services/local_storage_service.dart';
import 'package:pokeapp/services/pokemon_service.dart';

class ServiceManagerTest extends ServiceManager {
  ServiceManagerTest({
    super.authService = const AuthService(),
    super.favouritePokemonService = const FavouritePokemonService(),
    super.localStorageService = const LocalStorageService(),
    super.pokemonService = const PokemonService(),
  });
}
