import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'Config/config.dart';
import 'DialogBox/errorDialog.dart';
import 'DialogBox/loadingDialog.dart';
import 'Home/home.dart';
import 'login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _confirmPasswordTextController =
      TextEditingController();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool hidePass = true;
  bool hideConfirmPass = true;
  bool looding = false;

//Selecting Image
  String? newurl;
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  uploadimage() async {
    setState(() {});
    if (_image != null) {
      final ref = FirebaseStorage.instance.ref("/newimages");
      UploadTask uploadtask = ref.putFile(_image!.absolute);
      await Future.value(uploadtask);
      final newurl = await ref.getDownloadURL();

      FirebaseFirestore.instance.collection("MrFiaz").add({
        'img': newurl,
      });
    } else {
      print("Nothing ");
    }
    setState(() {});
  }

  File? _imageFile;

  Future uploadImageToFirebase(BuildContext context) async {
    File file = new File("");
    String fileName = file.path.split('/').last;
    // String fileName = new fileName(_imageFile!.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask;
    taskSnapshot.ref.getDownloadURL().then(
          (value) => print("Done: $value"),
        );
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer SignUp",
          style: GoogleFonts.pollerOne(textStyle: TextStyle()),
          textScaleFactor: 1.0,
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
        // leading: Icon(Icons.arrow_back_ios, color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.end,
            //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      _image == null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey[300],
                              child: GestureDetector(
                                onTap: () {
                                  getImage();
                                },
                                child: Icon(
                                  Icons.add_a_photo_outlined,
                                  size: 40,
                                ),
                              ),
                            )
                          : CircleAvatar(
                              radius: 66,
                              // backgroundImage: AssetImage('images/2.jpg'),
                              child: CircleAvatar(
                                radius: 75,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 72,
                                  backgroundImage: FileImage(_image!),
                                ),
                              ),
                            ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _nameTextController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Enter Your Name",
                          labelText: "Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.grey[600],
                          ),
                        ),
                        validator:
                            RequiredValidator(errorText: 'Name is required'),
                      ),
                      TextFormField(
                        //keyboardType: TextInputType.visiblePassword,
                        controller: _emailTextController,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Enter Your E-mail",
                          labelText: "E-mail",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey[600],
                          ),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'E-mail is required'),
                          EmailValidator(
                              errorText: 'Enter a valid e-mail address'),
                        ]),
                      ),
                      TextFormField(
                        obscureText: hidePass,
                        controller: _passwordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Enter Your Password",
                          labelText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey[600],
                          ),
                          suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                setState(() {
                                  hidePass = false;
                                });
                              }),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(8,
                              errorText:
                                  'password must be at least 8 digits long'),
                          PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                              errorText:
                                  'passwords must have at least one special character'),
                        ]),
                      ),
                      TextFormField(
                          obscureText: hideConfirmPass,
                          controller: _confirmPasswordTextController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "Re-enter Your Password",
                            labelText: "Confirm Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hideConfirmPass = false;
                                  });
                                }),
                          ),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'password is required'),
                            MinLengthValidator(8,
                                errorText:
                                    'password must be at least 8 digits long'),
                            PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                                errorText:
                                    'passwords must have at least one special character'),
                          ])),
                      SizedBox(height: 40.0),
                      looding
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GestureDetector(
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.indigo,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.indigo,
                                          spreadRadius: 1,
                                          offset: Offset(1, 0),
                                          blurRadius: 8)
                                    ]),
                                child: Center(
                                  child: Text("Signup",
                                      style: GoogleFonts.knewave(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
                                ),
                              ),
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  RegisterUser();
                                }
                              },
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.knewave(
                                textStyle: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              "Login.",
                              style: GoogleFonts.knewave(
                                  textStyle: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 16)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RegisterUser() async {
    if (formkey.currentState!.validate() && _image != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                children: [
                  new CircularProgressIndicator(),
                  SizedBox(
                    width: 25.0,
                  ),
                  new Text("Loading, Please wait"),
                ],
              ),
            ),
          );
        },
      );

      /// uploading image to firebase storage
      Reference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("CustomerImages")
          .child("${randomAlphaNumeric(9)}.jpg");
      final UploadTask task = firebaseStorageRef.putFile(_image!);

      task.whenComplete(() async {
        try {
          var downloadURL = await firebaseStorageRef.getDownloadURL();
          print("this is url $downloadURL");

          /// Add Data to Firestore
          UserCredential result = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _emailTextController.text,
                  password: _passwordTextController.text);
          User? user = result.user;

          FirebaseFirestore.instance
              .collection("CustomerUserRecord")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set({
            "name": _nameTextController.text.trim(),
            "email": _emailTextController.text.trim(),
            "password": _passwordTextController.text.trim(),
            "confirmpassword": _confirmPasswordTextController.text.trim(),
            "userImage": downloadURL,
            "userUid": user!.uid,
          }).then((value) async {
            user.sendEmailVerification();
          });

          Navigator.of(context).pop();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Registered Successfully. Please Login.. check your email for verification",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          );
        } on FirebaseAuthException catch (e) {
          Navigator.of(context).pop();
          if (e.code == 'weak-password') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Password Provided is too Weak",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          } else if (e.code == 'email-already-in-use') {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  "Account Already exists",
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
            );
          }
        }
      });
    } else {
      msgalert("Please select a Image !");
    }
  }

  displaytoast(String msg) {
    Fluttertoast.showToast(msg: msg, timeInSecForIosWeb: 3);
  }

  msgalert(String msg) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "",
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }
}
