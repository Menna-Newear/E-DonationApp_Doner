import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.onPressed});
  final String image, name;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
            ),
            const Gutter(),
            Text(
              name,
              style: FontsStyles.teststyle15,
            ),
          ],
        ),
      ),
    );
  }
}
