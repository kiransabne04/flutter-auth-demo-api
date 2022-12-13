import 'package:auth_demo/core/authentication_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  AuthenticationManager _authenticationManager = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
      ),
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
