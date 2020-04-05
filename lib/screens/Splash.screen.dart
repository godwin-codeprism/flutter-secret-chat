import 'package:calculator/navigation/RouteNames.dart';
import 'package:calculator/services/auth.service.dart';
import 'package:calculator/utils/ComponentDidMount.dart';
import 'package:calculator/utils/globals.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with ComponentDidMountMixin<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Text(
            "Stash Chat",
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }

  @override
  void componentDidMount(BuildContext context) {
    checkForCurrentUser();
  }

  void checkForCurrentUser() async {
    try {
      FirebaseUser user = await AuthService.getAuth().currentUser();
      if (user != null) {
        GLOBALS.user.displayName = user.displayName;
        GLOBALS.user.photoUrl = user.photoUrl;
        GLOBALS.user.phoneNumber = user.phoneNumber;
        GLOBALS.user.email = user.email;
        GLOBALS.user.uid = user.uid;
        GLOBALS.user.isEmailVerified = user.isEmailVerified;
        Navigator.pushReplacementNamed(context, HomeScreenRoute);
      } else {
        Navigator.pushReplacementNamed(context, AuthenticateScreenRoute);
      }
    } catch (err) {
      print(err);
      Navigator.pushReplacementNamed(context, AuthenticateScreenRoute);
    }
  }
}
