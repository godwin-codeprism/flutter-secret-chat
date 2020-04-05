import 'dart:io';

import 'package:calculator/router/RouteNames.dart';
import 'package:calculator/router/Router.dart';
import 'package:calculator/screens/Splash.screen.dart';
import 'package:calculator/services/navigation.service.dart';
import 'package:calculator/themes/CupertinoThemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'utils/globals.dart';
import 'utils/helpers.dart';

GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<NavigationService>(NavigationService());
  return runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  final locator = getIt.get<NavigationService>();
  androidApp() => MaterialApp(
        title: "Calculator",
        theme: ThemeData(
            primaryColor: HexColor(GLOBALS.colors.primary),
            accentColor: HexColor(GLOBALS.colors.accent),
            fontFamily: 'Circe'),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        navigatorKey: locator.navigatorKey,
        onGenerateRoute: generateRoutes,
        initialRoute: SplashScreenRoute,
      );

  iOSApp() => ChangeNotifierProvider<CupertinoThemeChanger>(
        create: (_) => CupertinoThemeChanger(
            CupertinoThemeData(brightness: Brightness.dark)),
        child: new CupertinoAppWithTheme(),
      );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? iOSApp() : androidApp();
  }
}

class CupertinoAppWithTheme extends StatelessWidget {
  final locator = getIt.get<NavigationService>();
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CupertinoThemeChanger>(context);
    return CupertinoApp(
        title: "Calculator",
        home: SplashScreen(),
        theme: theme.getTheme(),
        debugShowCheckedModeBanner: false,
        navigatorKey: locator.navigatorKey,
        onGenerateRoute: generateRoutes,
        initialRoute: SplashScreenRoute);
  }
}
