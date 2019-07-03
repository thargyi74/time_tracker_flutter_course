import 'package:flutter/material.dart';

class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            'Thank for using Smart Wast Collect',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 36.0,
        ),
        FlatButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('BACK'),
        ),
      ],
    );
  }
}
