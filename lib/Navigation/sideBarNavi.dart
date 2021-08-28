import 'package:demo/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SidebarNav extends StatelessWidget {
  const SidebarNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              width: 280,
              height: 130,
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(213, 187, 75, 1)),
                        onPressed: () {
                          //
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              size: 14,
                              color: Color.fromRGBO(17, 69, 99, 1),
                            ),
                            Text(
                              " Profile",
                              style: GoogleFonts.cambo(
                                  fontSize: 14,
                                  color: Color.fromRGBO(17, 69, 99, 1)),
                            )
                          ],
                        ),
                      ),
                      top: 5,
                      right: 5,
                    ),

                    Positioned(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Mr./Mrs./Dr. Full Name",
                            style: GoogleFonts.adamina(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(213, 187, 75, 1)),
                          ),
                          Text(
                            "# Faculty Id",
                            style: GoogleFonts.adamina(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(213, 187, 75, 0.8)),
                          ),
                        ],
                      ),
                      top: 70,
                      left: 20,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  const Radius.circular(4),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(27, 27, 27, 0.5),
                    offset: Offset(0, 10),
                    blurRadius: 16,
                  ),
                ],
                color: Color.fromRGBO(27, 79, 109, 1),
              ),
            ),
            top: 80,
            left: 20,
          ),
          Positioned(
            child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    const Radius.circular(9),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromRGBO(27, 27, 27, 0.5),
                      offset: Offset(0, 5),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.0),
                  child: Image.network("https://picsum.photos/144"),
                )
                //child: Image(image: AssetImage('assets/images/1.png'), width: 72, height: 72,),
                ),
            top: 60,
            left: 40,
          ),
          Positioned(
            child: Container(
              width: 320,
              height: 250,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView(
                children: [
                  ListTile(
                      title: ListText("Tasks"),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  ListTile(
                      title: ListText("Leave Applications"),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  ListTile(
                      title: ListText("Notifications"),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  ListTile(
                      title: ListText("Circulars"),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
            top: 230,
          ),
          Positioned(
            child: Image(
              image: AssetImage('assets/images/clg_logo.png'),
              width: 220,
            ),
            bottom: 30,
            left: 50,
          ),
          Positioned(
            child: Text(
              "Innovative Software Product Industry of NSCET",
              style: GoogleFonts.cambo(
                  fontSize: 12, color: Color.fromRGBO(75, 75, 75, 1)
              ),
              textAlign: TextAlign.center,
            ),
            width: 320,
            bottom: 5,
          )
        ],
      ),
    );
  }
}

class ListText extends StatelessWidget {
  String? text;

  ListText(giventext) {
    this.text = giventext;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text!,
      style: GoogleFonts.roboto(
          fontSize: 20, color: Color.fromRGBO(17, 17, 17, 1),
          fontWeight: FontWeight.w300
      ),
    );
  }
}
