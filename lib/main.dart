import 'package:bis_building/Color.dart';
import 'package:bis_building/Login/LoginScreen.dart';
import 'package:bis_building/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(getColorHexFromStr('#113E43')),
          accentColor: Color(getColorHexFromStr('#F6F6F6'))
      ),
      home: SplashScreen(),
    );
  }
}
