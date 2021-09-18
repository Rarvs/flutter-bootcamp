import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.routeKey,
      routes: {
        WelcomeScreen.routeKey: (context) => WelcomeScreen(),
        ChatScreen.routeKey: (context) => ChatScreen(),
        RegistrationScreen.routeKey: (context) => RegistrationScreen(),
        LoginScreen.routeKey: (context) => LoginScreen(),
      },
    );
  }
}
