import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_mobile_app/models/top_news_headline_model/article_model.dart';
import 'package:news_mobile_app/providers/common_function_provider/provider_list.dart';
import 'package:news_mobile_app/providers/theme_provider/theme_provider.dart';
import 'package:news_mobile_app/ui/splash_screen/splash_screen.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart' as router;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';

import 'models/top_news_headline_model/source_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  Directory directory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(SourceAdapter());

    // Box box =await Hive.openBox("test data");
    // await box.put("1", "sample");
    // print(await box.get("1"));

  runApp(MultiProvider(providers: ProviderRegistrar.providers, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

// This widget is the root of your application.
class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();
  void getCurrentAppTheme() async {
    themeProvider.darkTheme = await themeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeProvider;
          })
        ],
        child: Consumer<ThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'News4U',
            themeMode: themeProvider.darkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: themeProvider.darkTheme ? MyThemes.darkTheme : MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: router.generateRoute,
            home: const SplashScreen(),
          );
        }));
  }
}
