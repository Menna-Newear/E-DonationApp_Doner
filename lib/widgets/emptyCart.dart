import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.subTitle,
      required this.bottonLabel});
  final String imagePath, title, subTitle, bottonLabel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Center(
                child: Image.asset(
              imagePath,
              height: size.height * 0.3,
              scale: 0.5,
            )),
          ),
          const Text("Oooops", style: FontsStyles.teststyle38),
          Text(title, style: FontsStyles.teststyle28),
          const GutterTiny(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(subTitle,
                style: FontsStyles.teststyle17
                    .copyWith(fontWeight: FontWeight.w400)),
          ),
          const GutterLarge(),
        ],
      ),
    );
  }
}
