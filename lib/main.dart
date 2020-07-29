import 'package:flutter/material.dart';
import 'home.dart';
import 'favourite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => SplashScreen(),
        '/homescreen': (context) => HomeScreen(),

      },

    );
  }
}
