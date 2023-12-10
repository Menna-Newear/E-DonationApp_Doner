import 'package:e_donation_app_doner/constants/appColors.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(
      {required bool isPrimaryTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isPrimaryTheme
          ? AppColors.kSecondaryScafoldColor
          : AppColors.kprimaryScaffoldColor,
      cardColor: isPrimaryTheme
          ? const Color.fromARGB(255, 13, 6, 37)
          : AppColors.kPrimaryFontColor,
      brightness: isPrimaryTheme ? Brightness.dark : Brightness.light,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isPrimaryTheme ? Colors.white : Colors.black,
        ),
        backgroundColor: isPrimaryTheme
            ? AppColors.kSecondaryScafoldColor
            : AppColors.kprimaryScaffoldColor,
        titleTextStyle: isPrimaryTheme
            ? const TextStyle(color: Colors.white)
            : const TextStyle(color: Colors.black),
        elevation: 0,
        centerTitle: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isPrimaryTheme ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: isPrimaryTheme ? Colors.white : Colors.black,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.error,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
