import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'user.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    final googleSignin = GoogleSignIn();
    await googleSignin.signOut();
    return await _firebaseAuth.signOut();
  }

/*  Future<User> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      GoogleSignInAuthentication googleAut = await googleUser.authentication;
      FirebaseUser user = await _firebaseAuth.signInWith3
      return _userFromFirebase(user);
    } else {
      throw StateError("Google Signin aborted");
    }
  }*/

  Future<User> signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        await _firebaseAuth.signInWithCredential(credential);
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _firebaseAuth.currentUser();
    assert(user.uid == currentUser.uid);

    if (currentUser != null) {
      return _userFromFirebase(currentUser);
    } else {
      throw StateError("Google Signin aborted");
    }
  }
}
