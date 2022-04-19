import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'elect_ser_detail.dart';

class ElectricianServices extends StatefulWidget {
  const ElectricianServices({Key? key}) : super(key: key);

  @override
  _ElectricianServicesState createState() => _ElectricianServicesState();
}

class _ElectricianServicesState extends State<ElectricianServices> {
  var avtivity_list = [
    {
      "name": "Fan",
      "click":
          " Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));",
      "pic": "images/fanservices.jpg",
      "list": "Price List",
      "detail":
          "Electricians work on electrical equipment and in homes, factories, businesses and buildings,"
              " both existing and under construction, to install, repair and maintain power,"
              " lighting, communications and control systems."
    },
    {
      "name": "Wiring",
      "click":
          " Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));",
      "pic": "images/wiring.jpg",
      "list":"Price List",
      "detail": "Painters use paint, tools, and materials such as plaster,"
          " to change the appearance and texture of buildings, walls, and other structures. "
          "They may operate alone or alongside other painters or construction workers."
    },
    {
      "name": "UPS",
      "click":
          " Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));",
      "pic": "images/ups.jpg",
      "list": "Price List",
      "detail": "Masons can expect to work in all weather and with various materials,"
          " lift and carry heavy objects, and read and assess technical drawings. "
          "Their responsibilities include texturing and polishing blocks of stone, installing dressed stone,"
          " mixing cement and mortar, and restoring old and damaged masonry works."
    },
    {
      "name": "Lighting",
      "click":
          " Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));",
      "pic": "images/lighting.jpg",
      "list":"Price List",
      "detail":
          "Carpenter can expert to work for layout, installation, repairing, finishing,"
              " and maintaining various structures, fixtures, and buildings. "
              "Other duties will include designing, cutting, and measuring materials according to a client's requirements"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: avtivity_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 1,
            crossAxisCount: 4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SingleElectricianServices(
              elect_name: avtivity_list[index]['name'],
              elect_pressed: avtivity_list[index]['pressed'],
              elect_pic: avtivity_list[index]['pic'],
              elect_list: avtivity_list[index]['list'],
              elect_detail: avtivity_list[index]['detail'],
            );
          }),
    );
  }
}

class SingleElectricianServices extends StatefulWidget {
  // const SingleElectricianServices({Key? key}) : super(key: key);
  final elect_name;
  final elect_pic;
  final elect_list;
  final elect_detail;
  final elect_pressed;

  SingleElectricianServices({
    this.elect_name,
    this.elect_pic,
    this.elect_list,
    this.elect_detail,
    this.elect_pressed,
  });

  @override
  _SingleElectricianServicesState createState() =>
      _SingleElectricianServicesState();
}

class _SingleElectricianServicesState extends State<SingleElectricianServices> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ElectricianServicesDetail(
                      elec_ser_detail_name: widget.elect_name,
                      // elec_service_pressed: widget.elect_pressed,
                      elec_ser_detail_pic: widget.elect_pic,
                      elect_list: widget.elect_list,
                      elec_service_detail: widget.elect_detail,
                    )));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
            height: 70.0,
            width: 70.0,
            child: Image.asset(
              widget.elect_pic,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            widget.elect_name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ],
      ),
      // child: Image.asset(
      //   widget.elect_pic,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}
