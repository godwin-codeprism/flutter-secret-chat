import 'package:calculator/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  ProfilePicture({String pictureURL});
  final String pp = GLOBALS.user.photoUrl;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(200 / 2
          )
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200 / 2),
          child: Image.network(pp, fit: BoxFit.cover),
        )
      ),
    );
  }
}
