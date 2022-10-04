// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class User {
//
//   final String uid;
//
//   User({required this.uid});
// }
// class AuthBase{
// User _userFromFirebase(User user){
//   return User(uid: user.uid);
// }
// Future<User>registerWithEmailAndPasssword(String email,String password)async{
//   final authResult=await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email, password: password);
//
//  return _userFromFirebase(authResult.user);
// }
//
// Future<User>loginWithEmailAndPassword(String email,String password)async{
//   final authResult=await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email, password: password);
//
//   return _userFromFirebase(authResult.user);
// }
// Future<void>logout()async{
//   await FirebaseAuth.instance.signOut();
// }
//
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUse {
  final String uid;

 FirebaseUse({required this.uid});
}

class AuthBase {
 FirebaseUse? _userFromFirebase( user) {
    return user != null ? FirebaseUse(uid: user.uid) : null;
  }

  Future<FirebaseUse?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential= await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(UserCredential.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUse?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(UserCredential.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}