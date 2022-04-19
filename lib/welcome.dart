import 'dart:ui';

import 'package:fiazproject/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget button({
    required String name,
    required Color color,
    required Widget pressed,
  }) {
    return Container(
      height: 45,
      width: 300,
      child: RaisedButton(
        highlightColor: Colors.indigo.shade500,
        color: color,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pressed));
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.indigo.shade500,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          name,
          style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.white)),
          textScaleFactor: 1.3,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset("images/logo.png"),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Welcome To KHIDMATGAR",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.indigo,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    Column(
                      children: [
                        Text("Book services from Khidmatgar and",
                          style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),),
                        Text("make reservation in real-time",
                          style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                        ),

                      ],
                    ),
                    Text(
                      "Select Login Type",
                      style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.indigo)),
                      textScaleFactor: 1.3,
                    ),
                    button(

                        name: "Login"
                        ,
                        color: Colors.indigo.shade500,
                        pressed: LoginPage()),
                    button(
                        name: "Sign Up",
                        color: Colors.indigo.shade500,
                        pressed: SignUp()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
