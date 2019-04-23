import 'dart:async';

import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'package:time_tracker_flutter_course/services/user.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.auth, @required this.onSignIn});

  final Function(User) onSignIn;
  final AuthBase auth;

  Future<void> _signInWithAnonymously() async {
    try {
      User user = await auth.signInAnonymously();
      onSignIn(user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 35,
              letterSpacing: 1.0,
              color: Colors.teal,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 48.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            color: Colors.teal[700],
            text: 'Sign in With email.',
            textColor: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            text: 'Go anonymous',
            textColor: Colors.black,
            color: Colors.lime[300],
            onPressed: _signInWithAnonymously,
          ),
        ],
      ),
    );
  }

  void _signInWithGoogle() {
    // TODO: Write Code to Google Authentication
  }
}
