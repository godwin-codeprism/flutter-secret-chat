import 'package:calculator/components/BottomNavBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BottomTabs/Chats.screen.dart';
import 'BottomTabs/ProfileTab.screen.dart';
import 'BottomTabs/SettingsTab.screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => _HomeScreenState();
}

Widget tabsSwitcher(int index) {
  switch (index) {
    case 0:
      {
        return ProfileScreen();
      }
    case 1:
      {
        return ChatsScreen();
      }
    case 2:
      {
        return SettingsScreen();
      }
    default:
      {
        return ChatsScreen();
      }
  }
}

class _HomeScreenState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              title: Text(
                "Profile",
                style: TextStyle(fontFamily: "Circe"),
              )),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble),
              title: Text(
                "Chats",
                style: TextStyle(fontFamily: "Circe"),
              )),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontFamily: "Circe"),
              )),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return Center(
          child: tabsSwitcher(index),
        );
      },
    );
  }
}
