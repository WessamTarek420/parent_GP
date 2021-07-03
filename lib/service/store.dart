import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';
import 'package:parent_gp/model/father.dart';

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
      femail: father.email,
    });
  }

  Stream<QuerySnapshot> loadChildren() {
    return _firestore
        .collection(kchildInfo)
        .where('fatherEmail', isEqualTo: father.email)
        .snapshots();
  }

  deletChild(DocumentId) {
    _firestore.collection(kchildInfo).document(DocumentId).delete();
  }

  editChild(data, DocumentId) {
    _firestore.collection(kchildInfo).document(DocumentId).updateData(data);
  }

  Stream<QuerySnapshot> loadChildGrades(String email) {
    print("maaail " + email);
    _firestore
        .collection(kchildInfo)
        .doc(email)
        .collection('grades')
        .snapshots();
  }
}
