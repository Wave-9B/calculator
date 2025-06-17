import 'package:calculator/theme.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(16.0),
                child: Container(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 24,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Adicione opções de menu aqui
              ListTile(
                // Simple Calculator
                leading: Icon(Icons.calculate),
                title: Text(
                  Localizations.localeOf(context).languageCode == 'pt'
                      ? 'Calculadora'
                      : 'Simple Calculator',
                ),

                onTap: () {
                  // ação do menu
                  Navigator.pushReplacementNamed(context, '/calculator');
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                // length
                leading: Icon(Icons.straighten),
                title: Text(
                  Localizations.localeOf(context).languageCode == 'pt'
                      ? 'Conversor de Unidades'
                      : 'Unit Converter',
                ),

                onTap: () {
                  // ação do menu
                  Navigator.pushReplacementNamed(context, '/unit');
                },
              ),
              ListTile(
                // temperature
                leading: Icon(Icons.thermostat),
                title: Text(
                  Localizations.localeOf(context).languageCode == 'pt'
                      ? 'Temperatura'
                      : 'Temperature',
                ),

                onTap: () {
                  // ação do menu
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, '/temperature');
                },
              ),
              ListTile(
                // scientific calculator
                leading: Icon(Icons.science),
                title: Text(
                  Localizations.localeOf(context).languageCode == 'pt'
                      ? 'Calculadora Científica'
                      : 'Scientific Calculator',
                ),

                onTap: () {
                  // ação do menu
                  //Navigator.pop(context);
                  //await Future.delayed(const Duration(milliseconds: 100));
                  Navigator.pushReplacementNamed(context, '/scientific');
                },
              ),

              ListTile(
                // currency
                leading: Icon(Icons.currency_exchange),
                title: Text(
                  Localizations.localeOf(context).languageCode == 'pt'
                      ? 'Conversor de Moedas'
                      : 'Currency Converter',
                ),

                onTap: () {
                  // ação do menu
                  Navigator.pushReplacementNamed(context, '/currency');
                },
              ),
            ],
          ),
        ),
        ListTile(
          // about
          tileColor: Colors.transparent,
          leading: Icon(Icons.info),
          title: Text(
            Localizations.localeOf(context).languageCode == 'pt'
                ? 'Sobre'
                : 'About',
          ),

          onTap: () {
            // ação do menu
            Navigator.pushReplacementNamed(context, '/about');
          },
        ),
        SizedBox(
          height: 20, // Espaço entre o menu e o rodapé
        ),
      ],
    );
  }
}
