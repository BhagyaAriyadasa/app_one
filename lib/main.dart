import 'package:app_one/pages/first_page.dart';
import 'package:app_one/pages/home_page.dart';
import 'package:app_one/pages/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/home_page': (context) => const HomePage(),
        '/settings_page': (context) => const SettingsPage()
      },
    );
  }
}

