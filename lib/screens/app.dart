import 'package:acloud_mobile/screens/admin_screen.dart';
import 'package:acloud_mobile/screens/main_screen.dart';
import 'package:acloud_mobile/screens/login_screen.dart';
import 'package:acloud_mobile/screens/dashboard_screen.dart';
import 'package:acloud_mobile/screens/personal_screen.dart';
import 'package:acloud_mobile/screens/unknown_screen.dart';
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
        '/unknown': (context) => UnknownScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/personal': (context) => PersonalScreen(),
        '/admin': (context) => AdminScreen(),
      },
      initialRoute: '/',
      // onGenerateRoute: (settings) {
      //   switch(settings.name) {
      //     case '/':
      //       return MaterialPageRoute(builder: (context) => MainScreen());
      //     case "/login":
      //       return MaterialPageRoute(builder: (context) => LoginScreen());
      //     case '/dashboard':
      //       return MaterialPageRoute(builder: (context) => DashboardScreen());
      //     case '/personal':
      //       return MaterialPageRoute(builder: (context) => PersonalScreen());
      //     default:
      //       return MaterialPageRoute(builder: (context) => UnknownScreen());
      //   }
      // },
    );
  }
}