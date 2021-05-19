import 'package:buy_a_coffee/services/auth.dart';
import 'package:buy_a_coffee/shared/constants.dart';
import 'package:buy_a_coffee/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],

              //removes the drop shadow->no longer elevated off the screen
              elevation: 0.0,
              title: Text('Sign in to buy a coffee'),
              actions: <Widget>[
                TextButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person, color: Colors.white),
                  label:
                      Text("New User?", style: TextStyle(color: Colors.white)),
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
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              (!val.contains("@") || !val.contains(".com"))
                                  ? 'Enter a valid email'
                                  : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (val) => val.length < 6
                              ? 'Must have atleast 6 characters'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                            // color: Colors.pink[400],
                            child: Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                //If sign in is successful then show loading widget
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.signInWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    loading = false;
                                    error =
                                        'Could not sign in with those credentials';
                                  });
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
