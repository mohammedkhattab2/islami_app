import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home.dart';
import 'package:islami_app/ui/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Splash.routname,
      routes: {
        Splash.routname: (_) => const Splash(),
        Home.routname: (_) => const Home(),
      },
    );
  }
}
