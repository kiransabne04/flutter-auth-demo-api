import 'package:auth_demo/modules/login/model/login_request_model.dart';
import 'package:auth_demo/modules/login/model/login_response_model.dart';
import 'package:auth_demo/modules/login/model/register_request_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../model/register_response_model.dart';

//login service responsible to communicate with web-server
// via authentication related apis
class LoginService extends GetConnect {
  final String loginUrl = 'https://reqres.in/api/login';
  final String registerUrl = 'https://reqres.in/api/register';

  Future<LoginResponseModel?> makeLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());
    print(response.body.toString());
    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> registerUser(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());
    print(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
