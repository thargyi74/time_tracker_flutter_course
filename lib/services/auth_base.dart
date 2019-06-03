import 'package:time_tracker_flutter_course/services/user.dart';

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<User> signInWithFacebook();
  Future<User> signInWithGoogle();
  Future<void> signOut();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<User> createUserWithEmailAndPassword(String email, String password);
  Stream<User> get onAuthStateChanged;
}
