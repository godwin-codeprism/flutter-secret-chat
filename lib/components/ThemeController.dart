import 'package:calculator/themes/CupertinoThemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeController extends StatefulWidget {
  @override
  _ThemeControllerState createState() => _ThemeControllerState();
}

class _ThemeControllerState extends State<ThemeController> {
  bool darkTheme = true;

  @override
  Widget build(BuildContext context) {
    CupertinoThemeChanger _themeChanger =
        Provider.of<CupertinoThemeChanger>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            flex: 15,
            child: Center(
              child: Icon(
                CupertinoIcons.eye_solid,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 85,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                    bottom: BorderSide(
                        width: 1.0, color: CupertinoColors.systemGrey)),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 80,
                    child: Container(
                        child: Text(
                      "Dark Theme",
                      textAlign: TextAlign.left,
                      style: TextStyle(height: 2),
                    )),
                  ),
                  Flexible(
                    flex: 20,
                    child: CupertinoSwitch(
                      onChanged: (bool value) {
                        setState(() {
                          darkTheme = value;
                          _themeChanger.setTheme(CupertinoThemeData(
                              brightness:
                                  value ? Brightness.dark : Brightness.light));
                        });
                      },
                      value: darkTheme,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
