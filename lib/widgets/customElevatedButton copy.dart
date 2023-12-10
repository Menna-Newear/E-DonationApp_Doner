import 'package:e_donation_app_doner/providers/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key,
      required this.labelText,
      required this.icon,
      required this.onPressed});
  final String labelText;
  final Icon icon;
  final void Function() onPressed;
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        onPressed: onPressed,
        icon: icon,
        label: Text(
          labelText,
          style: themeProvider.getIsPrimaryTheme
              ? const TextStyle(
                  color: Colors.white,
                )
              : const TextStyle(color: Colors.black),
        ));
  }
}
