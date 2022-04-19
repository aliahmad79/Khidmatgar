import 'package:fiazproject/Home/service_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RecentActivities extends StatefulWidget {
  const RecentActivities({Key? key}) : super(key: key);

  @override
  _RecentActivitiesState createState() => _RecentActivitiesState();
}

class _RecentActivitiesState extends State<RecentActivities> {
  var avtivity_list = [
    {
      "name": "Plumber",
      "pic": "images/plum.jpg",
      "price": 150,
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
    },
    {
      "name": "Elctrician",
      "pic": "images/electrician.jpg",
      "price": 200,
      "detail":
          "Electricians work on electrical equipment and in homes, factories, businesses and buildings,"
              " both existing and under construction, to install, repair and maintain power,"
              " lighting, communications and control systems."
    },
    {
      "name": "Painter",
      "pic": "images/painter.jpg",
      "price": 100,
      "detail": "Painters use paint, tools, and materials such as plaster,"
          " to change the appearance and texture of buildings, walls, and other structures. "
          "They may operate alone or alongside other painters or construction workers."
    },
    {
      "name": "Mason",
      "pic": "images/mason.jpg",
      "price": 250,
      "detail": "Masons can expect to work in all weather and with various materials,"
          " lift and carry heavy objects, and read and assess technical drawings. "
          "Their responsibilities include texturing and polishing blocks of stone, installing dressed stone,"
          " mixing cement and mortar, and restoring old and damaged masonry works."
    },
    {
      "name": "Carpenter",
      "pic": "images/carpenter.jpg",
      "price": 150,
      "detail":
          "Carpenter can expert to work for layout, installation, repairing, finishing,"
              " and maintaining various structures, fixtures, and buildings. "
              "Other duties will include designing, cutting, and measuring materials according to a client's requirements"
    },
    {
      "name": "Maid",
      "pic": "images/babysitter.jpg",
      "price": 50,
      "detail": "Maids are responsible for keeping residences and commercial establishments clean and tidy. "
          "They perform various cleaning tasks, which include mopping, vacuuming and sweeping floors,"
          " washing carpets, replacing dirty linen, and wiping down kitchen counters."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: avtivity_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Single_avtivity(
            act_name: avtivity_list[index]['name'],
            act_pic: avtivity_list[index]['pic'],
            act_price: avtivity_list[index]['price'],
            act_detail: avtivity_list[index]['detail'],
          );
        });
  }
}

class Single_avtivity extends StatefulWidget {
  // const Single_avtivity({Key? key}) : super(key: key);
  final act_name;
  final act_pic;
  final act_price;
  final act_detail;

  Single_avtivity({
    this.act_name,
    this.act_pic,
    this.act_price,
    this.act_detail,
  });

  @override
  _Single_avtivityState createState() => _Single_avtivityState();
}

class _Single_avtivityState extends State<Single_avtivity> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Hero(
        tag: widget.act_name,
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceDetails(
                            ser_detail_name: widget.act_name,
                            ser_detail_pic: widget.act_pic,
                            ser_detail_price: widget.act_price,
                            service_detail: widget.act_detail,
                          )));
            },
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.act_name,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, height: 3.0),
                      ),
                    ),
                    Text(
                      "\$${widget.act_price}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, height: 3.0),
                    ),
                  ],
                ),
              ),
              child: Image.asset(
                widget.act_pic,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
