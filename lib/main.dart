import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lightproject/resource/theme_material_app.dart';
import 'package:lightproject/view/authen/register/register_screen.dart';
import 'package:lightproject/view/home/home.dart';
import 'package:provider/provider.dart';
import 'generate_route.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    MyApp()
    // MultiProvider(
    //   child: MyApp(),
      // providers: <SingleChildWidget>[
      //   ChangeNotifierProvider<BlocProfile>(create: (_) => BlocProfile()),
      //   ChangeNotifierProvider<BlocOrder>(create: (_) => BlocOrder()),
      // ],
    )
  ;
}

class StateManager {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  // static int indexCateProduct = 0;
  // static int idCate;
  // static StreamController<String> eventReloadProductPage = new StreamController<String>.broadcast();
}

class MyApp extends StatefulWidget {
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
  //   state!.setLocale(newLocale);
  // }

  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMaterialApp _themeMaterialApp = new ThemeMaterialApp();
  GenerateRoute _generateRoute = new GenerateRoute();
  // ThemeMaterialApp _themeMaterialApp = new ThemeMaterialApp();
  // Locale _locale;
  // setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }
  @override
  void didChangeDependencies() {
    // PreferenceProvider.getString(PreferenceNames.LANGUAGE_CODE, def: "vi").then((value) {
    //   setState(() {
    //     this._locale = Locale(value);
    //   });
    // });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: "LiveLy",
      navigatorKey: StateManager.navigatorKey,
      debugShowCheckedModeBanner: true,
      onGenerateRoute: (setting) => _generateRoute.checkRoute(setting),
      home: RegisterScreen(),
      theme:_themeMaterialApp.themeData
      // locale: _locale,
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale.languageCode == locale.languageCode) {
      //       return supportedLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      // supportedLocales: [
      //   const Locale('vi', 'VN'),
      //   const Locale('en', 'US'),
      // ],
    );
  }
}