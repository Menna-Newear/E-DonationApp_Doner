import 'package:e_donation_app_doner/screens/addDonation_screen.dart';
import 'package:e_donation_app_doner/screens/viewRequest_screen%20.dart';
import 'package:flutter/material.dart';

class DashboardButtonsModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonsModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonsModel> dashboardBtnList(BuildContext context) => [
        DashboardButtonsModel(
          text: "Add a new Donation",
          imagePath: "assets/images/donationIcon.png",
          onPressed: () {
            Navigator.pushNamed(
              context,
              AddDonationScreen.routeName,
            );
          },
        ),
        DashboardButtonsModel(
          text: "View Request",
          imagePath: "assets/images/BoxIcon1.png",
          onPressed: () {
            Navigator.pushNamed(
              context,
              ViewRequestScreen.routeName,
            );
          },
        ),
      ];
}
