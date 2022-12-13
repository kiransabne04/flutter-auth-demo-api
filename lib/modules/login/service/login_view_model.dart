import '../../../core/authentication_manager.dart';
import '../model/login_request_model.dart';
import '../model/register_request_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './login_service.dart';

class LoginViewModel extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authenticationManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authenticationManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .makeLogin(LoginRequestModel(email: email, password: password));
    if (response != null) {
      //set isLogged to true;
      _authenticationManager.login(response.token);
    } else {
      // show usera dialog about the error response
      Get.defaultDialog(
        middleText: 'User not found!',
        textConfirm: 'ok',
        confirmTextColor: Colors.amber,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }

  Future<void> registerUser(String email, String password) async {
    final response = await _loginService
        .registerUser(RegisterRequestModel(email: email, password: password));
    if (response != null) {
      // set isLogin to true;
      _authenticationManager.login(response.token);
    } else {
      // show user a dialog for error response
      Get.defaultDialog(
        middleText: 'Register Error',
        textConfirm: 'Okay',
        confirmTextColor: Colors.amber,
        onConfirm: () {
          Get.back();
        },
      );
    }
  }
}
