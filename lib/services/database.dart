import 'package:buy_a_coffee/models/brew.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference in firestore datavase
  //Note: If collection doesn't exist in firestore database then
  //firestore will create it automatically for you
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

//Takes user's uid associated with FirebaseUser and associates that to
//a document in firestore which stores the user's preferences for coffee
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .document(uid)
        .setData({'sugars': sugars, 'name': name, 'strength': strength});
    //'firestore parameter': value got from user
  }

  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    //each doc in snapshot documents
    return snapshot.documents.map((doc) {
      return Brew(
          // If name not given then return empty string
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugars: doc.data['sugars'] ?? '0');
    }).toList();
  }

  //Creates a stream for the brews which returns the brew
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
