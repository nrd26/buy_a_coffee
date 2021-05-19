import 'package:flutter/material.dart';
import 'package:buy_a_coffee/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  //formkey for form
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

//form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            Text(
              'How would you like your coffee?',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              decoration: textInputDecoration,
              validator: (val) => val.isEmpty ? 'Please enter your name' : null,
              onChanged: (val) => setState(() => _currentName = val),
            ),
            // SizedBox(
            //   height: 20.0,
            // ),
            //DropDown
            DropdownButtonFormField(
              //for each item in sugars, display a test widget showing
              //no of sugars
              items: sugars.map((sugar) {
                return DropdownMenuItem(
                  value: sugar,
                  child: Text('$sugar sugar(s)'),
                );
              }).toList(),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Slider
            ElevatedButton(
                onPressed: () async {
                  print(_currentName);
                  print(_currentSugars);
                  print(_currentStrength);
                },
                child: Text(
                  'Submit',
                ))
          ],
        ));
  }
}
