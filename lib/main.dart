import 'package:calculator/routes/app_routes.dart';
import 'package:calculator/screens/calculator_screen.dart';
//import 'package:calculator/screens/temperature_screen.dart';
import 'package:calculator/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //return MaterialApp
      title: 'Calculator',
      // theme: ThemeData.dark(),
      theme: primaryTheme, //use the primary theme defined in theme.dart
      home: CalculatorScreen(),
      routes: AppRoutes.routes, //use the routes defined in app_routes.dart
    );
  }
}
