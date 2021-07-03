import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/screens/EDitchild.dart';

import 'package:parent_gp/screens/SignUp.dart';
import 'package:parent_gp/screens/addChild.dart';
import 'package:parent_gp/screens/adminHome.dart';
import 'package:parent_gp/screens/edit.dart';
import 'package:parent_gp/screens/forgetpassword.dart';
import 'package:parent_gp/screens/ViewChildGrade.dart';

import 'screens/Loginscreen.dart';
import 'screens/start.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Start.id,
      routes: {
        Start.id: (context) => Start(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        AdminHome.id: (context) => AdminHome(),
        AddChild.id: (context) => AddChild(),
        EditChild.id: (context) => EditChild(),
        Showchild.id: (context) => Showchild(),
        ForgetPassword.id: (context) => ForgetPassword(),
      },
    );
  }
}
