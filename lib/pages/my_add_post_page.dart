import 'package:flutter/material.dart';

class MyAddPostPage extends StatefulWidget {
  const MyAddPostPage({super.key});

  @override
  State<MyAddPostPage> createState() => _MyAddPostPageState();
}

class _MyAddPostPageState extends State<MyAddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Add post page"),
      ),
    );
  }
}
