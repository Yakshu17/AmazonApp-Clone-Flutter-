import 'dart:async';

import 'package:amazon_clone/Screens/LoginScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>const LoginScreen(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/amazon_logo.png',
                fit: BoxFit.fitWidth,

              ),
            )
          ],
        ),

      ),
    );
  }
}
