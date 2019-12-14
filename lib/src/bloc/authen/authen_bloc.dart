import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:training_flutter_krungsri/src/services/auth_service.dart';
import './bloc.dart';

class AuthenBloc extends Bloc<AuthenEvent, AuthenState> {
  var authenService = AuthService();

  @override
  AuthenState get initialState => InitialAuthenState();

  @override
  Stream<AuthenState> mapEventToState(
    AuthenEvent event,
  ) async* {
    switch (event.runtimeType) {
      case AppStart:
        yield* _mapAppStartToState();
        break;
      case Logged:
        yield* _mapLoggedToState(event);
        break;
      case Logout:
        yield* _mapLogoutToState();
        break;
    }
//    if (event is AppStart) {
//      //todo
//      var result = await authenService.isLogin();
//      if (result) {
//        yield AuthenticatedState();
//      } else {
//        yield UnAuthenticatedState();
//      }
//    } else if (event is Logged) {
//      //todo
//      var result = await authenService.login(event.user);
//      if (result) {
//        yield AuthenticatedState();
//      } else {
//        yield UnAuthenticatedState();
//      }
//    } else if (event is Logout) {
//      //todo
//      await authenService.logout();
//      yield UnAuthenticatedState();
//    }
  }

  Stream<AuthenState> _mapAppStartToState() async* {
    var result = await authenService.isLogin();
    if (result) {
      yield AuthenticatedState();
    } else {
      yield UnAuthenticatedState();
    }
  }

  Stream<AuthenState> _mapLoggedToState(Logged event) async* {
    yield LoadingAuthenState();
    try {
      var result = await authenService.login(event.user);
      if (result) {
        yield AuthenticatedState();
      } else {
        yield UnAuthenticatedState();
      }
    } on Exception catch (e) {
      // TODO
      print('Error WOIIIII: ' + e.toString());
      //return error to LOGGING server here
    }
  }

  Stream<AuthenState> _mapLogoutToState() async* {
    await authenService.logout();
    yield UnAuthenticatedState();
  }
}
