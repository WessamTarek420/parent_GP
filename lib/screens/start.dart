import 'package:flutter/material.dart';
import 'package:parent_gp/screens/Loginscreen.dart';
import 'package:parent_gp/screens/SignUp.dart';
class Start extends StatelessWidget {
  static String id = 'Start';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Image(
                image: AssetImage('images/3.png'),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 90),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WHERE KIDS LOVE LEARNING',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                        /* Text('Distant Learning&home Schooling Made Easy'),*/
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Distant Learning&home Schooling Made Easy',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          /* Text('Distant Learning&home Schooling Made Easy'),*/
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topCenter,
                  child:
                   FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () { Navigator.pushNamed(context, SignUpScreen.id);},
                        color:Colors.teal[300],
                        child: Text(
                          "Start Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )), ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already a member?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                 GestureDetector(
                   onTap: (){Navigator.pushNamed(context, LoginScreen.id);},
                                  child: Text(
                    'SIGN IN',
                  ),
                )
              ],
            )
          ],
        ));
  }
}
