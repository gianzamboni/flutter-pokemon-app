import 'package:pokeapp/models/user_session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_session.g.dart';

@riverpod
class UserSessionNotifier extends _$UserSessionNotifier {
  @override
  UserSession? build() {
    return null;
  }


  void setUserSession(UserSession userSession) {
    print('setUserSession: ${userSession.toString()}');
    state = userSession;
  }
}

@riverpod
bool userIsAuthenticated(Ref ref) {
  final userSession = ref.watch(userSessionProvider);
  return userSession != null;
}
