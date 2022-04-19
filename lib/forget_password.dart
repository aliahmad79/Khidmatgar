import 'package:fiazproject/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    super.dispose();
  }

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
      emailController.text = "";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reset Password",
          style: GoogleFonts.knewave(
              textStyle: TextStyle(color: Colors.white, fontSize: 22)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              'Reset Link will be sent to your email id !',
              style: GoogleFonts.knewave(
                  textStyle: TextStyle(color: Colors.black, fontSize: 16)),
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: "Enter Your E-mail",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.grey[600],
                          ),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          } else if (!value.contains('@')) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  email = emailController.text;
                                });
                                resetPassword();
                              }
                            },
                            child: Text(
                              'Send Email',
                              style: GoogleFonts.knewave(
                                  textStyle: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                            ),
                          ),
                          TextButton(
                            onPressed: () => {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, a, b) => LoginPage(),
                                    transitionDuration: Duration(seconds: 0),
                                  ),
                                  (route) => false)
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.knewave(
                                  textStyle: TextStyle(
                                      color: Colors.indigo,
                                      fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an Account? ",
                            style: GoogleFonts.knewave(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                )
                            ),
                          ),
                          TextButton(
                              onPressed: () => {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, a, b) =>
                                              SignUp(),
                                          transitionDuration:
                                              Duration(seconds: 0),
                                        ),
                                        (route) => false)
                                  },
                              child: Text('Signup',
                                style: GoogleFonts.knewave(
                                    textStyle: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 16)),
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
