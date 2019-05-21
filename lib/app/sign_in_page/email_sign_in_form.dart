import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  TextEditingController _email;
  TextEditingController _password;

  List<Widget> _buildChildren() {
    return [
      TextFormField(
        controller: _email,
        validator: (value) => (value.isEmpty) ? "Please Enter Email" : null,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email),
            labelText: "Email",
            border: OutlineInputBorder()),
      ),
      SizedBox(height: 8.0),
      TextFormField(
        controller: _password,
        obscureText: true,
        validator: (value) => (value.isEmpty) ? "Password" : null,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: "Password",
            border: OutlineInputBorder()),
      ),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: 'Sign in',
        onPressed: () {},
      ),
      SizedBox(height: 8.0),
      FlatButton(
        child: Text('Need an account? Register'),
        onPressed: () {},
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
