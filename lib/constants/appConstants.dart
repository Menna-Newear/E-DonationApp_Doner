import 'package:flutter/material.dart';

class AppConstant {
  static const String logo = "assets/images/logo4.png";
  static const String sadPerson = "assets/images/persons/sad_person.png";
  static const String person =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFLYtxj-tne8GF3mErRrfyPwjRAr2VIkV5Ou0GWd8&s";
  static List<String> categoriesList = [
    'Phones',
    'Clothes',
    'Beauty',
    'Shoes',
    'Funiture',
    'Watches',
  ];

  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItems =
        List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
      (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(
          categoriesList[index],
        ),
      ),
    );
    return menuItems;
  }
}
