import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_flutter_krungsri/src/bloc/BlocDelegate.dart';
import 'package:training_flutter_krungsri/src/my_app.dart';
import 'package:bloc/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  BlocSupervisor.delegate = SimpleBlocDelegate();

  return runApp(MyApp());
}
