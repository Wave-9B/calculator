// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AppColors {
//   static Color primaryColor = const Color.fromARGB(255, 159, 174, 209); // #21242B
//   static Color primaryAccent = const Color.fromARGB(255, 126, 143, 176); // #30343C
//   static Color secondaryColor = const Color.fromARGB(255, 156, 164, 202); // #16171C
//   static Color secondaryAccent = const Color.fromARGB(255, 156, 166, 197);
//   static Color titleColor = const Color.fromARGB(255, 59, 59, 59);
//   static Color textColor = const Color.fromARGB(255, 83, 83, 83);
//   static Color hintTextColor = const Color.fromARGB(115, 101, 101, 101);
//   static Color hiddenTextColor = const Color.fromARGB(51, 244, 244, 244);
//   static Color successColor = const Color.fromARGB(255, 5, 85, 62);
//   static Color highlightColor = const Color.fromARGB(255, 103, 74, 13);
//   //-----------------------------------------------------------------------
//    static Color appButtonsColor = Colors.grey.shade400; // cor de fundo dos botões
//   static Color calcNumberColor = const Color.fromARGB(221, 66, 66, 66);
//   static Color operandTextColor = const Color.fromARGB(255, 51, 65, 104);
//   static Color delClearTextColor = const Color.fromARGB(255, 95, 43, 21);
// }

// ThemeData myLightTheme = ThemeData(
//   //seed color
//   colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
//   brightness: Brightness.light,

//   //scaffold color
//   scaffoldBackgroundColor: AppColors.secondaryAccent,

//   // app bar theme colors
//   appBarTheme: AppBarTheme(
//     backgroundColor: AppColors.secondaryColor,
//     foregroundColor: AppColors.textColor,
//     surfaceTintColor: Colors.transparent,
//     centerTitle: true,
//     titleTextStyle: GoogleFonts.lato(
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//       color: AppColors.titleColor,
//     ),
//   ),

//   drawerTheme: DrawerThemeData(
//     backgroundColor: AppColors.secondaryAccent,
//     surfaceTintColor: Colors.transparent, // remove um avermelhado
//   ),

//   listTileTheme: ListTileThemeData(
//     textColor: AppColors.textColor,
//     iconColor: AppColors.textColor,
//     titleTextStyle: GoogleFonts.lato(
//       fontSize: 16,
//       color: AppColors.textColor,
//       fontWeight: FontWeight.w600,
//     ),

//     //tileColor: AppColors.secondaryColor.withValues(alpha: 0.5),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//   ),

//   textTheme: TextTheme(
//     bodyMedium: TextStyle(
//       color: AppColors.textColor,
//       fontSize: 16,
//       letterSpacing: 1,
//     ),
//     headlineMedium: TextStyle(
//       color: AppColors.titleColor,
//       fontSize: 16,
//       fontWeight: FontWeight.bold,
//       letterSpacing: 1,
//     ),
//     titleMedium: TextStyle(
//       color: AppColors.titleColor,
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//       letterSpacing: 2,
//     ),
//   ),

//   //Card Theme
//   cardTheme: CardThemeData(
//     color: AppColors.secondaryColor,
//     surfaceTintColor: Colors.transparent,
//     shape: const RoundedRectangleBorder(),
//     shadowColor: Colors.transparent,
//     margin: const EdgeInsets.only(bottom: 16),
//   ),

//   // input decoration theme
//   inputDecorationTheme: InputDecorationTheme(
//     filled: true,
//     fillColor: AppColors.secondaryColor,
//     border: InputBorder.none,
//     labelStyle: TextStyle(color: AppColors.textColor),
//     prefixIconColor: AppColors.textColor,
//   ),

//   // dialog theme
//   dialogTheme: DialogThemeData(
//     backgroundColor: AppColors.secondaryAccent,
//     surfaceTintColor: Colors.transparent, // remove um avermelhado
//   ),
// );
