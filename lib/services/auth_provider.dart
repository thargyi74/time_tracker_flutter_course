import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/services/auth_base.dart';

class AuthProvider extends InheritedWidget {
  AuthProvider({@required this.auth, @required this.child});
  final AuthBase auth;
  final Widget child;

  // final auth = AuthProvider.of(context);
  static AuthBase of(BuildContext context) {
    AuthProvider provider = context.inheritFromWidgetOfExactType(AuthProvider);
    return provider.auth;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
