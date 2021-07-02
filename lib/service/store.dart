

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addChild(Child child) {
    _firestore.collection(kchildInfo).doc(child.email).set({
      kchildName: child.childName,
      kage: child.age,
      kbirthday: child.birthday,
      kchildLocation: child.childLocation,
      kfatherName: child.fatherName,
      kmotherName: child.motherName,
      kphone: child.phone,
      kpassword: child.password,
      kemail: child.email,
      kimage: child.image,
    });
  }

  Stream<QuerySnapshot> loadChildren() {
    return _firestore.collection(kchildInfo).snapshots();
  }

  deletChild(DocumentId) {
    _firestore.collection(kchildInfo).document(DocumentId).delete();
  }

  editChild(data, DocumentId) {
    _firestore.collection(kchildInfo).document(DocumentId).updateData(data);
  }
}
