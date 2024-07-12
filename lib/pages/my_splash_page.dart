import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterinstagram/pages/login_page.dart';

class MySplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Schedule navigation to LoginPage after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50),
            SizedBox(
              height: 200,
              width: 200,
              child: SvgPicture.asset(
                'images/Icon.svg',
                semanticsLabel: 'Instagram Logo',
              ),
            ),
            Column(
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText(
                      'From',
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.pink,
                      ),
                    ),
                  ],
                  isRepeatingAnimation: false,
                ),
                SizedBox(height: 10),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('Meta'),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
