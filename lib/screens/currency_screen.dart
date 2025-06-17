import 'package:calculator/widgets/app_drawer.dart';
//import 'package:calculator/widgets/custom_converter_screen.dart';
import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  List<String> currenciesList = ['USD', 'BRL', 'CAD'];
  String inputCurrencieValue = '';
  String outputCurrencieValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? 'Conversor de Moedas'
              : 'Currencie Converter',
        ),
      ),
      drawer: const Drawer(child: AppDrawer()),
      body: Center(
        child: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? 'Tela de Conversor de Moedas\n (Em desenvolvimento)'
              : 'Currencie converter screen\n (Under development)',
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );

    // CustomConverterScreen(
    //   title: "Currency Conversion",
    //   dropdownOptionsList: currenciesList,
    //   inputCurrentValue: inputCurrencieValue,
    //   outputCurrentValue: outputCurrencieValue,
    //   inputValue: inputValue,
    //   outputValue: outputValue,
    //   onInputValueChanged: onInputValueChanged,
    //   onOutputValueChanged: onOutputValueChanged,
    //   onExchangeValues: onExchangeValues,
    //   buildButton: buildButton,
    //   buttonValues: buttonValues,
    //   drawer: drawer,
    // );
  }
}
