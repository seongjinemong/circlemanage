import 'package:flutter/material.dart';
import 'package:circlemanage/login/create.dart';
import 'package:circlemanage/resource/dimen.dart';
import 'package:circlemanage/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'lib/assets/Logo_final.png',
                    width: 200,
                    height: 200,
                  ),
                  /*
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Text(
                      'Circle\nManage',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 50),
                    ),
                  ),
                  */
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.email),
                        //hintText: 'What do people call you?',
                        labelText: 'Email',
                      ),
                      onSaved: (String value) {
                        _email = value;
                      },
                      /*validator: (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.' : null;
                  },
                  */
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        //icon: Icon(Icons.lock),
                        //hintText: 'What do people call you?',
                        labelText: 'Password',
                      ),
                      onSaved: (String value) {
                        _password = value;
                      },
                      /*validator: (String value) {
                    return value.contains('@')
                        ? 'Do not use the @ char.' : null;
                  },
                  */
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: EdgeInsets.only(
                              right: 100, left: 100, top: 15, bottom: 15),
                          elevation: Dimen.elevation,
                          highlightElevation: Dimen.highlightelevation,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.blue,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          onPressed: () {
                            signIn();
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'No Account?',
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreatePage()));
                          },
                          child: Text("Create New",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
        setState(() {
          print("Error");
        });
      }
    }
  }
}
