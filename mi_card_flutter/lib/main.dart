import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 64.0,
                  foregroundImage: AssetImage('images/ImageProfile.jpeg'),
                ),
                Text('Rafael "Rarvs" Silva',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 32.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                Text('ANDROID DEVELOPER',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.teal.shade100,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    )),
                SizedBox(
                  height: 16.0,
                  width: 160.0,
                  child: Divider(
                    color: Colors.teal.shade200,
                  ),
                ),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal.shade900,
                      ),
                      title: Text('35 99188-6783',
                          style: TextStyle(
                              fontFamily: 'SourceSansPro',
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900)),
                    )),
                Card(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.teal.shade900,
                      ),
                      title: Text(
                        'rafael.rarvs@gmail.com',
                        style: TextStyle(
                            fontFamily: 'SourceSansPro',
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
