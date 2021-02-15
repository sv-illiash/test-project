import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:my_book_reloaded/app/locator.dart';
import 'package:my_book_reloaded/app/router.gr.dart' as autoRoute;
import 'package:my_book_reloaded/core/services/navigation/navigation_service.dart';
import 'package:my_book_reloaded/ui/shared/my_themes.dart';
import 'package:my_book_reloaded/ui/views/main_view/main_view.dart';
import 'package:my_book_reloaded/ui/views/onboarding_view/onboarding_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/services/auth/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(Environment.prod);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String theme = prefs.getString('theme') ?? "system";
  runApp(MyApp(
    theme: theme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;

  const MyApp({Key key, @required this.theme}) : super(key: key);

  ThemeMode getThemeMode() {
    ThemeMode themeMode;
    try {
      themeMode = ThemeMode.values.firstWhere((e) => describeEnum(e) == theme);
    } catch (e) {
      themeMode = ThemeMode.system;
    }
    return themeMode;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
   // AuthService().refresh(AuthService.getToken(['token']));


    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.light,
      debugShowCheckedModeBanner: true,
      darkTheme: MyThemes.dark,
      themeMode: getThemeMode(),
      onGenerateRoute: autoRoute.Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,

      
      home: OnboardingView(),

    );
  }
}
