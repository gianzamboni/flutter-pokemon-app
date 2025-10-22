import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pokeapp/models/user_session.dart';

class LocalStorageService {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  const LocalStorageService();

  Future<void> saveUserSession(UserSession userSession) async {
    await _storage.write(key: 'userSession', value: userSession.toJson());
  }

  Future<UserSession?> getUserSession() async {
    final userSessionJsonString = await _storage.read(key: 'userSession');
    return userSessionJsonString != null
        ? UserSession.fromJson(userSessionJsonString)
        : null;
  }

  Future<void> clear() async {
    await _storage.delete(key: 'userSession');
  }
}
