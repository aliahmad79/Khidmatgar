import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatefulWidget {
  final String message;
  const LoadingAlertDialog({Key? key, required this.message}) : super(key: key);

  @override
  _LoadingAlertDialogState createState() => _LoadingAlertDialogState();
}

class _LoadingAlertDialogState extends State<LoadingAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          // cicularProgress(),
          SizedBox(
            height: 10,
          ),
          Text(widget.message),
        ],
      ),
    );
  }
}
