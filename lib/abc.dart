import 'package:flutter/material.dart';

class ABC extends StatefulWidget {
  const ABC({Key? key}) : super(key: key);

  @override
  _ABCState createState() => _ABCState();
}

class _ABCState extends State<ABC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
    );
  }
}
