import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/Custom/Customadd.dart';
import 'package:parent_gp/service/auth.dart';
import 'package:parent_gp/service/store.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  static String id = 'ForgetPassword';

  final _auth = Auth();
  String email;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Forget password',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: Colors.teal[300],
        ),
        backgroundColor: Colors.teal[50],
        body: Form(
          key: globalKey,
          child: ListView(children: <Widget>[
            SizedBox(
              height: height * .03,
            ),
            Customadd(
                onclick: (value) {
                  email = value;
                },
                hint: 'enter your email',
                icon: Icons.email),
            SizedBox(
              height: height * .02,
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

                              _auth.forgetPassword(email);
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(e.toString()),
                            ));
                          }
                        },
                        color: Colors.teal[300],
                        child: Text(
                          'Send Request',
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
