import 'package:e_donation_app_doner/constants/fontsStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';

class NoSearchFound extends StatelessWidget {
  const NoSearchFound({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTttle,
  });
  final String imagePath, title, subTttle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Center(
                child: Image.asset(
              imagePath,
              height: size.height * 0.3,
              scale: 0.5,
            )),
          ),
          // const Text("Oooops", style: FontsStyles.teststyle38),
          Text(title, style: FontsStyles.teststyle22),
          Text(subTttle, style: FontsStyles.teststyle22),

          const GutterTiny(),

          const GutterLarge(),
          // SizedBox(
          //   height: size.height * 0.05,
          //   width: size.width * 0.35,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         padding: const EdgeInsets.all(12),
          //         elevation: 0,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(16)),
          //         backgroundColor: const Color(0xff68C8D2)),
          //     onPressed: () {},
          //     child: Text(
          //       bottonLabel,
          //       style: FontsStyles.teststyle15,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
