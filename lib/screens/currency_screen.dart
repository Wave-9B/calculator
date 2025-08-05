// import 'package:calculator/themes/dark_theme.dart';
// import 'package:calculator/utils/custom_button_values.dart';
// import 'package:calculator/widgets/app_drawer.dart';
// import 'package:calculator/widgets/custom_converter_screen.dart';
// //import 'package:calculator/widgets/custom_converter_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CurrencyScreen extends StatefulWidget {
//   const CurrencyScreen({super.key});

//   @override
//   State<CurrencyScreen> createState() => _CurrencyScreenState();
// }

// class _CurrencyScreenState extends State<CurrencyScreen> {
//   List<String> currenciesList = ['USD', 'BRL', 'CAD'];
//   String? currentInCurrencie; // current input currencie
//   String? currentOutCurrencie;
//   String inputDisplayValue = ''; // this is just the display
//   String outputDisplayValue = '';

//   @override
//   void initState() {
//     super.initState();
//     currentInCurrencie = currenciesList[0];
//     currentOutCurrencie = currenciesList[1];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomConverterScreen(
//       title: "Currency Conversion",
//       dropdownOptionsList: currenciesList,
//       inputCurrentValue: currentInCurrencie,
//       outputCurrentValue: currentOutCurrencie,
//       inputValue: inputDisplayValue,
//       outputValue: outputDisplayValue,
//       onInputValueChanged: (newValue) {
//         setState(() {
//           currentInCurrencie = newValue;
//           convertCurrencies();
//         });
//       },
//       onOutputValueChanged: (newValue) {
//         setState(() {
//           currentOutCurrencie = newValue;
//           convertCurrencies();
//         });
//       },
//       onExchangeValues: () {
//         setState(() {
//           final currencie = currentInCurrencie;
//           currentInCurrencie = currentOutCurrencie;
//           currentOutCurrencie = currencie;
//           convertCurrencies();
//         });
//       },
//       buildButton: buildButton,
//       buttonValues: CustomBtn.unitButtonValues,
//       drawer: Drawer(child: AppDrawer()),
//     );
//   }

//   void convertCurrencies() {
//     if (inputDisplayValue.isEmpty ||
//         currentInCurrencie == null ||
//         currentOutCurrencie == null) {
//       outputDisplayValue = '';
//       return;
//     }
//     double value = double.tryParse(inputDisplayValue) ?? 0.0;
//     double result = value;

//     // BRL conversion
//     if (currentInCurrencie == "BRL") {
//       if (currentOutCurrencie == "USD") {
//         result = 1;
//       } else if (currentOutCurrencie == "CAD") {
//         result = 2;
//       }
//     }

//     // USD conversion
//     if (currentInCurrencie == "USD") {
//       if (currentOutCurrencie == "BRL") {
//         result = 1;
//       } else if (currentOutCurrencie == "CAD") {
//         result = 2;
//       }
//     }
//     // CAD conversion
//     if (currentInCurrencie == "CAD") {
//       if (currentOutCurrencie == "USD") {
//         result = 1;
//       } else if (currentOutCurrencie == "BRL") {
//         result = 2;
//       }
//     }
//   }

//   Widget buildButton(value) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Material(
//         //color: getBtnColor(value), //aqui muda cor do fundo do botão
//         color: Colors.black87, // cor do fundo do botão
//         // Clip.hardEdge ao clicar o botão, o feedback visual não sai do contorno dele
//         clipBehavior: Clip.hardEdge,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(80.0),
//         ),
//         child: InkWell(
//           onTap: () => (value),
//           child: Center(
//             child:
//                 value == CustomBtn.del || value == CustomBtn.clr
//                     ? Icon(
//                       value == CustomBtn.del
//                           ? Icons.backspace_outlined
//                           : Icons.clear_all,
//                       size: 28,
//                       color: getTextBtnColor(value),
//                     )
//                     : value == CustomBtn.exchange
//                     ? Icon(
//                       Icons.swap_horiz,
//                       size: 32,
//                       color: getTextBtnColor(value),
//                     )
//                     : value == CustomBtn.dot
//                     ? Text(value, style: getBtnTextStyle(value))
//                     : // caso seja um número, exibe o número
//                     Text(value, style: getBtnTextStyle(value)),
//           ), // texto do botão
//         ),
//       ),
//     );
//   }

//   TextStyle getBtnTextStyle(value) {
//     return GoogleFonts.nunitoSans(
//       fontSize:
//           value == CustomBtn.del || value == CustomBtn.clr
//               ? 24
//               : value == CustomBtn.exchange
//               ? 24 // tamanho da fonte do texto do botão
//               : 28, // tamanho da fonte do texto do botão
//       color: getTextBtnColor(value), // cor do texto do botão
//       fontWeight: FontWeight.bold, // peso da fonte do texto do botão
//     );
//   }

//   Color getTextBtnColor(value) {
//     return [CustomBtn.del, CustomBtn.clr].contains(value)
//         ? AppColors.delClearTextColor
//         : [CustomBtn.exchange].contains(value)
//         ? AppColors.operandTextColor
//         : AppColors.calcNumberColor;
//   }
// }
