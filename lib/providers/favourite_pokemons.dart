import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp/models/move_direction.dart';
import 'package:pokeapp/models/pokemon.dart';
import 'package:pokeapp/providers/services.dart';
import 'package:pokeapp/providers/user_session.dart';
import 'package:pokeapp/services/favrourite_pokemon_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favourite_pokemons.g.dart';

@riverpod
class FavouritePokemonsNotifier extends _$FavouritePokemonsNotifier {
  late FavouritePokemonService _favouritePokemonService;

  @override
  Future<List<Pokemon>> build() async {
    _favouritePokemonService = ref
        .read(servicesProvider)
        .favouritePokemonService;
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
      return await _favouritePokemonService.getFavouritePokemons(token);
    }
  }

  Future<void> add(BasicPokemon pokemon) async {
    if (state.isLoading || state.hasError) return;
    final token = ref.read(userSessionProvider.notifier).getSessionToken();
    if (token == null) return;

    final response = await _favouritePokemonService.addFavouritePokemon(
      token,
      pokemon.id,
    );
    state = AsyncData([...state.value!, response]);
  }

  Future<void> move(int index, MoveDirection direction) async {
    if (state.isLoading || state.hasError) return;

    if (index < 0 && direction == MoveDirection.up) return;
    if (index >= (state.value!.length) && direction == MoveDirection.down)
      return;

    List<Pokemon> newList = state.value!.toList();

    final index2 = direction == MoveDirection.up ? index - 1 : index + 1;

    final token = ref.read(userSessionProvider.notifier).getSessionToken();
    if (token == null) return;

    final rankingNumber1 = newList[index].rankingNumber;
    final rankingNumber2 = newList[index2].rankingNumber;

    final modifiedPokemons = await _favouritePokemonService
        .swapFavouritePokemons(token, rankingNumber1, rankingNumber2);

    print(modifiedPokemons);
    newList[index] = modifiedPokemons[0];
    newList[index2] = modifiedPokemons[1];

    state = AsyncData(newList);
  }

  Future<void> delete(int index) async {
    if (state.isLoading || state.hasError) return;

    final token = ref.read(userSessionProvider.notifier).getSessionToken();
    if (token == null) return;

    await _favouritePokemonService.deleteFavouritePokemon(
      token,
      state.value![index].id,
    );

    final newList = state.value!.toList();
    newList.removeAt(index);
    state = AsyncData(newList);
  }
}

@riverpod
bool pokemonListHasError(Ref ref) {
  return ref.watch(favouritePokemonsProvider).hasError;
}
