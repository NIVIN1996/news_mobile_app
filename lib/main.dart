import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_mobile_app/models/top_news_headline_model/article_model.dart';
import 'package:news_mobile_app/providers/common_function_provider/provider_list.dart';
import 'package:news_mobile_app/providers/theme_provider/theme_provider.dart';
import 'package:news_mobile_app/ui/splash_screen/splash_screen.dart';
import 'package:news_mobile_app/ui/navigation/routes.dart' as router;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ArticleAdapter().typeId)) {
    Hive.registerAdapter(ArticleAdapter());
  }
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
