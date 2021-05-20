import 'package:buy_a_coffee/models/brew.dart';
import 'package:buy_a_coffee/screens/home/brew_list.dart';
import 'package:buy_a_coffee/screens/home/settings_form.dart';
import 'package:buy_a_coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:buy_a_coffee/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      //shows bottom sheet
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    //Listening for Brew Lists
    return StreamProvider<List<Brew>>.value(
      // initialData: null,
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text("Buy a Coffee"),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _showSettingsPanel(),
            ),
            IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/coffee_bg.png'),
                    fit: BoxFit.cover)),
            child: BrewList()),
      ),
    );
  }
}
