import 'package:calculator/screens/Home.screen.dart';
import 'package:calculator/screens/Splash.screen.dart';
import 'package:calculator/screens/auth/Authenticate.screen.dart';
import 'package:flutter/cupertino.dart';

import 'RouteNames.dart';

Route<dynamic> generateRoutes (RouteSettings routeSettings){
  switch(routeSettings.name){
    case SplashScreenRoute:
      return CupertinoPageRoute(builder: (_) => SplashScreen());
    case AuthenticateScreenRoute:
      return CupertinoPageRoute(builder: (_) => AuthenticateScreen());
    case HomeScreenRoute:
      return CupertinoPageRoute(builder: (_) => HomeScreen());
    default:
      return CupertinoPageRoute(builder: (_) => SplashScreen());
  }
}