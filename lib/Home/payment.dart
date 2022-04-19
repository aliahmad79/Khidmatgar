import 'package:fiazproject/success.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0),
            child: Text(
              "Choose your payment\nmethod",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(width: 20.0),
          ),
          Row(
            children: [
              Radio(
                  value: 1,
                  groupValue: value,
                  onChanged: (_) {
                    setState(() {
                      value = 1;
                    });
                  }),
              SizedBox(width: 10.0),
              Text(
                "Credit Card/Debit Card",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 2,
                  groupValue: value,
                  onChanged: (_) {
                    setState(() {
                      value = 2;
                    });
                  }),
              SizedBox(width: 10.0),
              Text(
                "Cash on delivery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 3,
                  groupValue: value,
                  onChanged: (_) {
                    setState(() {
                      value = 3;
                    });
                  }),
              SizedBox(width: 10.0),
              Text(
                "EasyPaisa",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Radio(
                  value: 4,
                  groupValue: value,
                  onChanged: (_) {
                    setState(() {
                      value = 4;
                    });
                  }),
              SizedBox(width: 10.0),
              Text(
                "JazzCash",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 330.0, left: 15.0, right: 5.0),
            child: MaterialButton(
              color: Colors.indigo.shade500,
              height: 55.0,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                side: BorderSide(),
                borderRadius: BorderRadius.circular(50),
              ),
              onPressed: () {
                Success();
                //
                // showDialog(
                //
                //   context: context,
                //   builder: (context) {

                    // return Dialog(
                    //   child: Container(
                    //
                    //       height: 150,
                    //       width: 150,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(Icons.insert_emoticon_outlined),
                    //           Text("Transaction Successfully",
                    //             style: TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.only(top: 45.0,left: 150),
                    //             child: MaterialButton(
                    //               color: Colors.indigo,
                    //               textColor: Colors.white,
                    //               shape: StadiumBorder(),
                    //               child: Text('OK',
                    //                 style: TextStyle(
                    //                 fontSize: 15,
                    //                 fontWeight: FontWeight.bold,
                    //               ),),
                    //               onPressed: () {
                    //                 Navigator.of(context).pop();
                    //               },
                    //             ),
                    //           ),
                    //         ],
                    //       )
                    //   ),
                    // );
                    // Navigator.push(
                    //     context, MaterialPageRoute(builder: (context) => Success()));
                  // },
                // );
              },
              child: Text(
                "Pay",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )

          // Expanded(
          //   child: ListView.separated(
          //     itemCount: paymentLabels.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         leading: Radio(
          //           activeColor: kPrimaryColor,
          //           value: index,
          //           groupValue: value,
          //           onChanged: (i) => setState(() => value = i),
          //         ),
          //           title: Text(
          //             paymentLabels[index],
          //             style: TextStyle(color: kDarkColor),
          //           ),
          //           trailing: Icon(paymentIcons[index], color: kPrimaryColor),
          //         );
          //       },
          //       separatorBuilder: (context, index) {
          //         return Divider();
          //       },
          //     ),
          //   ),
          //   DefaultButton(
          //     btnText: 'Pay',
          //     onPressed: () => Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => Success(),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
