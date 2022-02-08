import 'package:coffee/auth/auth.dart';
import 'package:coffee/models/user.dart';
import 'package:coffee/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Auth _auth = Auth();
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
