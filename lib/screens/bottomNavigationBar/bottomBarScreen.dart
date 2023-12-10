import 'package:e_donation_app_doner/screens/home_screen.dart';
import 'package:e_donation_app_doner/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});
  static const routeName = '/RootScreen';

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  late PageController controller;
  int currentScreen = 0;
  List<Widget> screens = [const HomeScreen(), const ProfileScreen()];
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: screens),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedIndex: currentScreen,
        onDestinationSelected: (value) {
          setState(() {
            currentScreen = value;
          });
          controller.jumpToPage(currentScreen);
        },
        destinations: const [
          NavigationDestination(
              selectedIcon: Icon(Icons.home_filled),
              icon: Icon(Icons.home),
              label: "Home"),
          // const NavigationDestination(
          //     icon: Icon(Icons.search), label: "Search"),
          // NavigationDestination(
          //     icon: Badge(
          //         label: Text("${cartProvider.getCartItems.length}"),
          //         child: Icon(Icons.shopping_cart)),
          //     label: "Cart"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        ],
      ),
    );
  }
}
