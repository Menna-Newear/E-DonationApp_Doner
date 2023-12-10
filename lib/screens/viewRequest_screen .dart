import 'package:e_donation_app_doner/constants/appConstants.dart';
import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:flutter/material.dart';

class ViewRequestScreen extends StatelessWidget {
  const ViewRequestScreen({super.key});
  static const routeName = '/ViewRequestScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "ALL Request",
          style: FontsStyles.teststyle17,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppConstant.logo),
        ),
      ),
      body: const Column(
        children: [Text("Hello World")],
      ),
    );
  }
}
