import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationPage extends StatefulWidget {
  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController addresscontroller = new TextEditingController();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openLocationSettings();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  getadress(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(" => Searching adress  $placemarks");
    Placemark mark = placemarks[0];
    address =
        '${mark.street},${mark.locality},${mark.subAdministrativeArea},${mark.administrativeArea},${mark.country}';

    addresscontroller.text = address;
    setState(() {});
  }

  String location = "";
  String address = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Details ---"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            child: TextFormField(
              controller: addresscontroller,
              decoration: InputDecoration(
                labelText: "City",
                hintText: "Enter Your City",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(


            onPressed: () async {
              Position position = await _determinePosition();
              print(position.longitude);
              print(position.latitude);
              location =
                  ' latitude: ${position.latitude},longitude :${position.longitude},';
              getadress(position);
              setState(() {});
            },
            child: Text("Get Location "),
          ),
        ],
      ),
    );
  }
}
