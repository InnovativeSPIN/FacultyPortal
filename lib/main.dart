import 'package:demo/Navigation/sideBarNavi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: "opensans"),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            child: Center(
              child: loginpage(),
            ),
          ),
        ));
  }
}

class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  _loginpageState createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  double window_height = 0;
  double window_width = 0;

  var _bgcol = Colors.white;
  var _concol = Color(0xFFB104565);
  var _headcol = Color(0xFFBA08200);

  double _login_width = 0;
  double _loginYoffset = 0;
  double _loginXoffset = 0;
  double _registeryoffset = 0;
  double _login_opacity = 1;
  double _hmart = 100;
  int _state = 0;
  var _welcol = Color(0xFFB104565);

  @override
  Widget build(BuildContext context) {
    window_height = MediaQuery.of(context).size.height;
    window_width = MediaQuery.of(context).size.width;

    switch (_state) {
      case 0:
        _bgcol = Colors.white;
        _headcol = Color(0xFFBFF834E);
        _welcol = Color(0xFFB104565);
        _concol = Color(0xFFB104565);
        _loginYoffset = window_height;
        _loginXoffset = 0;
        _login_width = window_width;
        _registeryoffset = window_height;
        _login_opacity = 1;
        _hmart = 100;

        break;
      case 1:
        _bgcol = Color(0xFFB104565);
        _headcol = Color(0xFFBA08200);
        _welcol = Colors.white;
        _concol = Colors.white;
        _login_width = window_width;
        _loginYoffset = 270;
        _loginXoffset = 0;
        _registeryoffset = window_height;
        _login_opacity = 1;
        _hmart = 100;
        break;
      case 2:
        _bgcol = Color(0xFFB104565);
        _headcol = Color(0xFFBA08200);
        _welcol = Colors.white;
        _concol = Colors.white;
        _login_width = window_width - 40;
        _loginYoffset = 250;
        _loginXoffset = 20;
        _registeryoffset = 270;
        _login_opacity = 0.7;
        _hmart = 80;
        break;
    }

    return Stack(
      children: <Widget>[
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          color: _bgcol,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    _state = 0;
                  });
                },
                child: Container(
                  child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 1000),
                        margin: EdgeInsets.only(top: _hmart),
                        child: Text(
                          "Welcome to",
                          style: TextStyle(color: _welcol, fontSize: 20),
                        ),
                      ),
                      Text(
                        "NSCET CONNECT",
                        style: TextStyle(color: _headcol, fontSize: 24),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                            "A Cross platform Communication application developed by inhouse nscet developers",
                            style: TextStyle(color: _concol, fontSize: 14),
                            textAlign: TextAlign.center),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(child: Image.asset("assets/images/clg_logo.png")),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_state != 0) {
                        _state = 0;
                      } else {
                        _state = 1;
                      }
                    });
                  },
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFB104565),
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                        "Get Started",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ))),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _state = 2;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _login_width,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform:
                Matrix4.translationValues(_loginXoffset, _loginYoffset, 1),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(_login_opacity),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: <Widget>[
                Primary_Button(
                  btnText: "Login",
                  
                ),
                SizedBox( height: 20),
                OutlineBtn(btnText: "Create a New Accouunt")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _state = 2;
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1000),
            transform: Matrix4.translationValues(0, _registeryoffset, 1),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: [
                Primary_Button(
                  btnText: "Register",
                ),
                SizedBox( height: 20),
                OutlineBtn(btnText: "Back to login")
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Primary_Button extends StatefulWidget {
  final String btnText;
  Primary_Button({required this.btnText});

  @override
  _Primary_ButtonState createState() => _Primary_ButtonState();
}

class _Primary_ButtonState extends State<Primary_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0xFFB104565), borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(widget.btnText,
              style: TextStyle(color: Colors.white, fontSize: 16)),
        ));
  }
}

class OutlineBtn extends StatefulWidget {
  final String btnText;
  OutlineBtn({required this.btnText});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFB104565),
            width: 2,
          ),
           
          borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(widget.btnText,
              style: TextStyle(color: Color(0xFFB104565), fontSize: 16)),
        ));
      
    
  }
}