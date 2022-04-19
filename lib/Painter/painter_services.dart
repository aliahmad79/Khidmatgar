import 'package:fiazproject/Painter/painter_ser_detail.dart';
import 'package:flutter/material.dart';

class PainterServices extends StatefulWidget {
  const PainterServices({Key? key}) : super(key: key);

  @override
  _PainterServicesState createState() => _PainterServicesState();
}

class _PainterServicesState extends State<PainterServices> {
  var avtivity_list = [
    {
      "name": "Wall Painter",
      "pic": "images/wallpaint.jpg",
      "price": "See List",
      "detail":
          "Plumbers install and repair pipes that supply water and gas to, as well as carry waste away from, "
              "homes and businesses. They also install plumbing fixtures such as bathtubs, sinks, and toilets, "
              "and appliances, including dishwashers and washing machines. "
              "Experienced plumbers train apprentices and supervise helpers. "
              "They work alongside other construction workers."
    },
    {
      "name": "Interior Painter",
      "pic": "images/ceiling.jpg",
      "price": "See List",
      "detail":
          "Electricians work on electrical equipment and in homes, factories, businesses and buildings,"
              " both existing and under construction, to install, repair and maintain power,"
              " lighting, communications and control systems."
    },
    {
      "name": "Roof Coatings",
      "pic": "images/roof.jpg",
      "price": "See List",
      "detail": "Painters use paint, tools, and materials such as plaster,"
          " to change the appearance and texture of buildings, walls, and other structures. "
          "They may operate alone or alongside other painters or construction workers."
    },
    // {
    //   "name": "UPS",
    //   "pic": "images/ups.jpg",
    //   "price": 250,
    //   "detail": "Masons can expect to work in all weather and with various materials,"
    //       " lift and carry heavy objects, and read and assess technical drawings. "
    //       "Their responsibilities include texturing and polishing blocks of stone, installing dressed stone,"
    //       " mixing cement and mortar, and restoring old and damaged masonry works."
    // },
    // {
    //   "name": "Lighting",
    //   "pic": "images/lighting.jpg",
    //   "price": 150,
    //   "detail":
    //       "Carpenter can expert to work for layout, installation, repairing, finishing,"
    //           " and maintaining various structures, fixtures, and buildings. "
    //           "Other duties will include designing, cutting, and measuring materials according to a client's requirements"
    // },
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
      body: GridView.builder(
          itemCount: avtivity_list.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return SinglePainterService(
              paint_name: avtivity_list[index]['name'],
              paint_pic: avtivity_list[index]['pic'],
              paint_price: avtivity_list[index]['price'],
              paint_detail: avtivity_list[index]['detail'],
            );
          }),
    );
  }
}

class SinglePainterService extends StatefulWidget {
  // const SinglePainterService({Key? key}) : super(key: key);
  final paint_name;
  final paint_pic;
  final paint_price;
  final paint_detail;

  SinglePainterService({
    this.paint_name,
    this.paint_pic,
    this.paint_price,
    this.paint_detail,
  });

  @override
  _SinglePainterServiceState createState() => _SinglePainterServiceState();
}

class _SinglePainterServiceState extends State<SinglePainterService> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PainterServicesDetail(
                      paint_ser_detail_name: widget.paint_name,
                      paint_ser_detail_pic: widget.paint_pic,
                      paint_ser_detail_price: widget.paint_price,
                      paint_service_detail: widget.paint_detail,
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
              widget.paint_pic,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget.paint_name,
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
