import 'package:flutter/material.dart';

class Certificate extends StatelessWidget {
  static String id ="Certificate";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      
      body: Image(
                image: AssetImage('images/cert.gif'),
                height: height,
                width: width,
              ),
    );
  }
}