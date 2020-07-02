import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flash_chat/services/login_service.dart';

import 'screens/welcome_screen.dart';

LoginService _login = LoginService();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String route = await _handleLandingPage();
  runApp(FlashChat(route: route));
}

Future<String> _handleLandingPage() async {
  final _auth = _login.firebaseAuth;
  final user = await _auth.currentUser();
  return user != null ? ChatScreen.id : WelcomeScreen.id;
}

class FlashChat extends StatelessWidget {
  FlashChat({this.route});

  String route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route ?? WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
