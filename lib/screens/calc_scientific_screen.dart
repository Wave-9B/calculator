import 'package:flutter/material.dart';
import 'package:calculator/widgets/app_drawer.dart';
//scientific calculator screen

class ScientificScreen extends StatefulWidget {
  const ScientificScreen({super.key});

  @override
  State<ScientificScreen> createState() => _ScientificScreenState();
}

class _ScientificScreenState extends State<ScientificScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? 'Calculadora Científica'
              : 'Scientific Calculator',
        ),
      ),
      drawer: const Drawer(child: AppDrawer()),
      body: Center(
        child: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? 'Tela de Calculadora Científica \n (Em desenvolvimento)'
              : 'Scientific Calculator Screen \n (Under development)',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
