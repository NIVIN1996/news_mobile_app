import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_mobile_app/ui/login_screen/login_screen.dart';

import '../../utils/text_style/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(const Duration(seconds: 5), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Lottie.asset(
              'assets/splash_icon/splash.json',
            )),
            const SizedBox(height: 10),
            Text(
              "NEWS4U",
              textAlign: TextAlign.center,
              style: TextFontStyle.med(size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
