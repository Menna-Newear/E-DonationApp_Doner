import 'package:e_donation_app_doner/constants/appConstants.dart';
import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:e_donation_app_doner/models/homeModel.dart';
import 'package:e_donation_app_doner/widgets/HomeScreenWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/Home Screen';

  get name => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home",
          style: FontsStyles.teststyle17,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppConstant.logo),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.pushNamed(context, AddDonationScreen.routeName,
      //               arguments: name);
      //         },
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             GestureDetector(
      //               onTap: () => Navigator.pushNamed(
      //                   context, AddDonationScreen.routeName),
      //               child: const HomeScreenWidget(
      //                 image: 'assets/images/donationIcon1.png',
      //                 name: 'Add New Donation',
      //               ),
      //             ),
      //             const SizedBox(
      //               width: 50,
      //             ),
      //             GestureDetector(
      //               onTap: () => Navigator.pushNamed(
      //                   context, ViewRequestScreen.routeName),
      //               child: const HomeScreenWidget(
      //                 image: 'assets/images/BoxIcon.png',
      //                 name: '   View All Requests',
      //               ),
      //             ),
      //           ],
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        children: List.generate(
          2,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: HomeScreenWidget(
              image: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .imagePath,
              name: DashboardButtonsModel.dashboardBtnList(context)[index].text,
              onPressed: DashboardButtonsModel.dashboardBtnList(context)[index]
                  .onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
