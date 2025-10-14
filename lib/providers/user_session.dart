import 'package:pokeapp/models/user_session.dart';
import 'package:pokeapp/services/local_storage_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_session.g.dart';

@riverpod
class UserSessionNotifier extends _$UserSessionNotifier {
  @override
  Future<UserSession?> build() async {
    final userSession = await LocalStorageService.getUserSession();
    return userSession;
  }

  void setUserSession(UserSession? userSession) async {
    if(userSession != null) {
      LocalStorageService.saveUserSession(userSession);
    }
    state = AsyncData(userSession);
    }

  void logout() {
    LocalStorageService.clear();
    state = AsyncData(null);
  }
}

@riverpod
UserSessionState userAuthState(Ref ref) {
  final userSession = ref.watch(userSessionProvider);
  return switch (userSession) {
    AsyncData(:final value) => value != null ? UserSessionState.authenticated : UserSessionState.anonymous,
    AsyncError() => UserSessionState.error,
    AsyncLoading() => UserSessionState.loading,
  };
}
