import 'package:pokeapp/models/user_session.dart';
import 'package:pokeapp/providers/services.dart';
import 'package:pokeapp/services/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_session.g.dart';

@riverpod
class UserSessionNotifier extends _$UserSessionNotifier {
  late LocalStorageService _localStorageService;

  @override
  Future<UserSession?> build() async {
    _localStorageService = ref.read(servicesProvider).localStorageService;
    final userSession = await _localStorageService.getUserSession();
    return userSession;
  }

  void setUserSession(UserSession? userSession) async {
    if (userSession != null) {
      _localStorageService.saveUserSession(userSession);
    }
    state = AsyncData(userSession);
  }

  void logout() {
    _localStorageService.clear();
    state = AsyncData(null);
  }

  String? getSessionToken() {
    return switch (state) {
      AsyncData(:final value) => value?.token,
      AsyncError() => null,
      AsyncLoading() => null,
    };
  }
}

@riverpod
UserSessionState userAuthState(Ref ref) {
  final userSession = ref.watch(userSessionProvider);
  return switch (userSession) {
    AsyncData(:final value) =>
      value != null
          ? UserSessionState.authenticated
          : UserSessionState.anonymous,
    AsyncError() => UserSessionState.error,
    AsyncLoading() => UserSessionState.loading,
  };
}
