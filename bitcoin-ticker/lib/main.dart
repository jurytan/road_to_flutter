import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(primaryColor: Colors.lightBlue),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
