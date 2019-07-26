import 'package:flutter/material.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  AnimatedSwitcherDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AnimatedSwitcherState createState() => _AnimatedSwitcherState();
}

class _AnimatedSwitcherState extends State<AnimatedSwitcherDemo>
    with SingleTickerProviderStateMixin {
  IconData _actionIcon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('点击中间的❤️'),
        actions: <Widget>[],
      ),
      body: Center(
        child: AnimatedSwitcher(
          transitionBuilder: (child, anim) {
            return ScaleTransition(child: child, scale: anim);
          },
          duration: Duration(milliseconds: 500),
          child: IconButton(
            iconSize: 100,
            key: ValueKey(_actionIcon),
            icon: Icon(
              _actionIcon,
              color: Colors.pink,
            ),
            onPressed: () {
              setState(
                () {
                  if (_actionIcon == Icons.favorite_border)
                    _actionIcon = Icons.favorite;
                  else
                    _actionIcon = Icons.favorite_border;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
