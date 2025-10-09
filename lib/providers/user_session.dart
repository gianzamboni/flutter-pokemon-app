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
bool userIsAuthenticated(Ref ref) {
  final userSession = ref.watch(userSessionProvider).value;
  return userSession != null;
}
