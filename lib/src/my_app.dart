import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_flutter_krungsri/src/bloc/authen/authen_bloc.dart';
import 'package:training_flutter_krungsri/src/pages/favorite_page.dart';
import 'package:training_flutter_krungsri/src/pages/login_page.dart';
import 'package:training_flutter_krungsri/src/pages/main_page.dart';
import 'package:training_flutter_krungsri/src/pages/test_page.dart';
import 'package:training_flutter_krungsri/src/services/auth_service.dart';
import 'package:training_flutter_krungsri/src/themes/app_dark_theme.dart';
import 'package:training_flutter_krungsri/src/themes/app_theme.dart';
import 'package:training_flutter_krungsri/src/utils/constant.dart';

import 'bloc/authen/authen_event.dart';
import 'bloc/authen/authen_state.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _route = <String, WidgetBuilder>{
    Constant.HOME_ROUTE: (context) => MainPage(),
    Constant.LOGIN_ROUTE: (context) => LoginPage(),
    Constant.TEST_ROUTE: (context) => TestPage(),
    Constant.FAVORITE_ROUTE: (context) => FavoritePage(),
  };

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;
    return BlocProvider<AuthenBloc>(
      create: (context) => AuthenBloc()..add(AppStart()),
      child: MaterialApp(
        routes: _route,
        debugShowCheckedModeBanner: false,
        theme: appTheme(isIOS: isIOS),
        darkTheme: appDarkTheme(isIOS: isIOS),
        title: 'App name when minimize',
//        home: FutureBuilder(
//            future: AuthService().isLogin(),
//            builder: (context, snapshot) {
//              //snapshot is the output of AuthService().isLogin() ASYNC
//              if (snapshot.hasData) {
//                if (snapshot.data == true) {
//                  return MainPage();
//                }
//                return LoginPage();
//              }
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            }),
        home: BlocBuilder<AuthenBloc, AuthenState>(
          builder: (context, state) {
            if (state is AuthenticatedState) {
              return MainPage();
            }
            if (state is UnAuthenticatedState) {
              return LoginPage();
            }
            if (state is LoadingAuthenState) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return Container(
              child: Center(
                child: FlutterLogo(
                  size: 150.0,
                  colors: Colors.red,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
