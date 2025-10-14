import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/move_direction.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/providers/user_session.dart';
import 'package:pokeapp/services/pokemon_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_pokemons.g.dart';

@riverpod
class FavouritePokemonsNotifier extends _$FavouritePokemonsNotifier {

  @override
  Future<List<Pokemon>> build() async {
    return await _getFavouritePokemons();
  }

  Future<void> refresh(WidgetRef ref) async {
    state = state.hasError ? const AsyncLoading() : state;
    final response = await _getFavouritePokemons();
    state = AsyncData(response);  
  }

  Future<List<Pokemon>> _getFavouritePokemons() async {
    final token = ref.read(userSessionProvider.notifier).getSessionToken();
    if (token == null) {
      return [];
    } else {
      return await PokemonService.getFavouritePokemons(token);
    }
  }

  void move(int index, MoveDirection direction) {
    if (state.isLoading || state.hasError) return;

    List<Pokemon> newList = state.value!.toList();

    if (direction == MoveDirection.up && index > 0) {
      var temp = newList[index - 1];
      newList[index - 1] = newList[index];
      newList[index] = temp;
    } else if (direction == MoveDirection.down && index < newList.length - 1) {
      var temp = newList[index + 1];
      newList[index + 1] = newList[index];
      newList[index] = temp;
    }
    
    state = AsyncData(newList);
  }
}

@riverpod
bool pokemonListHasError(Ref ref) {
  return ref.watch(favouritePokemonsProvider).hasError;
}
