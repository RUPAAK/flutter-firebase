import 'package:coffee/screens/authenticate/register.dart';
import 'package:coffee/screens/authenticate/signin.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool displaySignIn = true;
  void togglePage() {
    setState(() {
      displaySignIn = !displaySignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (displaySignIn) {
      return SignIn(togglePage: togglePage);
    } else {
      return Register(togglePage: togglePage);
    }
  }
}
