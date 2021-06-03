import 'dart:ffi';


import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;
  Future signUp(String email, String password) async {
    final authResult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }

  Future signIn(String email, String password) async {
    final authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult;
  }
  // ignore: deprecated_member_use

  // ignore: deprecated_member_use
  Future<FirebaseUser> getUser() async {
    final currentUser = await _auth.currentUser;
    return currentUser;
  }
  
  Future<Void> signOut() async {
    await _auth.signOut();
  }
}
