import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/move_direction.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/services/pokemon_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_pokemons.g.dart';

List<int> pokemonIds = [4, 134, 151, 153, 576, 107, 108, 158, 201, 392];

@riverpod
class FavouritePokemonsNotifier extends _$FavouritePokemonsNotifier {
  @override
  Future<List<Pokemon>> build() async {
    final response = await PokemonService.getPokemons(pokemonIds);
    return response;
  }

  Future<void> refresh(WidgetRef ref) async {
    state = state.hasError ? const AsyncLoading() : state;
    final response = await PokemonService.getPokemons(pokemonIds);
    state = AsyncData(response);  
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
