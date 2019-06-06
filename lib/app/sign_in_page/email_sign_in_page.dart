import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/email_sign_in_form.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(auth: auth),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
