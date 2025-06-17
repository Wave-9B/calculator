import 'package:calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            Localizations.localeOf(context).languageCode == 'pt'
                ? 'Este é um aplicativo de calculadora simples construído com Flutter.\n\n'
                    'Versão 0.1.0\n\n'
                    'Eduardo Brenga\n@wave9b\n© 2025 '
                : 'This is a simple calculator app built with Flutter.\n\n'
                    'Version 0.1.0\n\n'
                    'Eduardo Brenga\n@wave9b\n© 2025 ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
