import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'ACelect_ser_detail.dart';

class ACElectricianServices extends StatefulWidget {
  const ACElectricianServices({Key? key}) : super(key: key);

  @override
  _ACElectricianServicesState createState() => _ACElectricianServicesState();
}

class _ACElectricianServicesState extends State<ACElectricianServices> {
  var avtivity_list = [
    {
      "name": "AC",
      "pressed":
          " Navigator.of(context).push(MaterialPageRoute(builder: (context) => ACForm()));",
      "pic": "images/acinstaller.jpg",
      "list": "Price List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
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
              acelect_name: avtivity_list[index]['name'],
              acelect_pressed: avtivity_list[index]['pressed'],
              acelect_pic: avtivity_list[index]['pic'],
              acelect_list: avtivity_list[index]['list'],
              acelect_detail: avtivity_list[index]['detail'],
            );
          }),
    );
  }
}

class SingleElectricianServices extends StatefulWidget {
  // const SingleElectricianServices({Key? key}) : super(key: key);
  final acelect_name;
  final acelect_pic;
  final acelect_list;
  final acelect_detail;
  final acelect_pressed;

  SingleElectricianServices({
    this.acelect_name,
    this.acelect_pic,
    this.acelect_list,
    this.acelect_detail,
    this.acelect_pressed,
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
                builder: (context) => AcElectricianServicesDetail(
                      acelec_ser_detail_name: widget.acelect_name,
                      // elec_service_pressed: widget.elect_pressed,
                      acelec_ser_detail_pic: widget.acelect_pic,
                      acelect_list: widget.acelect_list,
                      acelec_service_detail: widget.acelect_detail,
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
              widget.acelect_pic,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            widget.acelect_name,
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
