import 'dart:convert';
import 'package:demo/Utils.dart';
import 'package:demo/Navigation/sideBarNavi.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarNav(),
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Color.fromRGBO(27, 79, 109, 1),
      ),
      body: AppAboutPage(),
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
    );
  }
}

class AppAboutPage extends StatefulWidget {
  AppAboutPage({Key? key}) : super(key: key);

  @override
  _AppAboutPageState createState() => _AppAboutPageState();
}

class _AppAboutPageState extends State<AppAboutPage> {
  final messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text != "") {
      postfetch(
          'http://192.168.0.103:8000/api/faculty/user/feedback',
          <String, String>{
            "facultyId": "1",
            "message": messageController.text
          }).then((res) => {
            if (res.statusCode == 200){
              print(res.body),
              ScaffoldMessenger.of(context)
                  .showSnackBar(getSnackBar("Feedback Sent !"))
            } else {
                ScaffoldMessenger.of(context).showSnackBar(getSnackBar("Server Problem"))
              }
          });
      FocusScope.of(context).unfocus();
      messageController.clear();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(getSnackBar("Check the input"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(36, 36, 36, 10),
            child: Center(
              child: Text(
                "About The App",
                style: GoogleFonts.cambo(
                    fontSize: 32, color: Color.fromRGBO(27, 27, 27, 1)),
              ),
            )),
        Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 36, 30),
            child: Center(
                child: Text(
              "NSCET E-Connect was designed and developed by iSPIN team of Computer Science & Engineering department of Nadar Saraswathi College of Engineering and Technology for the communication and management purpose .",
              style: GoogleFonts.roboto(
                  fontSize: 18, color: Color.fromRGBO(56, 56, 56, 1)),
              textAlign: TextAlign.justify,
            ))),
        Container(
          child: Column(
            children: [
              Center(
                child: Text(
                  "CONTACT iSPIN TEAM",
                  style: GoogleFonts.adamina(
                      fontSize: 22, color: Color.fromRGBO(242, 129, 0, 1)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(16, 14, 16, 12),
                child: TextField(
                  decoration: const InputDecoration(
                      labelText: "Message or Feedback",
                      labelStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(242, 129, 0, 1),
                              width: 3))),
                  maxLines: 4,
                  controller: messageController,
                ),
              ),
              Center(
                  child: ElevatedButton.icon(
                      onPressed: sendMessage,
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => Color.fromRGBO(242, 129, 0, 1))),
                      icon: Icon(Icons.send),
                      label: Text("Send"))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image(
                        image: AssetImage('assets/images/clg_logo.png'),
                        width: 160),
                  ),
                  Container(
                    child: Image(
                        image: AssetImage('assets/images/iSPIN_logo.png'), width: 160),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
