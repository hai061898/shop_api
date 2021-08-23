import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/pages/home/home_screen.dart';
import 'package:shop/pages/splash/slash_screen.dart';

import 'controllers/auth_controller.dart';


AuthController authController = AuthController();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Obx(
        () {
          if (authController.authenicated.value)
            return HomeScreen();
          else
            return SplashScreen();
        },
      ),
    );
  }
}