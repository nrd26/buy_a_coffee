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
    return StreamProvider.value(
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
