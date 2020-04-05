import 'dart:ui';

import 'package:calculator/components/auth_button.dart';
import 'package:calculator/services/auth.service.dart';
import 'package:calculator/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_auth.jpg"),
              fit: BoxFit.cover)),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[SplashMessage(), GoogleButton()],
          ),
        ),
      ),
    );
  }
}

class SplashMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 140,
      child: Column(
        children: <Widget>[
          Text(
            "Stash Chat",
            style: TextStyle(fontFamily: 'Circe', fontSize: 28, color: CupertinoColors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Keep your converstaiton away from unwanted attention.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Circe', fontSize: 18, color: CupertinoColors.black),
            ),
          ),
          Text(
            "Happy Messaging!! 🤗",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Circe', fontSize: 20, fontWeight: FontWeight.w300, color: CupertinoColors.black),
          ),
        ],
      ),
    );
  }
}

class GoogleButton extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton>{
  bool darkMode = false;
  double borderRadius = 5.0;

  @override
  Widget build(BuildContext context) {
    return StretchableButton(
      buttonColor: darkMode ? Color(0xFF4285F4) : Colors.white,
      borderRadius: borderRadius,
      splashColor: HexColor("#F5F5F5"),
      onPressed: () => AuthService.googleSignIn(),
      buttonPadding: 0.0,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            height: 38.0, // 40dp - 2*1dp border
            width: 38.0, // matches above
            decoration: BoxDecoration(
              color: darkMode ? Colors.white : null,
              borderRadius: BorderRadius.circular(this.borderRadius),
            ),
            child: Center(
              child: new Image.asset('assets/images/google-logo.png', width: 30, height: 20)
            ),
          ),
        ),

        SizedBox(width: 5.0 /* 24.0 - 10dp padding */),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
          child: Text(
            "Connect with Google",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Circe',
              color: darkMode ? Colors.white : Colors.black.withOpacity(0.54),
            ),
          ),
        ),
      ],
    );
  }

}
