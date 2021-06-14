import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/Custom/CustomTextField.dart';
import 'package:parent_gp/screens/Loginscreen.dart';
import 'package:parent_gp/screens/adminHome.dart';
import 'package:parent_gp/service/auth.dart';



class SignUpScreen extends StatelessWidget {
  static String id = 'SignUpScreen';
  final _auth = Auth();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  String _email, _password;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal[300],
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/10.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: width,
            height: height,
            child: Form(
              key: globalKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage('images/3.png')),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * .05),
                  CustomTextField(
                      onclick: (value) {},
                      hint: 'enter your name',
                      icon: Icons.person),
                  SizedBox(height: height * .02),
                  CustomTextField(
                      onclick: (value) {
                        _email = value;
                      },
                      hint: 'enter your email',
                      icon: Icons.email),
                  SizedBox(height: height * .02),
                  CustomTextField(
                      onclick: (value) {
                        _password = value;
                      },
                      hint: 'enter your password',
                      icon: Icons.lock),
                  SizedBox(height: height * .06),
                  Container(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Builder(
                        builder: (context) => FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () async {
                              if (globalKey.currentState.validate()) {
                                globalKey.currentState.save();
                                try {
                                 final authresult =
                                     await _auth.signUp(_email, _password);
                                       Navigator.pushNamed(context, AdminHome.id);
                                } catch (e) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(e.toString()),
                                  ));
                                }
                              }
                            },
                            color: Colors.teal[300],
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(height: height * .03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {},
                          child: Image(
                            image: AssetImage("images/f.png"),
                          )),
                      SizedBox(width: width * .20),
                      GestureDetector(
                          onTap: () {
                            
                          },
                          child: Image(
                            image: AssetImage("images/g.png"),
                          )),
                    ],
                  ),
                  SizedBox(height: height * .05),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(' have an account?'),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoginScreen.id);
                            },
                            child: Text('Sign In',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ))),
                      ])
                ],
              ),
            ),
          ),
        ));
  }
}
