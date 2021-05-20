import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'acloud',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 24,
              ),
              MaterialButton(
                child: Text('start'),
                onPressed: () {
                  // entering app
                  Navigator.pushReplacementNamed(context, '/login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}