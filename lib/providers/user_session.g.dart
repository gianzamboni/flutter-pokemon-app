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
    r'474b20284b04dc3065c76cd08d35052bf0119149';

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

@ProviderFor(userAuthState)
const userAuthStateProvider = UserAuthStateProvider._();

final class UserAuthStateProvider
    extends
        $FunctionalProvider<
          UserSessionState,
          UserSessionState,
          UserSessionState
        >
    with $Provider<UserSessionState> {
  const UserAuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userAuthStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userAuthStateHash();

  @$internal
  @override
  $ProviderElement<UserSessionState> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserSessionState create(Ref ref) {
    return userAuthState(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSessionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSessionState>(value),
    );
  }
}

String _$userAuthStateHash() => r'94e94f3d844e0fbe600dfd728cd314c865ff9351';
