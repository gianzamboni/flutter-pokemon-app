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
    extends $NotifierProvider<FavouritePokemonsNotifier, List<Pokemon>> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Pokemon> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Pokemon>>(value),
    );
  }
}

String _$favouritePokemonsNotifierHash() =>
    r'5579c7e15e8f37d827286bb8decb0bc2e2b4a903';

abstract class _$FavouritePokemonsNotifier extends $Notifier<List<Pokemon>> {
  List<Pokemon> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<Pokemon>, List<Pokemon>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Pokemon>, List<Pokemon>>,
              List<Pokemon>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
