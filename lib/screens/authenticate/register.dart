import 'package:buy_a_coffee/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  //Global Key object helps to Track the state of the form and
  //assigning a key to a Form helps to validate the form
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],

          //removes the drop shadow->no longer elevated off the screen
          elevation: 0.0,
          title: Text('Sign up to buy a coffee'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                // toggleView function declared inside widget not state object so this is possible
                widget.toggleView();
              },
              icon: Icon(Icons.person, color: Colors.white),
              label: Text("Sign In", style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Must have atleast 6 characters'
                          : null,
                      obscureText: true,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          //Validates the form based on the state of
                          //validators present in the text fields
                          if (_formkey.currentState.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'Please provide a valid email');
                            }
                          }
                        }),
                    // to display the error when valid email is not given
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ))));
  }
}
