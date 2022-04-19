import 'package:fiazproject/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Success extends StatefulWidget {
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/success.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Successful !!",
                    style: GoogleFonts.pollerOne(
                        textStyle:
                            TextStyle(color: Color(0xFF303030), fontSize: 18)),
                    textScaleFactor: 1.3,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: Text(
              "Place Order Successfully",
              textAlign: TextAlign.center,
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(color: Colors.black, fontSize: 14)),
              textScaleFactor: 1.3,
            ),
          ),

          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
            child: Text(
              "We will shortly conatct you",
              textAlign: TextAlign.center,
              style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(color: Colors.black, fontSize: 14)),
              textScaleFactor: 1.3,
            ),
          ),
          SizedBox(height: 20.0,),
          GestureDetector(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.indigo,
                          spreadRadius: 1,
                          offset: Offset(1, 0),
                          blurRadius: 8)
                    ]),
                child: Center(
                  child: Text("Ok",
                      style: GoogleFonts.knewave(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20))),
                ),
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
