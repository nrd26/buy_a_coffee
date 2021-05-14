import 'package:buy_a_coffee/screens/authenticate/authenticate.dart';
import 'package:buy_a_coffee/screens/authenticate/sign_in.dart';
import 'package:buy_a_coffee/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either Home or Authenticate based on whether user signed in or not
    return Container(
      child: SignIn(),
    );
  }
}
