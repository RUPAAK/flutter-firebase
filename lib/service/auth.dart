import 'dart:developer';

import 'package:coffee/models/user.dart';
import 'package:coffee/service/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebaseuser
  OurUser? _userFromFirebaseUser(User user) {
    return user != null ? OurUser(uid: user.uid) : null;
  }

  Future signupAnnom() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print("Failed to signupannom");
      print(e);
    }
  }

  Future signUpEmailPass(String email, String pass) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData('0', "Latest Member", 100);
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print("Failed to signup");
      print(e);
    }
  }

  Future signInEmailPass(String email, String pass) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print("Failed to signup");
      print(e);
      return null;
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Falied to logout");
      print(e);
    }
  }

  Stream<OurUser?> get user {
    return _auth
        .authStateChanges()
        .map((eachUser) => _userFromFirebaseUser(eachUser!));
    // .map(_userFromFirebaseUser);
  }
}
