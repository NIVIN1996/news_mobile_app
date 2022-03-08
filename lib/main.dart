import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_mobile_app/ui/splash_screen/splash_screen.dart';
import 'package:news_mobile_app/services/navigator/routes.dart' as router;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News4U',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
      theme: ThemeData(

        primarySwatch: Colors.grey,
      ),
      home: const SplashScreen(),
    );
  }
}

