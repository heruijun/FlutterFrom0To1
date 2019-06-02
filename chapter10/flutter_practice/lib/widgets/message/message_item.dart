import 'package:flutter/material.dart';
import 'package:flutter_boss/model/message.dart';

class MessageItem extends StatelessWidget {
  final Message message;

  MessageItem({Key key, this.message, this.onPressed}) : super(key: key);
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        padding: const EdgeInsets.only(
            left: 18.0, top: 10.0, right: 18.0, bottom: 10.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(message.head),
              radius: 32,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(left: 15, top: 3),
                    child: Text(
                      message.name,
                      style: new TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                      top: 7,
                    ),
                    child: Text(
                      message.message,
                      maxLines: 1,
                      textScaleFactor: 1.0,
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
