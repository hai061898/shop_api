import 'package:flutter/material.dart';
import 'package:shop/pages/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => OnboardingScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://media.discordapp.net/attachments/710868691574587452/878464163142307880/unknown.png"),
                ),
                
              ),
            ),
            SizedBox(height: 64),
            Text(
              "Shop Online",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}