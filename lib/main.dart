import 'package:flutter/material.dart';
import 'package:terrasoi/pages/home_page.dart';
import 'package:terrasoi/pages/login_page.dart';
import 'package:terrasoi/pages/register_page.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      }));
}