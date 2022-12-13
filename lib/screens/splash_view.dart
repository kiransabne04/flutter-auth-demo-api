import 'package:auth_demo/core/authentication_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'onboard_view.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final AuthenticationManager _authenticationManager =
      Get.put(AuthenticationManager());

  Future<void> initializeSettings() async {
    _authenticationManager.checkLoginStatus();

    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initializeSettings(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingView();
        } else {
          if (snapshot.hasError)
            return errorView(snapshot);
          else
            return OnBoard();
        }
      },
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(
      body: Center(
        child: Text('Error: ${snapshot.error}'),
      ),
    );
  }

  Scaffold waitingView() {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: CircularProgressIndicator(),
            ),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
