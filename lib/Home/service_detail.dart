// ignore_for_file: non_constant_identifier_names

import 'package:fiazproject/Home/recentactivity.dart';
import 'package:flutter/material.dart';

import '../form.dart';
import 'home.dart';

class ServiceDetails extends StatefulWidget {
  // const ServiceDetails({Key? key}) : super(key: key);
  final ser_detail_name;
  final ser_detail_pic;
  final ser_detail_price;
  final service_detail;
  ServiceDetails({
    this.ser_detail_name,
    this.ser_detail_pic,
    this.ser_detail_price,
    this.service_detail,
  });

  @override //
  _ServiceDetailsState createState() => _ServiceDetailsState();
}

class _ServiceDetailsState extends State<ServiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text("Khidmatgar")),
        backgroundColor: Colors.indigo.shade500,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.ser_detail_pic),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    widget.ser_detail_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      "\$${widget.ser_detail_price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
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
                child: MaterialButton(
              shape: StadiumBorder(),
              height: 50.0,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
              color: Colors.indigo.shade500,
              textColor: Colors.white,
              elevation: 2.0,
              child: Text("Book Now"),
            )),
          ),
          Divider(),
          ListTile(
            title: Text("Service Detail"),
            subtitle: Text(widget.service_detail),
          ),
          Divider(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Service Name:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.ser_detail_name),
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
          Divider(),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Similar Activities",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 320.0,
              child: RecentActivities(),
            ),
          ),
        ],
      ),
    );
  }
}
