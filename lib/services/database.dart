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

  //Creates a stream for the brews which returns a snapshot of data
  //change everytime the user changes data
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
