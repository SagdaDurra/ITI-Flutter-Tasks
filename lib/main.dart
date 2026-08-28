import 'package:flutter/material.dart';
import 'package:iti_flutter/Presentation/Screens/Authentication/LoginScreen.dart';
import 'package:iti_flutter/Presentation/Screens/Home/HomeScreen.dart';
import 'package:iti_flutter/Presentation/Screens/Splash%20Screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Try',

      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),

      //

      // the first page that will be shown
      home: SplashScreen(), // cause there is no parameter like home page , i write bc
      // home page needed a parameter
    );
  }
}

