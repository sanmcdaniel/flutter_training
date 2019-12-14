import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:training_flutter_krungsri/src/bloc/authen/authen_bloc.dart';
import 'package:training_flutter_krungsri/src/bloc/authen/authen_event.dart';
import 'package:training_flutter_krungsri/src/models/user.dart';
import 'package:validators/validators.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenBloc authenBloc;
  LoginBloc({this.authenBloc});

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      try {
        final username = event.user.username;
        final password = event.user.password;

        String errorUsername;
        String errorPassword;

        if (username.isEmpty) {
          errorUsername = 'Empty username';
        } else if (!isEmail(username)) {
          errorUsername = 'Username must be in Email format.';
        }

        if (password.isEmpty) {
          errorPassword = 'Empty password';
        } else if (password.length < 8) {
          errorPassword = 'Password length must longer than 8 characters.';
        }

        if (errorUsername == null && errorPassword == null) {
          var user = User();
          user.username = username;
          user.password = password;
          authenBloc.add(Logged(user));
          yield InitialLoginState();
        } else {
          yield LoginInValid(
              errorUsername: errorUsername, errorPassword: errorPassword);
        }
      } on Exception catch (e) {
        // TODO
        print('Error in Login Bloc ______ 3333: ' + e.toString());
        yield LoginFailure(error: e.toString());
      }
    }
  }
}
