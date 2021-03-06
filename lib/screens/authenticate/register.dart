import 'package:coffee/service/auth.dart';
import 'package:coffee/shared/constants.dart';
import 'package:coffee/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function togglePage;

  const Register({Key? key, required this.togglePage}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final Auth _auth = Auth();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  String email = "";
  String pass = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
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
          key: _formKey,
          child: Column(children: [
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: "Email"),
              validator: (val) => val!.isEmpty ? "Enter a email" : null,
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
              decoration: textInputDecoration.copyWith(hintText: "Pass"),
              obscureText: true,
              validator: (val) => val!.length < 6 ? "Enter valid pass" : null,
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
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                  dynamic result = await _auth.signUpEmailPass(email, pass);
                  if (result == null) {
                    setState(() {
                      loading = false;
                    });
                    setState(() {
                      error = "Please supply valid email";
                    });
                  }
                }
              },
              child: Text(
                "Signup",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[400],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14.0),
            )
          ]),
        )),
      ),
    );
  }
}
