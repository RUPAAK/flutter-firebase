import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee/models/coffee.dart';
import 'package:coffee/models/user.dart';

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

  // list
  List<Coffee> _coffeeListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Coffee(
          name: doc.get('name') ?? '',
          sugars: doc.get('sugars') ?? '0',
          strength: doc.get('strength') ?? 0);
    }).toList();
  }

  UserData _userDataFromSnapShot(DocumentSnapshot snapshot) {
    return UserData(
        uid: uid!,
        name: snapshot.get('name') ?? '',
        sugars: snapshot.get('sugars') ?? '',
        strength: snapshot.get('strength') ?? 0);
  }
  //stream

  Stream<List<Coffee>> get coffee {
    return coffeeCollection.snapshots().map(_coffeeListFromSnapshot);
  }

  //user doc

  Stream<UserData> get userData {
 
    return coffeeCollection.doc(uid).snapshots().map(_userDataFromSnapShot);
  }
}
