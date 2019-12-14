import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_flutter_krungsri/src/bloc/authen/authen_bloc.dart';
import 'package:training_flutter_krungsri/src/bloc/login/bloc.dart';
import 'package:training_flutter_krungsri/src/models/user.dart';
import 'package:training_flutter_krungsri/src/services/auth_service.dart';
import 'package:training_flutter_krungsri/src/services/network_service.dart';
import 'package:training_flutter_krungsri/src/utils/constant.dart';
import 'package:validators/validators.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      backgroundColor: Colors.blue,
      body: BlocProvider<LoginBloc>(
        create: (context) =>
            LoginBloc(authenBloc: BlocProvider.of<AuthenBloc>(context)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.all(30),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      print('Stateeeeeeee: ${state.toString()} ^^^^^^');
                      if (state is LoginFailure) {
                        showAlertDialog(error: state.error);
                      }
                    },
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return _buildForm(context, state);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildForm(BuildContext context, LoginState state) {
    return Form(
      key: _userForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            'assets/images/car-banner.jpg',
            fit: BoxFit.fitHeight,
          ),
          TextFormField(
            key: Key('_userName'),
            //validator: _userNameValidator,
            onSaved: (String value) {
              _user.username = value;
            },
            decoration: InputDecoration(
              errorText: state is LoginInValid ? state.errorUsername : null,
              hintText: 'Username: ',
              icon: Icon(Icons.email),
              labelText: 'Username',
            ),
          ),
          TextFormField(
            key: Key('_passWord'),
            //validator: _passwordValidator,
            onSaved: (String value) {
              _user.password = value;
            },
            obscureText: true,
            decoration: InputDecoration(
              errorText: state is LoginInValid ? state.errorPassword : null,
              hintText: 'Password: ',
              icon: Icon(Icons.lock),
              labelText: 'Password',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                _userForm.currentState.save();
                BlocProvider.of<LoginBloc>(context).add(Login(_user));
//                if (_userForm.currentState.validate()) {
//                  _userForm.currentState.save();
//                }
//                bool result = await AuthService().login(_user);
//                if (result) {
////                            Navigator.of(context).push(MaterialPageRoute(
////                                builder: (context) => MainPage()));
//                  Navigator.pushReplacementNamed(context, Constant.HOME_ROUTE);
//                } else {
//                  showAlertDialog(error: 'Username or Password incorrect!');
//                }
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.black54),
              ),
              color: Colors.yellow[500],
            ),
          ),
          Container(
            width: double.infinity,
            child: FlatButton(
              onPressed: () {},
              child: Text('Register'),
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void showAlertDialog({String error = "!!!"}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Titleeeee'),
          content: Text('Bodyyyyyyy'),
          actions: <Widget>[
            FlatButton(
              child: Text('=== ' + error + '==='),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
