import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/color/colors.dart';
import '../../utils/text_style/text_style.dart';
import '../home_screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Lottie.asset('assets/splash_icon/splash.json',)),
            const SizedBox(height: 10),
            Text(
              "NEWS4U",
              textAlign: TextAlign.center,
              style: TextFontStyle.med(color: AppColor.black, size: 30),

            ),
          ],
        ),
      ),
    );
  }
}
