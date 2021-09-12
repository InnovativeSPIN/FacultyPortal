import 'package:flutter/material.dart';
import 'package:demo/Authentication/Signup.dart';
import 'package:demo/Authentication/Forgotpwd.dart';

import 'package:demo/Utils.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: const Signin(),
      ),
    );
  }
}

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

//Widget testWidget = new MediaQuery(
//    data: new MediaQueryData(), child: new MaterialApp(home: new Signin()));

class _SigninState extends State<Signin> {
  String _facultyID = "";

  String _Password = "";

  String value = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final facultyidController = TextEditingController();
  final passwordController = TextEditingController();

  void loigncall() {
    if (passwordController.text != "") {
      postfetch('http://http://127.0.0.1:8000/', <String, String>{
        "facultyId":
            facultyidController.text, // declared as dictionary key:value
        "password": passwordController.text //variable
      }).then((res) => {
            if (res.statusCode == 200)
              {
                print(res.body),
                ScaffoldMessenger.of(context)
                    .showSnackBar(getSnackBar("Feedback Sent !"))
              }
            else
              {
                ScaffoldMessenger.of(context)
                    .showSnackBar(getSnackBar("Server Problem"))
              }
          });
      FocusScope.of(context).unfocus();
      facultyidController.clear();
      passwordController.clear();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(getSnackBar("Check the input"));
    }
  }

  Widget _buildFacultyID() {
    return Container(
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Faculty ID",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                fontFamily: "Times New Roman",
                //color: Color(0xffa08200),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none,
              )),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
          },
          controller: facultyidController,
        ),
        decoration: Decor());
  }

  Widget _buildPassword() {
    return Container(
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelStyle: TextStyle(
                fontFamily: "Times New Roman",
                //color: Color(0xffa08200),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide.none,
              )),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
          },
          controller: passwordController,
        ),
        decoration: Decor());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.fromLTRB(10, 50, 0, 5),
                      child: Image.asset(
                        'assets/images/clg_logo.png',
                        height: 100,
                      )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        child: Text_Method("NADAR SARASWATHI", 30, 0xff094167,
                            TextAlign.center),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        child: Text_Method(
                            "COLLEGE OF ENGINEERING AND TECHNOLOGY",
                            22,
                            0xffA08200,
                            TextAlign.center),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                        child: Text_Method(
                            "Sign in", 26, 0xffA9302F, TextAlign.center),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildFacultyID(),
                  SizedBox(height: 20),
                  _buildPassword(),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffB0403F),
                        // background
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          loigncall();
                        }
                      },
                      child: Text_Method(
                          "Signin", 20, 0xffffffff, TextAlign.center)),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      child: Text_Method(
                          "Forgot Password ?", 20, 0xffA9302F, TextAlign.left),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forgotpassword()),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      child: Text_Method(
                          "Create New Account", 20, 0xffA9302F, TextAlign.left),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
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

BoxDecoration Decor() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color(0x29000000),
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );
}
