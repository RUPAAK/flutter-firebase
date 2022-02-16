import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});
  //collection ref
  final CollectionReference coffeeCollection =
      FirebaseFirestore.instance.collection('coffees');

  Future updateUserData(String sugars, String name, int strength) async {
    return await coffeeCollection
        .doc(uid)
        .set({"sugars": sugars, "name": name, "strength": strength});
  }

  //stream

  Stream<QuerySnapshot> get coffee {
    return coffeeCollection.snapshots();
  }
}
