import 'package:buy_a_coffee/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
            backgroundColor: Colors.brown[400],

            //removes the drop shadow->no longer elevated off the screen
            elevation: 0.0,
            title: Text('Sign in to buy a coffee')),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: RaisedButton(
              child: Text('Sign in anonymomusly'),
              onPressed: () async {
                dynamic result = await _auth.sigInAnon();
                if (result == null) {
                  print('Error signing in');
                } else {
                  print('Signed in');
                  print(result.uid);
                }
              }),
        ));
  }
}
