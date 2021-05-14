import 'package:buy_a_coffee/models/user.dart';
import 'package:buy_a_coffee/screens/wrapper.dart';
import 'package:buy_a_coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Listens to the auth stream which returns user data. Stream Provider makes the stream available to all its descendants
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Buy a Coffee',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Wrapper(),
      ),
    );
  }
}
