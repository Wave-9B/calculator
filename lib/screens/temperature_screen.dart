import 'package:calculator/themes/dark_theme.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:calculator/widgets/custom_converter_screen.dart';
import 'package:calculator/utils/custom_button_values.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  String? currentInputTemp; // current input temperature unit
  String? currentOutputTemp; // current output temperature unit
  String tempInNumber = ''; // input temperature value as a string
  String tempOutNumber = ''; // output temperature value as a string

  final List<String> temperatureList = ['Celsius', 'Fahrenheit', 'Kelvin'];

  @override
  void initState() {
    super.initState();
    currentInputTemp = temperatureList[0];
    currentOutputTemp = temperatureList[1];
  }

  @override
  Widget build(BuildContext context) {
    return CustomConverterScreen(
      title: 'Temperature Converter',
      dropdownOptionsList: temperatureList,
      inputCurrentValue: currentInputTemp,
      outputCurrentValue: currentOutputTemp,
      inputValue: tempInNumber,
      outputValue: tempOutNumber,
      drawer: Drawer(child: AppDrawer()),
      onInputValueChanged: (newValue) {
        setState(() {
          currentInputTemp = newValue;
          convertTemps();
        });
      },
      onOutputValueChanged: (newValue) {
        setState(() {
          currentOutputTemp = newValue;
          convertTemps();
        });
      },
      onExchangeValues: () {
        setState(() {
          final temp = currentInputTemp;
          currentInputTemp = currentOutputTemp;
          currentOutputTemp = temp;
          convertTemps();
        });
      },
      buildButton: buildButton,
      buttonValues: CustomBtn.temperatureButtonValues,
    );
  }

  void convertTemps() {
    if (tempInNumber.isEmpty ||
        currentInputTemp == null ||
        currentOutputTemp == null) {
      tempOutNumber = '';
      return;
    }
    double value = double.tryParse(tempInNumber) ?? 0.0;
    double result = value;

    // Celsius conversion
    if (currentInputTemp == 'Celsius') {
      if (currentOutputTemp == 'Fahrenheit') {
        result = value * 9 / 5 + 32;
      } else if (currentOutputTemp == 'Kelvin') {
        result = value + 273.15;
      }
    }
    // Fahrenheit conversion
    else if (currentInputTemp == 'Fahrenheit') {
      if (currentOutputTemp == 'Celsius') {
        result = (value - 32) * 5 / 9;
      } else if (currentOutputTemp == 'Kelvin') {
        result = (value - 32) * 5 / 9 + 273.15;
      }
    }
    // Kelvin conversion
    else if (currentInputTemp == 'Kelvin') {
      if (currentOutputTemp == 'Celsius') {
        result = value - 273.15;
      } else if (currentOutputTemp == 'Fahrenheit') {
        result = (value - 273.15) * 9 / 5 + 32;
      }
    }

    tempOutNumber = result
        .toStringAsFixed(2)
        .replaceFirst(RegExp(r'\.?0+$'), '');
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: AppColors.appButtonsColor,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: InkWell(
          onTap: () {
            setState(() {
              if (value == CustomBtn.del) {
                if (tempInNumber.isNotEmpty) {
                  tempInNumber = tempInNumber.substring(
                    0,
                    tempInNumber.length - 1,
                  );
                }
              } else if (value == CustomBtn.clr) {
                tempInNumber = '';
                tempOutNumber = '';
              } else if (value == CustomBtn.dot && tempInNumber.contains('.')) {
                return;
              } else if (value == CustomBtn.plusMinus) {
                if (currentInputTemp == 'Kelvin') {
                  // Kelvin cannot be negative, so we do not allow plus/minus
                  return;
                } else if (tempInNumber.startsWith('-')) {
                  tempInNumber = tempInNumber.substring(1); //
                } else if (tempInNumber.isNotEmpty) {
                  tempInNumber = '-$tempInNumber'; //
                }
              } else {
                tempInNumber += value;
              }
              convertTemps();
            });
          },
          child: Center(
            child:
                value == CustomBtn.del || value == CustomBtn.clr
                    ? Icon(
                      value == CustomBtn.del
                          ? Icons.backspace_outlined
                          : Icons.clear_all,
                      size: 28,
                      color: getTextBtnColor(value),
                    )
                    : value == CustomBtn.dot
                    ? Text(value, style: getBtnTextStyle(value))
                    : Text(value, style: getBtnTextStyle(value)),
          ),
        ),
      ),
    );
  }

  TextStyle getBtnTextStyle(value) {
    return GoogleFonts.nunitoSans(
      fontSize:
          value == CustomBtn.del || value == CustomBtn.clr
              ? 24
              : value == CustomBtn.exchange
              ? 24 // tamanho da fonte do texto do botão
              : 28, // tamanho da fonte do texto do botão
      color: getTextBtnColor(value), // cor do texto do botão
      fontWeight: FontWeight.bold, // peso da fonte do texto do botão
    );
  }

  Color getTextBtnColor(value) {
    return [CustomBtn.del, CustomBtn.clr].contains(value)
        ? AppColors.delClearTextColor
        : [CustomBtn.plusMinus].contains(value)
        ? AppColors.operandTextColor
        : AppColors.calcNumberColor;
  }
}
