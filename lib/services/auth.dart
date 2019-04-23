import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'user.dart';

class Auth implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get onAuthStateChanged {
    return _firebaseAuth.onAuthStateChanged.map(_userFromFirebase);
  }

  User _userFromFirebase(FirebaseUser user) =>
      (user == null) ? null : User(uid: user.uid);

  Future<User> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return _userFromFirebase(user);
  }

  Future<User> signInAnonymously() async {
    FirebaseUser user = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
