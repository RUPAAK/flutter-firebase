import 'package:cloud_firestore/cloud_firestore.dart';
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
    final coffees = Provider.of<QuerySnapshot?>(context);

    for (var doc in coffees!.docs) {
      print(doc.data());
    }

    return Container();
  }
}
