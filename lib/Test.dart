import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  List _choice = ["Inverter", "Non Inverter"];

  int? _value = 0;

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
                child: Center(child: Text(_choice[index])),
              ),
              selected: _value == index,
              selectedColor: Colors.indigo.shade100,
              onSelected: (bool selected) {
                setState(() {
                  _value = selected ? index : null;
                  String a = selected ? _choice[index] : null;
                  print(a);
                });
              },
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: choiceChip(),
      ),
    );
  }
}
