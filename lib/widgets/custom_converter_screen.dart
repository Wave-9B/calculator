import 'package:calculator/theme.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_dropdown.dart';

class CustomConverterScreen extends StatelessWidget {
  final String title;
  final List<String> dropdownOptionsList;
  final String? inputCurrentValue;
  final String? outputCurrentValue;
  final String inputValue;
  final String outputValue;
  final ValueChanged<String?> onInputValueChanged;
  final ValueChanged<String?> onOutputValueChanged;
  final VoidCallback onExchangeValues;
  final Widget Function(dynamic) buildButton;
  final List<dynamic> buttonValues;

  final Drawer drawer;

  const CustomConverterScreen({
    super.key,
    required this.title,
    required this.dropdownOptionsList,
    required this.inputCurrentValue,
    required this.outputCurrentValue,
    required this.inputValue,
    required this.outputValue,
    required this.onInputValueChanged,
    required this.onOutputValueChanged,
    required this.onExchangeValues,
    required this.buildButton,
    required this.buttonValues,
    required this.drawer, // Default drawer if not provided
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      drawer: drawer, // Replace with your AppDrawer widget if needed
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: SingleChildScrollView(
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
                          // Input field
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
                                    inputValue.isEmpty ? '0' : inputValue,
                                    style: TextStyle(
                                      fontSize: 60,
                                      color:
                                          inputValue.isEmpty
                                              ? AppColors.hiddenTextColor
                                              : AppColors.calcNumberColor,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              CustomDropdown(
                                items: dropdownOptionsList,
                                value: inputCurrentValue,
                                hint: 'Select a unit',
                                onChanged: onInputValueChanged,
                              ),
                            ],
                          ),
                          // Equal sign and exchange button
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.swap_horiz_rounded,
                                  size: 40,
                                  color: AppColors.operandTextColor.withValues(
                                    alpha: 0.8,
                                  ),
                                ),
                                onPressed: onExchangeValues,
                              ),
                              const Text('=', style: TextStyle(fontSize: 48)),
                            ],
                          ),
                          // Output field
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
                                    outputValue.isEmpty ? '0' : outputValue,
                                    style: TextStyle(
                                      fontSize: 60,
                                      color:
                                          outputValue.isEmpty
                                              ? AppColors.hiddenTextColor
                                              : AppColors.calcNumberColor,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              CustomDropdown(
                                items: dropdownOptionsList,
                                value: outputCurrentValue,
                                hint: 'Select a unit',
                                onChanged: onOutputValueChanged,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Wrap(
              children:
                  buttonValues
                      .map(
                        (value) => SizedBox(
                          width:
                              (value == '0' || value == '.')
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
}
