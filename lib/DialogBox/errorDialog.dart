import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ErrorAlertDialog extends StatefulWidget {
  final String message;
  const ErrorAlertDialog({Key? key, required this.message}) : super(key: key);

  @override
  _ErrorAlertDialogState createState() => _ErrorAlertDialogState();
}

class _ErrorAlertDialogState extends State<ErrorAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(widget.message),
      actions: [
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.indigo,
          child: Center(
            child: Text("Ok"),
          ),
        ),
      ],
    );
  }
}
