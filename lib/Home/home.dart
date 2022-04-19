import 'package:fiazproject/Ac%20Electrician/ACelectrician_services.dart';
import 'package:fiazproject/Carpenter/carpenter_services.dart';
import 'package:fiazproject/Electrician/electrician_services.dart';
import 'package:fiazproject/Mason/mason_services.dart';
import 'package:fiazproject/Painter/painter_services.dart';
import 'package:fiazproject/Plumber/plumber_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../login.dart';
import 'drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool err = false;
  String msgErr = '';

  @override
  void initState() {
    super.initState();
  }

  void whatsAppOpen() async {
    bool whatsapp = await FlutterLaunch.hasApp(name: "whatsapp");

    if (whatsapp) {
      await FlutterLaunch.launchWhatsapp(
          phone: "+923047447970", message: "Hi, Khidmatgar");
    } else {
      setState(() {
        err = false;
        msgErr = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget image_carousal = new Container(
      height: 180.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage("images/plum.jpg"),
          AssetImage("images/electrician.jpg"),
          AssetImage("images/painter.jpg"),
          AssetImage("images/mason.jpg"),
          AssetImage("images/carpenter.jpg"),
          AssetImage("images/babysitter.jpg"),
        ],
        autoplay: true,
        dotSize: 4.0,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 2.0,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    Widget customcontainer(
        String img, Widget pressed, String txt, double height, double wid) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => pressed));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                height: height,
                width: wid,
                child: Image.asset(
                  "$img",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            "$txt",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Khidmatgar",
          style: GoogleFonts.pollerOne(textStyle: TextStyle()),
          textScaleFactor: 1.0,),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade500,
        actions: [
          IconButton(
            onPressed: () {
              whatsAppOpen();
            },
            icon: Image.asset("images/whatsapp.png"),
            // icon: Icon(Icons.message_outlined, color: Colors.green,)
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              image_carousal,
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "Carpentry Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 1.5),
                  child: Text(
                    "Give your ambience new life and breathe a new life to your surrounding.",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              // CustomListTile(title: "Categories"),
              SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 175.0,
                  child: CarpenterServices(),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,

                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "Electric Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "Want your equipment at top condition? Well, wander no more. Avail services of our technicians right now ",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90.0,
                  child: ElectricianServices(),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "Masonary Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "A carpenter knows that carpentry is a work of art let our artists give you the service you deserve",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90.0,
                  child: MasonServices(),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "Plumbing Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "Never doubt the resourcefulness of well-trained plumber, and our plumbers are noy just well-trained but professionals",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90.0,
                  child: PlumberServices(),
                ),
              ),
              SizedBox(height: 0.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "House Painting Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "A true artist is not one who is inspired, but one who inspires others",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90.0,
                  child: PainterServices(),
                ),

              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "AC Electric Services",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 1.5, top: 0.0, bottom: 0.0),
                  child: Text(
                    "A true artist is not one who is inspired, but one who inspires others",
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 3.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 90.0,
                  child: ACElectricianServices(),
                ),

              ),

            ],
          ),
        ),

      ),

    );
  }
}
