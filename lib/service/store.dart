import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:parent_gp/const.dart';
import 'package:parent_gp/model/child.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addChild(Child child) {
    _firestore.collection(kchildInfo).add({
      kchildName: child.childName,
      kage: child.age,
      kbirthday: child.birthday,
      kchildLocation: child.childLocation,
      kfatherName: child.fatherName,
      kmotherName: child.motherName,
      kphone: child.phone,
      kpassword: child.password,
      kemail: child.email,
      kimage:child.image,
    });
  }

 /* Future<List<Child>> loadChildren() async {
    var snapShot = await _firestore.collection(kchildInfo).getDocuments();
    List<Child> childern=[];
    for(var doc in snapShot.documents)
    {
       var data = doc.data;
       //childern.add(Child(age: data[kage]));
    }
    return childern;
  }*/
  Stream<QuerySnapshot> loadChildren(){
    return _firestore.collection(kchildInfo).snapshots();
  }
}
