import 'package:equatable/equatable.dart';

abstract class AuthenState extends Equatable {
  const AuthenState();
  @override
  List<Object> get props => [];
}

class InitialAuthenState extends AuthenState {}

class LoadingAuthenState extends AuthenState {}

class AuthenticatedState extends AuthenState {}

class UnAuthenticatedState extends AuthenState {}
