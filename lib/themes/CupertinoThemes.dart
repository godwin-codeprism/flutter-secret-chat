import 'package:flutter/cupertino.dart';

class CupertinoThemeChanger extends ChangeNotifier{
  CupertinoThemeData _themeData;

  // Constructor
  CupertinoThemeChanger(this._themeData);

  getTheme () => _themeData;

  setTheme(CupertinoThemeData themeData){
    this._themeData = themeData;
    notifyListeners();
  }

}