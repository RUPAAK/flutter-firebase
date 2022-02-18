import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/coffee.dart';
import 'package:coffee/screens/home/coffee-list.dart';
import 'package:coffee/screens/home/setting_form.dart';
import 'package:coffee/service/auth.dart';
import 'package:coffee/service/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Auth _auth = Auth();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _displaySettingPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Coffee>?>.value(
        value: DatabaseService().coffee,
        initialData: null,
        catchError: (_, __) {},
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              title: Text("Coffee"),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: [
                TextButton.icon(
                    onPressed: () async {
                      await _auth.signout();
                    },
                    icon: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Logout",
                      style: TextStyle(color: Colors.black),
                    )),
                TextButton.icon(
                    onPressed: () async {
                      _displaySettingPanel();
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    label: Text(
                      "",
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            body: CoffeeList(),
          );
        });
  }
}
