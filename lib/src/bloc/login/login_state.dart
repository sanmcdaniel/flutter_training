import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class InitialLoginState extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginInValid extends LoginState {
  final String errorUsername;
  final String errorPassword;

  const LoginInValid({this.errorUsername, this.errorPassword});

  @override
  List<Object> get props => [errorUsername, errorPassword];

  @override
  String toString() =>
      'LoginInValid { errorUsername: $errorUsername , errorPassword: $errorPassword}';
}
