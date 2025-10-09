// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserSessionNotifier)
const userSessionProvider = UserSessionNotifierProvider._();

final class UserSessionNotifierProvider
    extends $AsyncNotifierProvider<UserSessionNotifier, UserSession?> {
  const UserSessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSessionNotifierHash();

  @$internal
  @override
  UserSessionNotifier create() => UserSessionNotifier();
}

String _$userSessionNotifierHash() =>
    r'92343d089c76234b950850b593b4a72052639155';

abstract class _$UserSessionNotifier extends $AsyncNotifier<UserSession?> {
  FutureOr<UserSession?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<UserSession?>, UserSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserSession?>, UserSession?>,
              AsyncValue<UserSession?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(userIsAuthenticated)
const userIsAuthenticatedProvider = UserIsAuthenticatedProvider._();

final class UserIsAuthenticatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const UserIsAuthenticatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userIsAuthenticatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userIsAuthenticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return userIsAuthenticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$userIsAuthenticatedHash() =>
    r'7f69cd904d0f4f4ccb5e222e5aaad3a3e185401a';
