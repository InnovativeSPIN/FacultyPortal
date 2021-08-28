import 'package:flutter/material.dart';

class login_Screen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/clg_logo.png',
                    height: 100,
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    child: Text_Method(
                        "NADAR SARASWATHI", 32, 0xffA9302F, TextAlign.center)),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text_Method("COLLEGE OF ENGINEERING AND TECHNOLOGY",
                        22, 0XFFA08200, TextAlign.center)),
              ],
            ),
          ),
          Container(
              child: Text_Method("Signin", 26, 0xff104565, TextAlign.center)),
          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              child: Container(
                child: TextField(
                  onChanged: (text) {
                    print('username field: $text');
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "FACULTY ID",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        //color: Color(0xffa08200),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide.none,
                      )),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Container(
              child: Container(
                child: TextField(
                  onChanged: (text) {
                    print('password field: $text');
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "PASSWORD",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(
                        fontFamily: "Times New Roman",
                        //color: Color(0xffa08200),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide.none,
                      )),
                ),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //button
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(3.0))),

              backgroundColor: const Color(0xffA9302F),
              foregroundColor: Colors.white,
              onPressed: () {
                // Respond to button press
              },
              // icon: Icon(Icons.add),
              label: Text_Method("LOGIN", 17, 0xffffffff, TextAlign.center),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      child: Text_Method(
                          "Forgot password ?", 16, 0xffA9302F, TextAlign.left),
                      onPressed: () {},
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 0),
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    child: Text_Method(
                        "Create New Account", 16, 0xffA9302F, TextAlign.left),
                    onPressed: () {},
                  ),
                ),
             /*   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment(0.0, 1.0),
                      child: Text_Method(
                          "Designed and Developed by iSPIN, Computer Science Department, NSCET",
                          14,
                          0xff4C4C4C,
                          TextAlign.center),
                    ),
                  ],
                ) */
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text Text_Method(String text, double font_size, color, align) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Times New Roman',
        fontSize: font_size,
        color: Color(color),
      ),
      textAlign: align,
    );
  }
}
