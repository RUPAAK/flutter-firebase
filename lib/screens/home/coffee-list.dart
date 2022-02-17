import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoffeeList extends StatefulWidget {
  const CoffeeList({Key? key}) : super(key: key);

  @override
  _CoffeeListState createState() => _CoffeeListState();
}

class _CoffeeListState extends State<CoffeeList> {
  @override
  Widget build(BuildContext context) {
    //inside Widget to use context
    final coffees = Provider.of<List<Coffee>?>(context);
    if (coffees == null) {
      return Container();
    } else {
      coffees.forEach((element) {
        print(element.name);
        print(element.sugars);
        print(element.strength);
      });
      return Container();
    }
  }
}
