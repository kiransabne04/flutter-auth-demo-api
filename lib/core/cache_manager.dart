import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  final authBox = GetStorage('AuthBox');
  Future<bool> saveToken(String? token) async {
    await authBox.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    return authBox.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    await authBox.remove(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN }
