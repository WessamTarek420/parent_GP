import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/model/father.dart';
import 'package:parent_gp/screens/ViewMyChilds.dart';
import 'package:parent_gp/screens/addChild.dart';
import 'package:parent_gp/screens/edit.dart';
import 'package:parent_gp/screens/navigator_drawer.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    father.email = FirebaseAuth.instance.currentUser.email;
    return Scaffold(
        drawer: NavigationDrawerWidget(),
        backgroundColor: Colors.teal[50],
        appBar: AppBar(
          backgroundColor: Colors.teal[300],
          title: Text(
            'KIDO',
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.teal[300],
                onPressed: () {
                  Navigator.pushNamed(context, AddChild.id);
                },
                child: Text(
                  'Add Child',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.teal[300],
                onPressed: () {
                  Navigator.pushNamed(context, EditChild.id);
                },
                child: Text(
                  'Edit child information',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.teal[300],
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ViewMyChilds()));
                },
                child: Text(
                  'View grade',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ));
  }
}
