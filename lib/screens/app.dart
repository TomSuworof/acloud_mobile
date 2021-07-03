import 'package:acloud_mobile/screens/main_screen.dart';
import 'package:acloud_mobile/screens/login_screen.dart';
import 'package:acloud_mobile/screens/dashboard_screen.dart';
import 'package:acloud_mobile/screens/personal_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.grey,
      ),
      routes: {
        '/': (context) => MainScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/personal': (context) => PersonalScreen(),
      },
      initialRoute: '/',
    );
  }
}