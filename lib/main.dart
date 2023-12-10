import 'package:e_donation_app_doner/constants/themaData.dart';
import 'package:e_donation_app_doner/firebase_options.dart';
import 'package:e_donation_app_doner/providers/product_provider.dart';
import 'package:e_donation_app_doner/providers/themeProvider.dart';
import 'package:e_donation_app_doner/screens/addDonation_screen.dart';
import 'package:e_donation_app_doner/screens/bottomNavigationBar/bottomBarScreen.dart';
import 'package:e_donation_app_doner/screens/home_screen.dart';
import 'package:e_donation_app_doner/screens/splash/splash_view.dart';
import 'package:e_donation_app_doner/screens/splash/splash_view_body.dart';
import 'package:e_donation_app_doner/screens/viewRequest_screen%20.dart';
import 'package:e_donation_app_doner/widgets/auth/forgot_password.dart';
import 'package:e_donation_app_doner/widgets/auth/login.dart';
import 'package:e_donation_app_doner/widgets/auth/registerView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EDonationAppDonerRelease());
}

class EDonationAppDonerRelease extends StatelessWidget {
  const EDonationAppDonerRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return ThemeProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return ProductProvider();
        }),
      ],
      child: Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
        return MaterialApp(
          title: 'E-Donation App',
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(
            isPrimaryTheme: ThemeProvider.getIsPrimaryTheme,
            context: context,
          ),
          home: const SplashView(),
          routes: {
            SplashViewBody.routName: (context) => const SplashView(),
            LoginScreen.routName: (context) => const LoginScreen(),
            RegisterScreen.routName: (context) => const RegisterScreen(),
            ForgotPasswordScreen.routeName: (context) =>
                const ForgotPasswordScreen(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            AddDonationScreen.routeName: (context) => const AddDonationScreen(),
            ViewRequestScreen.routeName: (context) => const ViewRequestScreen(),
            BottomBarScreen.routeName: (context) => const BottomBarScreen(),
          },
        );
      }),
    );
  }
}
