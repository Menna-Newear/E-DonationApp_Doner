import 'package:e_donation_app_doner/constants/appConstants.dart';
import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:e_donation_app_doner/providers/themeProvider.dart';
import 'package:e_donation_app_doner/widgets/auth/login.dart';
import 'package:e_donation_app_doner/widgets/customAlertDialogMethod%20copy.dart';
import 'package:e_donation_app_doner/widgets/customElevatedButton%20copy.dart';
import 'package:e_donation_app_doner/widgets/customProfileImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: FontsStyles.teststyle17,
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AppConstant.logo),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*  const CustomAppBar(
              iconImage: Icon(Icons.arrow_back),
              label: "Profile",
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),*/

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  CustomProfileImage(),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Menna Newear",
                        style: FontsStyles.teststyle17,
                      ),
                      Text(
                        "mennanewear@gmail.com",
                        style: FontsStyles.teststyle13,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    style: FontsStyles.teststyle15,
                  ),
                  SwitchListTile(
                      secondary: themeProvider.getIsPrimaryTheme
                          ? const Icon(Icons.light_mode)
                          : const Icon(Icons.dark_mode),
                      title: Text(themeProvider.getIsPrimaryTheme
                          ? "Primary Theme"
                          : " Secondary Theme"),
                      value: themeProvider.getIsPrimaryTheme,
                      onChanged: (value) {
                        themeProvider.setPrimaryTheme(themeValue: value);
                      }),
                  const Divider(
                    thickness: 1.5,
                  ),
                ],
              ),
            ),
            Center(
                child: CustomElevatedButton(
              onPressed: () async {
                if (user == null) {
                  await Navigator.pushNamed(
                    context,
                    LoginScreen.routName,
                  );
                } else {
                  await CustomAlertDialoge.showErrorORWarningDialog(
                    context: context,
                    errMessage: "Are you sure?",
                    fn: () async {
                      await FirebaseAuth.instance.signOut();
                      if (!mounted) return;
                      await Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routName,
                      );
                    },
                    isError: false,
                    image: 'assets/images/persons/sad_person.png',
                  );
                }
              },
              labelText: user == null ? "Login" : "Logout",
              icon: Icon(user == null ? Icons.login : Icons.logout),
            ))
          ],
        ),
      ),
    );
  }
}
