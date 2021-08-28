import 'package:demo/Navigation/sideBarNavi.dart';
import 'package:demo/signupin/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Splashscreen(duration: 5, goToPage: HomePage())));
}
/* splash screen */
class Splashscreen extends StatelessWidget {
  int duration = 0;
  Widget goToPage;

  Splashscreen({required this.goToPage, required this.duration});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => this.goToPage));
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/SPLASH_LOGO.png", height: 300.0),
          SizedBox(height: 30.0),
          SpinKitChasingDots(
            color: Color(0xFFB104565),
          )
        ],
      ),
    );
  }
}

// temporary home page 


