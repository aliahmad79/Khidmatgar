import 'package:flutter/material.dart';

import 'carp_ser_detail.dart';

class CarpenterServices extends StatefulWidget {

  @override
  _CarpenterServicesState createState() => _CarpenterServicesState();
}

class _CarpenterServicesState extends State<CarpenterServices> {
  var avtivity_list = [
    {
      "name": "Door",
      "pic": "images/doorcarpenter.jpg",
      "price": "See List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
    },
    {
      "name": "Furniture Polish",
      "pic": "images/polish.jpg",
      "price": "See List",
      "detail":
          "Electricians work on electrical equipment and in homes, factories, businesses and buildings,"
              " both existing and under construction, to install, repair and maintain power,"
              " lighting, communications and control systems."
    },
    {
      "name": "Kitchen",
      "pic": "images/kitchen.jpg",
      "price": "See List",
      "detail": "Painters use paint, tools, and materials such as plaster,"
          " to change the appearance and texture of buildings, walls, and other structures. "
          "They may operate alone or alongside other painters or construction workers."
    },
    {
      "name": "Cabinets",
      "pic": "images/cabients.jpg",
      "price": "See List",
      "detail": "Masons can expect to work in all weather and with various materials,"
          " lift and carry heavy objects, and read and assess technical drawings. "
          "Their responsibilities include texturing and polishing blocks of stone, installing dressed stone,"
          " mixing cement and mortar, and restoring old and damaged masonry works."
    },
    {
      "name": "Repairing",
      "pic": "images/repairnig.jpg",
      "price": "See List",
      "detail":
          "Carpenter can expert to work for layout, installation, repairing, finishing,"
              " and maintaining various structures, fixtures, and buildings. "
              "Other duties will include designing, cutting, and measuring materials according to a client's requirements"
    },
    // {
    //   "name": "Maid",
    //   "pic": "images/babysitter.jpg",
    //   "price": 50,
    //   "detail": "Maids are responsible for keeping residences and commercial establishments clean and tidy. "
    //       "They perform various cleaning tasks, which include mopping, vacuuming and sweeping floors,"
    //       " washing carpets, replacing dirty linen, and wiping down kitchen counters."
    // },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Carpenter Services"),
      //   backgroundColor: Colors.deepOrange,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.search),
      //     ),
      //   ],
      //   // actions: [
      //   //   IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      //   // ],
      // ),
      body: GridView.builder(
          itemCount: avtivity_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 0,
            // childAspectRatio: 0.8,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SingleCarpenterService(
              carp_name: avtivity_list[index]['name'],
              carp_pic: avtivity_list[index]['pic'],
              carp_price: avtivity_list[index]['price'],
              carp_detail: avtivity_list[index]['detail'],
            );
          }),
    );
  }
}

class SingleCarpenterService extends StatefulWidget {
  // const SingleCarpenterService({Key? key}) : super(key: key);
  final carp_name;
  final carp_pic;
  final carp_price;
  final carp_detail;

  SingleCarpenterService({
    this.carp_name,
    this.carp_pic,
    this.carp_price,
    this.carp_detail,
  });

  @override
  _SingleCarpenterServiceState createState() => _SingleCarpenterServiceState();
}

class _SingleCarpenterServiceState extends State<SingleCarpenterService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarpenterServicesDetail(
                      carp_ser_detail_name: widget.carp_name,
                      carp_ser_detail_pic: widget.carp_pic,
                      carp_ser_detail_price: widget.carp_price,
                      carp_service_detail: widget.carp_detail,
                    )));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            height: 70.0,
            width: 70.0,
            child: Image.asset(
              widget.carp_pic,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 0.0,
          ),
          Text(
            widget.carp_name,
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
