import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../themes/dark_theme.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hint;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key, // what is it? well, it is a key that is used to identify the widget in the widget tree
    required this.items,
    required this.value,
    required this.hint,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: AppColors.primaryAccent,
      hint: Text(hint, style: GoogleFonts.lato(color: AppColors.hintTextColor)),
      value: value,
      items:
          items.map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val, style: GoogleFonts.lato()),
            );
          }).toList(),
      onChanged: onChanged,
    );
  }
}
