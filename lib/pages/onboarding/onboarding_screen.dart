import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:shop/pages/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
        finishCallback: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: Colors.black,
        imageAssetPath: 'assets/1.png',
        title: 'Shop online',
        body: 'Online Shop',
        doAnimateImage: true),
    PageModel(
        color: Colors.blue,
        imageAssetPath: 'assets/2.png',
        title: 'Shop online',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: Colors.green,
        imageAssetPath: 'assets/3.png',
        title: 'Shop online',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
  ];
}