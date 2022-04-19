import 'package:fiazproject/Carpenter/carpenter_services.dart';
import 'package:fiazproject/Electrician/electrician_services.dart';
import 'package:fiazproject/Mason/mason_services.dart';
import 'package:fiazproject/Painter/painter_services.dart';
import 'package:fiazproject/Plumber/plumber_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HorCarList extends StatelessWidget {
  const HorCarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MyCat(
            image_location: 'images/plum.jpg',
            image_caption: 'Plumber',
            pressed: PlumberServices(),
          ),
          MyCat(
            image_location: 'images/electrician.jpg',
            image_caption: 'Electrician',
            pressed: ElectricianServices(),
          ),
          MyCat(
            image_location: 'images/painter.jpg',
            image_caption: 'Painter',
            pressed: PainterServices(),
          ),
          MyCat(
            image_location: 'images/mason.jpg',
            image_caption: 'Mason',
            pressed: MasonServices(),
          ),
          MyCat(
            image_location: 'images/carpenter.jpg',
            image_caption: 'Carpenter',
            pressed: CarpenterServices(),
          ),
          // MyCat(
          //   image_location: 'images/babysitter.jpg',
          //   image_caption: 'Maid',
          // ),
        ],
      ),
    );
  }
}

class MyCat extends StatelessWidget {
  // const MyCat({Key? key}) : super(key: key);
  final String image_location;
  final String image_caption;
  final Widget pressed;
  MyCat({
    required this.image_location,
    required this.image_caption,
    required this.pressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => pressed));
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image_location),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(image_caption),
        ],
      ),
    );
  }
}
