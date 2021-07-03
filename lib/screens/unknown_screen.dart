import 'package:flutter/material.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Unknown path', style: Theme
                    .of(context)
                    .textTheme
                    .headline2),
                Text('It means app does not know, what page it should lead to',
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1),
              ],
            ),
          ),
        ));
  }
}