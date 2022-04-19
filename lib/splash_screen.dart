import 'dart:async';
import 'package:fiazproject/Home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    final auth=FirebaseAuth.instance.currentUser;
    if ( auth!= null) {
      return new Timer(_duration, HomePage);
    } else {
      return new Timer(_duration, WelcomePage);
    }
  }

  void WelcomePage() {
    Navigator.pushReplacementNamed(context, '/first');
  }

  void HomePage() {
    Navigator.pushReplacementNamed(context, '/second');
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade500,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          'Khidmatgar',
                          style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'images/logo.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
              Text(
                "KHIDMATGAR",
                style: GoogleFonts.lemon(textStyle: TextStyle(color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
