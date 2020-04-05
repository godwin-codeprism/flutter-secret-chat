import 'package:calculator/components/ProfilePicture.dart';
import 'package:calculator/navigation/RouteNames.dart';
import 'package:calculator/services/auth.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              "Profile",
              style: TextStyle(fontFamily: 'Circe'),
            ),
          )
        ];
      },
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              ProfilePicture(),
              RaisedButton(
                onPressed: () {
                  AuthService.signOut();
                 Navigator.pushReplacementNamed(context, AuthenticateScreenRoute);
                },
                color: Colors.white,
                child: Text("Sign Out"),
              )
            ]),
          )
        ],
      ),
    );
  }
}
