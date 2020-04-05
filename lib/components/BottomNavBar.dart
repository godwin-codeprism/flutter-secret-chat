import 'package:calculator/utils/helpers.dart';
import 'package:flutter/cupertino.dart';

class BottomNavBar extends StatelessWidget
    implements ObstructingPreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: LimitedBox(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 50,
        child: new Container(
          color: HexColor("#FF6600"),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(400, 50.0);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return false;
  }
}
