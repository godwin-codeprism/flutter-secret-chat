import 'package:flutter/widgets.dart';

class NavigationService {

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> switchTo(String routeName){
    return navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  Future<dynamic> navigateTo(String routeName){
    return navigatorKey.currentState.pushNamed(routeName);
  }

  bool goBack(){
    return navigatorKey.currentState.pop();
  }

}