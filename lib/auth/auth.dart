import 'package:coffee/models/user.dart';
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
