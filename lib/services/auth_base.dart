import 'package:time_tracker_flutter_course/services/user.dart';

abstract class AuthBase {
  Future<User> currentUser();
  Future<User> signInAnonymously();
  Future<void> signOut();
  Future<User> signInWithGoogle();
  Future<User> signInWithFacebook();
  Stream<User> get onAuthStateChanged;
}
