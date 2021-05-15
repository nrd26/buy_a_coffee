import 'package:buy_a_coffee/models/user.dart';
import 'package:buy_a_coffee/screens/authenticate/authenticate.dart';
import 'package:buy_a_coffee/screens/authenticate/sign_in.dart';
import 'package:buy_a_coffee/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Access the user object that is made available due to streamprovider
    // in main.dart
    final user = Provider.of<User>(context);
    print(user);

    //return either Home or Authenticate based on whether user signed in or not
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
