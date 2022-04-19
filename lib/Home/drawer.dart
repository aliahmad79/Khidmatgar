import 'package:fiazproject/Home/about.dart';
import 'package:fiazproject/Home/accountsetting.dart';
import 'package:fiazproject/Home/contactus.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/Home/price_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import '../login.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPictureSize: Size.square(80),
              accountEmail: Text(FirebaseAuth.instance.currentUser!.email!,
                style: GoogleFonts.pollerOne(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.white,
                    )),
              ),


              accountName: FirebaseAuth.instance.currentUser!.displayName != null
                      ? Text(FirebaseAuth.instance.currentUser!.displayName!, style: GoogleFonts.pollerOne(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.white,
                  )),)
                      : Text(""),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: FirebaseAuth
                              .instance.currentUser!.photoURL !=
                          null
                      ? NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!)
                      : NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/User_font_awesome.svg/768px-User_font_awesome.svg.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.indigo,),
              title: Text("HomePage", ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.indigo,),
              title: Text("Profile"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
            ),
            //

            ListTile(
              leading: Icon(Icons.directions_outlined, color: Colors.indigo,),
              title: Text("View Services"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.price_check_outlined, color: Colors.indigo,),
              title: Text("Price List"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PriceList()));
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.contact_page, color: Colors.indigo,),
              title: Text("Contact Us"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Contactus()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Colors.indigo,),
              title: Text("About Us"),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.indigo,),
              title: Text("Logout"),
              onTap: () async {
                print("Clicked");
                GoogleSignIn().disconnect();
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
