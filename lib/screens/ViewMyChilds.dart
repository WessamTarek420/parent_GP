import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';
import 'package:parent_gp/screens/EDitchild.dart';
import 'package:parent_gp/screens/ViewChildGrade.dart';
import 'package:parent_gp/screens/pop.dart';
import 'package:parent_gp/service/store.dart';

class ViewMyChilds extends StatefulWidget {
  static String id = 'ViewMyChilds';

  @override
  _ViewMyChildsState createState() => _ViewMyChildsState();
}

class _ViewMyChildsState extends State<ViewMyChilds> {
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'children',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.teal[300],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadChildren(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<Child> children = [];
            for (var doc in snapShot.data.documents) {
              var data = doc.data();
              children.add(Child(
                  cId: doc.documentID,
                  fatherName: data[kfatherName],
                  motherName: data[kmotherName],
                  childName: data[kchildName],
                  schoolName: data[kschoolName],
                  childLocation: data[kchildLocation],
                  phone: data[kphone],
                  age: data[kage],
                  birthday: data[kbirthday],
                  email: data[kemail],
                  image: data[kimage]));
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewChildGrade(
                                children[index].email,
                                children[index].childName)))
                  },
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                          child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(children[index].image),
                      )),
                      Positioned(
                        bottom: 0,
                        child: Opacity(
                          opacity: .6,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    children[index].childName,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: children.length,
            );
          } else {
            return Center(child: Text('loading....'));
          }
        },
      ),
    );
  }
}
