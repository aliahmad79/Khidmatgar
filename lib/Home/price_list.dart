import 'package:fiazproject/Home/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceList extends StatefulWidget {

  @override
  _PriceListState createState() => _PriceListState();
}

class _PriceListState extends State<PriceList> {
  String imageUrl =
      "https://images.unsplash.com/photo-1497997092403-f091fcf5b6c4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8dGFpbG9yfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80";
  String imageUrl1 = "assets/images/providerimg.jpg";
  String imageUrl2 =
      "assets/images/caretaker.jpg";
  String imageUrl3 =
      "assets/images/wallpaint.jpg";




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Price List",
          style: GoogleFonts.pollerOne(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
              )),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined),
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        ),
      ),
      body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Electrician Charges",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Wiring Per Square Feet",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text(
                      "25 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Breaker Replacement",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text(
                      "700 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Fan Service",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 130.0),
                    child: Text(
                      "350 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "AC Service",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 130.0),
                    child: Text(
                      "2500 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "UPS Service",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 120.0),
                    child: Text(
                      "2000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Carpentary Charges",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              SizedBox(height: 15),

              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Per Hour",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "300 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Per Day",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "3000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Masonary Charges",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Per Day",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "1500 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Per Square Feet",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 90.0),
                    child: Text(
                      "150 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Plumbing Charges",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Kitchen Repairing",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 75.0),
                    child: Text(
                      "1000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Bathroom Repairing",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Text(
                      "1500 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Water Motor",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 115.0),
                    child: Text(
                      "1000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Painter Charges",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Per Day",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "1000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Per Room",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 135.0),
                    child: Text(
                      "3000 Rs",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),

              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Other Services",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading:  Text(
                    "Others",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Padding(
                    padding: EdgeInsets.only(left: 150.0),
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    thickness: 1,
                    color: Colors.blueGrey,
                  )),
             SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Description",
                  style: GoogleFonts.pollerOne(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Text(
                  "Want your equipment at top condition? Well, wander no more. Avail services of our technicians right now ",
                ),
              ),
              SizedBox(height: 30.0),
            ],
          )),
    );
  }
}
