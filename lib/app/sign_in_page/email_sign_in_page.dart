import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/email_sign_in_bloc.dart';
import 'package:time_tracker_flutter_course/app/sign_in_page/email_sign_in_form_bloc_based.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';

class EmailSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: _buildEmailSignInFormStateless(context),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildEmailSignInFormStateless(BuildContext context) {
    final AuthBase auth = Provider.of<AuthBase>(context);
    return StatefulProvider<EmailSignInBloc>(
      valueBuilder: (context) => EmailSignInBloc(auth: auth),
      child: Consumer<EmailSignInBloc>(
        builder: (context, bloc) => EmailSignInFormBlocBased(
              bloc: bloc,
            ),
      ),
      onDispose: (context, bloc) => bloc.dispose(),
    );
  } //StateFull Provider
}
