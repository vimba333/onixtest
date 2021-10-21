import 'package:flutter/material.dart';
import 'package:onixtest/ui/screen/weather_screen.dart';
import 'package:onixtest/ui/screen/setting_screen.dart';

var weatherSctreen = "/weather";
var settingSctreen = "/setting";

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: weatherSctreen,
      routes: {
        weatherSctreen: (BuildContext context) => const WeatherScreen(),
        settingSctreen: (BuildContext context) => const SettingScreen()
      },
    );
  }
}
