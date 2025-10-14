// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_pokemons.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FavouritePokemonsNotifier)
const favouritePokemonsProvider = FavouritePokemonsNotifierProvider._();

final class FavouritePokemonsNotifierProvider
    extends $AsyncNotifierProvider<FavouritePokemonsNotifier, List<Pokemon>> {
  const FavouritePokemonsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'favouritePokemonsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$favouritePokemonsNotifierHash();

  @$internal
  @override
  FavouritePokemonsNotifier create() => FavouritePokemonsNotifier();
}

String _$favouritePokemonsNotifierHash() =>
    r'6ca4449ab5d581f054ace644936efced538872bb';

abstract class _$FavouritePokemonsNotifier
    extends $AsyncNotifier<List<Pokemon>> {
  FutureOr<List<Pokemon>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Pokemon>>, List<Pokemon>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Pokemon>>, List<Pokemon>>,
              AsyncValue<List<Pokemon>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(pokemonListHasError)
const pokemonListHasErrorProvider = PokemonListHasErrorProvider._();

final class PokemonListHasErrorProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const PokemonListHasErrorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pokemonListHasErrorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pokemonListHasErrorHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return pokemonListHasError(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$pokemonListHasErrorHash() =>
    r'b034d35cea25271ce9d97493d97f7f85476c201e';
