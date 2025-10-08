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
    extends $NotifierProvider<UserSessionNotifier, UserSession?> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSession? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSession?>(value),
    );
  }
}

String _$userSessionNotifierHash() =>
    r'16ca0b3035741c9cb5588cabadeed6616b5ced4d';

abstract class _$UserSessionNotifier extends $Notifier<UserSession?> {
  UserSession? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserSession?, UserSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSession?, UserSession?>,
              UserSession?,
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
    r'ac0a61e2851b3719365cf14e858913306e6ed692';
