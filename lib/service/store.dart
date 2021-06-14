
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addChild(Child child) {
    _firestore.collection(kchildInfo).add({
      kchildName: child.childName,
      kage:child.age,
      kbirthday:child.birthday,
      kchildLocation:child.childLocation,
      kfatherName:child.fatherName,
      kmotherName:child.motherName,
      kphone:child.phone,
      kpassword:child.password,
      kemail:child.email,
      
    });
  }
}