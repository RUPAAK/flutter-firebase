import 'package:coffee/auth/auth.dart';
import 'package:coffee/models/user.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Coffee"),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () async {
            OurUser response = await _auth.signupAnnom();
            if (response == null)
              print("Failed To Signin");
            else {
              print("Success");
              print(response.uid);
            }
          },
          child: Text("Signin"),
        ),
      ),
    );
  }
}
