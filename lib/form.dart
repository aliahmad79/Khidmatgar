import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiazproject/Home/home.dart';
import 'package:fiazproject/Home/payment.dart';
import 'package:fiazproject/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //
  TextEditingController problemcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController phonenumbercontroller = new TextEditingController();
  TextEditingController citycontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController serrviceNamecontroller = new TextEditingController();
  String selectedservice = "";
  bool load = false;
  //
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  //

  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  int? _value = 0;
  late List<String> _choice = [
    "Installation",
    "Repairing",
  ];
  late int _defaultChoiceIndex;
  @override
  void initState() {
    super.initState();
    _choice = [
      "Installation",
      "Repairing",
    ];
  }

  String? valuechoose;
  List<String> listitem = [
    "Installation",
    "Repairing",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Book Service",
          style: GoogleFonts.pollerOne(textStyle: TextStyle()),
          textScaleFactor: 1.0,),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade500,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              right: 25.0, left: 25.0, bottom: 25.0, top: 10.0),
          child: Center(
            child: Form(
              autovalidate: true,
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Text(
                      "Choose Your Service ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Wrap(
                      spacing: 50.0,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      children: List<Widget>.generate(
                        2,
                        (int index) {
                          return ChoiceChip(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.only(
                                top: 14.0,
                                bottom: 14.0,
                                right: 20.0,
                                left: 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: BorderSide(color: Colors.black12)),
                            label: Text(_choice[index]),
                            selected: _value == index,
                            selectedColor: Colors.indigo.shade100,
                            onSelected: (bool selected) {
                              setState(() {});
                              _value = selected ? index : null;

                              String? service =
                                  selected ? _choice[index] : null;
                              print(service);
                              selectedservice = service!;
                            },
                          );
                        },
                      ).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 0.0),
                    child: Text(
                      "Describe Your Problem (Optional) ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: problemcontroller,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Problem",
                        hintText: "Describe Your Problem",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: serrviceNamecontroller,
                      decoration: InputDecoration(
                        labelText: "Service Name",
                        hintText: "Enter Your service name",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Your email",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: phonenumbercontroller,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter Your Number",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 15.0),
                  //   child: TextFormField(
                  //     readOnly: true,
                  //     decoration: InputDecoration(
                  //       suffixIcon: GestureDetector(
                  //         onTap: () {
                  //           setState(() {
                  //             _selectDate(context);
                  //           });
                  //         },
                  //         child: Icon(Icons.calendar_today_outlined),
                  //       ),
                  //       labelText: "Date",
                  //       hintText: (currentDate.toString()),
                  //       border: OutlineInputBorder(),
                  //     ),
                  //     validator: RequiredValidator(errorText: "Required"),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: TextFormField(
                      controller: addresscontroller,
                      enabled: false,
                      maxLines: 3,
                      maxLength: 200,
                      decoration: InputDecoration(
                        labelText: "Address",
                        hintText: "Enter Your Address",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  Container(
                    height: 45,
                    alignment: Alignment.center,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        Position position = await _determinePosition();
                        print(position.longitude);
                        print(position.latitude);
                        location =
                            ' latitude: ${position.latitude},longitude :${position.longitude},';
                        getadress(position);
                        setState(() {});
                      },
                      icon: Icon(Icons.location_on),
                      label: Text("Get current location "),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: MaterialButton(
                      color: Colors.indigo.shade500,
                      height: 55.0,
                      minWidth: double.infinity,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          placeOrder();
                        }
                      },
                      child: Text(
                        "Book Now",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  load ? CircularProgressIndicator() : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  msgalert() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Booking Successfully !",
      desc: "Your order has been placed  we will contact you shortly,",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
        )
      ],
    ).show();
  }

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
  void placeOrder() {


    AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      animType: AnimType.BOTTOMSLIDE,
      title: 'Confirmation',
      desc: 'Are you sure to place order.............',
      btnCancelOnPress: () {
        Navigator.of(context).pop();
      },
      btnOkOnPress: () async{
        {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            setState(() {
              load = true;
            });
            print("Presseed ");
            print(selectedservice);
            print(problemcontroller.text);
            print(namecontroller.text);

            Map<String, dynamic> userdatamap = {
              "Service": selectedservice,
              "Service Name": serrviceNamecontroller.text.trim(),
              "Email": emailcontroller.text.trim(),
              "Problem": problemcontroller.text.trim(),
              "Name": namecontroller.text.trim(),
              "Phone Number": phonenumbercontroller.text.trim(),
              "City": citycontroller.text.trim(),
              "address": addresscontroller.text,
            };

            FirebaseFirestore.instance
                .collection("Orders")
                .doc(emailcontroller.text)
                .set(userdatamap);
            setState(() {
              load = false;
            });

          }
        }
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Success()));
      },
    )..show();


  }
}
