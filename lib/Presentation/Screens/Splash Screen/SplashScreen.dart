import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iti_flutter/Presentation/Screens/Authentication/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    // the time the screen will stay
    Future.delayed(
      const Duration(seconds: 2),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Loginscreen(),
          ),
         // for more smoothing will learn it later ???????

         //PageRouteBuilder( pageBuilder: (context, animation, secondaryAnimation) => Loginscreen(),
         //  transitionsBuilder: (context, animation, secondaryAnimation, child)
         //  { final offsetAnimation = Tween<Offset>( begin: const Offset(0, 0.2), end: Offset.zero, ).animate(animation);
         //    return FadeTransition( opacity: animation, child: SlideTransition( position: offsetAnimation, child: child, ), ); },
         //  transitionDuration: const Duration( milliseconds: 800, ), ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Text(
          "Trabezza",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}