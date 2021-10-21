import 'package:flutter/material.dart';
import 'package:onixtest/ui/my_router.dart';
import 'package:onixtest/import_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

/// flutter run lib/main.dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => WeatherBloc(),
          child: const MyRouter(),
        ));
  }
}
