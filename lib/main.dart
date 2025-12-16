import 'package:flutter/material.dart';
import 'package:technest/presentation/screens/auth/login_screen.dart';

// Starting point of flutter app
void main() {
  runApp(const TechNestApp());
}

// App main class
class TechNestApp extends StatelessWidget {
  const TechNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechNest',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
