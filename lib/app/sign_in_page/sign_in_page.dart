import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';

class SignInPage extends StatelessWidget {
  Future<void> _signInWithAnonymously(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInAnonymously();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signInWithFacebook();
    } catch (e) {
      print(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
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
            onPressed: () => _signInWithFacebook(context),
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () => _signInWithGoogle(context),
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            color: Colors.teal[700],
            text: 'Sign in With email.',
            textColor: Colors.white,
            onPressed: () => _signInWithEmail(context),
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
            onPressed: () => _signInWithAnonymously(context),
          ),
        ],
      ),
    );
  }
}
