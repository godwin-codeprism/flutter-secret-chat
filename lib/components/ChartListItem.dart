import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListItem extends StatelessWidget {
  final String pp =
      "https://media-exp1.licdn.com/dms/image/C5103AQFu06xL-3HYeQ/profile-displayphoto-shrink_200_200/0?e=1586995200&v=beta&t=zQUQ-13YVQqOWV2cZ9vVP1qUf4NPYPg51ixpRksWdWA";

  @override
  Widget build(BuildContext context) {

    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 85,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => {print("Click works")},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Flexible(
                  flex: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(pp,
                        height: 60, width: 60, fit: BoxFit.cover),
                  )),
              Flexible(
                  flex: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            flex: 85,
                            child: Text(
                              "Godwin Vinny Carole",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Flexible(
                              flex: 25,
                              child: Text(
                                "10:36 AM",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ))
                        ],
                      ),
                      new Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          "Last Message from the user",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                      new Container(
                        height: 10,
                        child: Divider(color: CupertinoColors.systemGrey),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
