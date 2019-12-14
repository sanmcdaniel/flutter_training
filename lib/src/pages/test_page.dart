import 'package:flutter/material.dart';
import 'package:training_flutter_krungsri/src/models/user.dart';
import 'package:validators/validators.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  User _user;
  var _userForm = GlobalKey<FormState>();

  @override
  void initState() {
    _user = User();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/c4c-hero-banner.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              bottom: 100.0,
              left: 10.0,
              right: 10.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: _userNameValidator,
                        onSaved: (String value) {
                          _user.username = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Username: ',
                          icon: Icon(Icons.email),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: _passwordValidator,
                        onSaved: (String value) {
                          _user.password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password: ',
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 30.0,
              left: 10.0,
              right: 10.0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                      color: Colors.yellow[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  Container(
                    width: 150.0,
                    height: 50.0,
                    child: RaisedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onPressed: () {},
                      color: Colors.red[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _userNameValidator(String value) {
  if (value.isEmpty) {
    return 'Empty username';
  }
  if (!isEmail(value)) {
    return 'Username must be in Email format.';
  }
  return null;
}

String _passwordValidator(String value) {
  if (value.isEmpty) {
    return 'Empty password';
  }
  if (value.length < 8) {
    return 'Password length must longer than 8 characters.';
  }
  return null;
}
