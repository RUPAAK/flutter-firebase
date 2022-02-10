import 'package:coffee/auth/auth.dart';
import 'package:coffee/models/user.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function togglePage;

  SignIn({Key? key, required this.togglePage}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Auth _auth = Auth();

  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Signin"),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.togglePage();
              },
              icon: Icon(Icons.person),
              label: Text("Register"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
            child: Form(
          child: Column(children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  pass = value;
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                print(email);
                print(pass);
              },
              child: Text(
                "Signin",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
              ),
            )
          ]),
        )),
      ),
    );
  }
}
