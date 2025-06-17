import 'package:calculator/screens/about_screen.dart';
import 'package:calculator/screens/calc_scientific_screen.dart';
import 'package:calculator/screens/calculator_screen.dart';
import 'package:calculator/screens/currency_screen.dart';
import 'package:calculator/screens/temperature_screen.dart';
import 'package:calculator/screens/unit_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/calculator': (context) => CalculatorScreen(),
    '/unit': (context) => const UnitScreen(),
    '/scientific': (context) => const ScientificScreen(),
    '/temperature': (context) => const TemperatureScreen(),
    '/currency': (context) => const CurrencyScreen(),
    '/about': (context) => const AboutScreen(),
  };
}
// essa classe armazena todas as rotas (telas) do app