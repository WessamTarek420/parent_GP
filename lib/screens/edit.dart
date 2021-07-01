import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';
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
              ));
            }
            return ListView.builder(
              itemBuilder: (context, index) => Text(children[index].childName),
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
