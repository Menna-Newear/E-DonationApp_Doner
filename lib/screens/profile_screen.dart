import 'package:e_donation_app_doner/constants/appConstants.dart';
import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:e_donation_app_doner/models/user_model.dart';
import 'package:e_donation_app_doner/providers/themeProvider.dart';
import 'package:e_donation_app_doner/providers/user_provider.dart';
import 'package:e_donation_app_doner/widgets/auth/login.dart';
import 'package:e_donation_app_doner/widgets/customAlertDialogMethod%20copy.dart';
import 'package:e_donation_app_doner/widgets/customElevatedButton%20copy.dart';
import 'package:e_donation_app_doner/widgets/customProfileImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  bool _isLoading = true;
  UserModel? userModel;

  Future<void> fetchUserInfo() async {
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      userModel = await userProvider.fetchUserInfo();
    } catch (error) {
      await CustomAlertDialoge.showErrorORWarningDialog(
          context: context,
          errMessage: "An error has been occured $error",
          fn: () {},
          image: "assets/images/persons/sad_person.png");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    fetchUserInfo();
    super.initState();
  }

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
            Visibility(
              visible: user == null ? true : false,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            userModel == null
                ? const SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userModel!.userName,
                              style: FontsStyles.teststyle17,
                            ),
                            Text(
                              userModel!.userEmail,
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
