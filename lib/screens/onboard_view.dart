import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/login/login_view.dart';
import '../core/authentication_manager.dart';
import './home_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authenticationManager = Get.find();

    return Obx(
      () {
        return _authenticationManager.isLoggedIn.value
            ? HomeView()
            : LoginView();
      },
    );
  }
}
