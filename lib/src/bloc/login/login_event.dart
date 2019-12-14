import 'package:equatable/equatable.dart';
import 'package:training_flutter_krungsri/src/models/user.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Login extends LoginEvent {
  final User user;
  Login(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];

  @override
  String toString() {
    return "Username: ${user.username}, Password: ${user.password}";
  }
}
