import 'package:flutter/material.dart';

import 'package:weather_app/screens/home.dart';
import 'package:weather_app/screens/landingScreen.dart';
import 'package:weather_app/screens/signin.dart';
import 'package:weather_app/screens/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
      routes: {
        //'/home': (context) => const HomeScreen(),
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}
