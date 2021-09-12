import 'dart:io';

import 'package:demo/AboutPage/AboutPage.dart';
import 'package:demo/Authentication/Login.dart';
import 'package:demo/Authentication/Authotp.dart';
import 'package:demo/HomePage/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


void main() {
  runApp(AppNavigation());
}

class AppNavigation extends StatelessWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        //'/':(context) => HomePage(),
        "/":(context) => Signin(),
        //"/register":(context) => RegisterScreen(),
        '/about':(context) => AboutPage(),
        
      },
    );
  }
}
  

// temporary home page 


