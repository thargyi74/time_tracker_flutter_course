import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'package:time_tracker_flutter_course/services/user.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          } else {
            return HomePage(
              auth: auth,
            ); // to do HomePage
          }
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
