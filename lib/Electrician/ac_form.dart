import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiazproject/Home/payment.dart';
import 'package:fiazproject/success.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:google_fonts/google_fonts.dart';

class ACForm extends StatefulWidget {
  @override
  _ACFormState createState() => _ACFormState();
}

class _ACFormState extends State<ACForm> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController problemcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController phonenumbercontroller = new TextEditingController();
  TextEditingController servicecontroller = new TextEditingController();
  TextEditingController addresscontroller = new TextEditingController();
  TextEditingController datecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController serviceNamecontroller = new TextEditingController();
  //
  String selectedac = "";
  String selectedacsize = "";
  String selectedaccompany = "";
  String selectedprice = "";
  bool load = false;
  //
  void validate() {
    if (formkey.currentState!.validate()) {
      print("ok");
    } else {
      print("error");
    }
  }
  // final format = DateFormat("yyyy-MM-dd");

  int? _value = 0;
  int? _acval = 0;
  int? _accomvalue = 0;
  int? _acserval = 0;
  late List<String> _choice = [
    "Inverter",
    "Non Inverter",
  ];

  late List<String> _imagechoice;
  late List<String> _acsizechoice;
  late List<String> _accomchoice;
  late int _defaultChoiceIndex;
  late List<String> _acserchoice;
  late List<String> _acserpricechoice;
  @override
  void initState() {
    super.initState();
    _acsizechoice = ["1Tone", "1.5Tone", "2Tone", "2+Tone"];
    _imagechoice = [
      "images/Dawlance.png",
      "images/Haire.png",
      "images/Orient.png",
      "images/Pel.png",
      "images/Kenwood.png",
      "images/Gree.png",
      "images/Changhong.png",
      "images/Other.png",
    ];
    _accomchoice = [
      "Dawlance",
      "Haier",
      "Orient",
      "Pel",
      "Kenwood",
      "Gree",
      "Changghong",
      "Other"
    ];
    _acserchoice = [
      "Generral Service ",
      "Master Service",
      "Gas Refilling",
      "AC Install",
      "AC Repairing",
    ];
    _acserpricechoice = [
      "Starting from Rs. 1,500",
      "Starting from Rs. 2,000",
      "Starting from Rs. 4,000",
      "Contact us for a price",
      "Starting from Rs. 1000",
    ];
  }

  Widget choiceChip() {
    return Wrap(
      spacing: 50.0,
      // crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: List<Widget>.generate(
        2,
        (int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ChoiceChip(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black12),
              ),
              label: Container(
                height: 70,
                width: 112,
                child: Center(
                    child: Column(
                  children: [
                    Image.asset(
                      "images/Ac.png",
                      height: 50,
                      width: 50,
                    ),
                    Text(_choice[index]),
                  ],
                )),
              ),
              selected: _value == index,
              selectedColor: Colors.indigo.shade100,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                  String? SelectedInverter = selected ? _choice[index] : null;

                  selectedac = SelectedInverter!;
                  print(SelectedInverter);
                });
              },
            ),
          );
        },
      ).toList(),
    );
  }

  Widget AcsizeChip() {
    return Wrap(
      spacing: 5.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: List<Widget>.generate(
        4,
        (int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ChoiceChip(
              backgroundColor: Colors.white,
              padding: EdgeInsets.only(top: 3.0, bottom: 5.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black12),
              ),
              label: Container(
                height: 40,
                width: 55,
                child: Center(
                    child: Column(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    Text(_acsizechoice[index])
                  ],
                )),
              ),
              selected: _acval == index,
              selectedColor: Colors.indigo.shade200,
              onSelected: (bool selected) {
                setState(() {
                  _acval = selected ? index : null;
                  String? _acsize = selected ? _acsizechoice[index] : null;
                  print(_acsize);
                  selectedacsize = _acsize!;
                });
              },
            ),
          );
        },
      ).toList(),
    );
  }

  Widget ACcompchoiceChip() {
    return Wrap(
      spacing: 50.0,
      runSpacing: 15.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: List<Widget>.generate(
        8,
        (int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ChoiceChip(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.black12),
              ),
              label: Container(
                height: 75,
                width: 100,
                child: Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      _imagechoice[index],
                      height: 50,
                      width: 100,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
              ),
              selected: _accomvalue == index,
              selectedColor: Colors.indigo.shade100,
              onSelected: (bool selected) {
                setState(() {
                  _accomvalue = selected ? index : null;
                  String? accompany = selected ? _imagechoice[index] : null;
                  print(accompany);
                  selectedaccompany = accompany!;
                });
              },
            ),
          );
        },
      ).toList(),
    );
  }

  Widget ACserchoiceChip() {
    return Wrap(
      spacing: 10.0,
      runSpacing: 15.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: List<Widget>.generate(
        5,
        (int index) {
          return ChoiceChip(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(color: Colors.black12),
            ),
            label: Container(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _acserchoice[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      _acserpricechoice[index],
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            selected: _acserval == index,
            selectedColor: Colors.indigo.shade100,
            onSelected: (bool selected) {
              setState(() {
                _acserval = selected ? index : null;
                String? acservice = selected ? _acserpricechoice[index] : null;
                print(acservice);
                selectedprice = acservice!;
              });
            },
          );
        },
      ).toList(),
    );
  }

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
              right: 0.0, left: 0.0, bottom: 0.0, top: 10.0),
          child: Center(
            child: Form(
              autovalidate: true,
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0), //310
                    child: Text(
                      "Choose Your AC ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: choiceChip(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Choose Your AC Size ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AcsizeChip(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Choose Your AC Company",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    child: ACcompchoiceChip(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Choose Your AC Service",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: ACserchoiceChip(),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Describe Your Problem (Optional) ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
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
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: TextFormField(
                      controller: serviceNamecontroller,
                      decoration: InputDecoration(
                        labelText: "Service Name",
                        hintText: "Enter Your service name",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
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
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phonenumbercontroller,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        hintText: "Enter Your Number",
                        border: OutlineInputBorder(),
                      ),
                      validator: RequiredValidator(errorText: "Required"),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 15.0),
                    child: TextFormField(
                      enabled: false,
                      controller: addresscontroller,
                      maxLines: 3,
                      maxLength: 200,
                      decoration: InputDecoration(
                        labelText: "Address",
                        border: OutlineInputBorder(),
                      ),
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
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 15.0, right: 5.0),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
            print("Button Pressed ");
            print("Selecting Items is =>");
            print("Choose  your Ac is  $selectedac");
            print(selectedaccompany);
            print(selectedprice);
            print(problemcontroller.text);
            print(namecontroller.text);
            print(phonenumbercontroller.text);
            print(addresscontroller);

            Map<String, dynamic> userdatamap = {
              "AC": selectedac,
              "AC Size ": selectedacsize,
              "Company": selectedaccompany,
              "Service Price ": selectedprice,
              "Problem": problemcontroller.text.trim(),
              "Name": namecontroller.text.trim(),
              "Phone Number": phonenumbercontroller.text.trim(),
              "address": addresscontroller.text,
              "Service Name" : serviceNamecontroller.text.trim(),
              "Email" : emailcontroller.text.trim(),
            };

            FirebaseFirestore.instance
                .collection("Orders")
                .doc(namecontroller.text)
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
