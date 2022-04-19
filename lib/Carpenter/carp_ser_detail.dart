import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/Home/price_list.dart';
import 'package:fiazproject/Home/recentactivity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../form.dart';

class CarpenterServicesDetail extends StatefulWidget {
  // const CarpenterServicesDetail({Key? key}) : super(key: key);
  final carp_ser_detail_name;
  final carp_ser_detail_pic;
  final carp_ser_detail_price;
  final carp_service_detail;
  CarpenterServicesDetail({
    this.carp_ser_detail_name,
    this.carp_ser_detail_pic,
    this.carp_ser_detail_price,
    this.carp_service_detail,
  });

  @override
  _CarpenterServicesDetailState createState() =>
      _CarpenterServicesDetailState();
}

class _CarpenterServicesDetailState extends State<CarpenterServicesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Carpentery Service",
          style: GoogleFonts.pollerOne(textStyle: TextStyle()),
          textScaleFactor: 1.0,),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade500,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.carp_ser_detail_pic,
                fit: BoxFit.cover,),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    widget.carp_ser_detail_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: InkWell(

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>PriceList()));
                          // Navigator.push(context, MaterialPageRoute(builder: context)=>PriceList());
                        },
                      child: Text(
                        widget.carp_ser_detail_price,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Expanded(
              child:GestureDetector(
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
                    child: Text("Book Now",
                        style: GoogleFonts.knewave(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20))),
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("Service Detail"),
            subtitle: Text(widget.carp_service_detail),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  12.0,
                  5.0,
                  5.0,
                  5.0,
                ),
                child: Text(
                  "Service Name:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.carp_ser_detail_name),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                  12.0,
                  5.0,
                  5.0,
                  5.0,
                ),
                child: Text(
                  "Provide By:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Khidmatgar"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
