import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/Custom/Customadd.dart';

class EditChild extends StatelessWidget {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  static String id = 'EditChild';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.teal[50],
        body: Form(
          key: globalKey,
          child: ListView(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SizedBox(
                height: 90,
                child: Image(
                  image: AssetImage('images/3.png'),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height * .04,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter child name',
                icon: Icons.person),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter father name',
                icon: Icons.face),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter mother name',
                icon: Icons.face_outlined),
                 SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter name of school',
                icon: Icons.location_city),
                 SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter your location',
                icon: Icons.location_history),
                 
                 SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter age of child',
                icon: Icons.child_care),
                SizedBox(
              height: height * .02,
            ),
             Customadd(
                onclick: (value) {},
                hint: 'enter data of birth',
                icon: Icons.date_range_outlined),
                SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter email of child',
                icon: Icons.email), SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {},
                hint: 'enter password of child',
                icon: Icons.lock),
            SizedBox(
              height: height * .09,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Builder(
                  builder: (context) => FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () {},
                      color: Colors.teal[300],
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
            ),
          ]),
        ));
  }
}
