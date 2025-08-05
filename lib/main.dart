import 'package:calculator/routes/app_routes.dart';
import 'package:calculator/screens/calculator_screen.dart';
import 'package:calculator/themes/dark_theme.dart';
//import 'package:calculator/themes/ligth_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Widget mainScreen = CalculatorScreen();
    return MaterialApp(
      //return MaterialApp
      title: 'Calculator',
      theme: primaryTheme, // this uses the primary theme defined in theme.dart
      home: mainScreen,
      routes: AppRoutes.routes, //use the routes defined in app_routes.dart
    );
  }
}
