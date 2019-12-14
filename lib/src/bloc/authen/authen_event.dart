import 'package:equatable/equatable.dart';
import 'package:training_flutter_krungsri/src/models/user.dart';

abstract class AuthenEvent extends Equatable {
  const AuthenEvent();

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class AppStart extends AuthenEvent {}

class Logged extends AuthenEvent {
  final User user;
  Logged(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class Logout extends AuthenEvent {}
