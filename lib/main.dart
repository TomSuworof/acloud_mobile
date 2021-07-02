import 'package:acloud_mobile/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


// final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

Future main() async {
  await dotenv.load(fileName: '.env');
  runApp(App());
}