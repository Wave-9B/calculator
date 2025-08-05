import 'package:calculator/themes/dark_theme.dart';
import 'package:calculator/utils/scientific_calc_button_values.dart';
import 'package:calculator/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class ScientificScreen extends StatefulWidget {
  const ScientificScreen({super.key});

  @override
  State<ScientificScreen> createState() => _ScientificScreenState();
}

class _ScientificScreenState extends State<ScientificScreen> {
  String expression = '';
  String result = '';

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Localizations.localeOf(context).languageCode == 'pt'
              ? "Calculadora Científica (beta)"
              : "Scientific Calculator (beta)",
        ),
      ),
      drawer: const Drawer(child: AppDrawer()),
      body: SafeArea(
        child: Column(
          children: [
            // Output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        expression,
                        style: const TextStyle(
                          fontSize: 42,
                          color: Color.fromARGB(255, 214, 214, 214),
                        ),
                        textAlign: TextAlign.end,
                      ),
                      Text(
                        result.isEmpty ? "0" : result,
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Buttons
            Wrap(
              children:
                  ScienceBtn.scienceButtonValues
                      .map(
                        (value) => SizedBox(
                          width: screenSize.width / 5, // 5 por linha
                          height: screenSize.width / 7,
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
      padding: const EdgeInsets.all(6.0),
      child: Material(
        color: AppColors.appButtonsColor,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
        child: InkWell(
          onTap: () => onBtnTap(value),
          child: Center(child: Text(value, style: getBtnTextStyle(value))),
        ),
      ),
    );
  }

  void onBtnTap(String value) {
    setState(() {
      if (value == ScienceBtn.del) {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
        return;
      }
      if (value == ScienceBtn.clr) {
        expression = '';
        result = '';
        return;
      }
      if (value == ScienceBtn.calculate) {
        calculate();
        return;
      }
      // Adiciona valor ao expression
      expression += value;
    });
  }

  void calculate() {
    try {
      String exp = expression
          .replaceAll(ScienceBtn.multiply, '*')
          .replaceAll(ScienceBtn.divide, '/')
          .replaceAll(ScienceBtn.pi, 'pi')
          .replaceAll(ScienceBtn.e, 'e')
          .replaceAll(ScienceBtn.raiz, 'sqrt')
          .replaceAll(ScienceBtn.pow, '^')
          .replaceAll(ScienceBtn.fact, '!')
          .replaceAll(ScienceBtn.ln, 'ln')
          .replaceAll(ScienceBtn.log, 'log')
          .replaceAll(ScienceBtn.sin, 'sin')
          .replaceAll(ScienceBtn.cos, 'cos')
          .replaceAll(ScienceBtn.tan, 'tan')
          .replaceAll(ScienceBtn.sinh, 'sinh')
          .replaceAll(ScienceBtn.cosh, 'cosh')
          .replaceAll(ScienceBtn.tanh, 'tanh')
          .replaceAll(ScienceBtn.exp, 'exp')
          .replaceAll(ScienceBtn.abs, 'abs');

      Parser p = Parser();
      Expression expParsed = p.parse(exp);
      ContextModel cm = ContextModel();
      double eval = expParsed.evaluate(EvaluationType.REAL, cm);

      result = eval.toString();
      if (result.endsWith('.0')) {
        result = result.substring(0, result.length - 2);
      }
    } catch (e) {
      result = 'Erro';
    }
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
          ScienceBtn.pow,
          ScienceBtn.raiz,
          ScienceBtn.fact,
          ScienceBtn.ln,
          ScienceBtn.log,
          ScienceBtn.sin,
          ScienceBtn.cos,
          ScienceBtn.tan,
          ScienceBtn.sinh,
          ScienceBtn.cosh,
          ScienceBtn.tanh,
          ScienceBtn.exp,
          ScienceBtn.abs,
        ].contains(value)
        ? AppColors.operandTextColor
        : AppColors.calcNumberColor;
  }

  TextStyle getBtnTextStyle(value) {
    return GoogleFonts.nunitoSans(
      fontSize:
          [
                ScienceBtn.subtract,
                ScienceBtn.multiply,
                ScienceBtn.divide,
                ScienceBtn.add,
                ScienceBtn.calculate,
              ].contains(value)
              ? 28
              : [
                ScienceBtn.del,
                ScienceBtn.clr,
                ScienceBtn.per,
                ScienceBtn.plusMinus,
              ].contains(value)
              ? 22
              : 24,
      color: getTextBtnColor(value),
      fontWeight: FontWeight.bold,
    );
  }
}
