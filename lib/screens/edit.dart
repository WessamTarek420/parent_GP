import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';
import 'package:parent_gp/screens/EDitchild.dart';
import 'package:parent_gp/screens/pop.dart';
import 'package:parent_gp/service/store.dart';

class EditChild extends StatefulWidget {
  static String id = 'EditChild';

  @override
  _EditChildState createState() => _EditChildState();
}

class _EditChildState extends State<EditChild> {
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
                  onTapUp: (details) {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dx2 = MediaQuery.of(context).size.width - dx;
                    double dy2 = MediaQuery.of(context).size.width - dy;
                    showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                        items: [
                          MyPopupMenuItem(
                            onClick: () {
                              _store.deletChild(children[index].cId);
                              Navigator.pop(context);
                            },
                            child: Text('Delete'),
                          ),
                          MyPopupMenuItem(
                            onClick: () {
                              Navigator.pushNamed(context, EditPRoduct.id,
                                  arguments: children[index]);
                            },
                            child: Text('Edite'),
                          )
                        ]);
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
