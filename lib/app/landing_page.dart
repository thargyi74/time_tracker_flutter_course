import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'package:time_tracker_flutter_course/services/user.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkCurrentUser();
    widget.auth.onAuthStateChanged.listen((user) {
      print('User: ${user?.uid}');
    });
  }

  Future<void> _checkCurrentUser() async {
    User user = await widget.auth.currentUser();
    _updatedUser(user);
  }

  void _updatedUser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.hasData) if (_user == null) {
            return SignInPage(
              auth: widget.auth,
              onSignIn: _updatedUser,
            );
          } else {
            return HomePage(
              auth: widget.auth,
              onSignOut: () => _updatedUser(null),
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
