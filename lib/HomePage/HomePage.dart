import 'package:demo/Navigation/sideBarNavi.dart';
import 'package:demo/Utils.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, "NSCET E-CONNECT"),
      drawer: SidebarNav(),
      body: Center(
        child:Image(image: AssetImage('assets/images/iSPIN_logo.png'), width: 320)
      ),
    );
  }
}
