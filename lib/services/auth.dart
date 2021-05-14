import 'package:buy_a_coffee/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //creating a firebase auth object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on firebase user. Returns null if user signs out and user uid if user signs in
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // If any auth change occurs in the stream then it returns null if user signs out otherwise returns user uid
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  //sign in anonymously
  //Asynchronous function in Dart
  Future sigInAnon() async {
    try {
      //Use an Auth result object to store result of signInAnonymously()

      AuthResult result = await _auth.signInAnonymously();
      //result has a user object which we return
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
  //sign in with email and password

  //register with email and password

  //sign out

}
