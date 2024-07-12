import 'package:flutter/material.dart';
import 'package:flutterinstagram/pages/login_page.dart';
import 'package:flutterinstagram/pages/my_splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1780C2)),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
