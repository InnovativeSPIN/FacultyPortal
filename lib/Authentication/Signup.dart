import 'package:flutter/material.dart';
import 'package:demo/Utils.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        body: const SignUp(),
      ),
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

//Widget testWidget = new MediaQuery(
//    data: new MediaQueryData(), child: new MaterialApp(home: new SignUp()));

class _SignUpState extends State<SignUp> {
  final departmentController = TextEditingController();
  final EmailController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final facultyidController = TextEditingController();
  final passwordController = TextEditingController();

  // String value = "";

  String _ConfirmPassword = "";

  String _Department = "";
  String _EmailID = "";
  String _Password = "";
  String _facultyID = "";
  final _formKey = GlobalKey<FormState>();

  var department = [
    "cse",
    "CSE",
    "mech",
    "MECH",
    "CIVIL",
    "civil",
    "eee",
    "EEE",
    "ece",
    "ECE",
    "S&H",
    "s&h"
  ];

  void signupcall() {
    if (passwordController.text != "") {
      postfetch('http://http://127.0.0.1:8000/', <String, String>{
        "facultyId":
            facultyidController.text, // declared as dictionary key:value
        "password": passwordController.text, //variable
        "department": departmentController.text,
        "email": EmailController.text
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
      EmailController.clear();
      departmentController.clear();
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
              return 'Enter your fricking faculty ID';
            }
          },
          controller: facultyidController,
        ),
        decoration: Decor());
  }

  Widget _buildEmailID() {
    return Container(
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Email ID",
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
            if (value == null || value.isValidEmail) {
              return 'Please enter email';
            }
          },
          controller: EmailController,
        ),
        decoration: Decor());
  }

  Widget _buildDepartment() {
    return Container(
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Department",
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
            if (department.contains(departmentController.text)) {
              
            } else {
              return 'Enter valid department (cse,mech,ece,civil,eee)';
            }
          },
          controller: departmentController,
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

  Widget _buildConfirmPassword() {
    return Container(
        child: TextFormField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: "Confirm Password",
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
            if (value != passwordController.text) {
              return 'password not matching';
            }
          },
          controller: confirmpasswordController,
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
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.fromLTRB(10, 50, 0, 5),
                      child: Text_Method(
                        "Create",
                        32,
                        0xffA9302F,
                      )),
                  Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text_Method(
                        "New Account",
                        32,
                        0XFFA08200,
                      )),
                  SizedBox(height: 30),
                  _buildFacultyID(),
                  SizedBox(height: 20),
                  _buildEmailID(),
                  SizedBox(height: 20),
                  _buildDepartment(),
                  SizedBox(height: 20),
                  _buildPassword(),
                  SizedBox(height: 20),
                  _buildConfirmPassword(),
                  SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffB0403F),
                        // background
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          signupcall();
                        }
                      },
                      child: Text_Method("Signup", 20, 0xffffffff))
                ],
              )),
        ),
      ),
    );
  }
}

Text Text_Method(
  String text,
  double font_size,
  color,
) {
  return Text(
    text,
    style: TextStyle(
      fontFamily: 'Times New Roman',
      fontSize: font_size,
      color: Color(color),
    ),
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

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
