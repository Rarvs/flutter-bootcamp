import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade500,
        appBar: AppBar(
          title: Text("I like Images"),
          backgroundColor: Colors.grey.shade600,
        ),
        body: Center(
          child: Image(
            image: NetworkImage("https://picsum.photos/300/300"),
          ),
        ),
      ),
    );
  }
}
