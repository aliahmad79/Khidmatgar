
import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  _ContactusState createState() => _ContactusState();
}

class _ContactusState extends State<Contactus> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }),
          ],
          title: Text(
            'Contact Us',
            style: GoogleFonts.pollerOne(textStyle: TextStyle()),
            textScaleFactor: 1.0,
          ),
          backgroundColor: Colors.indigo,
          shadowColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0,top:17.0),
            child: Center(
              child: Column(children: <Widget>[
                Container(
                  height: 120,
                    child: Image(
                      image: AssetImage("images/logo.png"),
                    )),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),

                    Text(
                      "KHIDMATGAR",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black.withOpacity(0.7))),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "COMSATS University Islamabad,\nVehari Campus\nMailsi Road, Off Multan Road,\nVehari, Punjab,\nPakistan",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 12)),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Email:\nmfiazhussain91@gmail.com\naliahmadbrw789@gmail.com",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 12)),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Phone No#\n0304-7447970\n03012-5855447",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 12)),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Developed by:\nFiaz Hussain\nAli Ahmad",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 12)),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "Supervised by:\nSir Zahid Anwar",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: 12)),
                      textScaleFactor: 1.3,
                    ),
                  ],
                ),
                new Divider(
                  color: Colors.black,
                ),
              ]),
            ),
          ),
        ));
  }
}
