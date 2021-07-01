import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/Custom/Customadd.dart';
import 'package:parent_gp/model/child.dart';
import 'package:parent_gp/service/auth.dart';
import 'package:parent_gp/service/store.dart';

class AddChild extends StatelessWidget {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  static String id = 'AddChild';
  final _store = Store();
  final _auth = Auth();
  String childName,
      fatherName,
      motherName,
      schoolName,
      childLocation,
      phone,
      age,
      birthday,
      email,
      password,
      image;
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
                onclick: (value) {
                  childName = value;
                },
                hint: 'enter child name',
                icon: Icons.person),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                image = value;
                },
                hint: 'enter image',
                icon: Icons.image),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  fatherName = value;
                },
                hint: 'enter father name',
                icon: Icons.face),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  motherName = value;
                },
                hint: 'enter mother name',
                icon: Icons.face_outlined),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  schoolName = value;
                },
                hint: 'enter name of school',
                icon: Icons.location_city),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  phone = value;
                },
                hint: 'enter phone',
                icon: Icons.mobile_friendly),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  childLocation = value;
                },
                hint: 'enter your location',
                icon: Icons.location_history),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  age = value;
                },
                hint: 'enter age of child',
                icon: Icons.child_care),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  birthday = value;
                },
                hint: 'enter data of birth',
                icon: Icons.date_range_outlined),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  email = value;
                },
                hint: 'enter email of child',
                icon: Icons.email),
            SizedBox(
              height: height * .02,
            ),
            Customadd(
                onclick: (value) {
                  password = value;
                },
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
                        onPressed: () async {
                          try {
                            if (globalKey.currentState.validate()) {
                              globalKey.currentState.save();
                              await _auth.signUp(email, password);
                              _store.addChild(Child(
                                  childName: childName,
                                  fatherName: fatherName,
                                  motherName: motherName,
                                  schoolName: schoolName,
                                  childLocation: childLocation,
                                  phone: phone,
                                  age: age,
                                  birthday: birthday,
                                  email: email,
                                  password: password,
                                  image: image));
                            }
                          } catch (e) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                          }
                        },
                        color: Colors.teal[300],
                        child: Text(
                          'ADD Child',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ))),
              ),
            ),
          ]),
        ));
  }
}
