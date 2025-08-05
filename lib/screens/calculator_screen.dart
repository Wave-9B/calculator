import 'package:calculator/utils/calc_button_values.dart';
import 'package:calculator/themes/dark_theme.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String number1 = ''; // . 0-9
  String operand = ''; // + - * /
  String number2 = ''; // . 0-9
  String expressionDisplay = ''; // used to display the expression in the output

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    // Dessa maneira, deixamos o width dos botões dinamico, ficnado baum em qualquer tamanho de tela.
    // so that they fit the screen width.
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? "Calculadora Básica"
              : "Simple Calculator",
        ),
      ),
      drawer: const Drawer(
        child: AppDrawer(),
      ), // Add a drawer with the AppDrawer widget
      body: SafeArea(
        child: Column(
          children: [
            //output
            Expanded(
              child: SingleChildScrollView(
                // reverse is used to keep the text at the bottom of the screen
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end, // Aligns the text to the right
                    children: [
                      Text(
                        expressionDisplay,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        (number1.isEmpty && operand.isEmpty && number2.isEmpty)
                            ? "0"
                            : "$number1 $operand $number2",
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //buttons
            Wrap(
              children:
                  ScienceBtn.buttonValues
                      .map(
                        (value) => SizedBox(
                          width:
                              screenSize.width /
                              4, // Divide the width by 4 for 4 buttons per row
                          height:
                              screenSize.width /
                              5, // Make the height equal to the width for a square button
                          child: buildButton(value),
                        ),
                      )
                      .toList(),
            ),
            // const SizedBox(height: 50), // Add some space between buttons and output
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
        color: AppColors.appButtonsColor, // cor do fundo do botão
        // Clip.hardEdge ao clicar o botão, o feedback visual não sai do contorno dele
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(
            child: Text(
              value,
              style: getBtnTextStyle(
                value,
              ), // aqui muda formatação do texto da calculadora
            ),
          ),
        ),
      ),
    );
  }

  void onBtnTap(String value) {
    if (value == ScienceBtn.del) {
      delete();
      return;
    }

    if (value == ScienceBtn.clr) {
      clearAll();
      return;
    }
    if (value == ScienceBtn.per) {
      convertToPercentage();
      return;
    }
    if (value == ScienceBtn.plusMinus) {
      togglePlusMinus();
      return;
    }

    if (value == ScienceBtn.calculate) {
      calculate();
      return;
    }

    appendValue(value);
  }

  // calcula o resultado
  void calculate() {
    if (number1.isEmpty) return;
    if (operand.isEmpty) return;
    if (number2.isEmpty) return;

    final double num1 = double.parse(number1);
    final double num2 = double.parse(number2);
    var result = 0.0;

    expressionDisplay =
        "$number1 $operand $number2"; // update expressão p/ exibir o cálculo

    switch (operand) {
      case ScienceBtn.add:
        result = num1 + num2;

        break;
      case ScienceBtn.subtract:
        result = num1 - num2;
        break;
      case ScienceBtn.multiply:
        result = num1 * num2;
        break;
      case ScienceBtn.divide:
        if (num2 == 0) {
          // se o divisor for 0, não faz nada
          result = 0.0;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Color.fromARGB(156, 0, 0, 0),
              duration: Duration(seconds: 2),
              content: Text(
                textAlign: TextAlign.justify,
                "Cannot divide by zero.\nNão é possível dividir por zero.",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );

          return;
        }
        result = num1 / num2;
        break;
      default:
    }
    setState(() {
      number1 = "$result";

      if (number1.endsWith('.0')) {
        // remove the .0 from the end of the string
        number1 = number1.substring(0, number1.length - 2);
      }
      operand = '';
      number2 = '';
    });
  }

  // convert to percentage
  void convertToPercentage() {
    setState(() {
      if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
        // Transforma number2 em porcentagem de number1
        final n1 = double.tryParse(number1) ?? 0;
        final n2 = double.tryParse(number2) ?? 0;
        number2 = ((n1 * n2) / 100).toString();
        // Remove .0 se for inteiro
        if (number2.endsWith('.0')) {
          number2 = number2.substring(0, number2.length - 2);
        }
        return;
      }

      if (operand.isNotEmpty) {
        // se operand não está vazio, não dá pra converter number1
        return;
      }

      // Se só number1, transforma ele em porcentagem normal
      if (number1.isNotEmpty) {
        final number = double.tryParse(number1) ?? 0;
        number1 = (number / 100).toString();
        if (number1.endsWith('.0')) {
          number1 = number1.substring(0, number1.length - 2);
        }
        operand = '';
        number2 = '';
      }
    });
  }

  // clear all values
  void clearAll() {
    // Limpa todos os valores, para limpar, apenas deixamos as strings vazias
    number1 = '';
    operand = '';
    number2 = '';
    expressionDisplay = '';
    setState(() {
      // Atualiza o estado da tela para refletir as mudanças
    });
  }

  //delete last character
  void delete() {
    if (number2.isNotEmpty) {
      // if number2 is not empty, delete the last character of number2
      //apaga ultimo caracter de number2 | 12345 -> 1234
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      // if operand is not empty, delete the operand, no caso operand vira string vazia
      operand = '';
    } else if (number1.isNotEmpty) {
      // if number1 is not empty, delete the last character of number1
      //12345 -> 1234
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {
      // Atualiza o estado da tela para refletir as mudanças
    });
  }

  // acrescenta/anexa valor ao number1, operand e number2
  void appendValue(String value) {
    // Se for operador, já retorna como está
    if (value != ScienceBtn.dot && int.tryParse(value) == null) {
      if (operand.isNotEmpty && number2.isNotEmpty) {
        calculate();
      }
      operand = value;
    } else if (number1.isEmpty || operand.isEmpty) {
      // number1 logic
      if (value == ScienceBtn.dot && number1.contains(ScienceBtn.dot)) return;
      if (value == ScienceBtn.dot && (number1.isEmpty || number1 == ScienceBtn.n0)) {
        value = "0.";
      }
      // Evita múltiplos zeros à esquerda em number1
      if (value == ScienceBtn.n0 && (number1 == "" || number1 == "0")) return;
      if (number1 == "0" && value != ScienceBtn.dot) {
        number1 = value; // substitui o zero inicial
      } else {
        number1 += value;
      }
    } else if (number2.isEmpty || operand.isNotEmpty) {
      // number2 logic
      if (value == ScienceBtn.dot && number2.contains(ScienceBtn.dot)) return;
      if (value == ScienceBtn.dot && (number2.isEmpty || number2 == ScienceBtn.n0)) {
        value = "0.";
      }
      // Evita múltiplos zeros à esquerda em number2
      if (value == ScienceBtn.n0 && (number2 == "" || number2 == "0")) return;
      if (number2 == "0" && value != ScienceBtn.dot) {
        number2 = value; // substitui o zero inicial
      } else {
        number2 += value;
      }
    }
    setState(() {});
  }

  void togglePlusMinus() {
    setState(() {
      if (operand.isEmpty) {
        // Inverte o sinal de number1
        if (number1.isNotEmpty && number1 != "0") {
          if (number1.startsWith('-')) {
            number1 = number1.substring(1);
          } else {
            number1 = '-$number1';
          }
        }
      } else {
        // Inverte o sinal de number2
        if (number2.isNotEmpty && number2 != "0") {
          if (number2.startsWith('-')) {
            number2 = number2.substring(1);
          } else {
            number2 = '-$number2';
          }
        }
      }
    });
  }

  //--------------------------
  Color getBtnColor(value) {
    return [ScienceBtn.del, ScienceBtn.clr].contains(value)
        ? const Color.fromARGB(255, 66, 72, 158)
        : [
          ScienceBtn.per,
          ScienceBtn.multiply,
          ScienceBtn.add,
          ScienceBtn.subtract,
          ScienceBtn.divide,
          ScienceBtn.calculate,
          ScienceBtn.plusMinus,
        ].contains(value)
        ? const Color.fromARGB(255, 64, 77, 113)
        : Colors.black87;
  }

  Color getTextBtnColor(value) {
    return [ScienceBtn.del, ScienceBtn.clr].contains(value)
        ? AppColors.delClearTextColor
        : [
          ScienceBtn.per,
          ScienceBtn.multiply,
          ScienceBtn.add,
          ScienceBtn.subtract,
          ScienceBtn.divide,
          ScienceBtn.calculate,
          ScienceBtn.plusMinus,
        ].contains(value)
        ? AppColors.operandTextColor
        : AppColors.calcNumberColor;
  }

  TextStyle getBtnTextStyle(value) {
    return GoogleFonts.nunitoSans(
      fontSize:
          value == ScienceBtn.subtract ||
                  value == ScienceBtn.multiply ||
                  value == ScienceBtn.divide ||
                  value == ScienceBtn.add ||
                  value == ScienceBtn.calculate
              ? 32 // apenas subtract tem tamanho diferente
              : value == ScienceBtn.del ||
                  value == ScienceBtn.clr ||
                  value == ScienceBtn.per ||
                  value == ScienceBtn.plusMinus
              ? 24 // del e clr tem tamanho diferente
              : 28,
      color: getTextBtnColor(value), // aqui muda a cor do texto do botão
      fontWeight: FontWeight.bold, // aqui muda a espessura do texto do botão
    );
  }
}
