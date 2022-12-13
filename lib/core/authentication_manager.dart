import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import './cache_manager.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLoggedIn = false.obs;

  void logOut() {
    isLoggedIn.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLoggedIn.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    // check token expiry
    if (token != null) {
      isLoggedIn.value = true;
    }
  }
}
