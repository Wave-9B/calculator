import 'package:calculator/theme.dart';
import 'package:calculator/utils/custom_button_values.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:calculator/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnitScreen extends StatefulWidget {
  const UnitScreen({super.key});

  @override
  State<UnitScreen> createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  List<String> unitInList = [
    'Kilometers',
    'Meters',
    'Centimeters',
    'Millimeters',
    'Miles',
    'Yards',
    'Feet',
    'Inches',
  ];
  List<String> unitOutList = [
    'Kilometers',
    'Meters',
    'Centimeters',
    'Millimeters',
    'Miles',
    'Yards',
    'Feet',
    'Inches',
  ];
  String? currentInputUnit;
  String? currentOuputUnit;
  String unitInNumber = '';
  String unitOutNumber = '';

  static const Map<String, double> toMeters = {
    'Kilometers': 1000.0,
    'Meters': 1.0,
    'Centimeters': 0.01,
    'Millimeters': 0.001,
    'Miles': 1609.34,
    'Yards': 0.9144,
    'Feet': 0.3048,
    'Inches': 0.0254,
  };

  @override
  void initState() {
    super.initState();
    // Inicialize input and output with default values
    currentInputUnit = unitInList[0]; // Default to Kilometers
    currentOuputUnit = unitOutList[4]; // Default to Miles
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? 'Unidades de Medida'
              : 'Units of Measurement',
        ),
      ),
      drawer: const Drawer(child: AppDrawer()),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Expanded(
              child: SingleChildScrollView(
                // reverse is used to keep the text at the bottom of the screen
                reverse: true,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // input field for unitInList
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenSize.width / 4,
                                height: screenSize.width / 4,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                  child: Text(
                                    unitInNumber.isEmpty ? '0' : unitInNumber,

                                    style: TextStyle(fontSize: 60),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              //Text('km', style: TextStyle(fontSize: 15)),
                              CustomDropdown(
                                items: unitInList,
                                value: currentInputUnit,
                                hint:
                                    Localizations.localeOf(
                                              context,
                                            ).languageCode ==
                                            'pt'
                                        ? 'Sel. unidade'
                                        : 'Select a unit',
                                onChanged: (newValue) {
                                  setState(() {
                                    currentInputUnit = newValue;
                                    convertUnits(); // Recalculate on unit change
                                  });
                                },
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 0,
                              ), // ? not good for text alignment
                              Text('=', style: TextStyle(fontSize: 48)),
                              SizedBox(
                                height: 56,
                              ), // ? not good for text alignment
                              //SizedBox(height: 45,)
                            ],
                          ),
                          // output field for unitOutList
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: screenSize.width / 4,
                                height: screenSize.width / 4,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.center,
                                  child: Text(
                                    unitOutNumber.isEmpty ? '0' : unitOutNumber,
                                    style: TextStyle(fontSize: 60),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              CustomDropdown(
                                items: unitOutList,
                                value: currentOuputUnit,
                                hint:
                                    Localizations.localeOf(
                                              context,
                                            ).languageCode ==
                                            'pt'
                                        ? 'Sel. unidade'
                                        : 'Select a unit',
                                onChanged: (newValue) {
                                  setState(() {
                                    currentOuputUnit = newValue;
                                    convertUnits(); // Recalculate on unit change
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Output field for unitOutList
                    ],
                  ),
                ),
              ),
            ),
            Wrap(
              children:
                  CustomBtn.unitButtonValues
                      .map(
                        (value) => SizedBox(
                          width:
                              (CustomBtn.n0 == value || value == CustomBtn.dot)
                                  ? screenSize.width / 2
                                  : screenSize.width / 4,
                          height: screenSize.width / 5,
                          child: buildButton(value),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        //color: getBtnColor(value), //aqui muda cor do fundo do botão
        color: Colors.black87, // cor do fundo do botão
        // Clip.hardEdge ao clicar o botão, o feedback visual não sai do contorno dele
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
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
                    : value == CustomBtn.exchange
                    ? Icon(
                      Icons.swap_horiz,
                      size: 32,
                      color: getTextBtnColor(value),
                    )
                    : value == CustomBtn.dot
                    ? Text(value, style: getBtnTextStyle(value))
                    : // caso seja um número, exibe o número
                    Text(value, style: getBtnTextStyle(value)),
          ), // texto do botão
        ),
      ),
    );
  }

  void onBtnTap(value) {
    // print('Button pressed: $value');
    switch (value) {
      case CustomBtn.del:
        _removeLastDigit();
        break;
      case CustomBtn.clr:
        _clearAll();
        break;
      case CustomBtn.exchange:
        // Swap input and output units
        String? temp = currentInputUnit;
        currentInputUnit = currentOuputUnit;
        currentOuputUnit = temp;
        // Clear the input number to force recalculation
        double oldUnitInNumber = double.tryParse(unitInNumber) ?? 0.0;
        unitOutNumber = oldUnitInNumber.toString();
        // unitInNumber = '';
        // unitOutNumber = '';
        break;
      case CustomBtn.dot:
        _appendValue('.');
        break;
      default:
        _appendValue(value);
    }
    convertUnits();

    setState(() {});
  }

  void convertUnits() {
    if (unitInNumber.isEmpty ||
        currentInputUnit == null ||
        currentOuputUnit == null) {
      unitOutNumber = '';
      //setState(() {});
      return;
    }
    double value = double.tryParse(unitInNumber) ?? 0.0;
    double valueInMeters = value * toMeters[currentInputUnit]!;
    double result = valueInMeters / toMeters[currentOuputUnit]!;

    unitOutNumber = result
        .toStringAsFixed(5)
        .replaceFirst(RegExp(r'\.?0+$'), '');
    // setState(() {});
  }

  void _removeLastDigit() {
    if (unitInNumber.isNotEmpty) {
      unitInNumber = unitInNumber.substring(0, unitInNumber.length - 1);
    }
  }

  void _clearAll() {
    unitInNumber = '';
    unitOutNumber = '';
  }

  void _appendValue(value) {
    if (value == CustomBtn.dot && unitInNumber.contains('.')) {
      // Prevent multiple dots
      return;
    }
    unitInNumber += value;
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
        : [CustomBtn.exchange].contains(value)
        ? AppColors.operandTextColor
        : AppColors.calcNumberColor;
  }
}
