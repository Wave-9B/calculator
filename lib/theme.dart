import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static Color primaryColor = const Color.fromRGBO(33, 36, 43, 1); // #21242B
  static Color primaryAccent = const Color.fromRGBO(48, 52, 60, 1); // #30343C
  static Color secondaryColor = const Color.fromRGBO(22, 23, 28, 1); // #16171C
  static Color secondaryAccent = const Color.fromRGBO(30, 32, 38, 1);
  static Color titleColor = const Color.fromRGBO(200, 200, 200, 1);
  static Color textColor = const Color.fromARGB(255, 215, 215, 215);
  static Color hintTextColor = const Color.fromARGB(115, 244, 244, 244);
  static Color hiddenTextColor = const Color.fromARGB(51, 244, 244, 244);
  static Color successColor = const Color.fromRGBO(9, 149, 110, 1);
  static Color highlightColor = const Color.fromARGB(255, 255, 185, 30);
  //-----------------------------------------------------------------------
  static Color calcNumberColor = const Color.fromARGB(221, 244, 244, 244);
  static Color operandTextColor = const Color.fromARGB(255, 122, 157, 255);
  static Color delClearTextColor = const Color.fromARGB(255, 221, 100, 48);
}

ThemeData primaryTheme = ThemeData(
  //seed color
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),

  //scaffold color
  scaffoldBackgroundColor: AppColors.secondaryAccent,

  // app bar theme colors
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryColor,
    foregroundColor: AppColors.textColor,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: GoogleFonts.lato(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.titleColor,
    ),
  ),

  drawerTheme: DrawerThemeData(
    backgroundColor: AppColors.secondaryAccent,
    surfaceTintColor: Colors.transparent, // remove um avermelhado
  ),

  listTileTheme: ListTileThemeData(
    textColor: AppColors.textColor,
    iconColor: AppColors.textColor,
    titleTextStyle: GoogleFonts.lato(
      fontSize: 16,
      color: AppColors.textColor,
      fontWeight: FontWeight.w600,
    ),

    //tileColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.textColor,
      fontSize: 16,
      letterSpacing: 1,
    ),
    headlineMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      letterSpacing: 1,
    ),
    titleMedium: TextStyle(
      color: AppColors.titleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      letterSpacing: 2,
    ),
  ),

  //Card Theme
  cardTheme: CardTheme(
    color: AppColors.secondaryColor.withValues(alpha: 0.5),
    surfaceTintColor: Colors.transparent,
    shape: const RoundedRectangleBorder(),
    shadowColor: Colors.transparent,
    margin: const EdgeInsets.only(bottom: 16),
  ),

  // input decoration theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.secondaryColor.withValues(alpha: 0.5),
    border: InputBorder.none,
    labelStyle: TextStyle(color: AppColors.textColor),
    prefixIconColor: AppColors.textColor,
  ),

  // dialog theme
  dialogTheme: DialogTheme(
    backgroundColor: AppColors.secondaryAccent,
    surfaceTintColor: Colors.transparent, // remove um avermelhado
  ),
);
