import 'package:flutter/material.dart';
import 'package:flutterinstagram/components/navigation_manu.dart';

class MySplashPage extends StatefulWidget {
  const MySplashPage({super.key});

  @override
  State<MySplashPage> createState() => _MySplashPageState();
}

class _MySplashPageState extends State<MySplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NavigationMenu()));
            },
            child: Text("Splash screen page")),
      ),
    );
  }
}
