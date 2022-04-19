import 'package:fiazproject/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Home/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'forget_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Customer Login",
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
            // maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 24.0,
                  left: 24.0,
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          "images/logo.png",
                          width: double.infinity,
                        ),
                      ),
                      // SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Customer",
                          style: GoogleFonts.pollerOne(
                              textStyle: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 18,
                                  letterSpacing: 1.2)),
                          textScaleFactor: 1.3,
                        ),
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Please! login to continue",
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
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
                            RequiredValidator(
                                errorText: "This field is required"),
                            EmailValidator(
                                errorText: 'Enter a valid E-mail address'),
                          ]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          obscureText: true,
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
                          ),
                          validator: RequiredValidator(
                              errorText: 'This field is required'),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ForgotPassword()));
                            },
                            child: Text(
                              "Forget Password",
                              style: TextStyle(
                                color: Colors.indigo.shade500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      loading
                          ? Center(child: CircularProgressIndicator())
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
                                  child: Text("Login",
                                      style: GoogleFonts.knewave(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20))),
                                ),
                              ),
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  formkey.currentState!.save();
                                  Login();
                                }
                              },
                            ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          "Or",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(FontAwesome.google, color: Colors.white,),
                                ),
                                Text("Continue with Google",
                                    style: GoogleFonts.knewave(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16))),
                              ],
                            ),
                          ),
                        ),
                        onTap: () async{
                          await SigninwithGoogle1();

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()));
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?  ",
                              style: GoogleFonts.knewave(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Sign Up.",
                              style: GoogleFonts.knewave(
                                  textStyle: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 16)),
                            ),
                          ),
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

  //

// Google Continue
  Future<UserCredential> SigninwithGoogle1() async {
    final googleuser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleuser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

// SignInMethod
  FirebaseAuth _auth = FirebaseAuth.instance;

  void Login() async {
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
                new Text("Authentication, Please wait"),
              ],
            ),
          ),
        );
      },
    );
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: _emailTextController.text,
          password: _passwordTextController.text);
      User? user = result.user;
      print("result.user ${result.user}");
      print(
          "FirebaseAuth.instance.currentUser : ${FirebaseAuth.instance.currentUser}");

      if (user!.emailVerified) {
        Navigator.pushNamed(context, '/second');
      } else {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Please Verify Your account by clicking on link",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }

//

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
