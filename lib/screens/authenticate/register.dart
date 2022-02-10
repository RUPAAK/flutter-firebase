import 'package:coffee/auth/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function togglePage;

  const Register({Key? key, required this.togglePage}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: Text("Signup"),
        actions: [
          TextButton.icon(
              onPressed: () {
                widget.togglePage();
              },
              icon: Icon(Icons.person),
              label: Text("Signin"))
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
              onPressed: () async {},
              child: Text(
                "Signup",
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
